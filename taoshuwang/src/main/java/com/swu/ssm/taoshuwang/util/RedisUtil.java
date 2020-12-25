package com.swu.ssm.taoshuwang.util;

import org.springframework.stereotype.Component;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.*;

/**
 * Company :  北京动力节点
 * Author :   Andy
 * Date : 2020/8/22
 * Description :
 */
@Component
public class RedisUtil {

    //获取jedis对象
    public static Jedis getJedis(){
        JedisPoolConfig config = new JedisPoolConfig();
        JedisPool jedisPool = new JedisPool(config,
                "192.168.80.129",6381,10000,
                "123456");
        Jedis jedis = jedisPool.getResource();
        return jedis;
    }

    //从数据库中读取数据，将输入存入到Redis中
    /*
    将List<Map<String,Object>>数据放入到Redis中
    tag:1 2 3        tagIndex
     */
    public void writeDateToRedis(List<Map<String,Object>> data,
                                        String keyPattern,int index){
        Jedis jedis = getJedis();
        jedis.select(index);
        for (Map<String, Object> datum : data) {
            String key = keyPattern + ":" + jedis.incr(keyPattern + "Index");
            //Redis即将用于存储对象数据
            Map<String,String> temp = new HashMap<>();
            for(Map.Entry<String,Object> m : datum.entrySet()){
                temp.put(m.getKey(),m.getValue() + "");
            }
            jedis.hmset(key,temp);
        }

    }

    //将对象类型数据存储到Redis中  List<Tag>   name,value
    public <T> void writeDateToRedis(List<T> data,Class<T> clazz,String keyPattern,int index){
        Jedis jedis = getJedis();
        jedis.select(index);

        //通过反射获取原类的属性名
        Field[] fields = clazz.getDeclaredFields();
        //通过反射获取原类的所有方法
        Method[] methods = clazz.getMethods();
        for (T t : data) {
            String key = keyPattern + ":" + jedis.incr(keyPattern + "Index");
            Map<String,String> map = new HashMap<>();
            for(Field field : fields){
                //对象每个属性名
                String fieldName = field.getName();
                //遍历所有的方法，取除以get开头的所有方法，处理方法名和每个属性名进行比较
                for(Method method : methods){
                    String methodName = method.getName();
                    if(methodName.startsWith("get")){
                        methodName = methodName.substring(3);

                        if(methodName.equalsIgnoreCase(fieldName)){
                            //通过反射执行当前的get方法
                            try {
                                Object value = method.invoke(t);
                                //因为日期比较特殊，得对日期格式进行转换
                                if(value.getClass() == Date.class){
                                    Date date = (Date) value;
                                    map.put(fieldName,DateUtil.dateToString(date));
                                }else{
                                    map.put(fieldName,value + "");
                                }
                            } catch (IllegalAccessException e) {
                                e.printStackTrace();
                            } catch (InvocationTargetException e) {
                                e.printStackTrace();
                            }
                        }
                    }
                }
            }
            jedis.hmset(key,map);
        }

    }


    //从Redis中读取数据，存入到对象中
    /**
     * 从Redis中读取数据，封装到List<Map<String,Object>中
     */
    public List<Map<String,Object>> readFromRedis(String keyPattern,int index) {
        Jedis jedis = getJedis();
        jedis.select(index);

        List<Map<String, Object>> data = new ArrayList<>();
        Set<String> keys = jedis.keys(keyPattern);
        for (String key : keys) {
            Map<String, Object> temp = new HashMap<>();
            Map<String, String> map = jedis.hgetAll(key);
            for (Map.Entry<String, String> m : map.entrySet()) {
                temp.put(m.getKey(), m.getValue());
            }
            data.add(temp);
        }
        return data;
    }

    //从Redis中读取数据   List<T>
    public <T> List<T> readFromRedis(Class<T> clazz,String keyPattern,int index){
        Jedis jedis = getJedis();
        jedis.select(index);

        Field[] fields = clazz.getDeclaredFields();
        Set<String> keys = jedis.keys(keyPattern);
        List<T> data = new ArrayList<>();
        for (String key : keys) {
            Map<String, String> map = jedis.hgetAll(key);
            try {
                T t = clazz.newInstance();
                for(Field field : fields){
                    String fieldName = field.getName();
                    for(Map.Entry<String,String> m : map.entrySet()){
                        String k = m.getKey();
                        if(k.equalsIgnoreCase(fieldName)){
                            //消耗资源
                            field.setAccessible(true);
                            Class<?> type = field.getType();
                            if(type == Integer.class){
                                field.set(t,Integer.parseInt(m.getValue()));
                            }else if(type == Long.class){
                                field.set(t,Long.parseLong(m.getValue()));
                            }else if(type == Float.class){
                                field.set(t,Float.parseFloat(m.getValue()));
                            }else if(type == Double.class){
                                field.set(t,Double.parseDouble(m.getValue()));
                            }else if(type == Short.class){
                                field.set(t,Short.parseShort(m.getValue()));
                            }else if(type == Byte.class){
                                field.set(t,Byte.parseByte(m.getValue()));
                            }else if(type == Date.class){
                                field.set(t,DateUtil.stringToDate(m.getValue()));
                            }else{
                                field.set(t,m.getValue());
                            }
                        }
                    }
                }
                data.add(t);
            } catch (InstantiationException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }

        }
        return data;
    }
}

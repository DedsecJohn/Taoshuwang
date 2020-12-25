package com.swu.ssm.taoshuwang.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Company :  北京动力节点
 * Author :   Andy
 * Date : 2020/8/23
 * Description :
 */
public class DateUtil {

    //日期转字符串
    public static String dateToString(Date date){
        String pattern = "yyyy-MM-dd";
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        return sdf.format(date);
    }

//    字符串转日期
    public static Date stringToDate(String time){
        String pattern = "yyyy-MM-dd";
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        try {
            Date date = sdf.parse(time);
            return date;
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }
}

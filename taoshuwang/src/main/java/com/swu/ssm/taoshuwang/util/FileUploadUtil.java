package com.swu.ssm.taoshuwang.util;

import com.bjpowernode.ssm.blog.constants.BlogConstants;
import com.bjpowernode.ssm.blog.constants.BlogEnum;
import com.bjpowernode.ssm.blog.exception.BlogException;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * Company :  北京动力节点
 * Author :   Andy
 * Date : 2020/8/16
 * Description :    文件上传工具类
 */
public class FileUploadUtil {

    public static Map<String,Object> fileUpload(MultipartFile img,
                                                HttpSession session){
        Map<String,Object> mess = new HashMap<>();
        String realPath = session.getServletContext().getRealPath("/upload");
        File file = new File(realPath);
        if(!file.exists()){
            file.mkdirs();
        }
        //不同浏览器长传路径不一样 E:/abc/1.jpg
        String fileName = img.getOriginalFilename();
        fileName = createFileName(fileName);
        try {
            //校验文件扩展名是否合法
            typeMatch(fileName);
            //校验文件大小是否合法
            maxSize(img);
            img.transferTo(new File(realPath + File.separator + fileName));
            mess.put("error",0);
            mess.put("url", BlogConstants.BACK_PATH +fileName);
        }catch (BlogException e1){
            mess.put("error",1);
            mess.put("message",e1.getMessage());
        }catch (IOException e) {
            e.printStackTrace();
        }
        return mess;
    }

    private static void maxSize(MultipartFile img) {

        //获取上传文件大小:字节
        long fileSize = img.getSize();
        //最大大小为2M
        long maxSize = 2 * 1024 * 1024;
        if(fileSize > maxSize){
            throw new BlogException(BlogEnum.MAX_SIZE);
        }
    }

    private static void typeMatch(String fileName) {
        String subFix =fileName.substring(fileName.lastIndexOf(".")+1);
        String correctType = "png,jpg,gif";
        if(!correctType.contains(subFix)){
            throw new BlogException(BlogEnum.TYPE_MISMATCH);
        }
    }


    private static String createFileName(String fileName){
        //截取文件名
        fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
        //生成不重复的文件名
        fileName = UUID.randomUUID().toString().replace("-","")
                +fileName;
        return fileName;
    }
}

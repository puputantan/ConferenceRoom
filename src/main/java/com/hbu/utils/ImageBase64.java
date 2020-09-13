package com.hbu.utils;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;
import java.util.Base64.Encoder;

public class ImageBase64 {
	
	public static void main(String[] args)  
    {  
      //  String strImg = GetImageStr(System.getProperty("user.dir") +"/data/scrFile666.jpg");  
      //  System.out.println(strImg);  
        String sourceVideo = "E:/GitGivenera/20190325/givenera-server/code/givenera-common/src/main/java/com/givenera/common/util/upload/32M.mp4" ;

        //GenerateImage(strImg, "C:/Users/58/Desktop/scrFileffff.jpg");  
        try {
			System.out.println(encodeBase64File(sourceVideo).length());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }  
	
	

	
	public static String encodeBase64File(String path) throws Exception {
        File file = new File(path);
        FileInputStream inputFile = new FileInputStream(file);
        byte[] buffer = new byte[(int)file.length()];
        inputFile.read(buffer);
        inputFile.close();
        Encoder encoder = Base64.getEncoder();
        String result = encoder.encodeToString(buffer);
        return result;
    }
	
	

	/*
	 * 图片转化成base64字符串  
	 * imagefilePath  图片路径
	 */
    public static String GetImageStr(String imagefilePath)  
    {//将图片文件转化为字节数组字符串，并对其进行Base64编码处理  
       
        InputStream in = null;  
        byte[] data = null;  
        //读取图片字节数组  
        try   
        {  
            in = new FileInputStream(imagefilePath);          
            data = new byte[in.available()];  
            in.read(data);  
        }   
        catch (IOException e)   
        {  
            e.printStackTrace();  
        } finally{
        	try {
        		if(in != null){
        			in.close();	
        		}
			} catch (IOException e) {
				e.printStackTrace();
			}
        }  
        //对字节数组Base64编码  
//        BASE64Encoder encoder = new BASE64Encoder();  
//        return encoder.encode(data);//返回Base64编码过的字节数组字符串
        
        return "";
    }  
    
    /*
	 *创建文件夹路径
	 * imagefilePath  图片路径
	 */
    public static void createMk(String imageMKPath)  
    {//将图片文件转化为字节数组字符串，并对其进行Base64编码处理  
       
    	File file =new File(imageMKPath);    
    	//如果文件夹不存在则创建    
    	if  (!file .exists()  && !file .isDirectory())      
    	{       
    	    System.out.println("//不存在");  
    	    file .mkdir();    
    	} else   
    	{  
    	    System.out.println("//目录存在");  
    	}  

    }  
      
    
    /*
     * base64字符串转化成图片
     * imgStr 图片base64编码
     * newFilePath  生成图片指定路径
     */
    public static boolean GenerateImage(String imgStr, String newFilePath)  
    {   
    	return false;
//    	//对字节数组字符串进行Base64解码并生成图片  
//        if (imgStr == null) //图像数据为空  
//            return false;  
//        BASE64Decoder decoder = new BASE64Decoder();  
//        OutputStream out = null;
//        try   
//        {  
//            //Base64解码  
//            byte[] b = decoder.decodeBuffer(imgStr);  
//            for(int i=0;i<b.length;++i)  
//            {  
//                if(b[i]<0)  
//                {//调整异常数据  
//                    b[i]+=256;  
//                }  
//            }  
//          
//            out = new FileOutputStream(newFilePath);      
//            out.write(b);  
//            out.flush();  
//              
//            return true;  
//        }   
//        catch (Exception e)   
//        {  
//            return false;  
//        }  finally {
//        	if(out != null){
//        		try {
//					out.close();
//				} catch (IOException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//        	}
//        }
    }  

}

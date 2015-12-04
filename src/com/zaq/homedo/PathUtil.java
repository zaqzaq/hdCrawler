package com.zaq.homedo;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

/**
 * @author zhangyj
 *
 * 
 */
public class PathUtil {
	private PathUtil(){}
	private static PathUtil pathUtil=null;
	
	public static PathUtil instance(){
		if(null==pathUtil){
			pathUtil=new PathUtil();
		}
		
		return pathUtil;
	}
	
	public String getPath(String fileName){
		
		String filePath=this.getClass().getClassLoader().getResource(fileName)
				.getFile().replaceAll("%20"," ");
		try {
			filePath = URLDecoder.decode(filePath,"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return filePath;
	}
}

package com.zaq.homedo;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;
import java.util.Properties;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

import org.apache.commons.collections.MapUtils;
import org.apache.log4j.PropertyConfigurator;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

public class AppUtil {
	private static String log4j="log4j.properties";
	private static String config="config.properties";
	private static Properties props ;
	private static Map<String, AtomicInteger> URL_POST_ERR_COUNT=new ConcurrentHashMap<>();
	
	public static void init() throws IOException {

		PropertyConfigurator.configure(PathUtil.instance().getPath(log4j)); 
		
		props= new Properties();
		InputStream isConfig = new BufferedInputStream(AppUtil.class.getClassLoader().getResourceAsStream(config));

		props.load(isConfig);
		
		new Thread(new Runnable() {
			
			@Override
			public void run() {
				while(true){
					MapUtils.debugPrint(System.err, "正在处理的错误请求", URL_POST_ERR_COUNT);
					try {
						Thread.sleep(60000l);
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
				}
				
			}
		}).start();
	}

	public static String getPropertity(String string) {
		return props.getProperty(string, "");
	}

	public static int getTimeOut(){
		return Integer.valueOf(AppUtil.getPropertity("http.timeout"));
	}
	
	public static int getMaxError(){
		return Integer.valueOf(AppUtil.getPropertity("http.post.maxError"));
	}
	
	/**
	 * 统一的网页请求 处理 
	 * @param url
	 * @return
	 * @throws Exception
	 */
	public  static Document httpPost(String url) throws Exception{
//		synchronized
//		Thread.sleep(20l);
		System.out.println("请求："+url);
		Document retDoc=null;
		
		try {
			retDoc=Jsoup.connect(url).timeout(AppUtil.getTimeOut()).post();
		} catch (Exception e) {
			if(URL_POST_ERR_COUNT.containsKey(url)){
				if(URL_POST_ERR_COUNT.get(url).intValue()>=getMaxError()){
					throw e;
				}else{
					URL_POST_ERR_COUNT.get(url).incrementAndGet();
				}
			}else{
				URL_POST_ERR_COUNT.put(url, new AtomicInteger(0));
			}
			
			return httpPost(url);
		}
		if(URL_POST_ERR_COUNT.containsKey(url)){
			URL_POST_ERR_COUNT.remove(url);
		}
		return retDoc;
	}
	
	public static void main(String[] args) {
		URL_POST_ERR_COUNT.put("xxx1", new AtomicInteger(1));
		URL_POST_ERR_COUNT.put("xxx2", new AtomicInteger(2));
		MapUtils.debugPrint(System.out, "^^^", URL_POST_ERR_COUNT);
	}
}	

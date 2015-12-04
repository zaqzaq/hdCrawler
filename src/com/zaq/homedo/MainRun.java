package com.zaq.homedo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.zaq.homedo.bean.Category;
import com.zaq.homedo.bean.Goods;

public class MainRun {
	static Logger logger=Logger.getLogger(MainRun.class);
	private static String PATH_ROOT="http://www.homedo.com/";
	
	private static String PAGE_LIST="http://b2b.homedo.com/goods/c/{category}?page={page}";
	
	public static void main(String[] args) throws Exception {
		//初始化环境
		AppUtil.init();
//		Document doc= Jsoup.connect(PATH_ROOT).timeout(AppUtil.getTimeOut()).post();
		Document doc=AppUtil.httpPost(PATH_ROOT);
		Elements es= doc.getElementsByAttributeValue("istrigger", "true");
		
		int i1=1;//一级类型计数器
		for(Element e:es ){
			Elements aes=e.getElementsByTag("a");
			//一级类型
			final String oneType=aes.html();
			System.out.println(aes.attr("href")+"    "+oneType);
			
			//保存一级类型
			String cateGory1=getCateGoryByUrl(aes.attr("href"));
			Category categoryOne= new Category(cateGory1, oneType,cateGory1, i1++);
			categoryOne.save();
			
			Elements lies=e.nextElementSibling().getElementsByTag("li");
			int i2=1;//二级类型计数器
			for(Element li:lies ){
				Elements h6a=li.select("h6").select("a");
				//二级类型
				final String twoType=h6a.html();
				System.out.println("    "+h6a.attr("href")+"    "+twoType);
				
				//保存二级类型
				String cateGory2=getCateGoryByUrl(h6a.attr("href"));
				Category categoryTwo=new Category(cateGory2, twoType, cateGory1+"|"+cateGory2, i2++, categoryOne);
				categoryTwo.save();
				
				Elements paes=li.select("p").select("a");
				int i3=1;//三级类型计数器
				for(Element pa:paes ){
					//三级类型
					final String threeType=pa.html();
					final String threeHref=pa.attr("href");
					System.out.println("    "+"    "+threeHref+"    "+threeType);
					
					//保存三级类型
					String cateGory3=getCateGoryByUrl(threeHref);
					final Category categoryThree=new Category(cateGory3, threeType, cateGory1+"|"+cateGory2+"|"+cateGory3,
																	i3++, categoryTwo);
					categoryThree.save();
					
//					ThreadPool.execute(new Runnable() {
//						
//						@Override
//						public void run() {
							//获取三级类开的categoryId
							String category=getCateGoryByUrl(threeHref);
							//获取三级类型的物品总页数
							int page=getPage(threeHref);		
							
							for(int i=0;i<page;i++){
								String pageUrl=PAGE_LIST.replace("{category}", category).replace("{page}", i+"");
								//获取第i页的所有物品的URL
								List<String> goodsUrlsAndImg=getGoodsUrlsAndImg(pageUrl);
								
								//多线程获取最终的物品信息
								for(final String goodsUrlAndImg:goodsUrlsAndImg){
									ThreadPool.execute(new Runnable() {
										
										@Override
										public void run() {
											SaveGoodsUtil.saveGoodsInfo(goodsUrlAndImg,categoryThree);
										}
									});
								}
								
							}
//						}
//					});
					
					
					
					
					
				}
				
			}
		}
		
	}
	
	
	//获取页面的所有物品的URL及列表中图片的uri 以|隔开
	protected static List<String> getGoodsUrlsAndImg(String pageUrl) {
		List<String> retUrls=new ArrayList<>();
		
		try {
//			Document doc= Jsoup.connect(pageUrl).timeout(AppUtil.getTimeOut()).post();
			Document doc=AppUtil.httpPost(pageUrl);
			for(Element goodE:doc.select(".pro > .img > a[href]")){
				retUrls.add(goodE.attr("href")+"|"+goodE.select("img").attr("src"));
			}
			
		} catch (Exception e) {
			logger.error(pageUrl+"：访问失败！获取页面的所有物品无效", e);
		}
		
		
		return retUrls;
	}

	/**
	 * 获取 threeHref 的总共的页数
	 * @param threeHref
	 * @return
	 */
	private static int getPage(String threeHref) {
		try {
//			Document doc= Jsoup.connect(threeHref).timeout(AppUtil.getTimeOut()).post();
			Document doc=AppUtil.httpPost(threeHref);
			if(doc.html().contains("最后一页")){
				return Integer.valueOf(doc.getElementsByAttributeValue("Pager", "pagebox").
																get(0).previousElementSibling().html());
			}
			
		} catch (Exception e) {
			logger.error(threeHref+"：访问失败！所获取总页数无效", e);
		}
		
		return 1;
	}

	/**
	 * 根据url截取类别ID
	 * @param url
	 * @return
	 */
	private static String getCateGoryByUrl(final String url) {
		int temp=url.lastIndexOf("=");
		return url.substring(temp+1,temp+6).trim();
	}
	
}

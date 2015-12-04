package com.zaq.homedo;

import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.zaq.homedo.bean.Category;
import com.zaq.homedo.bean.Goods;
import com.zaq.homedo.bean.GoodsForImg;
import com.zaq.homedo.bean.GoodsForLFProp;
import com.zaq.homedo.bean.Prop;
import com.zaq.homedo.bean.PropForList;
/**
 * 保存最终的物品及关联的数据 信息
 * @author zaqzaq
 * 2015年12月2日
 *
 */
public class SaveGoodsUtil {
	static Logger logger=Logger.getLogger(SaveGoodsUtil.class);
	private static String PATH_B2B="http://b2b.homedo.com";
	static Pattern pattern=Pattern.compile("eval\\('(.+?)'\\)");
	/**
	 * 保存最终的物品信息
	 * @param goodsUrlAndImg  物品的URL及列表中图片的uri 以|隔开
	 * @param categoryThree
	 */
	protected static void saveGoodsInfo(String goodsUrlAndImg,Category categoryThree) {
		try {
			String[] tmp=goodsUrlAndImg.split("\\|");
			String goodsUrl=tmp[0];
			String goodsListImgUri=tmp[1];
			
//			Document doc= Jsoup.connect(PATH_B2B+goodsUrl).timeout(AppUtil.getTimeOut()).post();
			Document doc=AppUtil.httpPost(PATH_B2B+goodsUrl);
			Elements elements= doc.select("script[type]");
//			Elements elements1= doc.select("script:contains(eval)");
//			Element jsE= doc.select("script:contains(eval)").get(0);
			String jsVal="";
			
			for(Element e:elements){
				if(e.html().contains("eval")){
					jsVal=e.html();
					break;
				}
			}
			
			Matcher matcher= pattern.matcher(jsVal);
			
			matcher.find();
			String eval1=matcher.group(1);
			System.out.println(eval1);//产品值 
			matcher.find();
			String eval2=matcher.group(1);
			System.out.println(eval2);//产品属性
			matcher.find();
			String eval3=matcher.group(1);
			System.out.println(eval3);//产品展示的图片
			
			Goods goods=new Goods();
			goods.setCategory(categoryThree);
			goods.setGoodsCode(getGoodsCodeByUrl(goodsUrl));

			goods.setUri(PATH_B2B+goodsUrl);
			goods.setUpdateTime(new Date());
			goods.setEval1(eval1);
			goods.setEval2(eval2);
			goods.setEval3(eval3);
			
			//解析json数据
			
			//获取属性列表
			JSONArray jsonArray2=new JSONArray(eval2);
			for(int i=0;i<jsonArray2.length();i++){
				JSONObject jsonObject=jsonArray2.getJSONObject(i);
				
				Prop prop=new Prop();
				prop.setName(jsonObject.getString("Name"));
				prop.setOrd(i);
				prop.setPropertyId(jsonObject.getLong("Id")+"");
				prop.setUpdateTime(new Date());
				JSONArray ja=jsonObject.getJSONArray("Values");
				for(int j=0;j<ja.length();j++){
					PropForList forList=new PropForList();
					forList.setProp(prop);
					forList.setValue(ja.get(j).toString());
					forList.setOrd(j);
					prop.getForLists().add(forList);
					
					GoodsForLFProp goodsForLFProp=new GoodsForLFProp();
					goodsForLFProp.setGoods(goods);
					goodsForLFProp.setPropForList(forList);
					goodsForLFProp.setIsTag(0);
					goods.getGoodsForLFProps().add(goodsForLFProp);
					
				}
				//保存属性
				prop.save();
			}
			
			//获取产品的属性，价格，名称
			JSONArray jsonArray1=new JSONArray(eval1);
			for(int i=0;i<jsonArray1.length();i++){
				JSONObject jsonObject=jsonArray1.getJSONObject(i);
				if(jsonObject.getLong("Id")==Long.valueOf(goods.getGoodsCode()).longValue()){
					goods.setName(jsonObject.getString("Name"));
					goods.setPrize(jsonObject.getBigDecimal("Price"));
					
					if(null==jsonObject.get("Skus")||"null".equals(jsonObject.get("Skus").toString())){
						//没有一个属性值的物品
					}else{
						JSONArray ja=jsonObject.getJSONArray("Skus");
						
						for(int j=0;j<ja.length();j++){
							//绑定物品的属性
							for(GoodsForLFProp gfo: goods.getGoodsForLFProps()){
								if(gfo.getPropForList().getProp().getPropertyId().equals(ja.getJSONObject(j).getLong("Id")+"")
										&&gfo.getPropForList().getValue().equals(ja.getJSONObject(j).getString("Value"))){
									gfo.setIsTag(1);//将此物品的此属性 设置 为绑定状态
									break;
								}
							}
							
						}
					}
					break;
				}
			}
			//获取缩略图片信息
			JSONArray jsonArray3=new JSONArray(eval3);
			for(int i=0;i<jsonArray3.length();i++){
				GoodsForImg goodsForImg1=new GoodsForImg();
				goodsForImg1.setGoods(goods);
				goodsForImg1.setImgUri(jsonArray3.getJSONObject(i).getString("FileName"));
				goodsForImg1.setOrd(i);
				goodsForImg1.setTypePostion(2);
				goodsForImg1.setTypeSize(3);
			
				GoodsForImg goodsForImg2=new GoodsForImg();
				goodsForImg2.setGoods(goods);
				goodsForImg2.setImgUri(jsonArray3.getJSONObject(i).getString("ListFileName"));
				goodsForImg2.setOrd(i);
				goodsForImg2.setTypePostion(2);
				goodsForImg2.setTypeSize(2);
				
				GoodsForImg goodsForImg3=new GoodsForImg();
				goodsForImg3.setGoods(goods);
				goodsForImg3.setImgUri(jsonArray3.getJSONObject(i).getString("SmallFileName"));
				goodsForImg3.setOrd(i);
				goodsForImg3.setTypePostion(2);
				goodsForImg3.setTypeSize(1);
				goods.getGoodsForImgs().add(goodsForImg1);
				goods.getGoodsForImgs().add(goodsForImg2);
				goods.getGoodsForImgs().add(goodsForImg3);
			}
			//分页时展示的图片
			GoodsForImg goodsForImg=new GoodsForImg();
			goodsForImg.setGoods(goods);
			goodsForImg.setImgUri(goodsListImgUri);
			goodsForImg.setOrd(0);
			goodsForImg.setTypePostion(1);
			goodsForImg.setTypeSize(0);
			goods.getGoodsForImgs().add(goodsForImg);
			
			//从页面doc中获取描述的图片信息
			Elements imgEs=doc.select("#divGoodsDetail img");
			for(int i=0;i<imgEs.size();i++){
				GoodsForImg goodsForImg4=new GoodsForImg();
				goodsForImg4.setGoods(goods);
				goodsForImg4.setImgUri(imgEs.get(i).attr("src"));
				goodsForImg4.setOrd(i);
				goodsForImg4.setTypePostion(3);
				goodsForImg4.setTypeSize(0);
				goods.getGoodsForImgs().add(goodsForImg4);
			}
			
			goods.save();
			
		} catch (Exception e) {
			logger.error(goodsUrlAndImg+"：访问失败！获取页面的物品详情无效", e);
		}
	}
	
	/**
	 * 根据url截取类别物品编码
	 * @param url
	 * @return
	 */
	private static String getGoodsCodeByUrl(final String url) {
		return url.substring(url.lastIndexOf("/")+1).trim();
	}
	
	public static void main(String[] args) {
		JSONArray jsonArray1=new JSONArray("[{'xxx':12}]");
		
		System.out.println(jsonArray1.getJSONObject(0).getInt("xxx"));
	}
}

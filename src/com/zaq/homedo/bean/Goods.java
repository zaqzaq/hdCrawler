package com.zaq.homedo.bean;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;

import com.zaq.homedo.BaseDao;

/**
 * 物品详情
 * @author zaqzaq
 * 2015年12月1日
 *
 */
public class Goods {
	private Logger logger=Logger.getLogger(Goods.class);

//	private Long id;
	private Category category;
	private String goodsCode;//它物品的编码
	private String uri;//它的uri路径
	private String name;//名称
	private BigDecimal prize;//价格
	private Date updateTime;//更新时间
	
	private String eval1;//同类产品列表
	private String eval2;//产品的属性列表
	private String eval3;//产品的缩略图列表
	
	private List<GoodsForImg> goodsForImgs=new ArrayList<>();
	
	private List<GoodsForLFProp> goodsForLFProps=new ArrayList<>();
	
	String sql="INSERT INTO Goods (categoryId, goodsCode,uri,name,prize,updateTime,eval1,eval2,eval3)"
			+ " VALUES (?,?,?,?,?,?,?,?,?)";
	String sql2="INSERT INTO Goods (categoryId, goodsCode,uri,name,prize,updateTime)"
			+ " VALUES (?,?,?,?,?,?)";
	public void save() {
		try {
			BaseDao.getInstance().storeInfo(sql, new Object[]{category.getCategoryId() ,
				goodsCode,uri,name,prize,updateTime,eval1,eval2,eval3});
		} catch (Exception e) {
			if(!e.getMessage().contains("Duplicate")){
				try {
					BaseDao.getInstance().storeInfo(sql2, new Object[]{category.getCategoryId() ,
						goodsCode,uri,name,prize,updateTime});
				} catch (Exception e1) {
					if(!e1.getMessage().contains("Duplicate")){
						logger.error(name+"-"+goodsCode+"  物品保存失败", e1);
					}
				}
			}
		}
		
		for(GoodsForImg gfi:goodsForImgs){
			gfi.save();
		}
		for(GoodsForLFProp gfp:goodsForLFProps){
			gfp.save();
		}
	}
	
	public String getUri() {
		return uri;
	}
	public void setUri(String uri) {
		this.uri = uri;
	}
	
	public Category getCategory() {
		return category;
	}
	public List<GoodsForImg> getGoodsForImgs() {
		return goodsForImgs;
	}
	public void setGoodsForImgs(List<GoodsForImg> goodsForImgs) {
		this.goodsForImgs = goodsForImgs;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	//	public Long getId() {
//		return id;
//	}
//	public void setId(Long id) {
//		this.id = id;
//	}
	
	public String getGoodsCode() {
		return goodsCode;
	}
	public String getEval1() {
		return eval1;
	}
	public void setEval1(String eval1) {
		this.eval1 = eval1;
	}
	public String getEval2() {
		return eval2;
	}
	public void setEval2(String eval2) {
		this.eval2 = eval2;
	}
	public String getEval3() {
		return eval3;
	}
	public void setEval3(String eval3) {
		this.eval3 = eval3;
	}
	public List<GoodsForLFProp> getGoodsForLFProps() {
		return goodsForLFProps;
	}
	public void setGoodsForLFProps(List<GoodsForLFProp> goodsForLFProps) {
		this.goodsForLFProps = goodsForLFProps;
	}
	public void setGoodsCode(String goodsCode) {
		this.goodsCode = goodsCode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public BigDecimal getPrize() {
		return prize;
	}
	public void setPrize(BigDecimal prize) {
		this.prize = prize;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

}

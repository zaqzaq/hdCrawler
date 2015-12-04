package com.zaq.homedo.bean;

import org.apache.log4j.Logger;

import com.zaq.homedo.BaseDao;

/**
 * 物品的图片
 * @author zaqzaq
 * 2015年12月1日
 *
 */
public class GoodsForImg {
	private Logger logger=Logger.getLogger(GoodsForImg.class);

//	private Long id;
	private Goods goods;
	private String imgUri;//图片资源路径
	private Integer ord;// 排序
	private Integer typeSize;//0：非typePostion=2   1：SmallFileName   2：ListFileName   3：FileName
	private Integer typePostion;//1：分页列表展示时的    2：头展示    3：文体描述用的
	
	String sql="INSERT INTO GoodsForImg (goodsId, imgUri,ord,typeSize,typePostion) VALUES (?,?,?,?,?)";
	public void save() {
		
		try {
			BaseDao.getInstance().storeInfo(sql, new Object[]{goods.getGoodsCode(), imgUri,ord,typeSize,typePostion});
		} catch (Exception e) {
			if(!e.getMessage().contains("Duplicate")){
				logger.error(goods.getName()+"-"+imgUri+"  物品图片保存失败", e);
			}
		}
	}
//	public Long getId() {
//		return id;
//	}
//	public void setId(Long id) {
//		this.id = id;
//	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	public String getImgUri() {
		return imgUri;
	}
	public void setImgUri(String imgUri) {
		this.imgUri = imgUri;
	}
	public Integer getOrd() {
		return ord;
	}
	public void setOrd(Integer ord) {
		this.ord = ord;
	}
	public Integer getTypeSize() {
		return typeSize;
	}
	public void setTypeSize(Integer typeSize) {
		this.typeSize = typeSize;
	}
	public Integer getTypePostion() {
		return typePostion;
	}
	public void setTypePostion(Integer typePostion) {
		this.typePostion = typePostion;
	}
}

package com.zaq.homedo.bean;

import org.apache.log4j.Logger;

import com.zaq.homedo.BaseDao;

/**
 * 物品所拥有的属性
 * @author zaqzaq
 * 2015年12月1日
 *
 */
public class GoodsForLFProp {
	private Logger logger=Logger.getLogger(GoodsForLFProp.class);

	private Goods goods;
	private PropForList propForList;
	private Integer isTag;//1是 0：否
	String sql="INSERT INTO GoodsForLFProp (goodsId,isTag ,propForListId) VALUES (?,?,?)";
	public void save() {
		
		try {
			BaseDao.getInstance().storeInfo(sql, new Object[]{goods.getGoodsCode(),isTag,propForList.getId() });
		} catch (Exception e) {
			if(!e.getMessage().contains("Duplicate")){
				logger.error(goods.getName()+"-"+propForList.getProp().getPropertyId()
						+"-"+propForList.getProp().getName()+"-"+propForList.getValue()+"-"+isTag+"  物品属性保存失败", e);
			}
		}
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	public PropForList getPropForList() {
		return propForList;
	}
	public void setPropForList(PropForList propForList) {
		this.propForList = propForList;
	}
	public Integer getIsTag() {
		return isTag;
	}
	public void setIsTag(Integer isTag) {
		this.isTag = isTag;
	}
	
}

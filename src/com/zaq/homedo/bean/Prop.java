package com.zaq.homedo.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;

import com.zaq.homedo.BaseDao;

/**
 * 物品的属性类
 * @author zaqzaq
 * 2015年12月1日
 *
 */
public class Prop {
	private Logger logger=Logger.getLogger(Prop.class);
//	private Long id;
	private String propertyId;//它的Id
	private String name;//名称
	private Integer ord;//排序
	private Date updateTime;//最后更新时间
	
	private List<PropForList> forLists=new ArrayList<>();
	String sql="INSERT INTO Prop (propertyId, name,ord,updateTime) VALUES (?,?,?,?)";

	public void save(){
		try {
			BaseDao.getInstance().storeInfo(sql, new Object[]{propertyId,name,ord,updateTime});
			
		} catch (Exception e) {
			if(!e.getMessage().contains("Duplicate")){
				logger.error(name+"-"+propertyId+"  属性保存失败", e);
			}
		}
		for(PropForList pfl:forLists){
			pfl.save();
		}
	}
//	public Long getId() {
//		return id;
//	}
//	public void setId(Long id) {
//		this.id = id;
//	}
	public String getPropertyId() {
		return propertyId;
	}
	public List<PropForList> getForLists() {
		return forLists;
	}
	public void setForLists(List<PropForList> forLists) {
		this.forLists = forLists;
	}
	public Integer getOrd() {
		return ord;
	}
	public void setOrd(Integer ord) {
		this.ord = ord;
	}
	public void setPropertyId(String propertyId) {
		this.propertyId = propertyId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
}

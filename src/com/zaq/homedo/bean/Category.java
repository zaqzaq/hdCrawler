package com.zaq.homedo.bean;

import org.apache.log4j.Logger;

import com.zaq.homedo.BaseDao;

/**
 * 分类
 * @author zaqzaq
 * 2015年12月1日
 *
 */
public class Category {
	private Logger logger=Logger.getLogger(Category.class);
//	private Long id;
	private String categoryId;//它的分类ID
	private Integer ord;//排序
	private String name;//名称
	private String path; // 以|号隔开
	private Category parent;
	
	/**
	 * 保存到数据库
	 */
	public void save(){
		/*String sql="INSERT INTO Category (categoryId, ord,name,path,parent) VALUES (?,?,?,?,?)";
		
		try {
			BaseDao.getInstance().storeInfo(sql, new Object[]{categoryId,ord,name,path,parent==null?null:parent.getCategoryId()});
		} catch (Exception e) {
			if(!e.getMessage().contains("Duplicate")){
				logger.error(name+"-"+categoryId+"  分类类型保存失败", e);
			}
		}*/
		
		/*
		 * 镀锌钢管-10343  保存失败
		 * 桥架线槽-10342  保存失败
		 * */
	}
	
	public Category(String categoryId, String name, String path,Integer ord) {
		this.categoryId = categoryId;
		this.name = name;
		this.path = path;
		this.ord = ord;
	}
	public Category(String categoryId, String name, String path,Integer ord, Category parent) {
		this.categoryId = categoryId;
		this.name = name;
		this.path = path;
		this.ord = ord;
		this.parent = parent;
	}
	
//	public Long getId() {
//		return id;
//	}
//
//	public void setId(Long id) {
//		this.id = id;
//	}

	public Integer getOrd() {
		return ord;
	}

	public void setOrd(Integer ord) {
		this.ord = ord;
	}

	public String getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public Category getParent() {
		return parent;
	}
	public void setParent(Category parent) {
		this.parent = parent;
	}
	
}

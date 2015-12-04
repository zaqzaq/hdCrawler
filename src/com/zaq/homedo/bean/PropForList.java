package com.zaq.homedo.bean;

import java.io.IOException;

import org.apache.log4j.Logger;

import com.zaq.homedo.AppUtil;
import com.zaq.homedo.BaseDao;
import com.zaq.homedo.ThreadPool;

/**
 * 属性拥有的类型
 * @author zaqzaq
 * 2015年12月1日
 *
 */
public class PropForList {
	private Logger logger=Logger.getLogger(PropForList.class);
	private Long id;
	private Prop prop;
	private String value;
	private Integer ord;//排序
	
	String sql="INSERT INTO PropForList (propId, value,ord) VALUES (?,?,?)";
	String sqlQ="select id from PropForList where value=? and propId=? ";
	public void save() {
		try {
			//先判断 propId value 是否唯一
			this.id=(Long) BaseDao.getInstance().getAnAttr(sqlQ, new Object[]{value,prop.getPropertyId()});
			
			if(null==this.id||0==this.id){
				this.id=BaseDao.getInstance().storeInfoAndGetGeneratedKey(sql, new Object[]{prop.getPropertyId(),value,ord});
			}
		} catch (Exception e) {
			if(!e.getMessage().contains("Duplicate")){
				logger.error(value+"-"+prop.getPropertyId()+"-"+prop.getName()+"  属性值保存失败", e);
			}
		}
	}
	
	
	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public Prop getProp() {
		return prop;
	}
	public void setProp(Prop prop) {
		this.prop = prop;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public Integer getOrd() {
		return ord;
	}
	public void setOrd(Integer ord) {
		this.ord = ord;
	}
	
	public static void main(String[] args) throws Exception {
		AppUtil.init();
		
		String sqlQ="select id from PropForList where value=? and propId=? ";
				//先判断 propId value 是否唯一
		final Long id=(Long) BaseDao.getInstance().getAnAttr(sqlQ, new Object[]{"2KM","12089"});
				
		ThreadPool.execute(new Runnable() {
			
			@Override
			public void run() {
				System.out.println(id);
				
			}
		});
		ThreadPool.execute(new Runnable() {
			
			@Override
			public void run() {
				System.out.println(id);
				
			}
		});
		
	}
}

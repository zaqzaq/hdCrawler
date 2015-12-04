package com.zaq.homedo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

public class BaseDao {
    
    private static BaseDao dbBase=new BaseDao();  
      
    private static QueryRunner run ;  
      
    private static DataSource dataSource;  
      
    public static DataSource getDataSource() {
		return dataSource;
	}

	private BaseDao(){}  
      
      
    public static BaseDao getInstance(){  
    	if(null==dbBase){
    		dbBase=new BaseDao(); 
    	}
    	run=DbHelper.getQueryRunner();  
    	dataSource=run.getDataSource();
        return dbBase;  
    }  
      
      
    /** 
     * eg: 
     * select count(1) from user 
     *  
     * @param sql 
     * @param params 
     * @return 
     * @throws SQLException 
     */  
    public int count(String sql, Object... params) throws SQLException{  
          
        Object o = getAnAttr(sql,params);  
        if(o instanceof Integer){  
            return (Integer) o;  
        }  
        if(o instanceof Long){  
            Long l = (Long)o;  
            return l.intValue();  
        }  
          
        String s = (String)o;  
        try{  
            return Integer.parseInt(s);  
        }catch (NumberFormatException e) {  
            return 0;  
        }  
    }  
       
     /** 
      * 获得第一个查询第一行第一列 
      * @param sql 
      * @param params 
      * @return 
     * @throws SQLException 
      */  
    public Object getAnAttr(String sql, Object... params) throws SQLException{  
  
        showSql(sql);  
  
        Object s=null;  
            s = run.query(sql, new ScalarHandler(1),params);  
        return s;  
    }  
    /** 
     * 查询返回单个对象 
     * @param sql 
     * @param clazz 
     * @return 
     * @throws SQLException 
     */   
    public <T> T queryForObject(Class<T> clazz,String sql,Object... param) throws SQLException{        
        T obj = null;  
            showSql(sql);             
            obj = (T)run.query(sql,new BeanHandler<T>(clazz), param);            
        return obj;  
    }  
    
    /** 
     * 查询返回单个对象 
     * @param sql 
     * @param clazz 
     * @return 
     * @throws SQLException 
     */   
    public ResultSet queryForObject(Connection conn, String sql,Object... param) throws SQLException{        
            showSql(sql);     
            if(sql == null)
            {
                throw new SQLException("Null SQL statement");
            }
            if(conn == null)
                throw new SQLException("Null connection");
            PreparedStatement stmt=conn.prepareStatement(sql);
            int i=1;
            for(Object o:param){
            	stmt.setObject(i++, o);
            }
            
            ResultSet rs=stmt.executeQuery();
            return rs;
    }
      
    /** 
     * 查询返回list对象 
     * @param sql 
     * @param clazz 
     * @return 
     * @throws SQLException 
     */  
    public <T> List<T> queryForOList(Class<T> clazz,String sql,Object... param) throws SQLException{  
        List<T> obj = null;  
            showSql(sql);  
            obj = (List<T>)run.query(sql,new BeanListHandler<T>(clazz),param);             
        return obj;  
    }  
      
      
    /** 
     * 保存返回主键 
     * @param sql 
     * @param param 
     * @return 
     * @throws SQLException 
     */  
    public long storeInfoAndGetGeneratedKey(String sql,Object... param) throws SQLException{  
        long pk=0;  
        
            showSql(sql);  
            run.update(sql,param);  
            pk = Long.valueOf(run.query("SELECT LAST_INSERT_ID()", new ScalarHandler(1)).toString());   
            

        return pk;  
    }  
    
    public void storeInfo(String sql,Object... param) throws SQLException{  
        showSql(sql);  
        run.update(sql,param);  
    } 
    
    public void storeInfo(Connection conn,String sql,Object... param) throws SQLException{  
    	conn.setAutoCommit(false);
        showSql(sql);  
        if(null==conn){
        	conn= run.getDataSource().getConnection();
        }
        run.update(conn,sql,param);  

    } 
    
    /** 
     * 保存返回主键  用于事务
     * @param sql 
     * @param param 
     * @return 返回主键  conn需要关闭
     * @throws SQLException 
     */  
    public long storeInfoAndGetGeneratedKey(Connection conn,String sql,Object... param) throws SQLException{  
    	conn.setAutoCommit(false);
        long pk=0;  
            showSql(sql);  
            if(null==conn){
            	conn= run.getDataSource().getConnection();
            }
            run.update(conn,sql,param);  
//            pk = ((Long)run.query(conn,"SELECT LAST_INSERT_ID()", new ScalarHandler(1))).intValue();   
            pk = Long.valueOf(run.query(conn,"SELECT LAST_INSERT_ID()", new ScalarHandler(1)).toString());   
            System.out.println("pkId="+pk+"   --"+run.query("SELECT LAST_INSERT_ID()", new ScalarHandler(1)));

        return pk;  
    } 
    /** 
     * 更新 
     * @param sql 
     * @return conn需要关闭
     * @throws SQLException 
     */  
      
    public int update(Connection conn, String sql,Object... param) throws SQLException{  
    	conn.setAutoCommit(false);
        int i=0;  
            showSql(sql);  
            i = run.update(conn,sql,param);  
        return i;  
  
    }  
    
    /** 
     * 更新 
     * @param sql 
     * @return 
     * @throws SQLException 
     */  
      
    public int update(String sql,Object... param) throws SQLException{  
        int i=0;  
            showSql(sql);  
            i = run.update(sql,param);  
        return i;  
  
    }  
      
    private void showSql(String sql){  
        if(AppUtil.getPropertity("SHOW_SQL").equals("true")){  
            System.out.println(sql);  
        }  
    }  
  
    /** 
     * @param args 
     * @throws IOException 
     * @throws SQLException 
     */  
    public static void main(String[] args) throws IOException, SQLException {  
    	AppUtil.init();
        BaseDao db = BaseDao.getInstance();  
          
        String sql = "insert into login_situation(username,message,userId) values(?,?,?)";  
        long pk = BaseDao.getInstance().storeInfoAndGetGeneratedKey(db.getDataSource().getConnection(),sql, new Object[]{"a","msg","1"});  
        System.out.println(pk);  
        
        sql = "select count(1) from app_user";     
        int i = db.count(sql,null);  
        
        System.out.println(i);
        
        sql ="select fullname from app_user where userid =?";  
        String a =(String) BaseDao.getInstance().getAnAttr(sql, new Object[]{1});  
          
        System.out.println(a);  
      
    }  
}

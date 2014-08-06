package com.auth.dao;

import java.util.List;

import com.auth.pojo.Driver;

public interface DriverDao {
	
	//返回数据库中的司机数据。
	public List getDriver();
	
	//获取该司机的主外键关联关系。
	public List getfk(Driver driver);
	
	//通过标识符检索司机。
	public Driver getDriverById(int id);

	//添加司机。
	public void addDriver(Driver driver);
	
	//通过姓名检索司机。
	public List getDriverByName(String username);
	
	//通过编号检索司机。
	public Driver getDriverByNum(String numcode);
	
	//通过标识符删除司机。
	public void delDriverById(int id);
	
	//批量删除司机。
	public void mutidel(String[] ids);
	
	//更新司机数据。
	public void updatedriver(Driver driver);
	
	//解除改司机的主外键关联，并在响应表中插入空数据。
	public void disassociated(Driver driver);
}
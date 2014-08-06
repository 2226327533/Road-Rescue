package com.auth.services;

import java.util.List;

import com.auth.pojo.Driver;

public interface DriverService {
	
	//添加司机。
	public boolean addDriver(Driver driver);
	
	//检索所有司机。
	public List showDriver();
	
	//通过编号检索司机。
	public Driver getDriverById(int id);
		
	//通过编号检索司机。
	public Driver getDriverBynum(String driverid);
	
	//更新司机数据。
	public void updateDriver(int driverid,Driver driver);
	
	//单一删除司机。
	public void delDriver(int driverid);
	
	//批量删除司机。
	public void mutidel(String[] ids);
}

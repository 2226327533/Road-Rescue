package com.auth.services;

import java.util.List;

import com.auth.pojo.CarInformation;
import com.auth.pojo.Driver;

public interface CarService {
	public void changeStatus(int carId, String toStatus);

	// 添加车。
	public boolean addCar(CarInformation carInformation);

	// 检索所有车。
	public List showCar();

	// 通过编号检索车。
	public CarInformation getCarById(int id);

	//通过编号检索车。
	public CarInformation getDriverBycode(String carid);
	
	// 通过车牌号检索车。
	public CarInformation getCarByNum(String carnum);

	// 更新车数据。
	public void updateCar(int carid, CarInformation carInformation);

	// 单一删除车。
	public void delCar(int driverid);

	// 批量删除车。
	public void mutidel(String[] ids);
}

package com.auth.dao;

import java.util.List;

import com.auth.pojo.CarInformation;
import com.auth.pojo.Driver;

/**
 * 
 * @author
 * 
 */
public interface CarDao {
	/**
	 * 
	 * @param toStatus
	 *            将车辆的状态转换为 toStatus
	 */
	public void changeStatus(int carId, String toStatus);

	// 返回数据库中的车辆数据。
	public List getCar();

	// 通过标识符检索车辆。
	public CarInformation getCarById(int id);

	// 添加车辆。
	public void addCar(CarInformation carInformation);

	// 通过车牌号检索车辆。
	public CarInformation getCarByNum(String carnum);
	
	// 通过标识符删除车辆。
	public void delCarById(int id);

	//通过编号检索车。
	public CarInformation getCarByCode(String numcode);
	
	// 批量删除车辆。
	public void mutidel(String[] ids);

	// 更新车辆数据。
	public void updateCar(CarInformation carInformation);
}

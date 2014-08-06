package com.auth.services.Impl;

import java.util.List;

import com.auth.dao.CarDao;
import com.auth.pojo.CarInformation;
import com.auth.services.CarService;

public class CarServiceImpl implements CarService {
	private CarDao carDao;

	public CarDao getCarDao() {
		return carDao;
	}

	public void setCarDao(CarDao carDao) {
		this.carDao = carDao;
	}

	public void changeStatus(int carId, String toStatus) {
		carDao.changeStatus(carId, toStatus);
	}

	public boolean addCar(CarInformation carInformation) {
		if (carDao.getCarByNum(carInformation.getCarnum()) == null) {
			carDao.addCar(carInformation);
			return true;
		} else {
			return false;
		}
	}

	public List showCar() {
		return carDao.getCar();
	}

	public CarInformation getCarById(int id) {
		return carDao.getCarById(id);
	}

	public void updateCar(int carid, CarInformation carInformation) {
		carInformation.setId(carid);
		carDao.updateCar(carInformation);

	}

	public void delCar(int driverid) {
		carDao.delCarById(driverid);
	}

	public void mutidel(String[] ids) {
		carDao.mutidel(ids);
	}

	public CarInformation getCarByNum(String carnum) {
		return carDao.getCarByNum(carnum);
	}

	public CarInformation getDriverBycode(String carid) {
		return carDao.getCarByCode(carid);
	}
}

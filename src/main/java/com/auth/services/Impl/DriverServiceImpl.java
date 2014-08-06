package com.auth.services.Impl;

import java.util.List;

import com.auth.dao.DriverDao;
import com.auth.pojo.Driver;
import com.auth.services.DriverService;

public class DriverServiceImpl implements DriverService {
	private DriverDao driverDao;

	public void setDriverDao(DriverDao driverDao) {
		this.driverDao = driverDao;
	}

	public boolean addDriver(Driver driver) {
		if (driverDao.getDriverByNum(driver.getNumcode()) == null) {
			driverDao.addDriver(driver);
			return true;
		} else {
			return false;
		}
	}

	public List showDriver() {
		return driverDao.getDriver();
	}

	public Driver getDriverById(int id) {
		return driverDao.getDriverById(id);
	}

	public void updateDriver(int driverid, Driver driver) {
		driver.setId(driverid);
		driverDao.updatedriver(driver);
	}

	public void delDriver(int driverid) {
		Driver driver = driverDao.getDriverById(driverid);
		if (driverDao.getfk(driver)!= null) {
			System.out.println("发起关联判断！");
			driverDao.disassociated(driver);
			System.out.println("关联解除成功！");
			driverDao.delDriverById(driverid);
			System.out.println("记录删除成功！");
		} else {
			driverDao.delDriverById(driverid);
			System.out.println("记录删除成功！");
		}
	}

	public void mutidel(String[] ids) {
		driverDao.mutidel(ids);
	}

	public Driver getDriverBynum(String driverid) {
		return driverDao.getDriverByNum(driverid);
	}
}

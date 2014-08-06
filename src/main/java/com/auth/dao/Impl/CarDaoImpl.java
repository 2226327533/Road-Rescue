package com.auth.dao.Impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.auth.dao.CarDao;
import com.auth.pojo.CarInformation;
import com.auth.pojo.Driver;

public class CarDaoImpl implements CarDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public void changeStatus(int carId, String toStatus) {
		CarInformation car1 = (CarInformation) this.sessionFactory
				.getCurrentSession().load(CarInformation.class, carId);
		car1.setCarstatus(toStatus);
		this.sessionFactory.getCurrentSession().update(car1);
		this.sessionFactory.getCurrentSession().flush();
	}

	public List getCar() {
		return this.sessionFactory.getCurrentSession()
				.createQuery("from CarInformation").list();
	}

	public CarInformation getCarById(int id) {
		return (CarInformation) this.sessionFactory.getCurrentSession().load(
				CarInformation.class, id);
	}

	public void addCar(CarInformation carInformation) {
		this.sessionFactory.getCurrentSession().save(carInformation);
	}

	public CarInformation getCarByNum(String carnum) {
		return (CarInformation)this.getSessionFactory().getCurrentSession().createQuery("from CarInformation c where c.carnum = '" + carnum + "'").uniqueResult();
	}

	public void delCarById(int id) {
		Session ses = sessionFactory.getCurrentSession();
		ses.delete(getCarById(id));
		ses.flush();
	}

	public void mutidel(String[] ids) {
		for (String id : ids) {
			delCarById(Integer.parseInt(id));
		}
	}

	public void updateCar(CarInformation carInformation) {
		Session ses = sessionFactory.getCurrentSession();
		ses.update(carInformation);
		ses.flush();
	}

	public CarInformation getCarByCode(String numcode) {
		return (CarInformation) this.sessionFactory.getCurrentSession()
				.createQuery("from CarInformation c where c.numcode=:num")
				.setString("num", numcode).uniqueResult();
	}
}

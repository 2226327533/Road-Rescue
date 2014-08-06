package com.auth.dao.Impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.auth.dao.DriverDao;
import com.auth.pojo.CarInformation;
import com.auth.pojo.Driver;

public class DriverDaoImpl implements DriverDao {

	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public void addDriver(Driver driver) {
		this.sessionFactory.getCurrentSession().save(driver);
	}

	public Driver getDriverById(int id) {
		return (Driver) this.sessionFactory.getCurrentSession().load(
				Driver.class, id);
	}

	public List getDriverByName(String username) {
		return this.sessionFactory.getCurrentSession()
				.createQuery("from Driver d where d.name=:username")
				.setString("username", username).list();
	}

	public List getDriver() {
		return this.sessionFactory.getCurrentSession()
				.createQuery("from Driver").list();
	}

	public void delDriverById(int id) {
		Session ses = sessionFactory.getCurrentSession();
		ses.delete(getDriverById(id));
		ses.flush();
	}

	public void mutidel(String[] ids) {
		Driver driver;
		for (String id : ids) {
			driver = getDriverById(Integer.parseInt(id));
			if (getfk(driver) != null) {
				disassociated(driver);
				delDriverById(Integer.parseInt(id));
			} else {
				delDriverById(Integer.parseInt(id));
			}
		}
	}

	public List getfk(Driver driver) {
		List list = this.sessionFactory.getCurrentSession()
				.createQuery("from CarInformation c where c.driver=:driver")
				.setParameter("driver", driver).list();
		return list;
	}

	public void updatedriver(Driver driver) {
		Session ses = sessionFactory.getCurrentSession();
		ses.update(driver);
		ses.flush();
	}

	public void disassociated(Driver driver) {
		Session ses = sessionFactory.getCurrentSession();
		List aList = ses
				.createQuery("from CarInformation c where c.driver=:driver")
				.setParameter("driver", driver).list();
		for (int i = 0; i < aList.size(); i++) {
			CarInformation carInformation = ((CarInformation) aList.get(i));
			carInformation.setDriver(null);
			ses.update(carInformation);
			ses.flush();
		}
	}

	public Driver getDriverByNum(String numcode) {
		return (Driver) this.sessionFactory.getCurrentSession()
				.createQuery("from Driver d where d.numcode=:num")
				.setString("num", numcode).uniqueResult();
	}
}
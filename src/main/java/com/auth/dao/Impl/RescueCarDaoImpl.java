package com.auth.dao.Impl;

import java.util.List;

import org.hibernate.SessionFactory;

import com.auth.dao.RescueCarDao;
import com.auth.pojo.Driver;
import com.auth.pojo.Rescueapply;
import com.auth.pojo.User;

public class RescueCarDaoImpl implements RescueCarDao {
	SessionFactory sessionFactory;
	
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}


	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}


	public List getCars() {
		String hql = "from CarInformation";
		return this.sessionFactory.getCurrentSession().createQuery(hql).list();
		
	}


	public void addRescueApply(Rescueapply rescueApply) {
		this.sessionFactory.getCurrentSession().save(rescueApply);
	}


	public Rescueapply updateRescue(Rescueapply rescue, int rescueId) {
		Rescueapply r = (Rescueapply)this.getSessionFactory().getCurrentSession().load(Rescueapply.class, rescueId);
		r.setReturntime(rescue.getReturntime());
		r.setMileage(rescue.getMileage());
		r.setRealcost(rescue.getRealcost());
		r.setIncomebalance(rescue.getIncomebalance());
		r.setReturmemo(rescue.getReturmemo());
		r.setIfpay(rescue.getIfpay());
		r.setPaytype(rescue.getPaytype());
		r.setStatus(rescue.getStatus());
		this.getSessionFactory().getCurrentSession().update(r);
		this.getSessionFactory().getCurrentSession().flush();
		return r;
	}


	public void saveOrUpdateRes(Rescueapply rescue) {
		this.getSessionFactory().getCurrentSession().saveOrUpdate(rescue);
		this.getSessionFactory().getCurrentSession().flush();
	}


	public List getAllRescueMess() {
		return this.getSessionFactory().getCurrentSession().createQuery("from Rescueapply r order by r.applytime desc").list();
	}


	public List getMessByStatus(String status) {
		return this.getSessionFactory().getCurrentSession().createQuery("from Rescueapply r where r.status = '" + status + "' order by r.applytime desc").list();
	}


	public Rescueapply getRescueById(int rescueId) {
		return (Rescueapply) this.getSessionFactory().getCurrentSession().load(Rescueapply.class,rescueId);
	}


	public List getMessByTime(String beginTme, String endTime,String rescueStatus) {
		String hql = "";
		if(beginTme!=null&&!beginTme.trim().equals("")){
			if(endTime!=null&&!endTime.trim().equals("")){
				hql = "from Rescueapply r where r.applytime >=:beginTime and r.applytime <=:endTime" + rescueStatus;
				return this.sessionFactory.getCurrentSession().createQuery(hql).setParameter("beginTime",beginTme).setParameter("endTime",endTime).list();
			}
			else{
				hql = "from Rescueapply r where r.applytime >=:beginTime" + rescueStatus;
				return this.sessionFactory.getCurrentSession().createQuery(hql).setParameter("beginTime",beginTme).list();
			}
		}else{
			if(endTime!=null&&!endTime.trim().equals("")){
				hql = "from Rescueapply r where r.applytime <=:endTime" + rescueStatus;
				return this.sessionFactory.getCurrentSession().createQuery(hql).setParameter("endTime",endTime).list();
			}else{
				return null;
			}
		}
	}


	public List getMessByDriver(String driver,String rescueStatus) {
		String hql = "from Rescueapply r where r.driver = :driver" + rescueStatus;
		return this.sessionFactory.getCurrentSession().createQuery(hql).setParameter("driver",driver).list();

	}


	public List getMessByUser(String username,String rescueStatus) {
		String hql = "from Rescueapply r where r.applyperson = :applyperson" + rescueStatus;
		return this.sessionFactory.getCurrentSession().createQuery(hql).setParameter("applyperson",username).list();
	}
	
	public List getMessByTimeAndDriver(String beginTme, String endTime,String driver,String rescueStatus) {
		
		if(beginTme!=null&&!beginTme.trim().equals("")){
			if(endTime!=null&&!endTime.trim().equals("")){
				String hql = "from Rescueapply r where r.applytime >=:beginTime and r.applytime <=:endTime and r.driver=:driver" + rescueStatus;
				return this.sessionFactory.getCurrentSession().createQuery(hql).setParameter("beginTime",beginTme).setParameter("endTime",endTime).setParameter("driver", driver).list();
			}
			else{
				String hql = "from Rescueapply r where r.applytime >=:beginTime and r.driver=:driver" + rescueStatus;
				return this.sessionFactory.getCurrentSession().createQuery(hql).setParameter("beginTime",beginTme).setParameter("driver", driver).list();
			}
		}else{
			if(endTime!=null&&!endTime.trim().equals("")){
				String hql = "from Rescueapply r where r.applytime <=:endTime and r.driver=:driver" + rescueStatus;
				return this.sessionFactory.getCurrentSession().createQuery(hql).setParameter("endTime",endTime).setParameter("driver", driver).list();
			}else{
				return null;
			}
		}
	}


	public List getMessByTimeAndUser(String beginTme, String endTime,
			String username,String rescueStatus) {
		
		if(beginTme!=null&&!beginTme.trim().equals("")){
			if(endTime!=null&&!endTime.trim().equals("")){
				String hql = "from Rescueapply r where r.applytime >=:beginTime and r.applytime <=:endTime and r.applyperson=:applyperson" + rescueStatus;
				return this.sessionFactory.getCurrentSession().createQuery(hql).setParameter("beginTime",beginTme).setParameter("endTime",endTime).setParameter("applyperson", username).list();			}
			else{
				
				String hql = "from Rescueapply r where r.applytime >=:beginTime and r.applyperson=:applyperson" + rescueStatus;
				return this.sessionFactory.getCurrentSession().createQuery(hql).setParameter("beginTime",beginTme).setParameter("applyperson", username).list();
			}
		}else{
			if(endTime!=null&&!endTime.trim().equals("")){
				String hql = "from Rescueapply r where r.applytime <=:endTime and r.applyperson=:applyperson" + rescueStatus;
				return this.sessionFactory.getCurrentSession().createQuery(hql).setParameter("endTime",endTime).setParameter("applyperson", username).list();
			}else{
				return null;
			}
		}

	}


	public List getMessByDriverAndUser(String driver, String username,String rescueStatus) {
		String hql = "from Rescueapply r where r.driver = :driver and r.applyperson=:username" + rescueStatus;
		return this.sessionFactory.getCurrentSession().createQuery(hql).setParameter("driver",driver).setParameter("username",username).list();


	}

	public List getMessByDriverAndUserAndTime(String driver, String username,
			String begin, String end,String rescueStatus) {
		String hql = "from Rescueapply r where r.driver = :driver and r.applyperson=:username and r.applytime >=:beginTime and r.applytime <=:endTime" + rescueStatus;
		return this.sessionFactory.getCurrentSession().createQuery(hql).setParameter("driver",driver).setParameter("username",username).setParameter("beginTime",begin).setParameter("endTime", end).list();

	}


	public void delRescueById(int id) {
		Rescueapply r = (Rescueapply)this.getSessionFactory().getCurrentSession().load(Rescueapply.class,id);
		this.getSessionFactory().getCurrentSession().delete(r);
		this.getSessionFactory().getCurrentSession().flush();
	}


	public void multiDel(String[] ids) {
		for(String id:ids){
			delRescueById(Integer.parseInt(id));
		}
	}

}

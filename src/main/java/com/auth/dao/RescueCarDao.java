package com.auth.dao;

import java.util.List;

import com.auth.pojo.Rescueapply;
/**
 * 
 * @author Hale
 * 救援派遣Dao
 */

public interface RescueCarDao{
	/**
	 * 
	 * @return List<Car_infromation>
	 * 
	 */
	public List getCars();
	public Rescueapply getRescueById(int rescueId);
	public void addRescueApply(Rescueapply rescueApply);
	public Rescueapply updateRescue(Rescueapply rescue,int rescueId);
	/**
	 * 更新救援信息
	 * @param rescue
	 */
	public void saveOrUpdateRes(Rescueapply rescue);
	/**
	 * 得到所有的救援信息
	 * @return
	 */
	public List getAllRescueMess();
	
	/**
	 * 根据救援请求状态查询出所有救援请求
	 * @param status
	 * @return
	 */
	public List getMessByStatus(String status);
	
	/**
	 * 通过申请时间来查询救援请求
	 * @param beginTme
	 * @param endTime
	 * @return
	 */
	public List getMessByTime(String beginTme,String endTime,String rescueStatus);
	
	/**
	 * 通过救援司机来查询救援请求
	 * @param driver
	 * @return
	 */
	public List getMessByDriver(String driver,String rescueStatus);
	
	/**
	 * 通过时间和司机查询救援请求
	 * @param beginTme
	 * @param endTime
	 * @param driver
	 * @return
	 */
	public List getMessByTimeAndDriver(String beginTme,String endTime,String driver,String rescueStatus);
	/**
	 * 通过时间和申请人查询救援请求
	 * @param beginTme
	 * @param endTime
	 * @param username
	 * @return
	 */
	public List getMessByTimeAndUser(String beginTme,String endTime,String username,String rescueStatus);
	/**
	 * 通过司机和申请人查询救援请求
	 * @param driver
	 * @param username
	 * @return
	 */
	public List getMessByDriverAndUser(String driver,String username,String rescueStatus);
	/**
	 * 通过 司机、申请人、申请时间进行查询
	 * @param driver
	 * @param username
	 * @param begin
	 * @param end
	 * @return
	 */
	public List getMessByDriverAndUserAndTime(String driver,String username,String begin,String end,String rescueStatus);
	/**
	 * 通过调度员查询救援请求
	 * @param user
	 * @return
	 */
	public List getMessByUser(String username,String rescueStatus);
	/**
	 * 通过ID删除救援信息
	 * @param id
	 */
	public void delRescueById(int id);
	
	public void multiDel(String []ids);
}

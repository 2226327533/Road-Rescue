package com.auth.services.Impl;

import java.util.List;

import com.auth.dao.RescueCarDao;
import com.auth.pojo.Rescueapply;
import com.auth.services.RescueCarService;

public class RescueCarServiceImpl implements RescueCarService{

	public RescueCarDao rescueCarDao;
	
	public RescueCarDao getRescueCarDao() {
		return rescueCarDao;
	}

	public void setRescueCarDao(RescueCarDao rescueCarDao) {
		this.rescueCarDao = rescueCarDao;
	}

	public List getCars() {
		return rescueCarDao.getCars();
	}

	public void addRescueApply(Rescueapply rescueApply) {
		rescueCarDao.addRescueApply(rescueApply);
	}
	public Rescueapply updateRescue(Rescueapply rescue,int rescueId){
		return rescueCarDao.updateRescue(rescue, rescueId);
	}

	public void saveOrUpdateRes(Rescueapply rescue) {
		rescueCarDao.saveOrUpdateRes(rescue);
	}

	public List getAllRescueMess() {
		return rescueCarDao.getAllRescueMess();
	}

	public List getMessByStatus(String status) {
		return rescueCarDao.getMessByStatus(status);
	}

	public Rescueapply getRescueById(int rescueId) {
		return rescueCarDao.getRescueById(rescueId);
	}

	public void delRescueById(int id) {
		rescueCarDao.delRescueById(id);
	}

	public List getMessBy(String time_begin, String time_end, String driver,
			String shenqingren,String type) {
		String rescueStatus = "";//查询类型 用于区分查询的救援请求的类型
		if(type=="listAll"||type.trim().equals("listAll")){
			rescueStatus = "";
		}
		if(type=="yiqueren"||type.trim().equals("yiqueren")){
			rescueStatus = " and r.status = '申请已确认'";
		}
		if(type=="yipaichu"||type.trim().equals("yipaichu")){
			rescueStatus = " and r.status = '车辆已派出'";
		}
		if(type=="yijieshu"||type.trim().equals("yijieshu")){
			rescueStatus = " and r.status = '救援已结束'";
		}
		
		
		
		boolean b1,b2,b3;
		if(driver==null ||driver.trim().equals("")){//司机为空  B1为假
			b1 = false;
		}else{
			b1 = true;
		}
		if(shenqingren==null ||shenqingren.trim().equals("")){//申请人为空  B2为假
			b2 = false;
		}else{
			b2 = true;
		}
		if((time_begin==null ||time_begin.trim().equals(""))&&(time_end==null ||time_end.trim().equals(""))){//时间为空  B3为假
			b3 = false;
		}else{
			b3 = true;
		}
		if(b1){
			if(b2){
				if(b3){
					return rescueCarDao.getMessByDriverAndUserAndTime(driver, shenqingren, time_begin, time_end,rescueStatus);
				}else{
					return rescueCarDao.getMessByDriverAndUser(driver, shenqingren,rescueStatus);
				}
			}else{
				if(b3){
					return rescueCarDao.getMessByTimeAndDriver(time_begin, time_end, driver,rescueStatus);
				}else{
					return rescueCarDao.getMessByDriver(driver,rescueStatus);
				}
			}
		}else{
			if(b2){
				if(b3){
					return rescueCarDao.getMessByTimeAndUser(time_begin, time_end, shenqingren,rescueStatus);
				}else{
					return rescueCarDao.getMessByUser(shenqingren,rescueStatus);
				}
			}else{
				if(b3){
					return rescueCarDao.getMessByTime(time_begin, time_end,rescueStatus);
				}else{
					if(type=="listAll"||type.trim().equals("listAll")){
						return rescueCarDao.getAllRescueMess();
					}
					if(type=="yiqueren"||type.trim().equals("yiqueren")){
						return rescueCarDao.getMessByStatus("申请已确认");
					}
					if(type=="yipaichu"||type.trim().equals("yipaichu")){
						return rescueCarDao.getMessByStatus("车辆已派出");
					}
					if(type=="yijieshu"||type.trim().equals("yijieshu")){
						return rescueCarDao.getMessByStatus("救援已结束");
					}else{
						return null;
					}
				}
			}
		}
	}

	public void multiDel(String[] ids) {
		rescueCarDao.multiDel(ids);
	}
}

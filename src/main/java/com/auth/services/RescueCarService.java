package com.auth.services;

import java.util.List;

import com.auth.pojo.Rescueapply;

public interface RescueCarService {
	public List getCars();
	public void addRescueApply(Rescueapply rescueApply);
	public Rescueapply updateRescue(Rescueapply rescue,int rescueId);
	public void saveOrUpdateRes(Rescueapply rescue);
	public List getAllRescueMess();
	public List getMessByStatus(String status);
	public Rescueapply getRescueById(int rescueId);
	public void delRescueById(int id);
	public List getMessBy(String time_begin,String time_end,String driver,String shenqingren,String type);
	public void multiDel(String[] ids);
}

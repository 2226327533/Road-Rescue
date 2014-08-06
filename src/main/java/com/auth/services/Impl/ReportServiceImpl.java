package com.auth.services.Impl;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.auth.dao.CarDao;
import com.auth.dao.ReportDao;
import com.auth.pojo.CarInformation;
import com.auth.pojo.Rescueapply;
import com.auth.services.ReportService;

public class ReportServiceImpl implements ReportService {
	@Resource(name="reportService")
	private ReportService rs;
	private CarDao carDao;
	public List myList;
	public String youhao;
	public String form_name;
	public CarDao getCarDao() {
		return carDao;
	}

	public void setCarDao(CarDao carDao) {
		this.carDao = carDao;
	}
	private ReportDao reportDao;
	
	public ReportDao getReportDao() {
		return reportDao;
	}

	public void setReportDao(ReportDao reportDao) {
		this.reportDao = reportDao;
	}
//查询数据
	public List showReport(String time_begin,String time_end) {
		
		List<Rescueapply> aList = reportDao.dataQuery(time_begin,time_end);
		CarInformation carInformation;
		for (Rescueapply res : aList) {
			carInformation = carDao.getCarByNum(res.getRescuecar());
			res.setCarcolor(carInformation.getNumcode());
			
		}
		return aList;
	}
//ReportController中showView()和detailList()调用
	public void showView_include(HttpServletRequest request)  {
		String day_begin = request.getParameter("time_begin");
		String day_end = request.getParameter("time_end");
		youhao = request.getParameter("youhao");
		String time_begin = day_begin+" 00:00:00";
		String time_end = day_end+" 23:59:59";
		myList = rs.showReport(time_begin,time_end);
		form_name = request.getParameter("form_name");
		request.setAttribute("myListSize",myList.size());//分页所需查询记录总数
		request.setAttribute("reportList",myList);
		request.setAttribute("time_begin", day_begin);
		request.setAttribute("time_end", day_end);
		request.setAttribute("oil_expend",youhao);
		
	}
	
	
	
//ReportController中daliyList()和dailyDetailList()调用	
	public void daliyList_include(HttpServletRequest request) {
		String time_day = request.getParameter("time_day");
		request.setAttribute("time_day", time_day);
		youhao = request.getParameter("youhao");
		request.setAttribute("youhao", youhao);
		String time_begin = time_day+" 00:00:00";
		String time_end = time_day+" 23:59:59";
		myList = rs.showReport(time_begin,time_end);
		form_name = request.getParameter("form_name");
		request.setAttribute("reportList",myList );
	}
	
	public boolean saveToExcel()throws IOException {
		reportDao.toExcel(myList, youhao,form_name);
		return true;
	}
	public boolean saveToExcel1() throws IOException {
		reportDao.toExcel1(myList, youhao,form_name);
		return true;
	}
	
//public List day_showReport(String time_begin,String time_end) {
//		
//		List<Rescueapply> aList = reportDao.dataQuery(time_begin,time_end);
//		CarInformation carInformation;
//		for (Rescueapply res : aList) {
//			carInformation = carDao.getCarByNum(res.getRescuecar());
//			res.setCarcolor(carInformation.getNumcode());
//			
//		}
//		return aList;
//	}
}

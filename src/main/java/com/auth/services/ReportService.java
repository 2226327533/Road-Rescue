package com.auth.services;



import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;



public interface ReportService {
	public List showReport(String time_begin,String time_end);
	public void showView_include(HttpServletRequest request) ;
	public void daliyList_include(HttpServletRequest request);
	public boolean saveToExcel()throws IOException;
	public boolean saveToExcel1()throws IOException;
//	public List day_showReport(String time_begin,String time_end);
}

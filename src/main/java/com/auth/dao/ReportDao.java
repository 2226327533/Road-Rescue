package com.auth.dao;

import java.io.IOException;
import java.util.List;


public interface ReportDao {
	public List dataQuery(String time_begin,String time_end);
//	public List day_dataQuery(String time_begin,String time_end);
	public void toExcel(List ls,String youhao,String form_name)throws IOException;
	public void toExcel1(List ls,String youhao,String form_name)throws IOException;
}

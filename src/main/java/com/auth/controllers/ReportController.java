package com.auth.controllers;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.auth.services.ReportService;

@Controller
@RequestMapping("/report")
public class ReportController extends MultiActionController {
	@Resource(name="reportService")
	private ReportService rs;
	
	
	
	@RequestMapping("showView")
	public String showView(HttpServletRequest request) throws IOException {
//		运营统计报表
		
		rs.showView_include(request);
		return "report/list";
	}
	
	@RequestMapping("daliyList")
	public String daliyList(HttpServletRequest request) {	
//		运营统计日报表
		rs.daliyList_include(request);

		return "report/daliylist";
	}
	
	@RequestMapping("detailList")
	public String detailList(HttpServletRequest request)   {
//		运营统计详单
		rs.showView_include(request);
		return "report/detaillist";
	}
	
	@RequestMapping("daliyDetailList")
	public String dailyDetailList(HttpServletRequest request) {
//		运营统计日详单
		rs.daliyList_include(request);
		return "report/daliydetaillist";
	}
	
	@RequestMapping("toExcel")
	public void execute(HttpServletResponse response) throws IOException {
//		运营统计报表、运营统计日报表 导出Excel	
		if (rs.saveToExcel()) {
			response.getWriter().print("<script> alert(\"导出Excel成功!存储位置为D盘Report目录下！\"); </script>");
		}
		else {
			response.getWriter().print("<script> alert(\"导出Excel失败!\"); </script>");
		}
	}
	
	@RequestMapping("toExcel1")
	public void execute1(HttpServletResponse response) throws IOException {
//		运营统计详单、运营统计日详单 导出Excel	
		if (rs.saveToExcel1()) {
			response.getWriter().print("<script> alert(\"导出Excel成功!存储位置为D盘Report目录下！\"); </script>");
		}
		else {
			response.getWriter().print("<script> alert(\"导出Excel失败!\"); </script>");
		}
	}
}

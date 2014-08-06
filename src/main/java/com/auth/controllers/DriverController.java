package com.auth.controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.auth.pojo.Driver;
import com.auth.services.DriverService;

@Controller
@RequestMapping("/driver")
public class DriverController extends MultiActionController {

	private static String FALSE = "/status/false";
	private static String SHOW = "/driver/list";
	private static String EDIT = "/driver/EditDrivers";
	private static String LIST = "redirect:/driver/listdriver.htm";

	@Resource(name = "driverService")
	private DriverService ds;

	//添加用户。
	@RequestMapping("adddriver.htm")
	private String adddriver(HttpServletRequest request, Driver dr) {
		if (!ds.addDriver(dr)) {
			return FALSE;
		} else {
			return LIST;
		}
	}

	//显示数据库中的司机。
	@RequestMapping("listdriver.htm")
	private String selectdriver(HttpServletRequest request) {
		request.setAttribute("DriverList", ds.showDriver());
		return SHOW;
	}

	//通过前台注入的编号，提取要编辑的司机的数据到编辑页面。
	@RequestMapping("editdriver.htm")
	private String editdriver(HttpServletRequest request, int driverid) {
		request.setAttribute("driver", ds.getDriverById(driverid));
		return EDIT;
	}

	//通过前台注入的修改后的司机数据，持久化之。
	@RequestMapping("updatedriver.htm")
	private String updatedriver(HttpServletRequest request, Driver dr,
			int driverid) {
		ds.updateDriver(driverid, dr);
		return LIST;
	}

	//单一删除司机。
	@RequestMapping("deldriver.htm")
	private String deldriver(HttpServletRequest request, Driver dr, int driverid) {
		ds.delDriver(driverid);
		return LIST;

	}

	//批量删除司机。
	@RequestMapping("mutidel.htm")
	private String mutidel(HttpServletRequest request, String[] ids) {
		ds.mutidel(ids);
		return LIST;
	}
	
	//验证司机是否可以注册。
	@RequestMapping("checkdriver.htm")
	private void checkdriver(HttpServletRequest request,HttpServletResponse response,String driverid) throws IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		Driver driver = ds.getDriverBynum(driverid);
		if (driver!=null) {
			out.println("true");
		} else {
			out.println("false");
		}
	}
}
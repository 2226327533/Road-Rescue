package com.auth.controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.auth.pojo.CarInformation;
import com.auth.services.CarService;
import com.auth.services.DriverService;

@Controller
@RequestMapping("/car")
public class CarController {

	private static String FALSE = "/status/false";
	private static String SHOW = "/car/list";
	private static String EDIT = "/car/EditCars";
	private static String ADD = "/car/AddCars";
	private static String STATUS = "/car/carstatus";
	private static String LIST = "forward:/car/listcar.htm";

	@Resource(name = "carService")
	private CarService cs;

	@Resource(name = "driverService")
	private DriverService ds;

	// 准备司机数据
	@RequestMapping("readytoadd.htm")
	private String readytoadd(HttpServletRequest request) {
		request.setAttribute("drivers", ds.showDriver());
		return ADD;
	}

	// 添加车辆。
	@RequestMapping("addcar.htm")
	private String adddriver(HttpServletRequest request, CarInformation cars,
			int driverid) {
		if (driverid == 0) {
			cars.setDriver(null);
		} else {
			cars.setDriver(ds.getDriverById(driverid));
		}

		if (!cs.addCar(cars)) {
			return FALSE;
		} else {
			return LIST;
		}
	}

	// 显示数据库中的车。
	@RequestMapping("listcar.htm")
	private String selectdriver(HttpServletRequest request) {
		request.setAttribute("CarList", cs.showCar());
		return SHOW;
	}

	// 通过前台注入的编号，提取要编辑的车的数据到编辑页面。
	@RequestMapping("editcar.htm")
	private String editdriver(HttpServletRequest request, int carid) {
		request.setAttribute("car", cs.getCarById(carid));
		request.setAttribute("drivers", ds.showDriver());
		return EDIT;
	}

	// 通过前台注入的修改后的车数据，持久化之。
	@RequestMapping("updatecar.htm")
	private String updatedriver(HttpServletRequest request,
			CarInformation cars, int carid, String driverid) {
		if (driverid != null && !driverid.trim().equals("")) {
			System.out.println("asdasd");
			cars.setDriver(ds.getDriverById(Integer.parseInt(driverid)));
		} else {
			cars.setDriver(null);
		}
		cs.updateCar(carid, cars);
		return LIST;
	}

	// 单一删除车。
	@RequestMapping("delcar.htm")
	private String deldriver(HttpServletRequest request, CarInformation cars,
			int carid) {
		cs.delCar(carid);
		return LIST;

	}

	// 批量删除车。
	@RequestMapping("mutidel.htm")
	private String mutidel(HttpServletRequest request, String[] ids) {
		cs.mutidel(ids);
		return LIST;
	}
	
	//显示车辆状态
	@RequestMapping("liststatus.htm")
	private String liststatus(HttpServletRequest request) {
		request.setAttribute("CarList", cs.showCar());
		return STATUS;
	}
	
	//检查车辆编号是否注册
	@RequestMapping("checkcar.htm")
	private void checkcar(HttpServletRequest request,String carid,HttpServletResponse response) throws IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		CarInformation carInformation = cs.getDriverBycode(carid);		
		if (carInformation!=null) {
			out.println("true");
		} else {
			out.println("false");
		}
	}
	
	//检查车牌号是否注册
	@RequestMapping("checkcarnum.htm")
	private void checkcarnum(HttpServletRequest request,String carnum,HttpServletResponse response) throws IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String carnumconvert = new String(carnum.getBytes("ISO-8859-1"),"utf-8") ;
		CarInformation carInformation = cs.getCarByNum(carnumconvert);	
		if (carInformation!=null) {
			out.println("true");
		} else {
			out.println("false");
		}	
	}
}

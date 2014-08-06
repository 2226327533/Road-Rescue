package com.auth.controllers;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.auth.pojo.Rescueapply;
import com.auth.services.CarService;
import com.auth.services.DriverService;
import com.auth.services.RescueCarService;
import com.auth.util.Tools;

@Controller
@RequestMapping("/rescue")
public class RescueController extends MultiActionController {
	/**
	 * Auther Hale
	 * 该方法的功能是解决数据绑定问题,使界面中传过来的字符串可以顺利的转换成时间!
	 * 注:保证实体类中所有的时间类型的数据都传过来！
	 * @param dataBinder
	 */
	
	@Resource(name="rescueCarService")
	private RescueCarService rescueCarService;
	@Resource(name="driverService")
	private DriverService driverService;
	@Resource(name="carService")
	private CarService carService;
	
	@RequestMapping("getCarState")
	public String getCarState(HttpServletRequest request){
		//System.out.println("hehe");
		List cars = rescueCarService.getCars();
		request.setAttribute("cars",cars);
		return "rescue/showInfo";
	}
	
	@RequestMapping("paiCar")
	public String paiCar(HttpServletRequest request){
		//System.out.println("hehe");
		List cars = rescueCarService.getCars();
		System.out.println(cars.size());
		request.setAttribute("cars",cars);
		return "rescue/paiCar";
	}
	
	@RequestMapping("rescueApply")
	public String rescueApply(HttpServletRequest request,Rescueapply rescue){
		rescue.setDispatchnum(Tools.getdanhao());
/*		System.out.println(rescue.getApplytime());
		System.out.println(rescue.getDispatchtime());*/
		rescueCarService.addRescueApply(rescue);
		request.setAttribute("rescue",rescue);
		return "rescue/edit";
	}
	
	@RequestMapping("addRescueApply")
	public String addRescueApply(HttpServletRequest request,Rescueapply rescue,String driverId,String carId){
//		System.out.println(rescue.getApplytime());
		//int driverid = Integer.parseInt(driverId);
		//Driver driver  = driverService.getDriverById(driverid);
		//System.out.println("driver + " + driver.getName());
		int carid = Integer.parseInt(carId);
		carService.changeStatus(carid,Tools.YIPAICHU);
		//rescue.setDriver(driver);
		rescueCarService.saveOrUpdateRes(rescue);
		request.setAttribute("rescue",rescue);
		request.setAttribute("carId",carId);
		return "rescue/rescueReturn";
	}
	
	
	@RequestMapping("rescueReturn")
	public String rescueReturn(HttpServletRequest request,Rescueapply rescue,String carId){
		Rescueapply r = rescueCarService.updateRescue(rescue,rescue.getId());
		request.setAttribute("rescue",r);
		int carid = Integer.parseInt(carId);
		carService.changeStatus(carid,Tools.WEIPAICHU);
		return "rescue/rescueEnd";
	}
	@RequestMapping("getAllMess")
	public String getAllMess(HttpServletRequest request){
		List drivers = driverService.showDriver();
		List rescues = rescueCarService.getAllRescueMess();
		request.setAttribute("drivers",drivers);
		request.setAttribute("rescues",rescues);
		return "rescue/listAll";
	}
	
	@RequestMapping("getStatusMess")
	public String getStatusMess(HttpServletRequest request,String status){
		String _status = "";
		if(status =="yiqueren" ||status.equals("yiqueren")){
			_status = "申请已确认";
		}
		if(status =="yipaichu" ||status.equals("yipaichu")){
			_status = "车辆已派出";
		}
		if(status =="yijieshu" ||status.equals("yijieshu")){
			_status = "救援已结束";
		}
		List rescues = rescueCarService.getMessByStatus(_status);
		request.setAttribute("rescues",rescues);
		List drivers = driverService.showDriver();
		request.setAttribute("drivers",drivers);
		//System.out.println(status);
		return "rescue/" + status;
		
	}
	
	@RequestMapping("show")
	public String show(String rescueId,HttpServletRequest request){
		int rId = Integer.parseInt(rescueId);
		Rescueapply rescue = rescueCarService.getRescueById(rId);
		request.setAttribute("rescue",rescue);
		return "rescue/rescueEnd";
	}
	
	@RequestMapping("edit")
	public String edit(String carNum,String rescueId,HttpServletRequest request,String flag){
		int rId = Integer.parseInt(rescueId);
		int f = Integer.parseInt(flag);
		Rescueapply rescue = rescueCarService.getRescueById(rId);
		request.setAttribute("rescue",rescue);
		
		//carService.changeStatus(carid,Tools.WEIPAICHU);
		if(f==1){
			return "rescue/edit";
		}else if(f==2){
			int carid =	 carService.getCarByNum(carNum).getId();
			request.setAttribute("carId",carid);
			return "rescue/rescueReturn";
		}else{
			return "rescue/rescueEnd";
		}
	}
	
	
	@RequestMapping("del")
	public String del(HttpServletRequest request,String rescueId,String flag){
		//System.out.println("del -------------flag ="  + flag + "==");
		int rId = Integer.parseInt(rescueId);
		rescueCarService.delRescueById(rId);
		if(flag =="listAll" || flag.trim().equals("listAll")){
			return "forward:/rescue/getAllMess";
		}else{
			//request.setAttribute("status",flag);
			return "forward:/rescue/getStatusMess?status="+ flag;
		}
		
	}
	
	@RequestMapping("search")
	public String search(String type,HttpServletRequest request,String time_begin,String time_end,String driver,String shenqingren){
		request.setAttribute("time_begin", time_begin);
		request.setAttribute("time_end", time_end);
		request.setAttribute("driver", driver);
		request.setAttribute("shenqingren", shenqingren);
		List drivers = driverService.showDriver();
		request.setAttribute("drivers",drivers);
		List rescues = rescueCarService.getMessBy(time_begin, time_end, driver, shenqingren,type);
		request.setAttribute("rescues",rescues);
		return "rescue/" + type;
	}
	
	@RequestMapping("multiDel")
	public String multiDel(String[] ids,String flag){
		if(ids ==null ||ids.equals("")){
			if(flag =="listAll" || flag.trim().equals("listAll")){
				return "forward:/rescue/getAllMess";
			}else{
				//request.setAttribute("status",flag);

				return "forward:/rescue/getStatusMess?status="+ flag;
			}
		}else{
			rescueCarService.multiDel(ids);
			if(flag =="listAll" || flag.trim().equals("listAll")){
				return "forward:/rescue/getAllMess";
			}else{
				//request.setAttribute("status",flag);
				return "forward:/rescue/getStatusMess?status="+ flag;
			}
		}
		
	}
}

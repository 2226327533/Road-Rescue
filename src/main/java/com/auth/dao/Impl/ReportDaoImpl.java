package com.auth.dao.Impl;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.auth.dao.ReportDao;
import com.auth.pojo.CarInformation;
import com.auth.pojo.Rescueapply;

public class ReportDaoImpl implements ReportDao {
	private SessionFactory sessionFactory;
	
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		
		this.sessionFactory = sessionFactory;
	}

	public List dataQuery(String time_begin,String time_end) {
		
		Session session = sessionFactory.getCurrentSession();
		List aList = session.createQuery("from Rescueapply ra where ra.dispatchtime >= ? and ra.returntime <= ?").setParameter(0,time_begin).setParameter(1,time_end).list();
		return aList;
		
	}
	
	public void toExcel(List ls,String youhao,String form_name) throws IOException {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
//    	System.out.println(df.format(new Date()));
    	String reportName = df.format(new Date());
    	int sum = 0;
    	int sum1 = 0;
    	int sum2 = 0;
  
        //创建excel工作簿 
        Workbook wb = new HSSFWorkbook(); 
        //创建第一个sheet（页），命名为 new sheet 
        Sheet sheet = wb.createSheet("new sheet"); 
        //Row 行 
        //Cell 方格 
        // Row 和 Cell 都是从0开始计数的 
        Row row = sheet.createRow((short) 0);
        Cell cell = row.createCell(2); 
        cell.setCellValue("黑龙车辆救援报表");
        Row row1 = sheet.createRow((short) 1);
        row1.createCell(0).setCellValue("车辆编号");
        row1.createCell(1).setCellValue("车牌号码");
        row1.createCell(2).setCellValue("驾驶员");
        row1.createCell(3).setCellValue("救援收入(元)");
        row1.createCell(4).setCellValue("行驶里程(公里)");
        row1.createCell(5).setCellValue("油耗费用(元)");
        for(int i=0;i<ls.size();i++) {
        	Row roww = sheet.createRow((short) i+2);
        	roww.createCell(0).setCellValue(((Rescueapply) ls.get(i)).getCarcolor());
        	roww.createCell(1).setCellValue(((Rescueapply) ls.get(i)).getRescuecar());
        	roww.createCell(2).setCellValue(((Rescueapply) ls.get(i)).getDriver());
        	roww.createCell(3).setCellValue(Integer.parseInt("123"));
        	sum = sum + Integer.parseInt("123");
        	roww.createCell(4).setCellValue(Integer.parseInt(((Rescueapply) ls.get(i)).getMileage()));
        	sum1 = sum1 + Integer.parseInt(((Rescueapply) ls.get(i)).getMileage());
        	roww.createCell(5).setCellValue(Integer.parseInt(((Rescueapply) ls.get(i)).getMileage())*Integer.parseInt(youhao));
        	sum2 = sum2 + Integer.parseInt(((Rescueapply) ls.get(i)).getMileage())*Integer.parseInt(youhao);
        	
        }
        Row row2 = sheet.createRow((short)(ls.size()+2));
        row2.createCell(2).setCellValue("总计:");
        row2.createCell(3).setCellValue(sum);
        row2.createCell(4).setCellValue(sum1);
        row2.createCell(5).setCellValue(sum2);
        /*// 创建一行，在页sheet上 
        Row row = sheet.createRow((short) 0); 
        // 在row行上创建一个方格 
        Cell cell = row.createCell(0); 
        //设置方格的显示 
        cell.setCellValue(1); 
 
        // Or do it on one line. 
        row.createCell(1).setCellValue(1.2); 
        row.createCell(2).setCellValue("This is a string 速度反馈链接"); 
        row.createCell(3).setCellValue(true); 
 */
        //创建一个文件 命名为workbook.xls 
        FileOutputStream fileOut = new FileOutputStream("d:/Report/"+form_name+" "+reportName+".xls"); 
        // 把上面创建的工作簿输出到文件中 
        wb.write(fileOut); 
        //关闭输出流 
        fileOut.close(); 
	}
	
	public void toExcel1(List ls,String youhao,String form_name) throws IOException {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
    	String reportName = df.format(new Date());
    	int sum = 0;
    	
        //创建excel工作簿 
        Workbook wb = new HSSFWorkbook(); 
        //创建第一个sheet（页），命名为 new sheet 
        Sheet sheet = wb.createSheet("new sheet"); 
        //Row 行 
        //Cell 方格 
        // Row 和 Cell 都是从0开始计数的 
        Row row = sheet.createRow((short) 0);
        Cell cell = row.createCell(4); 
        cell.setCellValue("黑龙车辆救援报表");
        Row row1 = sheet.createRow((short) 1);
        row1.createCell(0).setCellValue("序号");
        row1.createCell(1).setCellValue("派车时间");
        row1.createCell(2).setCellValue("返回时间");
        row1.createCell(3).setCellValue("编号");
        row1.createCell(4).setCellValue("驾驶员");
        row1.createCell(5).setCellValue("调度员");
        row1.createCell(6).setCellValue("车牌号码");
        row1.createCell(7).setCellValue("出发地-目的地");
        row1.createCell(8).setCellValue("支付类型");
        row1.createCell(9).setCellValue("收入(元)");
        for(int i=0;i<ls.size();i++) {
        	Row roww = sheet.createRow((short) i+2);
        	roww.createCell(0).setCellValue(i+1);
        	roww.createCell(1).setCellValue(((Rescueapply) ls.get(i)).getDispatchtime());
        	roww.createCell(2).setCellValue(((Rescueapply) ls.get(i)).getReturntime());
        	roww.createCell(3).setCellValue(((Rescueapply) ls.get(i)).getCarcolor());
        	roww.createCell(4).setCellValue(((Rescueapply) ls.get(i)).getDriver());
        	roww.createCell(5).setCellValue(((Rescueapply) ls.get(i)).getScheduleperson());
        	roww.createCell(6).setCellValue(((Rescueapply) ls.get(i)).getRescuecar());
        	roww.createCell(7).setCellValue(((Rescueapply) ls.get(i)).getPaytype());
        	roww.createCell(8).setCellValue(((Rescueapply) ls.get(i)).getPaytype());
        	roww.createCell(9).setCellValue(Integer.parseInt("123"));
        	sum = sum + Integer.parseInt("123");    	
        	
        }
        Row row2 = sheet.createRow((short)(ls.size()+2));
        row2.createCell(8).setCellValue("总计:");
        row2.createCell(9).setCellValue(sum);
       
       
        //创建一个文件 命名为workbook.xls 
        FileOutputStream fileOut = new FileOutputStream("d:/Report/"+form_name+" "+reportName+".xls"); 
        // 把上面创建的工作簿输出到文件中 
        wb.write(fileOut); 
        //关闭输出流 
        fileOut.close(); 
	}
//public List day_dataQuery(String time_begin,String time_end) {
//		
//		Session session = sessionFactory.getCurrentSession();
//		List aList = session.createQuery("from Rescueapply ra where ra.dispatchtime >= ? and ra.dispatchtime < ?").setParameter(0,time_begin).setParameter(1,time_end).list();
//		return aList;
//		
//	}

}

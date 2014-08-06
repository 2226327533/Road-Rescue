package com.auth.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Tools {
	public static String WEIPAICHU = "可用";
	public static String YIPAICHU = "不可用";
	
	public static String getdanhao(){
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmSS");
		String danhao  = "HL" + sdf.format(d);
		return danhao;
	}
}

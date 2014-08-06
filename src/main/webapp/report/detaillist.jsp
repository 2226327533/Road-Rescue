<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><style type="text/css"></style></head><body style="zoom: 1;">﻿



<title>黑龙汽车道路救援服务中心道路紧急救援管理系统</title>
<link rel="icon" href="http://liwei-pc:8010/HL.ico" type="image/x-icon">
<link rel="shortcut icon" href="http://liwei-pc:8010/HL.ico" type="image/x-icon">

<link href="../css/main.css" rel="stylesheet" type="text/css">
<link href="../css/jquery-ui.min.css" rel="stylesheet" type="text/css">
<script src="../js/json.js" language="javascript" type="text/javascript"></script>
<script src="../js/string.js" language="javascript" type="text/javascript"></script>
<script src="../js/jquery.min.js" language="javascript" type="text/javascript"></script>
<script src="../js/jquery-ui.min.js" type="text/javascript"></script>
<script src="../js/jquery.ui.datepicker-zh-CN.min.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
<script type="text/javascript" src="../js/messages_cn.js"></script>
<script src="../js/ihush.js" language="javascript" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		$("#maintabs").tabs();

	});
</script>

</head>

<body>

<div class="main">

<script type="text/javascript" src="a_data/jquery_002.js"></script>
<script type="text/javascript">
$(function(){
	
	/* 日历控件 */  
	var $dateOption = {
		changeMonth: true,
		changeYear: true,
		dateFormat: "yy-mm-dd"
	}; 
	$( "#time_begin" ).datepicker($dateOption);
	$( "#time_end" ).datepicker($dateOption);
	
	/* 设置验证规则 */  
	var $validateOption = {
		rules: {
			time_begin: "required",
			time_end: "required",
			youhao:{   
				required:true,
				number:true  
			}
		}
	};
	
	/* 开始验证*/
	$("#myform").submit(function(){
		//生成报表
		$("#search").prop("disabled", true);
		$("#search").val("计算中,请稍候...");
		var cssObj = {
			"background-color" : "#F9F9F9",
			"border": "1px solid #C8C8C8",
			"color": "#999999"
		}
		$("#search").css(cssObj);	
	}).validate($validateOption);
	
	
	//清空
	$("input[name='clearBtn']").click(function(){
		$("input[name='time_begin']").val("");
		$("input[name='time_end']").val("");
		$("input[name='youhao']").val("");
	});
	
	
	//统计
	var $sum_feiyong = 0;
	$(".item_feiyong").each(function(){
		
		
		$sum_feiyong += parseFloat(this.innerHTML);
	});
	$("#sum_feiyong").html($sum_feiyong.toFixed(2));
	
	
	/* //打印
	$("input#biuuu_button").click(function(){
		var mode = "popup";
		 var options = { mode : mode};
		 $("div#myPrintArea").printArea(options);
	}); */
	//打印
	$("input#biuuu_button").click(function (){
		 bdhtml=window.document.body.innerHTML;
		 sprnstr="<!--startprint-->";
		 eprnstr="<!--endprint-->";
		 prnhtml=bdhtml.substr(bdhtml.indexOf(sprnstr)+17);
		 prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr));
		 window.document.body.innerHTML=prnhtml;
		 window.print();
		 window.parent.returnValue='1';
	});
	
});


function getStyle(){
 var Style='<style>TB{BACKGROUND-COLOR: black;FONT-SIZE: 12px;LINE-HEIGHT: 16px;TEXT-DECORATION:none;} td{mso-number-format:"\@";BACKGROUND-COLOR:white} td.top{BACKGROUND-COLOR: #4F93DC;COLOR: #ffffff;FONT-SIZE: 12px; LINE-HEIGHT: 16px; TEXT-DECORATION: none;}</style>';
 return Style;
}

</script>

<div class="ui-tabs ui-widget ui-widget-content ui-corner-all" id="maintabs">
	<ul role="tablist" class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
		<li aria-selected="true" aria-labelledby="ui-id-1" aria-controls="maintabs-1" tabindex="0" role="tab" class="ui-state-default ui-corner-top ui-tabs-active ui-state-active"><a id="ui-id-1" tabindex="-1" role="presentation" class="ui-tabs-anchor" href="#maintabs-1">运营统计详单</a></li>
	</ul>
	<div aria-hidden="false" aria-expanded="true" role="tabpanel" class="ui-tabs-panel ui-widget-content ui-corner-bottom" aria-labelledby="ui-id-1" id="maintabs-1">
	<form novalidate="novalidate" id="myform" method="post" action="../report/detailList">
		<table class="titem">
			<tbody><tr>
				<td class="field">派车起止时间</td>
				<td class="value" style="text-align:left;">

<!-- 					<span><input type="text" readonly="readonly" class="common hasDatepicker" style="width:150px" name="time_begin" value="2014-02-15" id="dp1395304465438"></span>
 -->					<span><input type="text" class="common" style="width:150px" name="time_begin" id="time_begin" ></span>
					   --&nbsp;<span><input type="text"  class="common" style="width:150px" name="time_end" id="time_end"></span>
						<input type="hidden" name="form_name" value="运营统计详单">
					
				</td>
				<td class="field">油耗</td>
				<td class="value" style="text-align:left;">
					<span><input type="text" class="common" style="width:150px" name="youhao" OnBlur="if (!/^\d+$/g.test(this.value)) {alert('请正确录入信息！'); }"></span>
				
					元/公里
				</td>
				<td class="value submit" style="text-align:left;">
					&nbsp;<input id="search" name="search" value="生成报表" type="submit">
					<input name="clearBtn" value="清空" type="button">
					<input id="biuuu_button" value="打印" type="button">
					<input type="button" value="导出Excel"  onclick="javascript:location.href='../report/toExcel1'">
				</td>
			</tr>
		</tbody></table>
	</form>
	
	<br>
			<div id="myPrintArea">
		<!--startprint-->
			<div style="text-align: center;font-weight: bold;font-size: 20px;">
				${time_begin} 至 ${time_end} 运营状况统计详单
			</div>
			<div class="mainbox">
			

					<table class="tlist listblack" id="Pxp023Coo">
						<thead>
							<tr>
								<th width="30px">序号</th>
								<th width="70px">派车时间</th>
								<th width="70px">返回时间</th>
								<th width="30px">编号</th>
								<th>驾驶员</th>
								<th>调度员</th>
								<th>申请人</th>
								<th>车牌号码</th>
								<!-- <th class="longtext">救援地点</th> -->
								<th>出发地-目的地</th>
								<th>支付类型</th>
								<th>收入(元)</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${reportList}" var="rl">
						<%!int count = 1; %>
							<tr style="background: none repeat scroll 0% 0% rgb(217, 232, 245);">
								<td style="text-align:center;"><%=count %></td>
								<td>${rl.dispatchtime}</td>
								<td>${rl.returntime}</td>
								<td>${rl.carcolor}</td>
								<td>${rl.driver}</td>
								<td>${rl.scheduleperson}</td>
								<td>${rl.applyperson}</td>
								<td>${rl.carnum}</td>
								<!-- <td class="longtext">dsad</td> -->
								<td>
								${rl.rescueaddr}--${rl.destination}
								</td>
								<td>${rl.paytype}</td>
								<td class="item_feiyong">123</td>
							</tr>
						<%count++; %>
						</c:forEach>							
						</tbody>
						<tfoot>
							<tr class="sum">
								<td colspan="10" style="text-align: right;">总计：</td>
								<td id="sum_feiyong">NaN</td>
							</tr>
						</tfoot>
					</table>
		 	<!--endprint-->
		 	
		 		<div class="clearfix"></div>
			</div>
		</div>
		
	</div>
</div>

	</div>
<br>

<!-- <div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"> </div>-->
</body></html>
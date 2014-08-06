<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp" %>
<%@page import="com.auth.controllers.ReportController"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><style type="text/css"></style>
<title>黑龙汽车道路救援服务中心道路紧急救援管理系统</title>
<link rel="icon" href="../images/HL.ico" type="image/x-icon">
<link rel="shortcut icon" href="../images/HL.ico" type="image/x-icon">
<link href="../css/main.css" rel="stylesheet" type="text/css">
<link href="../css/holder.css" rel="stylesheet" type="text/css">
<script src="../js/json.js" language="javascript" type="text/javascript"></script>
<script src="../js/string.js" language="javascript" type="text/javascript"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
<script type="text/javascript" src="../js/messages_cn.js"></script>
<script src="../js/ihush.js" language="javascript" type="text/javascript"></script>
<script type="text/javascript">

$(function() {
	
	
	
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
		$("input[name='time_day']").val("");
		$("input[name='youhao']").val("");
	});
	
	
	//统计
	var $sum_feiyong = 0;
	$(".item_feiyong").each(function(){
		
		//console.log(this.innerHTML);
		//console.log(parseFloat(this.innerHTML))
		$sum_feiyong += parseFloat(this.innerHTML);
	});
	$("#sum_feiyong").html($sum_feiyong.toFixed(2));
	
	
	var $sum_licheng = 0;
	$(".item_licheng").each(function(){
		$sum_licheng += parseFloat(this.innerHTML);
	});
	$("#sum_licheng").html($sum_licheng.toFixed(2));
	
	
	var $sum_youhao = 0;
	$(".item_youhao").each(function(){
		$sum_youhao += parseFloat(this.innerHTML);
	});
	$("#sum_youhao").html($sum_youhao.toFixed(2));
	
	//打印
/* 	$("input#biuuu_button").click(function(){
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
	
	/* Ajax 分页 */
	 $("div.holder").jPages({
	      containerID: "itemContainer"
	    });
	
});

 	/* 导出Excel */
function AllAreaExcel() 
 {
  /* var oXL = new ActiveXObject("Excel.Application"); 
  var oWB = oXL.Workbooks.Add(); 
  var oSheet = oWB.ActiveSheet;  
  var sel=document.body.createTextRange();
  sel.moveToElementText(这里表格的名字);
  sel.select();
  sel.execCommand("Copy");
  oSheet.Paste();
  oXL.Visible = true; */
  
  alert("导出Excel成功！");
 } 

</script>
</head>

<body style="zoom: 1;">﻿

<div class="main">
<div id="maintabs" class="ui-tabs ui-widget ui-widget-content ui-corner-all">
	<ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all" role="tablist">
		<li class="ui-state-default ui-corner-top ui-tabs-active ui-state-active" role="tab" tabindex="0" aria-controls="maintabs-1" aria-labelledby="ui-id-1" aria-selected="true"><a href="http://liwei-pc:8010/report/list?time_begin=2014-02-15&time_end=2014-03-16&youhao=10#maintabs-1" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-1">运营统计报表</a></li>
	</ul>
	<div id="maintabs-1" aria-labelledby="ui-id-1" class="ui-tabs-panel ui-widget-content ui-corner-bottom" role="tabpanel" aria-expanded="true" aria-hidden="false">
	<form id="myform" method="post" action="../report/showView" novalidate="novalidate">
		<table class="titem">
			<tbody><tr>
				<td class="field">派车起止时间</td>
				<td class="value" style="text-align:left;">

						<span><input type="text" class="common" style="width:150px" name="time_begin" id="time_begin" ></span>
					   --&nbsp;<span><input type="text"  class="common" style="width:150px" name="time_end" id="time_end"></span>
						<input type="hidden" name="form_name" value="运营统计报表">
					
				</td>
				<td class="field">油耗</td>
				<td class="value" style="text-align:left;">
					<span><input type="text" class="common" style="width:150px" name="youhao" OnBlur="if (!/^\d+$/g.test(this.value)) {alert('请正确录入信息！'); }"></span>
				
					元/公里
				</td>
				<td class="value submit" style="text-align:left;">
					&nbsp;<input type="submit" id="search" name="search" value="生成报表">
					<input type="button" name="clearBtn" value="清空">
					<input id="biuuu_button" type="button" value="打印">
					<input type="button" value="导出Excel"  onclick="javascript:location.href='../report/toExcel'">
				</td>
			</tr>
		</tbody></table>
	</form>
	
	<br>
<!-- 			<div id="myPrintArea">
 -->		<!--startprint-->
			<div style="text-align: center;font-weight: bold;font-size: 20px;">
				${time_begin} 至 ${time_end} 运营状况统计  
			</div>
			<div class="mainbox">
<!--sdfsfsfsdfsfds   	 <div class="holder">  -->
							
				
					<table class="tlist listblack">
						<tbody>
						<thead>
							<tr>
								<th>车辆编号</th>
								<th>车牌号码</th>
								<th>驾驶员</th>
								<th>救援收入(元)</th>
								<th>行驶里程(公里)</th>
								<th>油耗费用(元)</th>
							</tr>
						</thead>

					<tbody>
						<c:forEach items="${reportList}" var="rl">
							<tr style="background-color: rgb(255, 255, 255); background-position: initial initial; background-repeat: initial initial;">
								<td>${rl.carcolor}</td>
								<td>${rl.rescuecar}</td>
								<td>${rl.driver}</td>
								<td class="item_feiyong">150.00</td>
								<td class="item_licheng">${rl.mileage}</td>
								<td class="item_youhao">${oil_expend*rl.mileage}</td>
							</tr>
									
						</c:forEach>	
					</tbody>
				
						<tfoot>
							<tr class="sum">
								<td colspan="3" style="text-align: right;">总计：</td>
								<td id="sum_feiyong">NaN</td>
								<td id="sum_licheng">NaN</td>
								<td id="sum_youhao">NaN</td>
							</tr>
						</tfoot>
					</table>
		 	<!--endprint-->
<!-- dsafddasdadad -->					
		<%-- 			<ul>
        <li><a href='?nowPage=${nowPage-1}'>←上一页</a></li>
                   <c:forEach varStatus="status" begin="1" end="${myListSize}" step="10">
                        <c:choose>
                           <c:when test="${nowPage==status.first}">
                              <li class='disabled'>${status.count}</li>
                           </c:when>
                           <c:otherwise>
                               <li  class='active'><a href='?nowPage=${status.count}'>${status.count}</a></li>
                           </c:otherwise>
                        </c:choose>
                   </c:forEach>
            <li><a href='?nowPage=${nowPage+1}'>下一页→</a></li>
      </ul> --%>
					
<!-- asdasdasdasdasdas -->	
		 	
<!--sdfsfsfsdfsfds  </div>  -->	
						
		 		<div class="clearfix"></div>
			</div>
		<!-- </div> -->
		
	</div>
</div>

	</div>
<br>

<!--  <div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"></div>
 --> </body>
</html>
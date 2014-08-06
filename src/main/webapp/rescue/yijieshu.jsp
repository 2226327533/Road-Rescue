<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><style type="text/css"></style></head><body style="zoom: 1;">﻿

<title>黑龙汽车道路救援服务中心道路紧急救援管理系统</title>
<link rel="icon" href="../image/HL.ico" type="image/x-icon">
	<link rel="shortcut icon" href="image/HL.ico" type="image/x-icon">

	<link href="../css/main.css" rel="stylesheet" type="text/css">
	<link href="../css/jquery-ui.min.css" rel="stylesheet" type="text/css">
	<script src="../js/json.js" language="javascript"
		type="text/javascript"></script>
	<script src="../js/string.js" language="javascript"
		type="text/javascript"></script>
	<script src="../js/jquery.min.js" language="javascript"
		type="text/javascript"></script>
	<script src="../js/jquery-ui.min.js" type="text/javascript"></script>
	<script src="../js/jquery.ui.datepicker-zh-CN.min.js"></script>
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="../js/messages_cn.js"></script>
	<script src="../js/ihush.js" language="javascript"
		type="text/javascript"></script>
<!-- <script type="text/javascript">
	$(function() {
		$("#maintabs").tabs();

	});
</script> -->
  <script type="text/javascript">
		function firm() {
			var a = document.getElementById("mutidel");
			 if (confirm("你确定删除吗？")) {  
	            a.submit();
	       	 }  
	       	 else {
	       	 } 
	    }  
</script>



<div class="main">



 <div id="maintabs" class="ui-tabs ui-widget ui-widget-content ui-corner-all">
	<ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all" role="tablist">
				<li class="ui-state-default ui-corner-top " role="tab" tabindex="0" aria-controls="ui-tabs-1" aria-labelledby="ui-id-1" aria-selected="false" ><a href="../rescue/getAllMess" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-1">全部信息</a></li>
				<li class="ui-state-default ui-corner-top " role="tab" tabindex="-1" aria-controls="ui-tabs-2" aria-labelledby="ui-id-2" ><a href="../rescue/getStatusMess?status=yiqueren" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-2">申请已确认</a></li>
				<li class="ui-state-default ui-corner-top " role="tab" tabindex="-1" aria-controls="ui-tabs-3" aria-labelledby="ui-id-3" aria-selected="false"><a href="../rescue/getStatusMess?status=yipaichu" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-3">车辆已派出</a></li>
				<li class="ui-state-default ui-corner-top ui-tabs-active ui-state-active" role="tab" tabindex="-1" aria-controls="ui-tabs-4" aria-labelledby="ui-id-4"  aria-selected="true"><a href="../rescue/getStatusMess?status=yijieshu" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-4">救援已结束</a></li>
			</ul><div id="ui-tabs-1" class="ui-tabs-panel ui-widget-content ui-corner-bottom" aria-live="polite" aria-labelledby="ui-id-1" role="tabpanel" aria-expanded="true" aria-hidden="false">﻿<script src="ihush.js" language="javascript" type="text/javascript"></script>
 <script type="text/javascript">

$(function(){
	
	//用ajax的方式翻页
	$(".pagelist a").click(function(){
		
		var $url = $(this).attr("href");
		$(this).parents(".ui-tabs-panel").load($url);
		
		return false;
		
	});
	
	/* 日历控件 */  
	var $dateOption = {
		changeMonth: true,
		changeYear: true,
		dateFormat: "yy-mm-dd"
	}; 
	$( "#time_begin" ).datepicker($dateOption);
	$( "#time_end" ).datepicker($dateOption);
	
	//清空
	$("input[name='clearBtn']").click(function(){
		$("input[name='time_begin']").val("");
		$("input[name='time_end']").val("");
	});
	
	
	//搜索
	$("input[name='search']").click(function(){
		
		var $parentNode = $(this).parents(".ui-tabs-panel");
		
		var apply_type = $parentNode.find("input[name='type']").val();
		
		var apply_time_begin = $parentNode.find("input[name='time_begin']").val();
		var apply_time_end = $parentNode.find("input[name='time_end']").val();
		var vehicle_driver = $parentNode.find("select[name='vehicle_driver']").val();
		var shenqingren = $parentNode.find("input[name='shenqingren']").val();
		//alert(apply_time_begin);
		//alert(apply_time_end);
		/* console.log(type);
		console.log(time_begin);
		console.log(time_end); */
		var $url = "list?type="+apply_type+"&time_begin="+apply_time_begin+"&time_end="+apply_time_end
				+"&vehicle_driver="+vehicle_driver+"&shenqingren="+shenqingren;
		$(this).parents(".ui-tabs-panel").load($url);
		
	});
});

</script>


<form action="../rescue/search">
<table class="titem">
	<tbody><tr>
		<td class="field">救援申请起止时间</td>
		<td class="value" style="text-align:left;">
			<input type="hidden" name="type" value="yijieshu">
			<input type="text" readonly="readonly" style="width:100px" name="time_begin" value="${time_begin}" id="time_begin">
			-
			<input type="text" readonly="readonly" style="width:100px" name="time_end" value="${time_end}" id="time_end">
		</td>
		<td class="field">申请人</td>
		<td class="value" style="text-align:left;">
			<input type="text" class="common" name="shenqingren" value="${shenqingren}">
		</td>
		<td class="field">驾驶员</td>
		<td class="value" style="text-align:left;">
			<select name="driver">
				<option value="">请选择</option>
					<c:if test="${!empty drivers}">
						<c:forEach items="${drivers}" var="driver">
							<option value="${driver.name}">${driver.name}</option>
						</c:forEach>
					</c:if>
			</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							
		</td>
		<td class="value submit" style="text-align:left;">
			&nbsp;<input type="submit" value="搜索">
			<input type="button" name="clearBtn" value="清空">
			
		</td>
	</tr>
</tbody></table>
</form>
<br>

		<div class="mainbox" style="overflow-x: scroll;">
			
			<form name="myform" method="post" action="../rescue/multiDel">
				<div class="option_bar">
					<input type="checkbox" id="chkall">&nbsp;全选
					<input type="hidden" name="flag" value="yijieshu">
					<input type="submit" value="批量删除" id="mutidel" onclick="firm();">

				</div>
						
				<table class="tlist" style="width:5000px;">
					<thead>
						<tr>
							<th style="width:40px;">
								选择
							</th>
							<th style="width:60px;">
								操作
							</th>
							<th>状态</th>
							<th>调度员</th>
							<th>申请时间</th>
							<th>录入时间</th>
							<th>申请人</th>
							<th>案件编号</th>
							<!-- <th>车主姓名</th> -->
							<th>联系电话</th>
							<th class="longtext">事故原因</th>
							<th class="longtext">救援地点</th>
							<th>车牌号码</th>
							<th>车型</th>
							<th>车身颜色</th>
							<th>送达目的地</th>
							<th>目的地类型</th>
							<th>预计费用(元)</th>
							<th class="longtext">申请备注</th>
							<th>派车单号</th>
							<th>派车时间</th>
							<th>救援车</th>
							<th>驾驶员</th>
							<th>联系电话</th>
							<th class="longtext">救援备注</th>
							<th>返回时间</th>
							<th>里程(公里)</th>
							<th>实际费用(元)</th>
							<th>收入差额(元)</th>
							<th>最终费用(元)</th>
							<th class="longtext">返回备注</th>
							<th>支付类型</th>
							<th>是否结算</th>
						</tr>
					</thead>
					<tbody>
					<c:if test="${!empty rescues}">
						<c:forEach items="${rescues}" var="rescue">
							<tr>
								
								<c:if test="${rescue.status=='救援已结束'}">
								<td align="center">
									<input type="checkbox" value="${rescue.id}" class="itemid" name="ids">
								</td> 
								</c:if>
								<td class="option">
									
									<c:if test="${rescue.status=='救援已结束'}">
										<a class="show" href="../rescue/show?rescueId=${rescue.id}" title="查看"><span class="ui-icon ui-icon-search" style="float: left; margin-right: 5px;"></span></a>
										<a class="edit" href="../rescue/edit?rescueId=${rescue.id}&flag=3" title="编辑"><span class="ui-icon ui-icon-pencil" style="float: left; margin-right: 5px;"></span></a>
										<a class="del" href="../rescue/del?rescueId=${rescue.id}&flag=yijieshu" title="删除"><span class="ui-icon ui-icon-trash" style="float: left;"></span></a>
									</c:if>
								</td>
								<td>${rescue.status}</td>
								<td>${rescue.scheduleperson}</td>
								<td>${rescue.applytime}</td>
								<td>${rescue.enteringtime}</td>
								<td>${rescue.applyperson}</td>
								<td>${rescue.casenum}</td>
								<!-- <td></td> -->
								<td>${rescue.applyphone}</td>
								<td class="longtext">${rescue.accidentcause}</td>
								<td class="longtext">${rescue.rescueaddr}</td>
								<td>${rescue.carnum}</td>
								<td>${rescue.motorcycle}</td>
								<td>${rescue.carcolor}</td>
								<td>${rescue.destination}</td>
								<td>${rescue.destinationtype}</td>
								<td>${rescue.estimatedcost}</td>
								<td class="longtext">${rescue.memo}</td>
								<td>${rescue.dispatchnum}</td>
								<td>${rescue.dispatchtime}</td>
								<td>${rescue.rescuecar}</td>
								<td>${rescue.driver}</td>
								<td>${rescue.driverphone}</td>
								<td class="longtext">${rescue.rescuememo}</td>
								<td>${rescue.returntime}</td>
								<td>${rescue.mileage}</td>
								<td>${rescue.realcost}</td>
								<td>${rescue.incomebalance}</td>
								<td>${rescue.finalcost}</td>
								<td class="longtext">${rescue.returmemo}</td>
								<td>${rescue.paytype}</td>
								<td>${rescue.ifpay}</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty rescues}">
						<td colspan="30" style="color: red;" align="left">没有查询到相关信息！</td>
					</c:if>
					</tbody>
				</table>
	 		</form>
	 		<div class="clearfix"></div>
		</div>
		
		<div class="pagelist">
	<span>
		<span>共 116 页 / 2313 条记录 </span><span class="indexPage">Prev</span><b>1</b> <a href="http://liwei-pc:8010/rescue/list/p/2?type=&time_begin=&time_end=&vehicle_driver=&shenqingren=">2</a> <a href="http://liwei-pc:8010/rescue/list/p/3?type=&time_begin=&time_end=&vehicle_driver=&shenqingren=">3</a> ... <a href="http://liwei-pc:8010/rescue/list/p/114?type=&time_begin=&time_end=&vehicle_driver=&shenqingren=">114</a> <a href="http://liwei-pc:8010/rescue/list/p/115?type=&time_begin=&time_end=&vehicle_driver=&shenqingren=">115</a> <a href="http://liwei-pc:8010/rescue/list/p/116?type=&time_begin=&time_end=&vehicle_driver=&shenqingren=">116</a><span class="nextPage"><a href="http://liwei-pc:8010/rescue/list/p/2?type=&time_begin=&time_end=&vehicle_driver=&shenqingren=">Next</a></span> 
	</span>
</div>

		

</div><div id="ui-tabs-2" class="ui-tabs-panel ui-widget-content ui-corner-bottom" aria-live="polite" aria-labelledby="ui-id-2" role="tabpanel" aria-expanded="false" aria-hidden="true" style="display: none;"></div><div id="ui-tabs-3" class="ui-tabs-panel ui-widget-content ui-corner-bottom" aria-live="polite" aria-labelledby="ui-id-3" role="tabpanel" aria-expanded="false" aria-hidden="true" style="display: none;"></div><div id="ui-tabs-4" class="ui-tabs-panel ui-widget-content ui-corner-bottom" aria-live="polite" aria-labelledby="ui-id-4" role="tabpanel" aria-expanded="false" aria-hidden="true" style="display: none;"></div>
	
</div>

</div>
<br>

</body></html>
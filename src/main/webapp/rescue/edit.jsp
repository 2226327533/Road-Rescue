<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@include file="/common/common.jsp" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><style type="text/css"></style></head><body style="zoom: 1;">﻿

<title>黑龙汽车道路救援服务中心道路紧急救援管理系统</title>
<link rel="icon" href="../images/HL.ico" type="image/x-icon">
<link rel="shortcut icon" href="../images/HL.ico" type="image/x-icon">

<link href="../css/main.css" rel="stylesheet" type="text/css">
<link href="../css/jquery-ui.min.css" rel="stylesheet" type="text/css">
<script src="../js/json.js" language="javascript" type="text/javascript"></script>
<script src="../js/string.js" language="javascript" type="text/javascript"></script>
<script src="../js/jquery.min.js" language="javascript" type="text/javascript"></script>
<script src="../js/jquery-ui.min.js" type="text/javascript"></script>

<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
<script type="text/javascript" src="../js/messages_cn.js"></script>
<script src="../js/ihush.js" language="javascript" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		$("#maintabs").tabs();

	});
</script>





<div class="main">


<div id="maintabs1" class="ui-tabs ui-widget ui-widget-content ui-corner-all">
	<ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all" role="tablist">
		<li class="ui-state-default ui-corner-top ui-tabs-active ui-state-active" role="tab" tabindex="0" aria-controls="maintabs-1" aria-labelledby="ui-id-1" aria-selected="true"><a href="http://liwei-pc:8010/rescue/edit?id=2471#maintabs-1" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-1">道路紧急救援&nbsp;<font style="color:#FF0000">申请已确认</font></a></li>
	</ul>
	<div id="maintabs-1" aria-labelledby="ui-id-1" class="ui-tabs-panel ui-widget-content ui-corner-bottom" role="tabpanel" aria-expanded="true" aria-hidden="false">

		<div class="mainbox clearfix">
			
			<!-- 救援申请 -->
			
<!-- 救援申请 -->

<script type="text/javascript">
/* 获取上一个页面中目的地类型 并赋给当前页面  */
 $(document).ready(function(){
  		$("input[name='destinationtype'][value=${rescue.destinationtype}]").attr("checked",true); //给指定的radio赋值
  		/* $("#rank").attr("value","${per.rank}");//给指定的select赋值 */
 }); 

</script>

<!--  -->
<script src="../js/jquery.ui.datepicker-zh-CN.min.js"></script>
<script type="text/javascript">
		
	$(function() {
		
		/* 手机号码验证  */
		jQuery.validator.addMethod("isMobile", function(value, element) {       
			var length = value.length;   
			var mobile = /^[1]\d\d\d\d\d\d\d\d\d\d$/;   
			//console.log(value + "=>" + mobile.test(value));
			return this.optional(element) || (length == 11 && mobile.test(value)); 
		},"请正确填写手机号码");  
		
		
		/////////////////////////////////////////////////////////////////////
		/* 申请单设置验证规则 */  
		var $validateOption_apply = {
			rules: {
				applyperson: "required",
				rescueaddr: "required",
				applyphone:{   
					required:true,
					isMobile:true  
				},
				estimatedcost:"number"
			}
		};
		
		/* 申请单开始验证*/
		$("#myform_aplly").validate($validateOption_apply);
		
		/* 派车 */
		$( "#paiche" ).click(function() {
			$( "#dialog-iframe" ).prop("src", "../rescue/paiCar");
			$( "#dialog-form" ).dialog( "open" );
		});
		
		$( "#dialog-form" ).dialog({
			autoOpen: false,
			height: 500,
			width: 820,
			modal: true
		});

	});
</script>

<form action="../rescue/addRescueApply" method="post" id="myform_aplly" novalidate="novalidate">
	<table class="titem">
		<tbody><tr>
			<td class="title" colspan="6">救援申请</td>
		</tr>
		
		<tr>
			<td class="field">录入时间</td>
			<td class="value" style="width: 20%;">
				<span><input class="common readonly" type="text" name="enteringtime" id="enteringtime" value="${rescue.enteringtime}" ><%-- <fmt:formatDate value="${rescue.enteringtime}" type="both" pattern="yyyy-MM-dd HH:mm"/> --%></span>
			</td>
			<td class="field">申请时间</td>
			<td class="value" style="width: 20%;">
				<span><input readonly="readonly" class="common readonly" type="text" name="applytime" id="applytime" value="${rescue.applytime}"></span>
			</td>
			<td class="field">申请人</td>
			<td class="value" style="width: 20%;">
				<span><input class="common" type="text" name="applyperson" value="${rescue.applyperson}"></span>
			</td>
		</tr>
		<tr>
			<td class="field">救援联系电话</td>
			<td class="value" style="width: 20%;">
				<span><input class="common" type="text" name="applyphone" value="${rescue.applyphone}"></span>
			</td>
			<td class="field">救援地点</td>
			<td class="value" colspan="3">
				<span><input class="common" type="text" name="rescueaddr" value="${rescue.rescueaddr}"></span>
			</td>
		</tr>
		<tr>
			<td class="field">事故原因</td>
			<td class="value" colspan="5">
				还能输入<label id="for_accidentcause" class="teatareanum">255</label>字
				<span><textarea class="common" name="accidentcause" value="">${rescue.accidentcause}</textarea></span>
			</td>
		</tr>
		<tr>
			<td class="field">车牌号码</td>
			<td class="value">
				<span><input class="common" type="text" name="carnum" value="${rescue.carnum}"></span>
			</td>
			<td class="field">车型</td>
			<td class="value">
				<span><input class="common" type="text" name="motorcycle" value="${rescue.motorcycle}"></span>
			</td>
			<td class="field">车身颜色</td>
			<td class="value">
				<span><input class="common" type="text" name="carcolor" value="${rescue.carcolor}"></span>
			</td>
		</tr>
		<tr>
			<td class="field">送达目的地</td>
			<td class="value">
				 <span><input class="common" type="text" name="destination" value="${rescue.destination}"></span>
			</td>
			<td class="field">目的地类型</td>
			<td class="value" colspan="3">
				<span>
					<input type="radio" value="市内" name="destinationtype">
					市内
					<input type="radio" value="长途" name="destinationtype">
					长途
					<input type="radio" value="困境" name="destinationtype">
					困境
					<input type="radio" value="送油" name="destinationtype">
					送油
					<input type="radio" value="搭电" name="destinationtype">
					搭电
				</span>
			</td>
		</tr>
		<tr>
			<td class="field">预计费用(元)</td>
			<td class="value">
				<span><input class="common" type="text" name="estimatedcost" value="${rescue.estimatedcost}"></span>
			</td>
			<td class="field">案件编号</td>
			<td class="value" colspan="3">
				<span><input class="common" type="text" name="casenum" value="${rescue.casenum}"></span>
			</td>
			
		</tr>
		<tr>
			<td class="field">备注</td>
			<td class="value" colspan="5">
				 还能输入<label id="for_memo" class="teatareanum">255</label>字
				<span><textarea class="common" name="memo" value="">${rescue.memo}</textarea></span>
			</td>
		</tr>		
		<tr>
			<td class="submit" colspan="6">
				<a href="/auth/rescue/form.jsp"><input type="button" value="暂不派车"></a>
			</td>
		</tr>	
	</tbody></table>
			

			
			<!-- 车辆调度 -->
			

<script type="text/javascript">
		
	$(function() {
		
		/* 计算字符数  */
		$("textarea").each(function(){
			
			caculate(this);
			
		});
		$("textarea").keyup(function(){
			
			caculate(this);
		});
		function caculate(ele){
			var len = ele.value.length;
			var left = 255 - len;
			if(left>=0){
				$("#for_"+ele.name).html(left);
			}else{
				$("#for_"+ele.name).html(0);
				ele.value = ele.value.substring(0,255);
			}
			
		}
	});
</script>

	<input type="hidden" name="status" value="车辆已派出">
	<input type="hidden" name="id" value="${rescue.id}">
	<table class="titem">
		<tbody><tr>
			<td class="title" colspan="6">车辆调度</td>
		</tr>
		
		<tr>
			<td class="field">派车单号</td>
			<td class="value" style="width: 20%;">
				<span><input readonly="readonly" class="common readonly" type="text" name="dispatchnum" value="${rescue.dispatchnum}"></span>
			</td>
			<td class="field">调度员</td>
			<td class="value" style="width: 20%;">
				<span><input readonly="readonly" class="common readonly" type="text" name="scheduleperson" value="${user.username}"></span>
			</td>
			<td class="field">派车时间</td>
			<td class="value" style="width: 20%;">
				<span><input readonly="readonly" class="common readonly" type="text" name="dispatchtime" id="dispatchtime" value=""></span>
			</td>
		</tr>
		<tr>
			<td class="field">救援车
									<input type="button" value="派车" class="paiche" id="paiche">
											</td>
			<td class="value">
				<span>
					<input readonly="readonly" class="common readonly" type="text" id="rescuecar" name="rescuecar" value="${rescue.rescuecar}">
					<input type="hidden" id="carId" name="carId" value="">
				</span>
			</td>
			<td class="field">驾驶员</td>
			<td class="value">
				<span>
					<input readonly="readonly" class="common readonly" type="text" id="driver" name="driver" value="${rescue.driver}">
					<input type="hidden" id="driverId" name="driverId" value="">
				</span>
			</td>
			<td class="field">联系电话</td>
			<td class="value">
				<span>
					<input readonly="readonly" class="common readonly" type="text" id="driverphone" name="driverphone" value="${rescue.driverphone}">
				</span>
			</td>
		</tr>
		<tr>
			<td class="field">备注</td>
			<td class="value" colspan="5">
				还能输入<label id="for_rescuememo" class="teatareanum">255</label>字
				<span><textarea class="common" name="rescuememo"></textarea></span>
			</td>
		</tr>			
		<tr>
			<td class="submit" colspan="6">
				平台还可以发送的短信数量：
				<span style="font-weight:bold;color:red;">-2</span>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input name="sendsmsC" type="checkbox" checked="checked">&nbsp;给客户发送短信&nbsp;&nbsp;&nbsp;&nbsp;
				<input name="sendsmsD" type="checkbox" checked="checked">&nbsp;给司机发送短信&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="/auth/rescue/form.jsp"><input type="button" value="返回"></a>
				<input type="submit" value="提交">
			</td>
		</tr>	
	</tbody></table>
</form>





			
			<!-- 救援结束 -->
			<!-- 时间控件 -->
<link href="../css/jquery-ui-timepicker-addon.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/jquery-ui-timepicker-addon.js"></script>

<script type="text/javascript">
		
	$(function() {
		
		/* 日历控件 */  
		var $dateOption = {
			changeMonth: true,
			changeYear: true,
			dateFormat: "yy-mm-dd",
			timeFormat: 'HH:mm:ss'
		}; 
		$( "#dispatchtime" ).datetimepicker($dateOption);

		$( "#enteringtime" ).datetimepicker($dateOption);
		$( "#applytime" ).datetimepicker($dateOption);
		
		/* 计算字符数  */
		$("textarea").each(function(){
			
			caculate(this);
			
		});
		$("textarea").keyup(function(){
			
			caculate(this);
		});
		function caculate(ele){
			var len = ele.value.length;
			var left = 255 - len;
			if(left>=0){
				$("#for_"+ele.name).html(left);
			}else{
				$("#for_"+ele.name).html(0);
				ele.value = ele.value.substring(0,255);
			}
			
		}
	});
</script>




		</div>
	</div>
</div>

</div>
<br>


<div class="ui-dialog ui-widget ui-widget-content ui-corner-all ui-front ui-draggable ui-resizable" tabindex="-1" role="dialog" aria-describedby="dialog-form" aria-labelledby="ui-id-2" style="display: none; position: absolute;"><div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix"><span id="ui-id-2" class="ui-dialog-title">请选择车辆</span><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only ui-dialog-titlebar-close" role="button" aria-disabled="false" title="close"><span class="ui-button-icon-primary ui-icon ui-icon-closethick"></span><span class="ui-button-text">close</span></button></div><div id="dialog-form" class="ui-dialog-content ui-widget-content">
	<iframe id="dialog-iframe" src="" width="100%" height="100%" frameborder="no" scrolling="no" allowtransparency="true"></iframe>
</div><div class="ui-resizable-handle ui-resizable-n" style="z-index: 90;"></div><div class="ui-resizable-handle ui-resizable-e" style="z-index: 90;"></div><div class="ui-resizable-handle ui-resizable-s" style="z-index: 90;"></div><div class="ui-resizable-handle ui-resizable-w" style="z-index: 90;"></div><div class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se" style="z-index: 90;"></div><div class="ui-resizable-handle ui-resizable-sw" style="z-index: 90;"></div><div class="ui-resizable-handle ui-resizable-ne" style="z-index: 90;"></div><div class="ui-resizable-handle ui-resizable-nw" style="z-index: 90;"></div></div></body></html>
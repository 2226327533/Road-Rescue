<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><style type="text/css"></style></head><body style="zoom: 1;">﻿



<title>黑龙汽车道路救援服务中心道路紧急救援管理系统</title>
<link rel="icon" href="/images/HL.ico" type="image/x-icon">
<link rel="shortcut icon" href="/images/HL.ico" type="image/x-icon">

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




<div class="main">


<div id="maintabs" class="ui-tabs ui-widget ui-widget-content ui-corner-all">
	<ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all" role="tablist">
	<!-- <li class="ui-state-default ui-corner-top ui-tabs-active ui-state-active" role="tab" tabindex="0" aria-controls="maintabs-1" aria-labelledby="ui-id-1" aria-selected="true"><a href="http://liwei-pc:8010/rescue/form#maintabs-1" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-1">道路救援管理</a></li>
		<li class="ui-state-default ui-corner-top ui-tabs-active ui-state-active" role="tab" tabindex="0" aria-controls="maintabs-1" aria-labelledby="ui-id-1" aria-selected="true"><a href="http://liwei-pc:8010/rescue/form#maintabs-1" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-2">道路紧急救援</a></li> -->
				<li class="ui-state-default ui-corner-top ui-tabs-active ui-state-active" role="tab" tabindex="0" aria-controls="maintabs-1" aria-labelledby="ui-id-1" aria-selected="true"><a href="http://liwei-pc:8010/rescue/form#maintabs-1" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-1">道路紧急救援</a></li>
		<li class="ui-state-default ui-corner-top" role="tab" tabindex="-1" aria-controls="ui-tabs-2" aria-labelledby="ui-id-2" aria-selected="false"><a href="../rescue/getCarState" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-2">救援车辆状态</a></li>
	</ul>
	<div id="maintabs-1" aria-labelledby="ui-id-1" class="ui-tabs-panel ui-widget-content ui-corner-bottom" role="tabpanel" aria-expanded="true" aria-hidden="false">

		<div class="mainbox clearfix">
			
			<!-- 救援申请 -->
			
<!-- 救援申请 -->

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
				enteringtime:"required",
				applytime:"required",
				applyphone:{   
					required:true,
					isMobile:true  
				},
				estimatedcost:"number"
			}
		};
		
		/* 申请单开始验证*/
		$("#myform_aplly").validate($validateOption_apply);
	});
</script>

<form action="../rescue/rescueApply" method="post" id="myform_aplly" novalidate="novalidate">
	<input type="hidden" name="status" value="申请已确认">
	<table class="titem">
	
		<tbody><tr>
			<td class="title" colspan="6">救援申请</td>
		</tr>
		<tr><%-- <input type="hidden" name="dispatchtime" value="${nowTime}"> --%>
			<td class="field">录入时间</td>
			<td class="value" style="width: 20%;">
				<span><input readonly="readonly" class="common readonly" type="text" name="enteringtime" id="enteringtime" value=""></span>
			</td>
			<td class="field">申请时间</td>
			<td class="value" style="width: 20%;">
				<span><input readonly="readonly" class="common readonly" type="text" name="applytime" id="applytime" value=""></span>
			</td>
			<td class="field">申请人</td>
			<td class="value" style="width: 20%;">
				<span><input class="common" type="text" name="applyperson" value=""></span>
			</td>
		</tr>
		<tr>
			<td class="field">救援联系电话</td>
			<td class="value" style="width: 20%;">
				<span><input class="common" type="text" name="applyphone" value=""></span>
			</td>
			<td class="field">救援地点</td>
			<td class="value" colspan="3">
				<span><input class="common" type="text" name="rescueaddr" value=""></span>
			</td>
		</tr>
		<tr>
			<td class="field">事故原因</td>
			<td class="value" colspan="5">
				还能输入<label id="for_accidentcause" class="teatareanum"></label>字
				<span><textarea class="common" name="accidentcause" onchange="caculate('accidentcause')"></textarea></span>
			</td>
		</tr>
		<tr>
			<td class="field">车牌号码</td>
			<td class="value">
				<span><input class="common" type="text" name="carnum" value=""></span>
			</td>
			<td class="field">车型</td>
			<td class="value">
				<span><input class="common" type="text" name="motorcycle" value=""></span>
			</td>
			<td class="field">车身颜色</td>
			<td class="value">
				<span><input class="common" type="text" name="carcolor" value=""></span>
			</td>
		</tr>
		<tr>
			<td class="field">送达目的地</td>
			<td class="value">
				 <span><input class="common" type="text" name="destination" value=""></span>
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
				<span><input class="common" type="text" name="estimatedcost" value=""></span>
			</td>
			<td class="field">案件编号</td>
			<td class="value" colspan="3">
				<span><input class="common" type="text" name="casenum" value=""></span>
			</td>
			
		</tr>
		<tr>
			<td class="field">备注</td>
			<td class="value" colspan="5">
				 还能输入<label id="for_memo" class="teatareanum"></label>字
				<span><textarea class="common" name="memo"></textarea></span>
			</td>
		</tr>
					
		<tr>
			<td class="submit" colspan="6">
				
				<input type="submit" value="提交申请">
				
			</td>
		</tr>
					
	</tbody></table>
</form>

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


</body></html>
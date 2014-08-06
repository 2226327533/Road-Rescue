<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@include file="/common/common.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><style type="text/css"></style></head><body style="zoom: 1;">﻿



<title>黑龙汽车道路救援服务中心道路紧急救援管理系统</title>
<script type="text/javascript">
	$(function() {
		$("#maintabs").tabs();

	});
</script>




<div class="main">


<div id="maintabs2" class="ui-tabs ui-widget ui-widget-content ui-corner-all">
	<ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all" role="tablist">
		<li class="ui-state-default ui-corner-top ui-tabs-active ui-state-active" role="tab" tabindex="0" aria-controls="maintabs-1" aria-labelledby="ui-id-1" aria-selected="true"><a href="http://liwei-pc:8010/rescue/edit?id=2471&msgd=%E7%BB%99%E5%8F%B8%E6%9C%BA%E5%8F%91%E9%80%81%E7%9A%84%E7%9F%AD%E4%BF%A1%EF%BC%9A%E5%AF%86%E9%92%A5%E4%B8%8D%E6%AD%A3%E7%A1%AE&msgc=%E7%BB%99%E5%AE%A2%E6%88%B7%E5%8F%91%E9%80%81%E7%9A%84%E7%9F%AD%E4%BF%A1%EF%BC%9A%E6%89%8B%E6%9C%BA%E5%8F%B7%E6%A0%BC%E5%BC%8F%E4%B8%8D%E6%AD%A3%E7%A1%AE#maintabs-1" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-1">道路紧急救援&nbsp;<font style="color:#FF0000">救援已结束</font></a></li>
	</ul>
	<div id="maintabs-1" aria-labelledby="ui-id-1" class="ui-tabs-panel ui-widget-content ui-corner-bottom" role="tabpanel" aria-expanded="true" aria-hidden="false">

		<div class="mainbox clearfix">
			
			<!-- 救援申请 -->
			
<!-- 救援申请 -->

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
<form action="http://liwei-pc:8010/rescue/applyUpdate?id=2471" method="post" id="myform_aplly" novalidate="novalidate">
	<table class="titem">
		<tbody><tr>
			<td class="title" colspan="6">救援申请</td>
		</tr>
		<tr>
			<td class="field">录入时间</td>
			<td class="value" style="width: 20%;">
				<span><input readonly="readonly" class="common readonly" type="text" name="enteringtime" id="enteringtime" value="${rescue.enteringtime}"><%-- <fmt:formatDate value="${rescue.enteringtime}" type="date"/> --%></span>
			</td>
			<td class="field">申请时间</td>
			<td class="value" style="width: 20%;">
				<span><input readonly="readonly" class="common readonly" type="text" name="applytime" id="applytime" value="${rescue.applytime}"><%-- <fmt:formatDate value="${rescue.applytime}" type="date"/> --%></span>
			</td>
			<td class="field">申请人</td>
			<td class="value" style="width: 20%;">
				<span><input class="common" readonly="readonly" type="text" name="applyperson" value="${rescue.applyperson}"></span>
			</td>
		</tr>
		<tr>
			<td class="field">救援联系电话</td>
			<td class="value" style="width: 20%;">
				<span><input class="common" readonly="readonly" type="text" name="applyphone" value="${rescue.applyphone}"></span>
			</td>
			<td class="field">救援地点</td>
			<td class="value" colspan="3">
				<span><input class="common" readonly="readonly" type="text" name="rescueaddr" value="${rescue.rescueaddr}"></span>
			</td>
		</tr>
		<tr>
			<td class="field">事故原因</td>
			<td class="value" colspan="5">
				<span><textarea class="common" name="accidentcause" readonly="readonly" value="">${rescue.accidentcause}</textarea></textarea></span>
			</td>
		</tr>
		<tr>
			<td class="field">车牌号码</td>
			<td class="value">
				<span><input class="common" readonly="readonly" type="text" name="carnum" value="${rescue.carnum}"></span>
			</td>
			<td class="field">车型</td>
			<td class="value">
				<span><input class="common" readonly="readonly" type="text" name="motorcycle" value="${rescue.motorcycle}"></span>
			</td>
			<td class="field">车身颜色</td>
			<td class="value">
				<span><input class="common" readonly="readonly" type="text" name="carcolor" value="${rescue.carcolor}"></span>
			</td>
		</tr>
		<tr>
			<td class="field">送达目的地</td>
			<td class="value">
				 <span><input class="common" readonly="readonly" name="destination" value="${rescue.destination}"></span>
			</td>
			<td class="field">目的地类型</td>
			<td class="value" colspan="3">
				<span>
					<input type="radio" value="市内" name="rescue_apply_mudidileixing">
					市内
					<input type="radio" value="长途" name="rescue_apply_mudidileixing">
					长途
					<input type="radio" value="困境" name="rescue_apply_mudidileixing">
					困境
					<input type="radio" value="送油" name="rescue_apply_mudidileixing">
					送油
					<input type="radio" value="搭电" name="rescue_apply_mudidileixing">
					搭电
				</span>
			</td>
		</tr>
		<tr>
			<td class="field">预计费用(元)</td>
			<td class="value">
				<span><input class="common" readonly="readonly" type="text" name="estimatedcost" value="${rescue.estimatedcost}"></span>
			</td>
			<td class="field">案件编号</td>
			<td class="value" colspan="3">
				<span><input class="common" readonly="readonly" type="text" name="casenum" value="${rescue.casenum}"></span>
			</td>
			
		</tr>
		<tr>
			<td class="field">备注</td>
			<td class="value" colspan="5">
				<span><textarea class="common" readonly="readonly" name="memo" value="">${rescue.memo}</textarea></span>
			</td>
		</tr>
					
		<tr>
			<td class="submit" colspan="6">
				
				
			</td>
		</tr>
					
	</tbody></table>
</form>


			
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

<!-- 
<div class="ui-widget" style="margin-bottom: 10px;width:400px;">
<div class="ui-state-highlight ui-corner-all" style="padding: 0 .7em;">
<p style="margin: 1em 0;">
<span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>
给司机发送的短信：密钥不正确
</p>
<p style="margin: 1em 0;">
<span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>
给客户发送的短信：手机号格式不正确
</p>
</div>
</div> -->

<form method="post" id="myform_dispatch" action="#" novalidate="novalidate">
<!-- 	<input type="hidden" name="rescue_apply_lianxidianhua" value="12545215555">
	<input type="hidden" name="rescue_apply_chepai" value="">
	<input type="hidden" name="rescue_apply_shenqingren" value="dasd">
	<input type="hidden" name="rescue_apply_jiuyuandidian" value="dsad"> -->
	
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
				<span><input readonly="readonly" class="common readonly" type="text" name="dispatchtime" id="dispatchtime" value="${rescue.dispatchtime}"></span>
			</td>
		</tr>
		<tr>
			<td class="field">救援车
													<input type="button" value="派车" class="paichegrey">
							</td>
			<td class="value">
				<span>
					<input readonly="readonly" class="common readonly" type="text" id="rescuecar" name="rescuecar" value="${rescue.rescuecar}">
					<!-- <input type="hidden" id="carId" name="carId" value=""> -->
				</span>
			</td>
			<td class="field">驾驶员</td>
			<td class="value">
				<span>
					<input readonly="readonly" class="common readonly" type="text" id="driver" name="driverName" value="${rescue.driver}">
					<!-- <input type="hidden" id="rescue_dispatch_driver_id" name="rescue_dispatch_driver_id" value="6"> -->
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
				<span><textarea class="common" readonly="readonly" name="rescuememo">${rescue.rescuememo}</textarea></span>
			</td>
		</tr>			
		<tr>
		<td>
		</td>
		
		
			<!-- <td class="submit" colspan="6">
				平台还可以发送的短信数量：
				<span style="font-weight:bold;color:red;">您的计算机无法连接到互联网，或短信平台出现故障，短信功能无法正常开启</span>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input name="sendsmsC" type="checkbox" checked="checked">&nbsp;给客户发送短信&nbsp;&nbsp;&nbsp;&nbsp;
				<input name="sendsmsD" type="checkbox" checked="checked">&nbsp;给司机发送短信&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" value="提交">
			</td> -->
		</tr>	
		<tr>
			<td class="submit" colspan="6">
				
				
			</td>
		</tr>
	</tbody></table>
</form>

			<!-- 救援结束 -->
			<!-- 时间控件 -->

<script type="text/javascript">
		
	$(function() {
		
		/* 日历控件 */  
		var $dateOption = {
			changeMonth: true,
			changeYear: true,
			dateFormat: "yy-mm-dd",
			timeFormat: 'HH:mm:ss'
		}; 
		$( "#returntime" ).datetimepicker($dateOption);

		
		
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

<script type="text/javascript">
/* 获取上一个页面中目的地类型 并赋给当前页面  */
 $(document).ready(function(){
  		$("input[name='paytype'][value=${rescue.paytype}]").attr("checked",true); //给指定的radio赋值
  		$("input[name='ifpay'][value=${rescue.ifpay}]").attr("checked",true);
  		/* $("#rank").attr("value","${per.rank}");//给指定的select赋值 */
 }); 

</script>


	
<script type="text/javascript">
		
	$(function() {
		
		
		/////////////////////////////////////////////////////////////////////
		/* 返回单设置验证规则 */  
		var $validateOption_back = {
			rules: {
				rescue_back_fanhuishijian: {   
					required:true  
				},
				rescue_back_shijifeiyong: {   
					required:true,
					number:true  
				},
				rescue_back_licheng: {   
					required:true,
					number:true  
				},
				rescue_back_shouruchae: {   
					number:true  
				}
			}
		};
		
		/* 返回单开始验证*/
		$("#myform_back").validate($validateOption_back);
		
	});
</script>

<form method="post" id="myform_back" action="/auth/rescue/form.jsp" novalidate="novalidate">
	<!-- <input type="hidden" id="" name="" value="14">
	<input type="hidden" id="driverId" name="DriverId" value=""> -->
	<input type="hidden" id="id" name="id" value="${rescue.id}">
	<table class="titem">
		<tbody><tr>
			<td class="title" colspan="6">救援结束</td>
		</tr>
		<tr>
			<td class="field">返回时间</td>
			<td class="value" style="width: 20%;">
				<span><input  readonly="readonly" readonly="readonly"  class="common readonly"  type="text" id="returntime" name="returntime" value="${rescue.returntime}"></span>
			</td>
			<td class="field">里程(公里)</td>
			<td class="value" style="width: 20%;">
				<span><input class="common" readonly="readonly"  type="text" name="mileage" value="${rescue.mileage}"></span>
			</td>
			<td class="field">支付类型</td>
			<td class="value" style="width: 20%;">
				<span>
					<input type="radio" value="现金" name="paytype">
					现金
					<input type="radio" value="挂账" name="paytype">
					挂账
				</span>
			</td>
		</tr>
		<tr>
			<td class="field">实际费用(元)</td>
			<td class="value" style="width: 20%;">
				<span><input class="common" type="text" readonly="readonly"  name="realcost" value="${rescue.realcost}"></span>
			</td>
			<td class="field">收入差额(元)</td>
			<td class="value" style="width: 20%;">
				<span><input class="common" type="text" readonly="readonly"  name="incomebalance" value="${rescue.incomebalance}"></span>
			</td>
			<td class="field">是否结算</td>
			<td class="value" style="width: 20%;">
				<span>
					<input type="radio" value="已结" name="ifpay">
					已结
					<input type="radio" value="未结" name="ifpay">
					未结
				</span>
			</td>
		</tr>
		<tr>
			<td class="field">备注</td>
			<td class="value" colspan="5">
				还能输入<label id="for_returnmemo" class="teatareanum">255</label>字
				<span><textarea class="common" name="returmemo" readonly="readonly" >${rescue.returmemo}</textarea></span>
			</td>
		</tr>
					
		<tr>
			<td class="submit" colspan="6">
								<input type="submit" value="返回">
							</td>
		</tr>
					
	</tbody></table>
</form>
		</div>
	</div>
</div>

</div>
<br>


<div class="ui-dialog ui-widget ui-widget-content ui-corner-all ui-front ui-draggable ui-resizable" tabindex="-1" role="dialog" aria-describedby="dialog-form" aria-labelledby="ui-id-2" style="display: none; position: absolute;"><div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix"><span id="ui-id-2" class="ui-dialog-title">请选择车辆</span><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only ui-dialog-titlebar-close" role="button" aria-disabled="false" title="close"><span class="ui-button-icon-primary ui-icon ui-icon-closethick"></span><span class="ui-button-text">close</span></button></div><div id="dialog-form" class="ui-dialog-content ui-widget-content">
	<iframe id="dialog-iframe" src="" width="100%" height="100%" frameborder="no" scrolling="no" allowtransparency="true"></iframe>
</div><div class="ui-resizable-handle ui-resizable-n" style="z-index: 90;"></div><div class="ui-resizable-handle ui-resizable-e" style="z-index: 90;"></div><div class="ui-resizable-handle ui-resizable-s" style="z-index: 90;"></div><div class="ui-resizable-handle ui-resizable-w" style="z-index: 90;"></div><div class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se" style="z-index: 90;"></div><div class="ui-resizable-handle ui-resizable-sw" style="z-index: 90;"></div><div class="ui-resizable-handle ui-resizable-ne" style="z-index: 90;"></div><div class="ui-resizable-handle ui-resizable-nw" style="z-index: 90;"></div></div></body></html>

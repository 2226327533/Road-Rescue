<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><style type="text/css"></style></head><body style="zoom: 1;">﻿



<title>黑龙汽车道路救援服务中心道路紧急救援管理系统</title>
<link rel="icon" href="../images/HL.ico" type="image/x-icon">
<link rel="shortcut icon" href="../images/HL.ico" type="image/x-icon">

<link href="../css/showInfo-main.css" rel="stylesheet" type="text/css">
<link href="../css/jquery-ui.min.css" rel="stylesheet" type="text/css">
<script src="../js/json.js" language="javascript" type="text/javascript"></script>
<script src="../js/string.js" language="javascript" type="text/javascript"></script>
<script src="../js/jquery.min.js" language="javascript" type="text/javascript"></script>
<script src="../js/jquery-ui.min.js" type="text/javascript"></script>
<script src="../js/jquery.ui.datepicker-zh-CN.min.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
<script type="text/javascript" src="../js/messages_cn.js"></script>
<script src="../js/ihush.js" language="javascript" type="text/javascript"></script>
<!-- 页面自动刷新 -->
<!-- <script type="text/javascript">
	$(function() {
		$("#maintabs").tabs();

	});
</script> -->




<div class="main">


<script type="text/javascript">
/* $(function() {
	$(".weipaichu").hover(
			function(){
				$(this).removeClass("weipaichu").addClass("weipaichu_focus");
			},
			function(){
				$(this).removeClass("weipaichu_focus").addClass("weipaichu");
			}
	);
	
}); */

</script>
		
		
		<ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all" role="tablist"></ul>
						<div id="maintabs-1" aria-labelledby="ui-id-1" class="ui-tabs-panel ui-widget-content ui-corner-bottom" role="tabpanel" aria-expanded="true" aria-hidden="false">
						<c:if test="${!empty cars}">
						<c:forEach items="${cars}" var="car">
							<div class="mainbox">
								<div class="infocard">
									<c:if test="${car.carstatus=='可用'}">
													<div class="innercard weipaichu">
									</c:if>
									<c:if test="${car.carstatus=='不可用'}">
													<div class="innercard yipaichu">
									</c:if>		
									<li>
										<span class="bianhao">[${car.numcode}号救援车]<br></span>
									</li>
								
									 <li><span class="cardtitle">&nbsp;&nbsp;${car.carnum}</span></li> 
									<li><span class="cardtitle">&nbsp;&nbsp;</span></li>
									<li><span class="cardtitle">&nbsp;&nbsp;</span></li> 
								</div> 
							</div>
						</c:forEach>
						</c:if>
						<c:if test="${empty cars}">
							<div class="mainbox">
								<div class="infocard">
									<li>没有查询到相关信息</li>
								</div> 
							</div>
						</c:if>
						</div>	
		
<td valign="bottom">	
<div class="pagelist">
	
  		<span>
		<span>共 1 页 / 15 条记录 </span><span class="indexPage">Prev</span><b>1</b><span class="nextPage">Next</span> 
		</span>
  	
</div>
</td>
	</div>
<br>

</body></html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'show.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		function fun(){
			document.form1.submit();
		}
		//setTimeout(sub,1000000);
	</script>
  </head>
  
  <body>
  	<form action="rescue/search" method="post" name="form1" id="form1">
  		<input type="hidden" name="time_begin" value="${param.time_begin}">
  		<input type="hidden" name="time_end" value="${param.time_end}">
  		<input type="hidden" name="driver" value="${param.driver}">
  		<input type="hidden" name="shenqingren" value="${param.shenqingren}">
  	</form>
    <table class="titem">
	<tbody><tr>
		<td class="field">救援申请起止时间</td>
		<td class="value" style="text-align:left;">
			<input type="hidden" name="type" value="">
			<input type="text" readonly="readonly" style="width:100px" name="time_begin" value="${time_begin}" id="time_begin">
			-
			<input type="text" readonly="readonly" style="width:100px" name="time_end" value="" id="time_end">
		</td>
		<td class="field">申请人</td>
		<td class="value" style="text-align:left;">
			<input type="text" class="common" name="shenqingren" value="">
		</td>
		<td class="field">驾驶员</td>
		<td class="value" style="text-align:left;">
			<select name="driver">
				<option value="">请选择</option>
					<c:if test="${!empty drivers}">
						<c:forEach items="${drivers}" var="driver">
							<option value="${driver.id}">${driver.name}</option>
						</c:forEach>
					</c:if>
			</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							
		</td>
		<td class="value submit" style="text-align:left;">
			&nbsp;<input type="button" name="search" value="搜索">
			<input type="button" name="clearBtn" value="清空">
		</td>
	</tr>
</tbody></table>


<br>
		
		<div class="mainbox" style="overflow-x: scroll;">
			
			<form name="myform" method="post" action="">
				<div class="option_bar">
					<input type="checkbox" id="chkall">&nbsp;全选
					<input type="submit" value="批量删除">
				</div>
						
				<table class="tlist" style="width:3600px;">
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
								<c:if test="${rescue.status=='申请已确认'}">
								<td align="center">
									<input type="checkbox" value="2452" class="itemid" name="ids[]">
								</td> 
								</c:if>
								<c:if test="${rescue.status=='救援已结束'}">
								<td align="center">
									<input type="checkbox" value="2452" class="itemid" name="ids[]">
								</td> 
								</c:if>
								<c:if test="${rescue.status=='车辆已派出'}">
								<td align="center">
									&nbsp;
								</td> 
								</c:if>
								<td class="option">
									<c:if test="${rescue.status=='申请已确认'}">
										<a class="edit" href="../rescue/edit?rescueId=${rescue.id}&flag=1" title="编辑"><span class="ui-icon ui-icon-pencil" style="float: left; margin-right: 5px;"></span></a>
										<a class="del" href="../rescue/del?rescueId=${rescue.id}" title="删除"><span class="ui-icon ui-icon-trash" style="float: left;"></span></a>
									</c:if>
									<c:if test="${rescue.status=='车辆已派出'}">
										<a class="edit" href="../rescue/edit?rescueId=${rescue.id}&flag=2&carNum=${rescue.rescuecar}" title="编辑"><span class="ui-icon ui-icon-pencil" style="float: left; margin-right: 5px;"></span></a>
									</c:if>
									<c:if test="${rescue.status=='救援已结束'}">
										<a class="show" href="../rescue/show?rescueId=${rescue.id}" title="查看"><span class="ui-icon ui-icon-search" style="float: left; margin-right: 5px;"></span></a>
										<a class="edit" href="../rescue/edit?rescueId=${rescue.id}&flag=3" title="编辑"><span class="ui-icon ui-icon-pencil" style="float: left; margin-right: 5px;"></span></a>
										<a class="del" href="../rescue/del?rescueId=${rescue.id}" title="删除"><span class="ui-icon ui-icon-trash" style="float: left;"></span></a>
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
  </body>
</html>

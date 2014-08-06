<%@page import="com.auth.pojo.Driver"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css"></style>
</head>
<body style="zoom: 1;">
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
	<script type="text/javascript">
		$(function() {
			$("#maintabs").tabs();

		});
	</script>
	
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
		<div id="maintabs"
			class="ui-tabs ui-widget ui-widget-content ui-corner-all">
			<ul
				class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all"
				role="tablist">
				<li
					class="ui-state-default ui-corner-top ui-tabs-active ui-state-active"
					role="tab" tabindex="0" aria-controls="maintabs-1"
					aria-labelledby="ui-id-1" aria-selected="true"><a
					href="driver/list#maintabs-1" class="ui-tabs-anchor"
					role="presentation" tabindex="-1" id="ui-id-1">驾驶员信息查询</a></li>
			</ul>
			<div id="maintabs-1" aria-labelledby="ui-id-1"
				class="ui-tabs-panel ui-widget-content ui-corner-bottom"
				role="tabpanel" aria-expanded="true" aria-hidden="false">


				<div class="mainbox" style="overflow-x: scroll;">

					<form name="myform" method="post"
						action="../driver/mutidel.htm">
						<div class="option_bar">
							<input type="checkbox" id="chkall">&nbsp;全选 
							<input type="submit" name="mutidel" id="mutidel" value="批量删除" onclick="firm()"> <input type="button"
								value="添加" onclick="javascript:location.href='AddDrivers.jsp'">
						</div>

						<table class="tlist" style="width: 2000px;">
							<thead>
								<tr>
									<th style="width: 40px;">选择</th>
									<th style="width: 40px;">操作</th>
									<th>编号</th>
									<th>状态</th>
									<th>姓名</th>
									<th>职务</th>
									<th>联系电话</th>
									<th>性别</th>
									<th>籍贯</th>
									<th>民族</th>
									<th>文化程度</th>
									<th>身份证号</th>
									<th>出生年月</th>
									<th>聘入时间</th>
									<th>家庭住址</th>
									<th>驾驶证号</th>
									<th>准驾车型</th>
									<th>领证时间</th>
									<th>备注</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${DriverList}" var="driver">
									<tr
										style="background-color: rgb(255, 255, 255); background-position: initial initial; background-repeat: initial initial;">
										<td align="center">
										<input type="checkbox" class="itemid" name="ids" value="${driver.id}" ></td>
										<td class="option"><a class="edit"
											href="../driver/editdriver.htm?driverid=${driver.id }"
											title="编辑"> <span class="ui-icon ui-icon-pencil"
												style="float: left; margin-right: 5px;"></span></a> <a
											class="del"
											href="../driver/deldriver.htm?driverid=${driver.id }"
											title="删除"><span class="ui-icon ui-icon-trash"
												style="float: left;"></span></a></td>
										<td>${driver.numcode}</td>
										<td>${driver.status}</td>
										<td>${driver.name}</td>
										<td>${driver.post}</td>
										<td>${driver.phone}</td>
										<td>${driver.sex}</td>
										<td>${driver.nativePlace}</td>
										<td>${driver.nation}</td>
										<td>${driver.culture}</td>
										<td>${driver.idcard}</td>
										<td>${driver.birthday}</td>
										<td>${driver.employtime}</td>
										<td>${driver.addr}</td>
										<td>${driver.carnum}</td>
										<td>${driver.cartype}</td>
										<td>${driver.getdate}</td>
										<td>${driver.memo}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</form>
					<div class="clearfix"></div>
				</div>

				<div class="pagelist">
					<span> <span>共 1 页 / 15 条记录 </span><span class="indexPage">Prev</span><b>1</b><span
						class="nextPage">Next</span>
					</span>
				</div>
			</div>
		</div>

	</div>
	<br>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css"></style>
</head>
<body class="showmenu" scroll="no" style="zoom: 1;">
	﻿
	<title>黑龙汽车道路救援服务中心道路紧急救援管理系统</title>
	<link rel="icon" href="/images/HL.ico" type="image/x-icon">
	<link rel="shortcut icon" href="images/HL.ico" type="image/x-icon">
	<link href="css/frame.css" rel="stylesheet" type="text/css">
	<link href="css/jquery-ui.min.css" rel="stylesheet" type="text/css">
	<script src="js/jquery.min.js" language="javascript"
		type="text/javascript"></script>
	<script src="js/jquery-ui.min.js" type="text/javascript"></script>
	<script src="js/frame.js" language="javascript" type="text/javascript"></script>




	<div class="pagemask"></div>

	<iframe class="iframemask"></iframe>

	<div class="head">
		<div class="top_logo">
			<img src="images/index-banner.png" alt="黑龙汽车道路救援服务中心道路紧急救援管理系统">
		</div>
		<div class="top_link">
			<ul>
				<li class="welcome">欢迎您, sa</li>
				<li><a href="http://liwei-pc:8010/auth/logout" target="_top">[退出]</a></li>
			</ul>
			<!--
		<div class="quick">
			<a href="#" class="ac_qucikmenu" id="ac_qucikmenu">1</a>
			<a href="#" class="ac_qucikadd" id="ac_qucikadd">2</a>
		</div>
		-->
		</div>
		<!-- <div class="nav" id="nav">
		<ul>
							<li><a class="thisclass" href="javascript:;" _for="top_1" target="main">黑龙汽车道路救援服务中心</a></li>
					</ul>
	</div> -->
	</div>
	<!-- header end -->

	<script type="text/javascript">
		$(function() {
			$("#accordion").accordion({
				navigation : true,
				collapsible : true,
				heightStyle : "content"
			});
		});
	</script>
	<div class="left">

		<div id="accordion" class="ui-accordion ui-widget ui-helper-reset"
			role="tablist">

			<h3
				class="ui-accordion-header ui-helper-reset ui-state-default ui-accordion-icons ui-accordion-header-active ui-state-active ui-corner-top"
				role="tab" id="ui-accordion-accordion-header-0"
				aria-controls="ui-accordion-accordion-panel-0" aria-selected="true"
				tabindex="0">
				<span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-s"></span><a
					href="http://liwei-pc:8010/#section1">道路救援管理</a>
			</h3>
			<div
				class="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom ui-accordion-content-active"
				id="ui-accordion-accordion-panel-0"
				aria-labelledby="ui-accordion-accordion-header-0" role="tabpanel"
				aria-expanded="true" aria-hidden="false" style="display: block;">
				<ul>
					<li><a href="/auth/rescue/form.jsp" target="main">道路紧急救援</a></li>
					<li><a href="rescue/getAllMess" target="main">救援信息查询</a></li>
					<li><a href="/auth/report/list.jsp" target="main">运营统计报表</a></li>
					<li><a href="/auth/report/daliylist.jsp" target="main">运营统计日报表</a></li>
					<li><a href="/auth/report/detaillist.jsp" target="main">运营统计详单</a></li>
					<li><a href="/auth/report/daliydetaillist.jsp" target="main">运营统计日详单</a></li>
				</ul>
			</div>
			<h3
				class="ui-accordion-header ui-helper-reset ui-state-default ui-accordion-icons ui-corner-all"
				role="tab" id="ui-accordion-accordion-header-1"
				aria-controls="ui-accordion-accordion-panel-1" aria-selected="false"
				tabindex="-1">
				<span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-e"></span><a
					href="http://liwei-pc:8010/#section1">车辆基本信息</a>
			</h3>
			<div
				class="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom"
				id="ui-accordion-accordion-panel-1"
				aria-labelledby="ui-accordion-accordion-header-1" role="tabpanel"
				aria-expanded="false" aria-hidden="true" style="display: none;">
				<ul>
					<li><a href="car/liststatus.htm" target="main">车辆派遣情况查询</a></li>
					<li><a href="car/listcar.htm" target="main">车辆基本信息查询</a></li>
				</ul>
			</div>
			<h3
				class="ui-accordion-header ui-helper-reset ui-state-default ui-accordion-icons ui-corner-all"
				role="tab" id="ui-accordion-accordion-header-2"
				aria-controls="ui-accordion-accordion-panel-2" aria-selected="false"
				tabindex="-1">
				<span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-e"></span><a
					href="#">驾驶员基本信息</a>
			</h3>
			<div
				class="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom"
				id="ui-accordion-accordion-panel-2"
				aria-labelledby="ui-accordion-accordion-header-2" role="tabpanel"
				aria-expanded="false" aria-hidden="true" style="display: none;">
				<ul>
					<li><a href="driver/listdriver.htm" target="main">驾驶员信息查询</a></li>
				</ul>
			</div>
			<!-- <h3
				class="ui-accordion-header ui-helper-reset ui-state-default ui-accordion-icons ui-corner-all"
				role="tab" id="ui-accordion-accordion-header-3"
				aria-controls="ui-accordion-accordion-panel-3" aria-selected="false"
				tabindex="-1">
				<span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-e"></span><a
					href="http://liwei-pc:8010/#section1">个人设置</a>
			</h3>
			<div
				class="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom"
				id="ui-accordion-accordion-panel-3"
				aria-labelledby="ui-accordion-accordion-header-3" role="tabpanel"
				aria-expanded="false" aria-hidden="true" style="display: none;">
				<ul>
					<li><a href="/auth/common/welcome.jsp" target="main">欢迎界面</a></li>
					<li><a href="/auth/common/personaledit.jsp" target="main">密码修改</a></li>
				</ul>
			</div> -->
			<h3
				class="ui-accordion-header ui-helper-reset ui-state-default ui-accordion-icons ui-corner-all"
				role="tab" id="ui-accordion-accordion-header-4"
				aria-controls="ui-accordion-accordion-panel-4" aria-selected="false"
				tabindex="-1">
				<span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-e"></span><a
					href="http://liwei-pc:8010/#section1">系统设置</a>
			</h3>
			<div
				class="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom"
				id="ui-accordion-accordion-panel-4"
				aria-labelledby="ui-accordion-accordion-header-4" role="tabpanel"
				aria-expanded="false" aria-hidden="true" style="display: none;">
				<ul>
					<li><a href="/auth/system/roleList.jsp" target="main">角色管理</a></li>
					<li><a href="/auth/system/userList.jsp" target="main">用户管理</a></li>
					<li><a href="/auth/system/resourceList.jsp" target="main">资源管理</a></li>
					<li><a href="/auth/system/appList.jsp" target="main">菜单管理</a></li>
					<li><a href="/auth/db/" target="main">数据备份</a></li>
				</ul>
			</div>

		</div>

	</div>
	<!-- left end -->


	<div class="right">
		<div class="main">
			<iframe id="main" name="main" frameborder="0" src="rescue/getAllMess"></iframe>
			<div sytle="clear:both"></div>
		</div>
	</div>
	<!-- right end -->

	<!--
<div class="qucikmenu" id="qucikmenu">
	<ul>
		<li><a href="javascript:;" target="main">1</a></li>
		<li><a href="javascript:;" target="main">2</a></li>
		<li><a href="javascript:;" target="main">3</a></li>
	</ul>
</div>
-->
	<!-- qucikmenu end -->


</body>
</html>
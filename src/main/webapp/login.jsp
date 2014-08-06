<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>黑龙汽车道路救援服务中心道路紧急救援管理系统 - 用户登录</title>
<link rel="icon" href="images/HL.ico" type="image/x-icon">
<link rel="shortcut icon" href="images/HL.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="css/login.css">
<link href="css/jquery-ui.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="js/jquery_002.js"></script>
<script src="js/jquery-ui.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/messages_cn.js"></script>
<script type="text/javascript">
		
	$(function() {
	
		if(self!=top){
		    window.top.location = self.location;
		}
	
		// highlight 
		var elements = $("input[type!='submit'], textarea, select");
		elements.focus(function(){
			$(this).parents('li').addClass('highlight');
		});
		elements.blur(function(){
			$(this).parents('li').removeClass('highlight');
		});
		$("#login").validate();
	});
</script>
</head>
  <body>
    <div id="page">
		<div id="header">
			<h1><img src="images/login-banner.png"></h1>
		</div>
		<div id="content">
			
			<form novalidate="novalidate" action="" method="post" id="login">
				<fieldset>
					<legend>用户登录</legend>
					<ul>
						<li>
							<label for="username"><span class="required">用户名</span></label>
							<input id="username" name="username" class="text required" title="请输入用户名" type="text">
						</li>
						
						<li>
							<label for="password"><span class="required">密&nbsp;&nbsp;&nbsp;码</span></label>
							<input id="password" name="passwd" class="text required" title="请输入用户密码" type="password">
						</li>
						
						<li>
							<label for="securitycode"><span class="required">验证码</span></label>
							<input id="securitycode" name="securitycode" class="text required" title="请输入验证码" type="text">
							<img id="securityimg" src="images/image.png" alt="看不清？点击更换" style="cursor:pointer" onclick="this.src=this.src+'?'" align="absmiddle">
						</li>
					</ul>
				</fieldset>
				
				<div class="submitdiv">
					<input class="button" value="登录" type="submit">
				</div>
				
				<div class="clear"></div>
			</form>
			
			</div>
	</div>
</body></html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%@include file="/common/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<title>黑龙汽车道路救援服务中心道路紧急救援管理系统</title>


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
	$( "#birthday" ).datepicker($dateOption);
	$( "#employtime" ).datepicker($dateOption);
	$( "#getdate" ).datepicker($dateOption);
	
	/* //清空
	$("input[name='clearBtn']").click(function(){
		$("input[name='time_begin']").val("");
		$("input[name='time_end']").val("");
	}); */
	
	
	//搜索
	/*  $("input[name='search']").click(function(){
		
		var $parentNode = $(this).parents(".ui-tabs-panel");
		
		var apply_type = $parentNode.find("input[name='type']").val();
		var time_begin = $parentNode.find("input[name='time_begin']").val();
		var time_end = $parentNode.find("input[name='time_end']").val();
		var driver = $parentNode.find("select[name='driver']").val();
		var shenqingren = $parentNode.find("input[name='shenqingren']").val(); */
		//alert(time_begin);
		//alert(time_end);
		/* console.log(type);
		console.log(time_begin);
		console.log(time_end); */
		//var $url = "listAll.jsp?time_begin="+time_begin+"&time_end="+time_end+"&driver="+driver+"&shenqingren="+shenqingren;
	
 		//var $url = "/rescue/search";
 		/* alert($url);
		$(this).parents(".ui-tabs-panel").load($url);
		
	});  */
});

</script>

<div id="maintabs"
	class="ui-tabs ui-widget ui-widget-content ui-corner-all">
	<ul
		class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all"
		role="tablist">
		<li
			class="ui-state-default ui-corner-top ui-tabs-active ui-state-active"
			role="tab" tabindex="0" aria-controls="maintabs-1"
			aria-labelledby="ui-id-1" aria-selected="true"><a href="#"
			class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-1">修改驾驶员基本信息</a>
		</li>
	</ul>
	<div id="maintabs-1" aria-labelledby="ui-id-1"
		class="ui-tabs-panel ui-widget-content ui-corner-bottom"
		role="tabpanel" aria-expanded="true" aria-hidden="false">

		<div class="mainbox clearfix">
			<form id="myform" method="post" action="../driver/updatedriver.htm"
				novalidate="novalidate">
				<table class="titem">
					<tbody>
						<tr>
							<input type="hidden" name=driverid value="${driver.id}">
							<td class="field">驾驶员编号</td>
							<td class="value"><span> <input class="common"
									type="text" name="numcode" value="${driver.numcode}"></span></td>
							<td class="field">姓名</td>
							<td class="value"><span><input class="common"
									type="text" name="name" value="${driver.name}"></span></td>
							<td class="field">职务</td>
							<td class="value"><span><input class="common"
									type="text" name="post" value="${driver.post}"></span></td>
						</tr>
						<tr>
							<td class="field">联系电话</td>
							<td class="value" style="width: 20%;"><span><input
									class="common" type="text" name="phone" value="${driver.phone}"></span></td>
							<td class="field">性别</td>
							<td class="value" style="width: 20%;"><input type="radio"
								value="男" name="sex" checked="checked"> 男 <input
								type="radio" value="女" name="sex"> 女</td>
							<td class="field">籍贯</td>
							<td class="value" style="width: 20%;"><span><input
									class="common" type="text" name="nativePlace"
									value="${driver.nativePlace}"></span></td>
						</tr>
						<tr>
							<td class="field">民族</td>
							<td class="value"><span><input class="common"
									type="text" name="nation" value="${driver.nation}"></span></td>
							<td class="field">文化程度</td>
							<td class="value"><span><input class="common"
									type="text" name="culture" value="${driver.culture}"></span></td>
							<td class="field">身份证号</td>
							<td class="value"><span><input class="common"
									type="text" name="idcard" value="${driver.idcard}"></span></td>
						</tr>
						<tr>
							<td class="field">出生年月</td>
							<td class="value"><span><input
									class="common"  type="text" name="birthday"
									id="birthday" value="${driver.birthday}"></span></td>
							<td class="field">聘入时间</td>
							<td class="value"><span><input
									 type="text" name="employtime"
									id="employtime" value="${driver.employtime}"></span></td>
							<td class="field">家庭住址</td>
							<td class="value"><span><input class="common"
									type="text" name="addr" value="${driver.addr}"></span></td>
						</tr>
						<tr>
							<td class="field">驾驶证号</td>
							<td class="value"><span><input class="common"
									type="text" name="carnum" value="${driver.carnum}"></span></td>
							<td class="field">准驾车型</td>
							<td class="value"><span><input class="common"
									type="text" name="cartype" value="${driver.cartype}"></span></td>
							<td class="field">领证时间</td>
							<td class="value"><span><input
									 type="text" name="getdate"
									id="getdate" value="${driver.getdate}"></span></td>
						</tr>
						<tr>
							<td class="field">状态</td>
							<td class="value" style="width: 20%;"><span> <select
									name="status">
										<option value="在岗">在岗</option>
										<option value="请假">请假</option>
										<option value="离职">离职</option>
								</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</span></td>
							<td class="field">&nbsp;</td>
							<td class="value"><span>&nbsp;</span></td>
							<td class="field">&nbsp;</td>
							<td class="value"><span>&nbsp;</span></td>
						</tr>
						<tr>
							<td class="field">备注</td>
							<td class="value" colspan="5"><span><input
									class="common" type="text" name="memo" value="${driver.memo}"></span></td>
						</tr>

						<tr>
							<td class="submit" colspan="6"><input type="submit"
								value="提交"> <input type="button" value="返回"
								onclick="javascript:history.go(-1);"></td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</div>
<br>
<!-- <div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"></div> -->

</body>
</html>
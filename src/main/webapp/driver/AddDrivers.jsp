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

  <title>
    黑龙汽车道路救援服务中心道路紧急救援管理系统
  </title>
  <link rel="icon" href="../images/HL.ico" type="image/x-icon">
  <link rel="shortcut icon" href="../images/HL.ico" type="image/x-icon">

  <link href="main.css" rel="stylesheet" type="text/css">
  <link href="../css/jquery-ui.min.css" rel="stylesheet" type="text/css">
  <script src="../js/json.js" language="javascript" type="text/javascript">
  </script>
  <script src="../js/string.js" language="javascript" type="text/javascript">
  </script>
  <script src="../js/jquery.min.js" language="javascript" type="text/javascript">
  </script>
  <script src="../js/jquery-ui.min.js" type="text/javascript">
  </script>
  <script src="../js/jquery.ui.datepicker-zh-CN.min.js">
  </script>
  <script type="text/javascript" src="../js/jquery.validate.min.js">
  </script>
  <script type="text/javascript" src="../js/messages_cn.js">
  </script>
  <script src="../js/ihush.js" language="javascript" type="text/javascript">
  </script>
<script type="text/javascript" src="../js/AjaxCheck.js" charset="utf-8">	
</script>
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
});

</script>

            <div id="maintabs" class="ui-tabs ui-widget ui-widget-content ui-corner-all">
              <ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all" role="tablist">
                <li 
                    class="ui-state-default ui-corner-top ui-tabs-active ui-state-active"
                    role="tab"
                    tabindex="0"
                    aria-controls="maintabs-1"
                    aria-labelledby="ui-id-1"
                    aria-selected="true">

      <a href="#" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-1">
        添加驾驶员基本信息
      </a>
    </li>
  </ul>
  <div 
      id="maintabs-1"
      aria-labelledby="ui-id-1"
      class="ui-tabs-panel ui-widget-content ui-corner-bottom"
      role="tabpanel"
      aria-expanded="true"
      aria-hidden="false">

    <div class="mainbox clearfix">
      <form id="myform" method="post" action="../driver/adddriver.htm" novalidate="novalidate">
        <table class="titem">
          <tbody>
            <tr>
              <td class="field">
                驾驶员编号
              </td>
              <td class="value">
                <span>
                  <input class="common" type="text" name="numcode" value="" onblur="checkdriver()">
                </span>
                <div id="tip" style="color: #FF0000"></div>
              </td>
              <td class="field">
                姓名
              </td>
              <td class="value">
                <span>
                  <input class="common" type="text" name="name" value="">
                </span>
              </td>
              <td class="field">
                职务
              </td>
              <td class="value">
                <span>
                  <input class="common" type="text" name="post" value="">
                </span>
              </td>
            </tr>
            <tr>
              <td class="field">
                联系电话
              </td>
              <td class="value" style="width: 20%;">
                <span>
                  <input class="common" type="text" name="phone" value="">
                </span>
              </td>
              <td class="field">
                性别
              </td>
              <td class="value" style="width: 20%;">
                <input type="radio" value="男" name="sex" checked="checked">
                男
                <input type="radio" value="女" name="sex">
                女
              </td>
              <td class="field">
                籍贯
              </td>
              <td class="value" style="width: 20%;">
                <span>
                  <input class="common" type="text" name="nativePlace" value="">
                </span>
              </td>
            </tr>
            <tr>
              <td class="field">
                民族
              </td>
              <td class="value">
                <span>
                  <input class="common" type="text" name="nation" value="">
                </span>
              </td>
              <td class="field">
                文化程度
              </td>
              <td class="value">
                <span>
                  <input class="common" type="text" name="culture" value="">
                </span>
              </td>
              <td class="field">
                身份证号
              </td>
              <td class="value">
                <span>
                  <input class="common" type="text" name="idcard" value="">
                </span>
              </td>
            </tr>
            <tr>
              <td class="field">
                出生年月
              </td>
              <td class="value">
                <span>
                  <input class="common" type="text" name="birthday" id="birthday" value="">
                </span>
              </td>
              <td class="field">
                聘入时间
              </td>
              <td class="value">
                <span>
                  <input class="common" type="text" name="employtime" id="employtime" value="">
                </span>
              </td>
              <td class="field">
                家庭住址
              </td>
              <td class="value">
                <span>
                  <input class="common" type="text" name="addr" value="">
                </span>
              </td>
            </tr>
            <tr>
              <td class="field">
                驾驶证号
              </td>
              <td class="value">
                <span>
                  <input class="common" type="text" name="carnum" value="">
                </span>
              </td>
              <td class="field">
                准驾车型
              </td>
              <td class="value">
                <span>
                  <input class="common" type="text" name="cartype" value="">
                </span>
              </td>
              <td class="field">
                领证时间
              </td>
              <td class="value">
                <span>
                  <input class="common" type="text" name="getdate" id="getdate" value="">
                </span>
              </td>
            </tr>
            <tr>
              <td class="field">
                状态
              </td>
              <td class="value" style="width: 20%;">
                <span>
                  <select name="status">
                    <option value="在岗">
                      在岗
                    </option>
                    <option value="请假">
                      请假
                    </option>
                    <option value="离职">
                      离职
                    </option>
                  </select>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </span>
              </td>
              <td class="field">
                &nbsp;
              </td>
              <td class="value">
                <span>
                  &nbsp;
                </span>
              </td>
              <td class="field">
                &nbsp;
              </td>
              <td class="value">
                <span>
                  &nbsp;
                </span>
              </td>
            </tr>
            <tr>
              <td class="field">
                备注
              </td>
              <td class="value" colspan="5">
                <span>
                  <input class="common" type="text" name="memo" value="">
                </span>
              </td>
            </tr>

            <tr>
              <td class="submit" colspan="6">
                <input type="submit" value="提交">
                <input type="button" value="返回" onclick="javascript:history.go(-1);">
              </td>
            </tr>
          </tbody>
        </table>
      </form>
    </div>
  </div>
</div>
<br>
</body>
</html>

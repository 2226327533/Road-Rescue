<%@page import="com.auth.pojo.Driver"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style type="text/css">
    </style>
  </head>
  <body style="zoom: 1;">
    <title>
      黑龙汽车道路救援服务中心道路紧急救援管理系统
    </title>
    <link rel="icon" href="../image/HL.ico" type="image/x-icon">
    <link rel="shortcut icon" href="image/HL.ico" type="image/x-icon">

    <link href="../css/main.css" rel="stylesheet" type="text/css">
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
        <div id="maintabs" class="ui-tabs ui-widget ui-widget-content ui-corner-all">
          <ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all" role="tablist">
            <li 
                class="ui-state-default ui-corner-top ui-tabs-active ui-state-active"
                role="tab"
                tabindex="0"
                aria-controls="maintabs-1"
                aria-labelledby="ui-id-1"
                aria-selected="true">



            <a href="driver/list#maintabs-1" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-1">
              车辆信息查询
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

          <div class="mainbox" style="overflow-x: scroll;">

            <form name="myform" method="post" action="../car/mutidel.htm">
              <div class="option_bar">
                <input type="checkbox" id="chkall">
                &nbsp;全选
                <input type="submit" name="mutidel" id="mutidel" value="批量删除" onclick="firm()">
                <input type="button" value="添加" onclick="javascript:location.href='../car/readytoadd.htm'">
              </div>

              <table class="tlist" style="width: 2000px;">
                <thead>
                  <tr>
                    <th style="width: 40px;">
                      选择
                    </th>
                    <th style="width: 40px;">
                      操作
                    </th>
                    <th>
                      编号
                    </th>
                    <th>
                      状态
                    </th>
                    <th>
                      车牌号码
                    </th>
                    <th>
                      驾驶员
                    </th>
                    <th>
                      联系电话
                    </th>
                    <th>
                      车辆类型
                    </th>
                    <th>
                      品牌
                    </th>
                    <th>
                      型号
                    </th>
                    <th>
                      颜色
                    </th>
                    <th>
                      识别码
                    </th>
                    <th>
                      发动机号
                    </th>
                    <th>
                      购买日期
                    </th>
                    <th>
                      登记日期
                    </th>
                    <th>
                      备注
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${CarList}" var="car">
                    <tr 
                        style="background-color: rgb(255, 255, 255); background-position: initial initial; background-repeat: initial initial;">

                      <td align="center">
                        <input type="checkbox" class="itemid" name="ids" value="${car.id}" >
                      </td>
                      <td class="option">
                        <a class="edit" href="../car/editcar.htm?carid=${car.id }" title="编辑">
                          <span class="ui-icon ui-icon-pencil" style="float: left; margin-right: 5px;">
                          </span>
                        </a>
                        <a class="del" href="../car/delcar.htm?carid=${car.id }" title="删除">
                          <span class="ui-icon ui-icon-trash" style="float: left;">
                          </span>
                        </a>
                      </td>
                      <td>
                        ${car.numcode}
                      </td>
                      <td>
                        ${car.carstatus}
                      </td>
                      <td>
                        ${car.carnum}
                      </td>
                      <td>
                        ${car.driver.name}
                      </td>
                      <td>
                        ${car.driver.phone}
                      </td>
                      <td>
                        ${car.cartype}
                      </td>
                      <td>
                        ${car.brand}
                      </td>
                      <td>
                        ${car.carmodel}
                      </td>
                      <td>
                        ${car.carcolor}
                      </td>
                      <td>
                        ${car.identify}
                      </td>
                      <td>
                        ${car.enginenum}
                      </td>
                      <td>
                        ${car.buydate}
                      </td>
                      <td>
                        ${car.regdate}
                      </td>
                      <td>
                        ${car.memo}
                      </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </form>
            <div class="clearfix">
            </div>
          </div>

          <div class="pagelist">
            <span>
              <span>
                共 1 页 / 15 条记录
              </span>
              <span class="indexPage">
                Prev
              </span>
              <b>
                1
              </b>
              <span class="nextPage">
                Next
              </span>
            </span>
          </div>
        </div>
      </div>
    </div>
    <br>
  </body>
</html>

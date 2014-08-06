<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <title>黑龙汽车道路救援服务中心道路紧急救援管理系统</title>
  
  <link rel="icon" href="../images/HL.ico" type="image/x-icon">
  <link rel="shortcut icon" href="../images/HL.ico" type="image/x-icon">
  <link href="main.css" rel="stylesheet" type="text/css">
  <link href="../css/jquery-ui.min.css" rel="stylesheet" type="text/css">
  <script src="../js/json.js" language="javascript" type="text/javascript"></script>
  <script src="../js/string.js" language="javascript" type="text/javascript"></script>
  <script src="../js/jquery.min.js" language="javascript" type="text/javascript"></script>
  <script src="../js/jquery-ui.min.js" type="text/javascript"></script>
  <script src="../js/jquery.ui.datepicker-zh-CN.min.js"></script>
  <script type="text/javascript" src="../js/jquery.validate.min.js"></script>
  <script type="text/javascript" src="../js/messages_cn.js"></script>
  <script src="../js/ihush.js" language="javascript" type="text/javascript"></script>
<script type="text/javascript" src="../js/CheckCar.js" charset="utf-8">	
</script>
<script type="text/javascript" src="../js/AjaxCheck.js" charset="utf-8">	
</script>
  <script type="text/javascript">
    $(function() {
      /* 日历控件 */
      var $dateOption = {
        changeMonth : true,
        changeYear : true,
        dateFormat : "yy-mm-dd",
        timeFormat : 'HH:mm:ss'
        };
        $("#buydate").datepicker($dateOption);
        $("#regdate").datepicker($dateOption);
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
            添加车辆基本信息
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
          <form id="myform" method="post" action="../car/addcar.htm" novalidate="novalidate">
            <table class="titem">
              <tbody>
                <tr>
                  <td class="field">
                    车辆编号
                  </td>
                  <td class="value">
                    <span>
                      <input class="common" type="text" name="numcode" value="" onblur="checkid()">
                    </span>
                    <div id="tip" style="color: #FF0000"></div>
                  </td>
                  <td class="field">
                    状态
                  </td>
                  <td class="value">
                    <span>
                      <select name="carstatus">
                        <option value="可用">可用</option>
                        <option value="不可用">不可用</option>
                      </select>
                    </span>
                  </td>
                  <td class="field">
                    车牌号码
                  </td>
                  <td class="value">
                    <span>
                      <input class="common" type="text" name="carnum" value="" onblur="checknum()">
                    </span>
                     <div id="tips" style="color: #FF0000"></div>
                  </td>
                </tr>
                <tr>
                  <td class="field">
                    驾驶员
                  </td>
                  <td class="value" style="width: 20%;">
                    <span>
                      <select name="driverid">
                        <option value="0">
                          暂不选择
                        </option>
                        <c:if test="${!empty drivers}">
                          <c:forEach items="${drivers}" var="driver">
                            <option value="${driver.id}">
                              ${driver.name}
                            </option>
                          </c:forEach>
                        </c:if>
                      </select>
                    </span>
                  </td>
                  <td class="field">
                    车辆类型
                  </td>
                  <td class="value" style="width: 20%;">
                    <span>
                      <input class="common" type="text" name="cartype" value="">
                    </span>
                  </td>
                  <td class="field">
                    品牌
                  </td>
                  <td class="value" style="width: 20%;">
                    <span>
                      <input class="common" type="text" name="brand" value="">
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="field">
                    型号
                  </td>
                  <td class="value">
                    <span>
                      <input class="common" type="text" name="carmodel" value="">
                    </span>
                  </td>
                  <td class="field">
                    颜色
                  </td>
                  <td class="value">
                    <span>
                      <input class="common" type="text" name="carcolor" value="">
                    </span>
                  </td>
                  <td class="field">
                    识别码
                  </td>
                  <td class="value">
                    <span>
                      <input class="common" type="text" name="identify" value="">
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="field">
                    发动机号
                  </td>
                  <td class="value">
                    <span>
                      <input class="common hasDatepicker" type="text" name="enginenum" id="enginenum" value="">

                    </span>
                  </td>
                  <td class="field">
                    购买日期
                  </td>
                  <td class="value">
                    <span>
                      <input class="common" type="text" name="buydate" id="buydate" value="">

                    </span>
                  </td>
                  <td class="field">
                    登记日期
                  </td>
                  <td class="value">
                    <span>
                      <input class="common" id="regdate" type=" text" name="regdate" value="">
                    </span>
                  </td>
                </tr>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              </span>
            </td>

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
<!--
  <div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"></div>
-->
</body>
</html>
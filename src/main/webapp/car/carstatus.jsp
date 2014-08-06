<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style type="text/css">
    </style>
  </head>
  <body style="zoom: 1;"> ﻿
    <title>
      黑龙汽车道路救援服务中心道路紧急救援管理系统
    </title>
    <link rel="icon" href="http://liwei-pc:8010/HL.ico" type="image/x-icon">
    <link rel="shortcut icon" href="http://liwei-pc:8010/HL.ico" type="image/x-icon">

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

            <div id="maintabs" class="ui-tabs ui-widget ui-widget-content ui-corner-all">
              <ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all" role="tablist">
                <li 
                    class="ui-state-default ui-corner-top ui-tabs-active ui-state-active"
                    role="tab"
                    tabindex="0"
                    aria-controls="maintabs-1"
                    aria-labelledby="ui-id-1"
                    aria-selected="true">



                <a 
                    href="http://liwei-pc:8010/vehicle/state#maintabs-1"
                    class="ui-tabs-anchor"
                    role="presentation"
                    tabindex="-1"
                    id="ui-id-1">



                  车辆状态查询
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



              <div class="mainbox">
                <c:forEach items="${CarList}" var="car">
                  <div class="infocard">
                    <c:if test="${car.carstatus=='可用'}">
                      <div class="innercard weipaichu">
                      </c:if>
                      <c:if test="${car.carstatus=='不可用'}">
                        <div class="innercard yipaichu">
                        </c:if>
                        <ul>
                          <li>
                          <span class="bianhao">
                            [${car.numcode}号救援车]
                          </span>
                          <span class="cardtitle">
                            ${car.carnum}
                          </span>
                        </li>

                        <li>
                        驾驶员：${car.driver.name}
                      </li>
                      <li>
                      联系电话：${car.driver.phone}
                    </li>
                    <li>
                    状态：未派出&nbsp;| 车辆：${car.carstatus}&nbsp;| 驾驶员：${car.driver.status}
                  </li>
                </ul>
              </div>
            </div>
          </c:forEach>
          <div style="clear: both;">
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

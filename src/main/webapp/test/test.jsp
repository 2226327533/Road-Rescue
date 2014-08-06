<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	$(function() {

		/* 日历控件 */  
		var $dateOption = {
			changeMonth: true,
			changeYear: true,
			dateFormat: "yy-mm-dd",
			timeFormat: 'HH:mm:ss'
		}; 
		$( "#time" ).datetimepicker($dateOption);
		
		
		/* 计算剩余字符数   */
		$("textarea").each(function(){
			
			caculate(this);
			
		});
		$("textarea").keyup(function(){
			
			caculate(this);
		});
		function caculate(ele){
			var len = ele.value.length;
			var left = 255 - len;
			if(left>=0){
				$("#for_"+ele.name).html(left);
			}else{
				$("#for_"+ele.name).html(0);
				ele.value = ele.value.substring(0,255);
			}
			
		}
	});
</script>


<!-- 表单验证 -->
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
<script type="text/javascript">
		
	$(function() {
		
		/* 手机号码验证  */
		jQuery.validator.addMethod("isMobile", function(value, element) {       
			var length = value.length;   
			var mobile = /^[1]\d\d\d\d\d\d\d\d\d\d$/;   
			//console.log(value + "=>" + mobile.test(value));
			return this.optional(element) || (length == 11 && mobile.test(value)); 
		},"请正确填写手机号码");  
		
		
		/////////////////////////////////////////////////////////////////////
		/* 申请单设置验证规则 */  
		var $validateOption_apply = {
			rules: {
				name: "required",
				pass: "required",
				phone:{   
					required:true,
					isMobile:true  
				},
				feiyong:"number"
			}
		};
		
		/* 申请单开始验证*/
		$("#myform_aplly").validate($validateOption_apply);
		

	});
</script>



	
</head>
<body>
		<input type="text" id="time" value=""><br>
		 
		<textarea rows="10" cols="40" id="" name="t1"></textarea><br>
		还能输入<label id="for_t1" class="teatareanum">255</label>字
		
		
		<form action="#" id="myform_aplly">
		 用户名:<input type="text" name="name" id="name"><br>
		 密码:<input type="text" name="pass" id="pass"><br>
		 手机号:<input type="text" name="phone" id="phone"><br>
		 费用:<input type="text" name="feiyong" id="feiyong"></br>
		<input type="submit">
		</form>
</body>
</html>
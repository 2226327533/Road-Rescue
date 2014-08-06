<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--  <link href="../css/jquery-ui-timepicker-addon.css" type="text/css" />
<script src="../js/jquery.min.js" type="text/javascript"></script>
<link href="../css/jquery-ui.min.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
<script src="../js/jquery-ui-timepicker-addon.js" type="text/javascript"></script>
中文
<script src="../js/jquery.ui.datepicker-zh-CN.min.js" type="text/javascript"></script> -->


	<link rel="stylesheet" href="../css/jquery-ui.css">
 	<script src="../js/jquery-1.9.1.js"></script> 
	<script src="../js/jquery-ui.js"></script> 
<script type="text/javascript">
$(function() {

	
	var $dateOption = {
		changeMonth: true,
		changeYear: true,
		dateFormat: "yy-mm-dd",
		timeFormat: 'HH:mm:ss'
	}; 
	$( "#time" ).datetimepicker($dateOption);
});
</script>

<script>
  $(function() {
    var availableTags = [
      "ActionScript",
      "AppleScript",
      "Asp",
      "BASIC",
      "C",
      "C++",
      "Clojure",
      "COBOL",
      "ColdFusion",
      "Erlang",
      "Fortran",
      "Groovy",
      "Haskell",
      "Java",
      "JavaScript",
      "Lisp",
      "Perl",
      "PHP",
      "Python",
      "Ruby",
      "Scala",
      "Scheme"
    ];
    $( "#tags" ).autocomplete({
      source: availableTags
    });
  });
  </script>

<title>Insert title here</title>
</head>
<body>
<input type="text" id="time" value=""><br>
<div class="ui-widget">
  <label for="tags">Tags: </label>
  <input id="tags">
</div>
</body>
</html>
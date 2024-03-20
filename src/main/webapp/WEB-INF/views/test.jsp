<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script>
<<<<<<< HEAD
function startTime() {    
=======
function startTime() {
	    
>>>>>>> branch 'feature_myPage' of https://github.com/jsl-team-sunflower/FinalProject.git
	var today = new Date();    
	var h = today.getHours()-12;    
	var m = today.getMinutes();    
	var s = today.getSeconds();    
	m = checkTime(m);    
	s = checkTime(s);    
	document.getElementById('clock').innerHTML =    h + ":" + m + ":" + s;    
	document.getElementById('today').innerHTML =    today;
	var t = setTimeout(startTime, 500);
	}
	
	function checkTime(i) {    
		if (i < 10) {i = "0" + i}; // 숫자가 10보다 작을 경우 앞에 0을 붙여줌    
		return i;
	}
</script>
</head>
<body onload="startTime()">
	<div id="today"></div>
	<br>
	<div id="clock"></div>
</body>
</html>

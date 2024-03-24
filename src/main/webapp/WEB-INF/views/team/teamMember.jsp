<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Member</title>
<style>
	body{
    margin-top:40px;
}


.cta {
  display: block;
  padding: 30px;
  border: 3px dotted #eee;
  border-radius: 4px;
  margin: 0 3%;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.16), 0 2px 10px rgba(0, 0, 0, 0.12);
}

.cta .name {
  opacity: 0.2;
}


.cta img {
  padding: 4px;
  line-height: 1.42857143;
  background-color: #fff;
  border: 1px dashed #ddd;
  border-radius: 4px;
  -webkit-transition: all .2s ease-in-out;
  -o-transition: all .2s ease-in-out;
  transition: all .2s ease-in-out;
    -webkit-transform: rotate(-10deg);
     -moz-transform: rotate(-10deg);
       -o-transform: rotate(-10deg);
      -ms-transform: rotate(-10deg);
          transform: rotate(-10deg);
}

a:hover{
    text-decoration:none;    
}

h1{
	font-size:38px;
    margin: 50px 0 70px 740px;
}
</style>
</head>
<body>
<h1>Team HIMAWARI</h1>
	<div class="container-fluid bootstrap snippets bootdey">
    <div class="col-md-12">
	    <div class="row">
			<div class="col-md-3">
	    	    <a class="cta text-center" href="#">
	                <h2 class="name">Leader</h2>
	                <img alt="" class="img-responsive" src="/resources//images/맹구.png">
	                <h2 style="font-size:20px; font-weight:bold;">이영민</h2>
	                <p>Run forest run</p>
	            </a>   
			</div>
			<div class="col-md-3" >
	    	    <a class="cta text-center" href="#" >
	                <h2 class="name">Developer</h2>
	                <img alt="" class="img-responsive" src="/resources//images/부리부리대마왕.png" style="height:200px; margin-left:35px;" >
	                <h2 style="font-size:20px; font-weight:bold;">서보규</h2>
	                <p>oooooohhhhhh!</p>
	            </a>   
			</div>
			<div class="col-md-3">
	    	    <a class="cta text-center" href="#">
	                <h2 class="name">Developer</h2>
	                <img alt="" class="img-thumbnail img-responsive" src="/resources//images/유리인형.png">
	                <h2 style="font-size:20px; font-weight:bold;">안창환</h2>
	                <p>끄악</p>
	            </a>   
			</div>
			<div class="col-md-3">
	    	    <a class="cta text-center" href="#">
	                <h2 class="name">Developer</h2>
	                <img alt="" class="img-thumbnail img-responsive" src="/resources//images/유리.png">
	                <h2 style="font-size:20px; font-weight:bold;">전소현</h2>
	                <p>이거 아니 잖숨!</p>
	            </a>   
			</div>
		</div>
	</div>
</div>
</body>
</html>
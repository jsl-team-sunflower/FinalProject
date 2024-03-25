<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	body{margin-top:20px;}
.mail-seccess {
    text-align: center;
	background: #fff;
	border-top: 1px solid #eee;
}
.mail-seccess .success-inner {
	display: inline-block;
}
.mail-seccess .success-inner h1 {
	font-size: 100px;
	text-shadow: 3px 5px 2px #3333;
	color: #006DFE;
	font-weight: 700;
}
.mail-seccess .success-inner h1 span {
	display: block;
	font-size: 25px;
	color: #333;
	font-weight: 600;
	text-shadow: none;
	margin-top: 20px;
}
.mail-seccess .success-inner p {
	padding: 20px 15px;
}
.mail-seccess .success-inner .btn{
	color:#000;
}
</style>
<meta charset="UTF-8">
<title>메일 발송 완료</title>
</head>
<body>
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
<section class="mail-seccess section">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 offset-lg-3 col-12">
				<!-- Error Inner -->
				<div class="success-inner">
					<h1><i class="fa fa-envelope"></i><span>Your Mail Sent Successfully!</span></h1>
					<p>소중한 의견 감사합니다.</p>
					<a href="#" onclick="window.close();" class="btn btn-primary btn-lg" ><button style="color: #fff; background-color: #337ab7; border-color: #2e6da4; height: 30px;   width: 50px;">닫기</button></a>
				</div>
				<!--/ End Error Inner -->
			</div>
		</div>
	</div>
</section>
</body>
</html>
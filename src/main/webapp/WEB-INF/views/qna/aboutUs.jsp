<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
div {
	display:inline-block;
}

	body{
		margin-top:20px;
		
	}


/*======= Contact ======*/

.form-control {
  box-shadow: none !important;
  outline: none !important;
  border: 2px solid #cecece;
  height: 38px;
}
.form-control:hover ,.form-control:focus{
  border-color: #97a0af;
}


.error {
  margin: 8px 0px;
  display: none;
  color: red;
}
#ajaxsuccess {
  font-size: 16px;
  width: 100%;
  display: none;
  clear: both;
  margin: 8px 0px;
}
.con_sub_text {
  margin: 20px 0px;
  font-size: 15px;
}

.contact-detail-box {
  margin-bottom: 50px;
}

.contact-detail-box address {
  font-size: 14px;
}
.contact-map {
  background-color: #ededed;
}

.title-box .border,.btn-primary,.back-to-top,
.logo i,.question-q-box,.social-circle li a:hover {
  background-color: #f16000 !important;
}
.title-box .title-alt,.text-colored,.footer a:hover,
.navbar-custom .navbar-nav li a:hover,
.navbar-custom .navbar-nav li a:focus,
.navbar-custom .navbar-nav li a:active,
.navbar-custom .navbar-nav li.active a {
  color: #f16000;
}

.btn-primary {
  border: 1px solid #f16000 !important;
}
.btn-primary:hover,
.btn-primary:focus,
.btn-primary:active,
.btn-primary.active,
.btn-primary.focus,
.btn-primary:active,
.btn-primary:focus,
.btn-primary:hover,
.open > .dropdown-toggle.btn-primary,
.btn-primary.active.focus, .btn-primary.active:focus, 
.btn-primary.active:hover, .btn-primary:active.focus, 
.btn-primary:active:focus, .btn-primary:active:hover, 
.open>.dropdown-toggle.btn-primary.focus, 
.open>.dropdown-toggle.btn-primary:focus, 
.open>.dropdown-toggle.btn-primary:hover {
  background-color: #d85600 !important;
  border: 1px solid #d85600 !important;
}

.btn-shadow.btn-primary {
  box-shadow: 1px 5px 9px rgba(241, 96, 1, 0.32);
}



/*======= Responsive ======*/
@media (min-width: 768px) {
    .nav-custom-left {
		margin-left: 5%;
	}
  .navbar-nav>li>a {
    padding-top: 10px;
    padding-bottom: 10px;
  }
  .contact-page .col-sm-6 {
    padding-left: 30px;
    padding-right: 30px;
  }
}

@media (max-width: 768px) {
  .navbar-custom {
        -moz-box-shadow: 0 2px 2px rgba(0,0,0,.1);
    -webkit-box-shadow: 0 2px 2px rgba(0,0,0,.1);
    box-shadow: 0 2px 2px rgba(0,0,0,.1);
  }
  .screen-space {
    margin: 0px auto 50px auto;
  }
  .feature-detail {
    padding: 0px 0px 50px 30px !important;
  }
  .footer h5 {
    margin-top: 30px;
  }
}


@media only screen and (min-width: 768px) and (max-width: 991px){
  .blog-wrapper .blog-item {
    width: 50%;
  }
  .navbar-custom .navbar-nav li a {
    font-size: 12px;
  }
  .blog-detail-box {
  padding-right: 0px;
}
}
@media only screen and (min-width: 767px) and (max-width: 991px){
  
}
@media (max-width: 767px) {
  .blog-wrapper .blog-item {
    width: 100%;
  }
  .logo {
    margin-top: 7px;
  }
  .blog-detail-box {
  padding-right: 0px;
}
}
</style>
<meta charset="UTF-8">
<br>
<title>About Us</title>
</head>
<body>
<h1 style="font-size:50px; text-align:center;">About Us</h1><br>
	<div class="container-fluid" style="margin-top:30px;">
		<div class="container bootstrap snippets bootdeys">
			<div class="row text-center col-sm-12">
				<div class="col-sm-4">
					<div class="contact-detail-box">
						<i class="fa fa-phone fa-3x text-colored"></i>
						<h4>Touch</h4>
						<abbr title="Phone">P:</abbr> 0507-1494-4412<br> 
						E: 
						<a href="mailto:email@email.com" class="text-muted">email@email.com</a>
					</div>
				</div>

				<div class="col-sm-4">
					<div class="contact-detail-box">
						<i class="fa fa-map-marker fa-3x text-colored"></i>
						<h4>Location</h4>
						<address>
							대전광역시 중구 계룡로 825 
							희영빌딩 5층, 7층<br>
						</address>
					</div>
				</div>

				<div class="col-sm-4">
					<div class="contact-detail-box">
						<i class="fa fa-book fa-3x text-colored"></i>
						<h4>Support</h4>
						<a href="https://blog.naver.com/jslglobal"><p>blog.naver.com/jslglobal</p></a>
						<a href="https://www.instagram.com/jsl_hrd"><p>www.instagram.com/jsl_hrd</p></a>
					</div>
				</div>

			</div>
			<div class="row col-sm-12">
				<div class="contact-map">
					<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3195.878849612365!2d127.40492237906148!3d36.32356407946817!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x356549343c3c3cf1%3A0x9d6af658336f953a!2z7KCc7J207JeQ7Iqk7JeY7J247J6s6rCc67Cc7JuQKOyjvCk!5e0!3m2!1sko!2skr!4v1679645026330!5m2!1sko!2skr" width="100%" height="580" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
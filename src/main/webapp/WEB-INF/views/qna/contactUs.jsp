<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
<!DOCTYPE html>
<html>
<head>
<style>
	body{margin-top:20px;
background:#eee;
}
.contact-area {
    background-attachment: fixed;
    background-size: cover;
    background-position: center;
}

@media only screen and (max-width:768px) {
    .contact {
        margin-bottom: 30px;
    }
}

.contact input {
    background: #fff;
    border: 1px solid #fff;
    border-radius: 3px;
    -webkit-box-shadow: none;
    box-shadow: none;
    color: #232434;
    font-size: 16px;
    height: 60px;
    padding: 10px;
    width: 100%;
    font-family: 'poppins', sans-serif;
    padding-left: 30px;
    -webkit-transition: all 0.3s ease 0s;
    -o-transition: all 0.3s ease 0s;
    transition: all 0.3s ease 0s;
}

.contact textarea {
    background: #fff;
    border: 1px solid #fff;
    border-radius: 3px;
    -webkit-box-shadow: none;
    box-shadow: none;
    color: #232434;
    font-size: 16px;
    padding: 10px;
    width: 100%;
    height: 100px;
    font-family: 'poppins', sans-serif;
    padding-left: 30px;
    -webkit-transition: all 0.3s ease 0s;
    -o-transition: all 0.3s ease 0s;
    transition: all 0.3s ease 0s;
}

.contact input:focus {
    background: #fff;
    border: 1px solid #fff;
    color: #232434;
    -webkit-box-shadow: none;
    box-shadow: none;
    outline: 0 none;
}

.contact textarea:focus {
    background: #fff;
    border: 1px solid #fff;
    color: #232434;
    -webkit-box-shadow: none;
    box-shadow: none;
    outline: 0 none;
}

.form-control::placeholder {
    color: #232434;
    opacity: 1;
}

.btn-contact-bg {
    border-radius: 30px;
    color: #fff;
    outline: medium none !important;
    padding: 15px 27px;
    text-transform: capitalize;
    -webkit-transition: all 0.3s ease 0s;
    -o-transition: all 0.3s ease 0s;
    transition: all 0.3s ease 0s;
    background: #7564e5;
    font-family: 'poppins', sans-serif;
    cursor: pointer;
    width: 100%;
}

.btn-contact-bg:hover,
.btn-contact-bg:focus {
    background: #232434;
    color: #fff;
}

/*START ADDRESS*/

.single_address {
    overflow: hidden;
    margin-bottom: 10px;
    padding-left: 40px;
}

@media only screen and (max-width:768px) {
    .single_address {
        padding-left: 0px;
    }
}

.single_address i {
    background: #f6f6f6;
    color: #7564e5;
    border-radius: 30px;
    width: 60px;
    height: 60px;
    line-height: 60px;
    text-align: center;
    float: left;
    margin-right: 14px;
    font-size: 22px;
    -webkit-box-shadow: 0 5px 30px 0 rgba(0, 0, 0, 0.1);
    box-shadow: 0 5px 30px 0 rgba(0, 0, 0, 0.1);
    margin-bottom: 20px;
    -webkit-transition: all 0.3s ease 0s;
    -o-transition: all 0.3s ease 0s;
    transition: all 0.3s ease 0s;
}

.single_address:hover i {
    background: #7564e5;
    color: #fff;
}

.single_address h4 {
    font-size: 18px;
    margin-bottom: 0px;
    overflow: hidden;
    font-weight: 600;
    margin-top:0px;
}

.single_address p {
    overflow: hidden;
    margin-top: 5px;
}

.section-title h1 {
    font-size: 44px;
    font-weight: 500;
    margin-top: 0;
    position: relative;
    text-transform: capitalize;
    margin-bottom: 15px;
}
.section-title p {
    padding: 0 10px;
    width: 70%;
    margin: auto;
    letter-spacing: 1px;
}
.section-title {
    margin-bottom: 30px;
}
.text-center {
    text-align: center!important;
    padding-top: 8px;
}
</style>
<meta charset="UTF-8">
<title>Contact Us</title>
</head>
<body>

<div id="contact" class="contact-area section-padding">
	<div class="container">										
		<div class="section-title text-center">
			<h1>건희사항</h1>
		</div>					
		<div class="row">
			<div class="col-lg-7">	
				<div class="contact">
					<form class="form" name="enq" method="post" action="/qa/MailSentSuccessfully" onsubmit="return validation();">
	<%-- 
	<<<<<<< HEAD
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	=======
	>>>>>>> feature_HF_Edit 
	--%>
						<div class="row">
							<div class="form-group col-md-6">
								<input type="text" name="name" class="form-control" placeholder="Erum" required="required">
							</div>
							<div class="form-group col-md-6">
								<input type="email" name="email" class="form-control" placeholder="Email" required="required">
							</div>
							<div class="form-group col-md-12">
								<input type="text" name="subject" class="form-control" placeholder="Title" required="required">
							</div>
							<div class="form-group col-md-12">
								<textarea rows="6" name="message" class="form-control" placeholder="Message" required="required"></textarea>
							</div>
							<div class="col-md-12 text-center">
								<button type="submit" value="Send message" name="submit" id="submitButton" class="btn btn-contact-bg" title="Submit Your Message!">Send</button>
							</div>
						</div>
					</form>
				</div>
			</div><!--- END COL --> 
			<div class="col-lg-5">
				<div class="single_address">
					<i class="fa fa-map-marker"></i>
					<h4>Our Address</h4>
					<p>대전 중구 계룡로 825 희영빌딩</p>
				</div>
				<div class="single_address">
					<i class="fa fa-envelope"></i>
					<h4>Send your message</h4>
					<p>www.jslhrd.com</p>
				</div>
				<div class="single_address">
					<i class="fa fa-phone"></i>
					<h4>Call us on</h4>
					<p>0507-1494-4412</p>
				</div>
				<div class="single_address">
					<i class="fa fa-clock-o"></i>
					<h4>Work Time</h4>
					<p>Mon - Fri: 09:20 - 17:30</p>
				</div>					
			</div><!--- END COL --> 
		</div><!--- END ROW -->
	</div><!--- END CONTAINER -->	
</div>

</body>
</html>
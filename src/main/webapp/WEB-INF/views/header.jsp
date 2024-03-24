<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>


<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<link rel="stylesheet" href="/resources/css/hyeon.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="icon" href="/resources//images/favico.ico">
<link href="/resources/css/HWAN.css" rel='stylesheet'>
<link href="/resources/css/login.css" rel='stylesheet'>
<link href="/resources/css/signup.css" rel='stylesheet'>
<link href="/resources/css/hyeon.css" rel='stylesheet'>
<link rel="stylesheet" href="/resources/css/admin.css" />
<link href="/resources/css/font-awesome.min.css" rel="stylesheet" />
<link rel="stylesheet" href="/resources/css/mypage.css" />
<link rel="stylesheet" href="/resources/css/pay.css" />
<link href="/resources/css/common.css" rel="stylesheet" />
<link href="/resources/css/layout.css" rel="stylesheet" />
<link href="/resources/css/order.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/js/bootstrap.min.js"></script>
<title>HIMAWARI</title>

</head>

<body style="padding: 0;">
	<nav class="navbar navbar-default">
		<div class="container-fluid">


			<div class="navbar-header" style="margin-right: -40px;">
				<a class="navbar-brand" href="/"> <img alt=""
					src="/resources//images/HIMAWARI.png" id="navbar-brand">

				</a>
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false"></button>
				<a class="navbar-brand" href="#"></a>
			</div>

			<!-- 네비 -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="/auction/onauction" id="AuctionNav">진행경매</a></li>
					<li><a href="/auction/ScheduleAuction" id="AuctionNav">상시경매</a></li>
					<li><a href="/auction/ResultAuction" id="AuctionNav">경매결과</a></li>
					<li class="dropdown"><a href="#" id="AuctionNav"
						class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-haspopup="true" aria-expanded="false">공지사항 <span
							class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/qa/list">QnA</a></li>
						</ul></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><form class="navbar-form">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Search">
							</div>
							<button type="submit" class="glyphicon glyphicon-search"></button>
						</form></li>
					<li class="dropdown-right"><a href="#"
						class="glyphicon glyphicon-shopping-cart"></a>
					<li class="dropdown-right"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false"> <span class="glyphicon glyphicon-user"></span></a>
						<ul class="dropdown-menu">
							<sec:authorize access="isAnonymous()">
							<li class="first"><a href="/login">로그인</a></li>
							<li><a href="/signup">회원가입</a></li>
							</sec:authorize> 
							<sec:authorize access="isAuthenticated()">
							<sec:authentication property="principal" var="principal" />
							<li class="first">${principal.username}님</li>
							<li><a href="/user/logout">로그아웃</a></li>
							<li><a href="/my/mypage?id=${principal.username}">마이페이지</a></li>
							</sec:authorize>
						</ul>
					</li>	
				</ul>
			</div>
			<!-- //네비 -->
		</div>
		<!-- /.container-fluid -->
	</nav>
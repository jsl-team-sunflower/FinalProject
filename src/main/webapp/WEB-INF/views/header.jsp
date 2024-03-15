<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>HIMAWARI</title>

    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
 	<link rel="stylesheet" href="/resources/css/hyeon.css">
    <!--[if lt IE 9]>
      <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
        <script src="/resources/js/jquery-1.12.4.min.js"></script>
   		<script src="/resources/js/bootstrap.min.js"></script>
    <!-- jquery 기반으로 동작 -->
  </head>
  <body id="top">
  <header>
   <div class="container-fluid">
   	<div class="container">
			<nav class="navbar navbar-default">
				<div class="container-fluid">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
						</button>
						<a class="navbar-brand" href="#">
						<img src="/resources/images/HIMAWARI2.png"></a>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li><a href="#" id="navtag">진행 경매</a></li>
							<li><a href="#" id="navtag">예정 경매</a></li>
							<li><a href="#" id="navtag">경매 결과</a></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle" id="navtag"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">고객센터</a>
								<ul class="dropdown-menu">
									<li><a href="/notice/list" id="navtag">공지사항</a></li>
									<li><a href="#" id="navtag">QnA</a></li>
								</ul>
							</li>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li>
								<form class="navbar-form navbar-left">
									<div class="form-group">
										<input type="text" class="form-control" placeholder="Search">
									</div>
									<button type="submit" id="search-btn" class="btn btn-default"><i class="glyphicon glyphicon-search"></i></button>
								</form>
							</li>
							<li><a href="#" id="navnone"><i class="glyphicon glyphicon-shopping-cart"></i></a></li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" id="navnone"
									data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
									<i class="glyphicon glyphicon-user"></i>
								</a>
								<ul class="dropdown-menu">
									<li><a href="#">Login</a></li>
									<li><a href="#">Logout</a></li>
									<li><a href="#">Join in</a></li>
									<li><a href="#">My Page</a></li>
								</ul>
							</li>
						</ul>
					</div>
					<!-- /.navbar-collapse -->
				</div>
				<!-- /.container-fluid -->
			</nav>
		</div>
   </div>
   </header>
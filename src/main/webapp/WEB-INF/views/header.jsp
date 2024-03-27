<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%-- 
<%@ taglib uri="http://www.springframework.org/security/tags"	prefix="sec"%>
 --%>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<!--  
<link rel="stylesheet" href="/resources/css/hyeon.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css">
 -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css">

<link rel="icon" href="/resources//images/favicon.png">

<link href="/resources/css/HWAN.css" rel='stylesheet'>
<link href="/resources/css/login.css" rel='stylesheet'>
<link href="/resources/css/signup.css" rel='stylesheet'>
<link rel="stylesheet" href="/resources/css/admin.css" />
<link href="/resources/css/font-awesome.min.css" rel="stylesheet" />
<link rel="stylesheet" href="/resources/css/mypage.css" />
<link rel="stylesheet" href="/resources/css/pay.css" />
<link href="/resources/css/common.css" rel="stylesheet" />
<link href="/resources/css/layout.css" rel="stylesheet" />
<link href="/resources/css/order.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/js/bootstrap.min.js"></script>
<title>HIMAWARI</title>
<script>
    var exc = 1; // 기본값으로 1 설정
    var value = "원"; // 기본값으로 빈 문자열 설정

    $(document).ready(function() {
        $('.dropdown-item').click(function(e) {
            e.preventDefault(); // 기본 이벤트 방지
            value = $(this).data('unit'); // 선택된 항목의 data-value 값을 가져옴
            /* alert(value); */
            $.ajax({
                type: 'POST', // 요청 방식 (GET, POST 등)
                url: '/exchange', // 요청할 URL
                data: {unit: value}, // 전송할 데이터
                success: function(response) {
                    exc = response;
                    /* console.log(exc); */
                    alert(value+'는 현재' + exc + '입니다');
                    updateDivs();
                },
                error: function(request,status,error) {
                    console.error("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                }
            });
        });

        function updateDivs() {
            var chlist = ${chlist}; // JSP 표현식은 사용할 수 없음
            for (var i = 0; i < chlist.length; i++) {
                var element = chlist[i];
                var div = $('<div style="text-align:center;"></div>').attr('name', element).attr('id', element); // element 사용
                var result = element * exc;
                result = result.toFixed(2); // 소수점 두 자리까지 반올림
                div.html(result + ' ' + value.toUpperCase()); // 대문자로 변환하여 div의 내부 HTML 설정
                $('body').append(div);
            }
        }

        // 페이지 로드시에도 호출하여 초기화
        updateDivs();
    });
</script>


	 
</script>
<!-- google 번역  -->
<script>
function googleTranslateElementInit() {
	new google.translate.TranslateElement(
			{
				pageLanguage : 'ko',
				includedLanguages : 'ko,zh-CN,zh-TW,ja,vi,th,tl,km,my,mn,ru,en,fr,ar',
				layout : google.translate.TranslateElement.InlineLayout.SIMPLE,
				autoDisplay : false
			}, 'google_translate_element');
}
</script> 
<script src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script> 
<!-- //Google 번역 -->
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
					<li><a href="/auction/ShortAuction" id="AuctionNav">짧은경매</a></li>
					<li><a href="/auction/liveAuction" id="AuctionNav">라이브경매</a></li>
					<li><a href="/auction/ResultAuction" id="AuctionNav">경매결과</a></li>
					<li class="dropdown">
						<a href="#" id="AuctionNav"	class="dropdown-toggle" data-toggle="dropdown" role="button"aria-haspopup="true" aria-expanded="false">공지사항 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/qa/list">QnA</a></li>
							<li><a href="/qa/contact" onclick="window.open(this.href, '_blank', 'width=600, height=750 location=no'); return false;" class="dropdown-toggle" >Contact Us</a><li>
							<li><a href="/qa/aboutus">About Us</a></li>
						</ul></li>

				</ul>
				<ul class="nav navbar-nav navbar-right">
					<!-- Google 번역 -->
					<li class="dropdown-right">
						<div id="google_translate_element" class="hd_lang" style="margin-top:13px; "></div> 
					</li>
					<li class="dropdown-right">
						<a href="#" class="dropdown-toggle"	data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> 
							<span style="font-size: 25px;">&#8361</span>
						</a>
						<ul id="exchange" class="dropdown-menu" style="min-width: 65px; text-align:center;">
							<a href="#" class="dropdown-item" data-unit="usd">
								<li id="usd" class="glyphicon glyphicon-usd" style="color: #777; font-size: 15px; display: inline-block; padding-bottom: 10px;"> USD</li>
							</a>
							<br>
							<a href="#" class="dropdown-item" data-unit="yen">
								<li class="glyphicon glyphicon-yen"	style="color: #777; font-size: 15px; display: inline-block;"> YEN</li>
							</a>
							<hr>
							<li>
								<a href="/exchange"	onclick="window.open(this.href, '\_blank', 'width=530, height=750 location=no'); return false;">
								현재 환율
								</a>
							</li>
						</ul>
					</li>
					<li class="dropdown-right"><a href="#" class="glyphicon glyphicon-shopping-cart"></a></li>
					<li class="dropdown-right">
						<a href="#" class="dropdown-toggle"	data-toggle="dropdown" role="button" aria-haspopup="true"aria-expanded="false"> 
							<span class="glyphicon glyphicon-user"></span>
						</a>
						<ul class="dropdown-menu">
							<sec:authorize access="isAnonymous()">
							<li class="first"><a href="/login">로그인</a></li>
							<li><a href="/signup">회원가입</a></li>
							</sec:authorize> 
							<sec:authorize access="isAuthenticated()">
							<sec:authentication property="principal" var="principal" />
							<li class="first">${principal.username}님</li>
							<li><a href="/user/logout">로그아웃</a></li>
							<li><a href="/my/mypage">마이페이지</a></li>
							</sec:authorize>
							<sec:authorize access="isAuthenticated()">
								<sec:authentication property="principal" var="principal" />
								<li class="first"
									style="margin: 8px; padding-left: 8px; font-weight: bold;">${principal.username}님</li>
								<li><a href="/user/logout">로그아웃</a></li>
								<li><a href="/my/mypage?id=${principal.username}">마이페이지</a></li>
							</sec:authorize>
						</ul></li>
				</ul>
			</div>
			<!-- //네비 -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	
	<p>${check}</p>
	<br>
	<br>
	</div>
</body>	
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<!-- sub contents -->
	<div class="sub_title">
		<h2>접속자 로그인</h2>
		<div class="container">
		  <div class="location">
			<ul>
				<li class="btn_home">
					<a href="index.do"><i class="fa fa-home btn_plus"></i></a>
				</li>
				<li class="dropdown">
					<a href="">커뮤니티<i class="fa fa-plus btn_plus"></i></a>
					<div class="dropdown_menu">
						<a href="gratings.do">공지사항</a>
						<a href="allclass.do">학과및모집안내</a>
						<a href="portfolio.do">포트폴리오</a>
						<a href="online.do">온라인접수</a>
						<a href="notice.do">커뮤니티</a>
					</div>
				</li>
				<li class="dropdown">
					<a href="">공지사항<i class="fa fa-plus btn_plus"></i></a>
					<div class="dropdown_menu">
						<a href="notice.do">공지사항</a>
						<a href="qa.do">질문과답변</a>
						<a href="faq.do">FAQ</a>
					</div>
				</li>
			</ul>
		  </div>
		</div><!-- container end -->
	</div>

	<div class="container">
		<div class="member_boxL">
            <h2>개인회원</h2>
            <div class="login_form">
                <form id="loginForm" method="post">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                	<div class="fl_clear">
	                 	<label for="id">아이디</label>
	                   	<input name="username" id="username" type="text">
             		</div>
                    <div class="fl_clear">
                    	<label for="pw">비밀번호</label>
                    	<input name="password" id="password" type="password">
                    </div>
                    <button type="submit" class=" btn_Blue btn_login">로그인</button>
                </form>
            </div>
        </div>
	</div>
	<!-- end contents -->
	
	<script>
		function fn_login() {
			if(!login.username.value) {
				alert("아이디를 입력하세요");
				login.username.focus();
				return false;
			}
			if(!login.password.value){
                alert("패스워드를 입력하세요.");
                login.password.focus();
                return false;
            }
            //자바 스크립트로 form 태그 속성을 지정할 수 있다
            var form = document.login;
            form.method = "post";
            form.action = "/login";
            form.submit();
            
            var msg = "${msg}"; //자바 속성값을 자바 변수에 저장할 수 있다
		}
	</script>
	
	<script>
		$(function() {
			$(".location  .dropdown > a").on("click",function(e) {
				e.preventDefault();
				if($(this).next().is(":visible")) {
					$(".location  .dropdown > a").next().hide();
				} else {
					$(".location  .dropdown > a").next().hide();
					$(this).next().show();
				}
			});
		});
	</script>
	

<%@ include file="../footer.jsp" %>
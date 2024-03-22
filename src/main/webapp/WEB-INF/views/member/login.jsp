<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<div>
	<c:forEach var="list" items="${list}">
		<br> ${list.id} ${list.pw} ${list.mail }  
	</c:forEach>
</div>

<div class="login__main__container">
	<div class="login__main">
		<h1 class="login__main__title">로그인</h1>
		<div class="login__main__inputs">
<<<<<<< HEAD
			<form name=login id="login-form" method="post" onsubmit="fn_login()">
=======
		
		
			<form id="login" name="login" method="post">
>>>>>>> branch 'feature_login' of https://github.com/jsl-team-sunflower/FinalProject.git
				<!-- CSRF 토큰 추가 -->
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

				<!-- 아이디 입력 -->
				<div>
<<<<<<< HEAD
					<label for="username">아이디:</label> <input
						class="login__main__input" type="text" id="id" name="username"
=======
					<label for="username">아이디</label> <input
						class="login__main__input" type="text" id="username" name="username"
>>>>>>> branch 'feature_login' of https://github.com/jsl-team-sunflower/FinalProject.git
						placeholder="아이디 입력하기" />
				</div>

				<!-- 비밀번호 입력 -->
				<div>
<<<<<<< HEAD
					<label for="password">비밀번호:</label> <input
						class="login__main__input" type="password" id="pw" name="password"
=======
					<label for="password">비밀번호</label> <input
						class="login__main__input" type="password" id="password" name="password"
>>>>>>> branch 'feature_login' of https://github.com/jsl-team-sunflower/FinalProject.git
						placeholder="비밀번호 입력하기" />
				</div>

				<!-- 아이디 저장 체크박스 -->
				<div class="login__main__chk">
					<input id="chkbox" type="checkbox" /> <label for="chkbox">아이디
						저장</label>
				</div>

				<!-- 로그인 버튼 -->
				<div class="login__main__btn">
					<a class="btn_login btn_Blue" >
						 <button type="submit" class=" btn_Blue btn_login" onclick="return fn_login();" 
						 style="width: 100%; height: 5%;">로그인</button>
					</a>
				</div>
			</form>


		</div>
		<div class="login__main__menu">
			<span>아이디 찾기</span> <span>|</span> <span>비밀번호 찾기</span> <span>|</span>
			<span>회원가입</span>
		</div>
	</div>
</div>

<script>
		function fn_login() {
			if(!login.username.value) {
				alert("아이디 입력");
				login.username.focus();
				return false;
			}
			if(!login.password.value) {
				alert("패스워드 입력");
				login.password.focus();
				return false;
			}
			// 자바스크립트로 form 태그 속성을 지정할 수 있다
			var form = document.login;
			form.method="post";
			form.action="/login";
			form.submit();
			
			var msg = "${ssg}"; //자바 속성값을 자바 변수에 저장할 수 있다
			
			if(msg) {
				alert(msg);
			}
		}
	</script>


<%@ include file="../footer.jsp"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<div class="login__main__container">
	<div class="login__main">
		<h1 class="login__main__title">로그인</h1>
		<div class="login__main__inputs">
			<form id="login-form" method="post">
				<!-- CSRF 토큰 추가 -->
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />

				<!-- 아이디 입력 -->
				<div>
					<label for="username">아이디:</label> <input
						class="login__main__input" type="text" id="id" name="id"
						placeholder="아이디 입력하기" />
				</div>

				<!-- 비밀번호 입력 -->
				<div>
					<label for="password">비밀번호:</label> <input
						class="login__main__input" type="password" id="pw" name="pw"
						placeholder="비밀번호 입력하기" />
				</div>

				<!-- 아이디 저장 체크박스 -->
				<div class="login__main__chk">
					<input id="chkbox" type="checkbox" /> <label for="chkbox">아이디
						저장</label>
				</div>

				<!-- 로그인 버튼 -->
				<div class="login__main__btn">
					<button type="submit" style="width: 100%">로그인</button>
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
		var id = document.getElementById("id").value;
		var pw = document.getElementById("pw").value;
		if (!id) {
			alert("아이디를 입력하세요");
			return false;
		}
		if (!pw) {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		
		 var form = document.login;
         form.method = "post";
         form.action = "/login";
         form.submit();
	}
</script>

<%@ include file="../footer.jsp"%>

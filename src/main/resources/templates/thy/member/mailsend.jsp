<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>

<div class="sub_title">
	<h2>접속자 로그인</h2>
	<div class="container">
		<div class="location">
			<ul>
				<li class="btn_home"><a href="index.html"><i
						class="fa fa-home btn_plus"></i></a></li>
				<li class="dropdown"><a href="">커뮤니티<i
						class="fa fa-plus btn_plus"></i></a>
					<div class="dropdown_menu">
						<a href="gratings.html">공지사항</a> <a href="allclass.html">학과및모집안내</a>
						<a href="portfolio.html">포트폴리오</a> <a href="online.html">온라인접수</a>
						<a href="notice.html">커뮤니티</a>
					</div></li>
				<li class="dropdown"><a href="">공지사항<i
						class="fa fa-plus btn_plus"></i></a>
					<div class="dropdown_menu">
						<a href="notice.html">공지사항</a> <a href="qa.html">질문과답변</a> <a
							href="faq.html">FAQ</a>
					</div></li>
			</ul>
		</div>
	</div>
	<!-- container end -->
</div>

<div class="container" style="padding:50px 0; padding-left:100px;">
	<h2>인증메일 보내기</h2>
	<div>
		<p>
			<input type="email" name="email" id="email" style="padding-bottom:10px;"> 
			<input type="button" value="인증번호전송" id="btn-mail" style="margin:10px;">
		</p>
		<p>
			<input type="text" name="num" disabled="disabled" id="checkNum"
				style="background: #ccc; padding-bottom:10px;"> <input type="button" value="인증번호확인"
				id="btn-auth" style="margin	:10px;">
		</p>
		<p>
			<button type="button" id="btn-next">다음</button>
			<button type="button" onclick="location.href='/'">이전</button>
		</p>
	</div>
</div>
<!-- end contents -->

<script>

	var code ="";
	var incode = "";
	var checkcode = false;
	
	$(function() {
		$(".location  .dropdown > a").on("click", function(e) {
			e.preventDefault();
			if ($(this).next().is(":visible")) {
				$(".location  .dropdown > a").next().hide();
			} else {
				$(".location  .dropdown > a").next().hide();
				$(this).next().show();
			}
		})
		
		$("#btn-mail").on("click", function() {
			var regEmail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[a-zA-Z0-9\-]+/;
			if (!regEmail.test($("#email").val())) {
				alert("이메일 주소가 유효하지 않아요!");
				$("#email").focus();
				return false;
			}

			var email = $("#email").val();
			$.ajax({
				type : 'get',
				url : "/mail.do?mail=" + email,
				success : function(data) {
					alert("메일전송 완료");
					code = data;
					
					$("#checkNum").attr("disabled",false);
					$("#checkNum").css("background","#fff");
				}

			})
		})
		
		$("#btn-auth").on("click",function(){
			incode = $("#checkNum").val();
			
			if (code =="" || incode =="")	{
				alert("인증필요");
			}
			else if(code == incode){
				alert("인증되었습니다.");
				checkcode = true;
			}  else { 
				alert("인증필요");
				
			}
			
		})
		
		$("#btn-next").on("click", function () {
		    if (checkcode == true) {
		        var secureValue = btoa(checkcode); // checkcode를 Base64로 인코딩
		        location.href = "/signup?secureValue=" + encodeURIComponent(secureValue);
		    } else {
		        alert("인증이 필요합니다");
		        checkcode = false;
		    }
		});

		
		
		
		/* $("#btn-next").on("click",function(){
			if (checkcode == true){
			location.href = "/signup?incode=" +incode;
			} else {
				alert("인증이 필요합니다");
				checkcode = false;
			}
		}) */
		
	});
</script>

<%@ include file="../footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>


<div class="sub_title">
	<h2>회원등록</h2>
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

<div class="container">
	<div class="memberterms">
		<h2>약관</h2>
		<form name="my" method="post" action="member.do">
		<input type="hidden" name="check" value="${ran}">
		<input type="checkbox" class="agreeall" name="chkctrl" id="chkctrl" value="t">
		모든 약관에 동의 합니다
		<textarea> 제1조 정보등록
	1.---------------------------
	2.---------------------------
	</textarea>
		<input type="checkbox" name="agree" id="agree1" value="t"
			onclick="check()"> 이용약관 동의
		<textarea> 제2조 회원등록
	1.----------------------------
	2.----------------------------
	3.----------------------------
	</textarea>
		<input type="checkbox" name="agree" id="agree2" value="t"
			onclick="check()"> 개인정보 수집 및 동의
		<textarea>제3조 회원등록
	1.----------------------------
	2.----------------------------
	3.----------------------------
	</textarea>
		<input type="checkbox" name="agree" id="agree3" value="t"
			onclick="check()"> 위치정보이용약관에 동의
			<div class="btnbox">
		<input type="button" class="btn submit btn_ok" id="btn_ok" value="등록">
		<input type="button" class="btn reset" value="취소" onclick="javascript:history.go(-1)">
		</div>
		</form>
	</div>
</div>
<!-- end contents -->

<script>
$(function() {
    var chklist=$("input[name=agree]");
    // input 태그 네임이 agree인 모든 태그를 변수에 담는다
    $("#chkctrl").click(function(){
       //id이름이 chkctrl클 클릭했을때
       if($(this).is(":checked")){
          //자기자신이 체크상태이면
          chklist.prop("checked",true);
          //chlist에 담겨진 모든태그를 체크상태로 변경
       }else {
          chklist.prop("checked",false);
          //attr() 함수는 html에 작성된 속성값을 문자열로 받아오고
          //prop() 함수는 자바스크립트의 프로퍼티를 가져온다
       }
    })
 
 
 // 아래처럼하면 여러 이벤트함수를 처리할수 있다는 장점이 있음
    $("#agree1, #agree2, #agree3").on("click", function() {
       if($("#agree1").is(":checked") == true
              && $("#agree2").is(":checked") == true 
              && $("#agree3").is(":checked") == true) {
          $("#chkctrl").prop("checked", true);
       }else{
          $("#chkctrl").prop("checked", false);
       }
    })
  
    $("#btn_ok").on("click", function() {
    	   var chk = true;
       for(var i=0; i<chklist.length; i++) {
          if(!chklist[i].checked) {
             chk = false
          }
       }
       if(!chk) {
          alert("모든 약관에 동의해 주세요");
          return false;
       }else{
    	   my.submit();
          //location.href="member.do?check="+chk;
       }
    })
    
 }) //
	
	

</script>








<%@ include file="../footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>


<div class="sub_title">
		<h2>회원가입</h2>
		<div class="container">
		  <div class="location">
			<ul>
				<li class="btn_home">
					<a href="index.html"><i class="fa fa-home btn_plus"></i></a>
				</li>
				<li class="dropdown">
					<a href="">커뮤니티<i class="fa fa-plus btn_plus"></i></a>
					<div class="dropdown_menu">
						<a href="gratings.html">공지사항</a>
						<a href="allclass.html">학과및모집안내</a>
						<a href="portfolio.html">포트폴리오</a>
						<a href="online.html">온라인접수</a>
						<a href="notice.html">커뮤니티</a>
					</div>
				</li>
				<li class="dropdown">
					<a href="">공지사항<i class="fa fa-plus btn_plus"></i></a>
					<div class="dropdown_menu">
						<a href="notice.html">공지사항</a>
						<a href="qa.html">질문과답변</a>
						<a href="faq.html">FAQ</a>
					</div>
				</li>
			</ul>
		  </div>
		</div><!-- container end -->
	</div>

	<div class="container">
		<div class="con_title">
            <h1>개인정보(개인회원)</h1>
         <p>HOME / 마이페이지 / 내정보(개인회원)</p>
        </div>
		<div class="join_write col_989">
                <div class="list_con">
                    <ul class="icon_type1">
                        <li>회원정보는 개인정보 취급방침에 따라 안전하게 보호되며 회원님의 명백한 동의 없이 공개 또는 제3자에게 제공되지 않습니다.</li>
                    </ul>
                </div>
           <form name="member" method="post" action="signup?${_csrf.parameterName}=${_csrf.token}" id="member" enctype="multipart/form-data" > 
           	  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <table class="table_write02" summary="회원가입을 위한 이름, 아이디, 비밀번호, 비밀번호확인, 소속, 유선전화번호, 휴대전화번호, 이메일, 주소, 본인확인질문, 본인확인답, 주활용사이트, 알림여부 정보 입력">
                <caption>회원가입을 위한 정보입력표</caption>
                <colgroup>
                    <col width="160px">
                    <col width="auto">
                </colgroup>
                <tbody id="joinDataBody">
                    <tr>
                        <th><label for="id">아이디<span class="must"><b>필수입력</b></span></label></th>
                        <td>
                            <input type="text" name="username" id="id" class="w300">
                            <button type="button" id="idCheckBtn" class="btn- btn-default" onclick="checkLoginId();">중복확인</button>
                        </td>
                    </tr>
                    <tr>
                        <th><label for="pw">비밀번호<!-- <span class="must"><b>필수입력</b></span> --></label></th>
                        <td>
                            <input type="password" name="password" id="pw1" class="w300">
                            <br>
                            <p class="guideTxt"><span class="tc_point">영문(대문자 구분), 숫자, 특수문자의 조합</span>으로 9~13자로 작성해 주십시오.</p>
                        </td>
                    </tr>
                    <tr>
                        <th><label for="pw2">비밀번호확인<!-- <span class="must"><b>필수입력</b></span> --></label></th>
                        <td>
                            <input type="password" name="passwordCheck" id="pw2" class="w300">
                            <p id="pwmsg"></p>
                        </td>
                    </tr>
                    <tr>
                        <th><label for="email">이메일<span class="must"><b>필수입력</b></span></label></th>
                        <td>
                            <input type="email" name="email" id="email" class="w300" placeholder="이메일 주소 입력">
                        </td>
                    </tr>
            </table>
		        <div class="btnArea Acenter pt60 pb100">
		        	<a href="javascript:history.go(-1);" class="btn_round btn_large btn_BlueGray w180"><b>취소</b></a>
		        	<a href="javascript:void(0);" id="btn-ok" class="btn_round btn_large btn_pointColor w180"><b>회원등록</b></a>
		        	<!-- <input type="submit" value="회원등록" class="btn_round btn_large btn_pointColor w180">  -->
		    	</div>
           </form>
        </div>
	</div>
	<!-- end contents -->
	
	<script>
	var checkCount = false;
    function checkLoginId() {
      const form = document.getElementById("member"); //시험볼때 이거나옴
      form.username.readonly = false;
      const username = document.querySelector('#member input[name="username"]');
      const count = getJson('/member-count', {username:username.value});
      if(username.value === ''){
    	  alert("아이디를 입력하세요");
    	  username.focus();
    	  return false;
      }
      if(count > 0) {
         alert("이미 가입된 아이디가 있어요");
         checkCount = false;
         username.focus();
         return false;
      }
      
      if(confirm("사용 가능한 아이디 입니다. \n입력하신 아이디 사용하시겠습니까?")) { //confirm 확인과 취소 버튼 두개 나오는거
         username.readOnly = true;
         checkCount = true;
         document.getElementById("idCheckBtn").disabled = true;
      }
   } 
 
   
   function getJson(uri, params) {
      let json = {};
      $.ajax({
         url:uri,
         type:'get',
         data:params,
         dataType:'json',
         async:false,
         success:function(response){
            json = response;
            //alert("json");
         },error:function() {
            alert("통신에러");
         }
      })
      return json;
   }
   
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
       
       $("#btn-ok").on("click", function () {
    	   // 1. 비밀번호 일치 여부 확인
    	   if ($("#pw1").val() !== $("#pw2").val()) {
    	     alert("비밀번호가 일치하지 않습니다.");
    	     $("#pw1").focus();
    	     return false;
    	   }
    	   
    	   // 2. 빈칸 여부 확인
    	   if (
    	     $("#id").val() === "" ||
    	     $("#pw1").val() === "" ||
    	     $("#pw2").val() === "" ||
    	     $("#email").val() === ""
    	   ) {
    	     alert("아이디, 비밀번호, 이매일 모두 입력해야 합니다.");
    	     $("#id").focus();
    	     return false;
    	   }
			
    	   // 3. 회원가입 처리
    	   if(checkCount == true){
    		   $("#member").submit();
    	   } else{
    		   alert("중복체크가 필요합니다.");
    	   }
       });
       
   });
      
      
   </script>
	
<%@ include file="../footer.jsp"%>
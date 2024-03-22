<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="/javascript/popup_2.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%@ include file="../header.jsp" %>
   <div class="mypage__container">
      <div class="mypage__sidebar">
     <h2 style="font-weight: bold">
          ${principal.username }<span style="font-size: 16px; font-weight: normal">님</span>
        </h2>
        <h3><b>온라인경매관리</b></h3>
        
        <div><a href="mypage">등록한 상품내역</a></div>
        <div><a href="bidHistory">응찰내역</a></div>
        <div><a href="payHistory">결제/구매내역</a></div>
        <h3><b>회원정보관리</b></h3>
        <div><a href="infoUpdate">회원정보수정</a></div>
      </div>
      <div class="mypage__main">
        <h2 class="mypage__main__title">회원정보수정</h2>
        <div class="mypage__main__content">
        <form method="post" action="/user/update" name="member">
        <input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
          <div><label for="name">이름</label></div>
          <input type="hidden" name="id"
					value="${member.id}" />
          <div><input name="name" id="name" type="text" value="${member.name }"/></div>
          <div><label for="phone">휴대폰 번호</label></div>
          <div><input name="phone" id="phone" type="text" value="${member.phone}"/></div>
          <div><label for="email"> 이메일</label></div>
          
          <div class="mypage__main__email">
            <input id="mail" type="text" name="mail" value="${member.mail}" />
            <input type="button" class="btn-mail" id="btn-mail" value="인증번호 요청"/>
          </div>
          <div class="signup__main__email">
        <input id="checkNum" type="text" name="num" class="w300"
        disabled="disabled" style="background-color: #f7f7f7"/>
        <input type="button" class="btn-auth" id="btn-auth" value="인증번호 확인"/>
      </div>
	    	<div><label class="address">주소</label></div>
      <div class="group">
	    <input type="button" onclick="sample6_execDaumPostcode()" class="button" value="우편번호 찾기" 
	    style="margin-left: 69%; width: 139px;"><p></p>
   		<input type="text" id="user_addressNumber" class="input" name="address" class="w300" value="${member.address }" placeholder="우편번호"><p></p>
	   </div>
          <div class="accountUpdate__btnContainer">
            <button type="submit" id="btn-ok" class="accountUpdate__btn">수정하기</button>
          </div>
          </form>
        </div>
      </div>
    </div>
    <!-- mail 인증확인 script-->
    <script>
    
    

    
    var code ="";
	var incode = "";
	var checkcode = false;
	
	$(function() {
		$("#btn-mail").on("click", function() {
			var regEmail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[a-zA-Z0-9\-]+/;
			if (!regEmail.test($("#mail").val())) {
				alert("이메일 주소를 입력해 주세요.");
				$("#mail").focus();
				return false;
			}

			var mail = $("#mail").val();
			$.ajax({
				type : 'get',
				url : "/mail.do?mail=" + mail,
				success : function(data) {
					alert("메일전송 완료");
					code = data;
					
					$("#checkNum").attr("disabled",false);
					$("#checkNum").css("background","#fff");
					$("#mail").attr("readonly",true);
					$("#btn-mail").attr("disabled",true);
					$("#mail").css("background","#fff"); 
				}

			})
		})
		
		$("#btn-auth").on("click",function(){
			incode = $("#checkNum").val();
			
			if (code =="" || incode =="")	{
				alert("인증번호를 입력해 주세요.");
			}
			else if(code == incode){
				alert("인증되었습니다.");
				checkcode = true;
				$("#btn-auth").attr("disabled",true);
				$("#checkNum").attr("disabled",true);
			}  else { 
				alert("인증번호를 확인해 주세요.");
				return false;
			}
			
			
		})
		
		 $("#btn-ok").on("click", function () {
     	   // 1. 비밀번호 일치 여부 확인
     	   if ($("#pw").val() !== $("#pwCheck").val()) {
     	     alert("비밀번호가 일치하지 않습니다.");
     	     $("#pw").focus();
     	     return false;
     	   }
     	   
     	   // 2. 빈칸 여부 확인
     	   if (
     	     $("#id").val() === "" ||
     	     $("#pw").val() === "" ||
     	     $("#pwCheck").val() === "" ||
     	     $("#name").val() === "" ||
     	     $("#phone").val() === "" ||
     	     $("#mail").val() === "" ||
     	     $("#checkNum").val() === "" ||
     	     $("#user_addressNumber").val() === "" ||
     	     $("#user_address1").val() === "" ||
     	     $("#user_address2").val() === ""
     	   ) {
     	     alert("모두 입력해야 합니다.");
     	     $("#id").focus();
     	     return false;
     	   }
 			
     	   // 3. 회원가입 처리
     	  if(checkcode == false){
			   alert("인증번호를 확인하세요.");
			   return false;
		   } else{
			   $("#member").submit();
		   }
        });
		
		
		
	});
	</script>
    <!-- //mail 인증확인 script-->
    <!-- 주소 API -->
    <script>
 function sample6_execDaumPostcode() {
		new daum.Postcode({
			oncomplete: function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if(data.userSelectedType === 'R'){
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if(data.buildingName !== '' && data.apartment === 'Y'){
						extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if(extraAddr !== ''){
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.querySelector('#user_addressNumber').value = data.zonecode+' '+ addr+ extraAddr;
					document.querySelector('#user_address1').value = addr;
					document.querySelector('#user_address2').value = extraAddr;
				} else {
					document.querySelector('#user_addreuser_addressNumberss').value = '';
					document.querySelector('#user_address1').value = '';
					document.querySelector('#user_address2').value = '';
				}
			}
		}).open();
	}
	</script>
    
    <!-- //주소 API -->
    
<%@ include file="../footer.jsp" %>
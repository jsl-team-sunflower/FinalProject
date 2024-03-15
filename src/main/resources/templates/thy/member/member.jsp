<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ include file="../header.jsp" %>
    
    <c:set var="check" value="${check }"></c:set>
    <c:if test="${check == null }">
       <script>
          alert("잘못된 접근입니다");
          location.href="memberterms.do";
      </script>
    </c:if>
    
       <!-- sub contents -->
   <div class="sub_title">
      <h2>회원가입</h2>
      <div class="container">
        <div class="location">
         <ul>
            <li class="btn_home">
               <a href="index.do"><i class="fa fa-home btn_plus"></i></a>
            </li>
            <li class="dropdown">
               <a href="">커뮤니티<i class="fa fa-plus btn_plus"></i></a>
               <div class="dropdown_menu">
                  <a href="gratings.html">공지사항</a>
                  <a href="allclass.html">학과및모집안내</a>
                  <a href="portfolio.do">포트폴리오</a>
                  <a href="online.html">온라인접수</a>
                  <a href="notice.do">커뮤니티</a>
               </div>
            </li>
            <li class="dropdown">
               <a href="">공지사항<i class="fa fa-plus btn_plus"></i></a>
               <div class="dropdown_menu">
                  <a href="notice.do">공지사항</a>
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
            <h1>내정보(개인회원)</h1>
         <p>HOME / 마이페이지 / 내정보(개인회원)</p>
        </div>
      <div class="join_write col_989">
                <div class="list_con">
                    <ul class="icon_type1">
                        <li>회원정보는 개인정보 취급방침에 따라 안전하게 보호되며 회원님의 명백한 동의 없이 공개 또는 제3자에게 제공되지 않습니다.</li>
                    </ul>
                </div>
        <form name="member" method="post" action="memberwrite.do" id="member" onsubmit="return check();">
         <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <table class="table_write02" summary="회원가입을 위한 이름, 아이디, 비밀번호, 비밀번호확인, 소속, 유선전화번호, 휴대전화번호, 이메일, 주소, 본인확인질문, 본인확인답, 주활용사이트, 알림여부 정보 입력">
                <caption>회원가입을 위한 정보입력표</caption>
                <colgroup>
                    <col width="160px">
                    <col width="auto">
                </colgroup>
                <tbody id="joinDataBody">
                    <tr>
                        <th><label for="name">이름</label></th>
                        <td>
                            <input type="text" name="name" id="Name" class="w300">
                        </td>
                    </tr>
                    <tr>
                        <th><label for="id">아이디<span class="must"><b>필수입력</b></span></label></th>
                        <td>
                            <input type="text" name="id" id="id" class="w300">
                            <br>
                            <p id="idmsg"></p>
                        </td>
                    </tr>
                    <tr>
                        <th><label for="pw">비밀번호<!-- <span class="must"><b>필수입력</b></span> --></label></th>
                        <td>
                            <input type="password" name="pw" id="pw" class="w300">
                            <p class="guideTxt"><span class="tc_point">영문(대문자 구분), 숫자, 특수문자의 조합</span>으로 9~13자로 작성해 주십시오.</p>
                        </td>
                    </tr>
                    <tr>
                        <th><label for="pw2">비밀번호확인<!-- <span class="must"><b>필수입력</b></span> --></label></th>
                        <td>
                            <input type="password" name="pw2" id="pw2" class="w300">
                            <p id="pwmsg"></p>
                     <!--        <p class="guideTxt"><span class="tc_point">비밀번호 미입력시 기존비밀번호가 유지됩니다.</span></p>  -->
                        </td>
                    </tr>
               <tr>
                        <th><label for="tel">전화번호<span class="must"><b>필수입력</b></span></label></th>
                        <td>
                            <input type="text" name="tel" id="tel" class="w300">
                            <br>
                            <p id="telmsg"></p>
                        </td>
                    </tr>
                    <tr>
                        <th><label for="email">이메일<span class="must"><b>필수입력</b></span></label></th>
                        <td>
                            <input type="email" name="email" id="email" class="w300" placeholder="이메일주소 입력">
                            <input type="button" id="btn_email" class="btn_email" value="인증번호전송">
                            <p id="emailmsg"></p>
                            
                            <input type="password" name="certinumber" id="certinumber" class="w300" placeholder="인증번호">
                            <input type="button" id="email_ok" value="인증번호 확인">
                        </td>
                    </tr>
            </table>
              <div class="btnArea Acenter pt60 pb100">
                 <a href="javascript:history.go(-1);" class="btn_round btn_large btn_BlueGray w180"><b>취소</b></a>
                   <a href="javascript:fn_save();" class="btn_round btn_large btn_pointColor w180"><b>회원등록</b></a>
      <!--        <input type="submit" value="회원등록" class="btn_round btn_large btn_pointColor w180">  -->
             </div>
            </form>
        </div>
   </div>
   <!-- end contents -->
   
   <script>
      function fn_save(){
         
         if(!member.name.value){
            alert("이름이 비어있습니다.");
            member.name.focus();
            return false;
         }

         if(sendCheck == 0){
            alert("메일을 인증해야 합니다.");
            return;
         } else {
            member.submit();
            //member 폼 안에 모든 값들을 전송한다   
            //유효성 없이 action을 실행하니 주의할 것
         }
         
      }
   </script>
   
   
   <script>
   
      var sendCheck = "";
      var token = $("meta[name='_csrf']").attr("content");
 	  var header = $("meta[name='_csrf_header']").attr("content");
         
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
         
         $("#id").blur(function(){
            if(!$("#id").val()){
               $("#idmsg").html("<span style='color:#f00;'>아이디는 필수 입력사항입니다.</span>");
            } else {
               $("#idmsg").html("");
            }
            
            $.ajax({
                type:'post', //비동기식으로 데이터 전송방식(get, post 둘다 가능)
                url:'memberidcheck.do', //서버에게 보내는 url 주소
                data:{id:$("#id").val()}, //서버에게 보내는 데이터
                beforeSend: function(xhr) {
                   xhr.setRequestHeader(header, token);
                },//전송 전에 header token값 아까 저장한거를 추가하라는 뜻
                success:function(data){ //비동기식 데이터 처리가 성공했을때
                   //alert(data+"는 사용할 수 있는 아이디입니다.");
                   if(data != 1){
                      if($("#id").val() != null){
                         $("#idmsg").html("<span style='color:#008000;'>사용가능한 아이디입니다.</span>");
                      }
                   } else {
                      if($("#id").val() != ""){
                          $("#idmsg").html("<span style='color:#f00;'>사용불가한 아이디입니다. 다른 아이디를 입력하세요.</span>");
                          $("#id").val("");
                          $("#id").focus();
                       }
                    }
                 }, error:function(xhr, status, error){
                    alert("통신에러!");
                 }
              })
           })
         
         $("#pw2").blur(function(){
            var pw1 = $("#pw").val();
            var pw2 = $("#pw2").val();
            
            if((pw1 == "")||(pw2 == "")){
               if(pw1 == ""){
                      $("#pwmsg").html("<span style='color:#f00;'>비밀번호를 입력하세요</span>")
                      $("#pw").focus();
                  } else if(pw2 == ""){
                     $("#pwmsg").html("<span style='color:#f00;'>비밀번호를 입력하세요</span>")
                      $("#pw2").focus();
                  }
            } else {
               if(pw1 != pw2){
                  $("#pwmsg").html("<span style='color:#f00;'>비밀번호가 일치하지 않습니다.</span>");
               } else {
                  $("#pwmsg").html("<span style='color:#008000;'>비밀번호가 일치합니다.</span>");
               }
            }
            
         })
         
         $("#tel").blur(function(){
            if(!$("#tel").val()){
               $("#telmsg").html("<span style='color:#f00;'>전화번호를 입력하세요.</span>");
            } else {
               $("#telmsg").html("");
            }
         })
         
//         $("#email").blur(function(){
//            if(!$("#email").val()){
//               $("#emailmsg").html("<span style='color:#f00;'>이메일을 입력하세요.</span>");
//            } else {
//               $("#emailmsg").html("");
//            }
//         })
         
         $("#btn_email").on("click", function(){
            var email = $("#email").val();
            if(email == ""){
               alert("이메일 주소를 입력하세요.");
               $("#email").focus();
            } else {
               $.ajax({
                  type:'post',
                  url:'emailsend.do',
                  data:{"email":$("#email").val()},
                  dataType:'json', //서버에서 return해주는 값은 json형식{key:value}의 데이터 값으로 받겠다
                  //받아오는 타입이 dataType
                  success:function(data){
                     alert(data.msg);
                  }, error:function(){
                     alert("통신에러"); //메일 보내고선 아무것도 안 넘어와서 에러 떴던 것
                  }
               })
            }
         })
         
         
         //비동기식 인증확인
         $("#email_ok").on("click", function(){
            var certinumber = $("#certinumber").val();
            if(certinumber == ""){
               alert("인증번호를 입력하세요");
               $("#certinumber").focus();
            } else {
               $.ajax({
                  type:"post",
                  data:{"certinumber":certinumber},
                  url:"certinumber.do",
                  dataType:"json",
                  success:function(data){
                     if(data.check == "not ok"){
                        sendCheck = 0;
                        alert(data.msg);
                     } else {
                        sendCheck = 1;
                        alert(data.msg);
                     }
                  }, error:function(){
                     alert("통신에러 발생");
                  }
               })
            }
         })
         
         
      });
   </script>
    
    <%@ include file="../footer.jsp" %>
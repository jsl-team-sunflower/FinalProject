<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

 <div class="mypage__container">
      <div class="mypage__sidebar">
        <h2 style="font-weight: bold">
          ${principal.username}<span style="font-size: 16px; font-weight: normal">님</span>
        </h2> 
        <h3><b>온라인경매관리</b></h3>
        
        <div><a href="mypage">등록한 상품내역</a></div>
        <div><a href="bidHistory">응찰내역</a></div>
        <div><a href="payHistory">결제/구매내역</a></div>
        <h3><b>회원정보관리</b></h3>
        <div><a href="infoUpdate">회원정보수정</a></div>
      </div>
      <div class="mypage__main">
        <h2 class="mypage__main__title">등록한 상품내역</h2>
        <ul class="myform__main__list">
        
        <c:forEach var="list" items="${list}" varStatus="status">
          <li>
          	<input id="${list.productNum}" type="hidden" value="${list.startTime.plusDays(7)}">
            <img src="/resources/images/laughter.jpg" alt="" />
            <div>물건번호: ${list.productNum}</div>
            <div>물건이름 : ${list.productName}</div>
            <div>작성자 : ${list.productWriter }</div>
            <div></div>
            <div id="productNum:${list.productNum}의EndTime"></div>
          </li>
          </c:forEach>
          
        </ul>
      </div>
    </div>

<script>
function timeCalcul(){
    <c:forEach items="${list}" var="list" >
        var Time = document.getElementById("${list.productNum}").value;
		        
        // 두 개의 날짜 생성
        var date1 = new Date(); 
        var date2 = new Date(Time); 

        // 날짜 연산
        var diffInMilliseconds = date2.getTime() - date1.getTime();

        // 밀리초를 일, 시간, 분, 초로 변환
        var days = Math.floor(diffInMilliseconds / (1000 * 60 * 60 * 24));
        var hours = Math.floor((diffInMilliseconds % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((diffInMilliseconds % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((diffInMilliseconds % (1000 * 60)) / 1000);

        // 결과 출력
        var findId = "productNum:" + ${list.productNum} + "의EndTime";
        var clockDiv = document.getElementById(findId);
        clockDiv.innerHTML =  "남은시간 : " + days + "일 " + hours + "시간 " + minutes + "분 " + seconds + "초";
    </c:forEach>
}
setInterval(timeCalcul, 1000);
</script>
 
<%@ include file="../footer.jsp" %>
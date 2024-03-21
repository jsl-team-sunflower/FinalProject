<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

 <div class="mypage__container">
      <div class="mypage__sidebar">
        <h2 style="font-weight: bold">
          OOO<span style="font-size: 16px; font-weight: normal">님</span>
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
        <c:forEach items="${list }" var="item">
          <li>
            <img src="/resources/images/laughter.jpg" alt="" />
            <span>${item.productName }</span>
            <div>${item.productWriter }</div>
            <div>현재가 ${item.presentPrice }</div>
            <div><input id="qq" type="hidden" value="${item.endTime}"></div>
            <div id="clock"></div>
          </li>
          </c:forEach>
          <li>
            <img src="/resources/images/laughter.jpg" alt="" />
            <span>1번 상품</span>
            <div>최영욱</div>
            <div>가격 100,000,000원</div>
            <div>3일 20:23:37</div>
          </li>
          <li>
            <img src="/resources/images/laughter.jpg" alt="" />
            <span>1번 상품</span>
            <div>최영욱</div>
            <div>가격 100,000,000원</div>
            <div>3일 20:23:37</div>
          </li>
          <li>
            <img src="/resources/images/laughter.jpg" alt="" />
            <span>1번 상품</span>
            <div>최영욱</div>
            <div>가격 100,000,000원</div>
            <div>3일 20:23:37</div>
          </li>
        </ul>
        <ul class="myform__main__list">
          <li>
            <img src="/resources/images/laughter.jpg" alt="" />
            <span>1번 상품</span>
            <div>최영욱</div>
            <div>가격 100,000,000원</div>
            <div>3일 20:23:37</div>
          </li>
          <li>
            <img src="/resources/images/laughter.jpg" alt="" />
            <span>1번 상품</span>
            <div>최영욱</div>
            <div>가격 100,000,000원</div>
            <div>3일 20:23:37</div>
          </li>
          <li>
            <img src="/resources/images/laughter.jpg" alt="" />
            <span>1번 상품</span>
            <div>최영욱</div>
            <div>가격 100,000,000원</div>
            <div>3일 20:23:37</div>
          </li>
          <li>
            <img src="/resources/images/laughter.jpg" alt="" />
            <span>1번 상품</span>
            <div>최영욱</div>
            <div>가격 100,000,000원</div>
            <div>3일 20:23:37</div>
          </li>
        </ul>
      </div>
    </div>
<script>

var endTime = document.querySelector(${item.productNum}).value


function timeCalcul(){
        // 두 개의 날짜 생성
        var date1 = new Date(); 
        var date2 = new Date(endTime); 

        // 날짜 연산
        var diffInMilliseconds = date2.getTime() - date1.getTime();

        // 밀리초를 일, 시간, 분, 초로 변환
        var days = Math.floor(diffInMilliseconds / (1000 * 60 * 60 * 24));
        var hours = Math.floor((diffInMilliseconds % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((diffInMilliseconds % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((diffInMilliseconds % (1000 * 60)) / 1000);

        // 결과 출력
        var clockDiv = document.getElementById();
        clockDiv.innerHTML =  days + "일 " + hours + "시간 " + minutes + "분 " + seconds + "초";
}
setInterval(timeCalcul, 1000);
    </script>

<%@ include file="../footer.jsp" %>
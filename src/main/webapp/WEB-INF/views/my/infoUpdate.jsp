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
        <h2 class="mypage__main__title">회원정보수정</h2>
        <div class="mypage__main__content">
          <div><label for="pw">비밀번호</label></div>
          <div><input id="pw" type="text" /></div>
          <div><label for="pwCheck">비밀번호 확인</label></div>
          <div><input id="pwCheck" type="text" /></div>
          <div><label for="name">이름</label></div>
          <div><input id="name" type="text" /></div>
          <div><label for="phone">휴대폰 번호</label></div>
          <div><input id="phone" type="text" /></div>
          <div><label for="email"> 이메일</label></div>
          <div class="mypage__main__email">
            <input id="email" type="text" /><button>인증번호 요청</button>
          </div>
          <div>주소</div>
          <div class="mypage__main__address">
            <input type="text" /><button>주소 검색</button>
          </div>
          <div class="accountUpdate__btnContainer">
            <button class="accountUpdate__btn">수정하기</button>
          </div>
        </div>
      </div>
    </div>
<%@ include file="../footer.jsp" %>
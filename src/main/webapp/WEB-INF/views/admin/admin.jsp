<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
 <div class="mypage__container">
      <div class="mypage__main">
        <h2 class="mypage__main__title">회원관리</h2>
        <div class="table__container">
          <table class="table">
            <thead>
              <tr>
                <th scope="col">번호</th>
                <th scope="col">아이디</th>
                <th scope="col">이름</th>
                <th scope="col">휴대폰 번호</th>
                <th scope="col">이메일</th>
                <th scope="col">주소</th>
              </tr>
            </thead>
            <tbody>
            <c:forEach items="${alist }" var="alist">
            	<tr>
                <th scope="row">${alist.userNum }</th>
                <td>${alist.id }</td>
                <td>${alist.name }</td>
                <td>${alist.phone }</td>
                <td>${alist.mail }</td>
                <td>${alist.address }</td>
              </tr>
            
            </c:forEach>
              
            </tbody>
          </table>
        </div>
        <script
          src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"
        ></script>
      </div>
    </div>
<%@ include file="../footer.jsp"%>
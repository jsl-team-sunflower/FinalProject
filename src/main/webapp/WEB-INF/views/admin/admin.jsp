<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
 <div class="mypage__container">
      <div class="adminPage__sidebar">
        <div><a href="admin">회원관리</a></div>
        <div><a href="product">상품관리</a></div>
      </div>
      <div class="mypage__main">
        <h2 class="mypage__main__title">회원관리</h2>
        <div class="table__container">
          <table class="table">
            <thead>
              <tr>
                <th scope="col">번호</th>
                <th scope="col">이름</th>
                <th scope="col">휴대폰 번호</th>
                <th scope="col">이메일</th>
                <th scope="col">주소</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <th scope="row">1</th>
                <td>Mark</td>
                <td>010-1111-2222</td>
                <td>@mdo</td>
                <td>서울</td>
              </tr>
              <tr>
                <th scope="row">2</th>
                <td>Jacob</td>
                <td>010-1111-2222</td>
                <td>@fat</td>
                <td>대전</td>
              </tr>
              <tr>
                <th scope="row">3</th>
                <td>Larry the Bird</td>
                <td>010-1111-2222</td>
                <td>@twitter</td>
                <td>대구</td>
              </tr>
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
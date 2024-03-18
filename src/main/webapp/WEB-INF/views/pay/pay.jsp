<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<div class="pay__main__container">
      <h3 class="pay__main__title">상품확인</h3>
      <table class="pay__main__table">
        <thead>
          <tr>
            <th scope="col">상품명</th>
            <th scope="col">낙찰가</th>
            <th scope="col">수량</th>
            <th scope="col">합계</th>
            <th scope="col">배송일</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th scope="row">
              <img style="width: 200px" src="/resources/images/laughter.jpg" /><span
                style="margin-left: 20px"
                >[도서] 시장학개론</span
              >
            </th>
            <td>Mark</td>
            <td>010-1111-2222</td>
            <td>@mdo</td>
            <td>서울</td>
          </tr>
        </tbody>
      </table>
      <h3 class="pay__main__title">배송주소</h3>

      <div class="pay__table__box">
        <table class="table">
          <h4 class="pay__main__table__title">주문고객</h4>
          <tr>
            <th>이름</th>
            <td>
              <input type="text" class="pay__table__name" />
            </td>
          </tr>
          <tr>
            <th>휴대폰</th>
            <td>
              <input type="text" style="width: 50px" />-<input
                type="text"
                style="width: 50px"
              />-<input type="text" style="width: 50px" />
            </td>
          </tr>
          <tr>
            <th>이메일</th>
            <td>
              <input type="text" />
            </td>
          </tr>
        </table>
        <div class="pay__table__divider"></div>
        <table class="table">
          <h4 class="pay__main__table__title">배송정보</h4>

          <tr>
            <th>배송지</th>
            <td>
              <span><input type="checkbox" /> </span>주문자 정보와 동일
            </td>
          </tr>
          <tr>
            <th>이름</th>
            <td><input class="pay__table__name" type="text" /></td>
          </tr>
          <tr>
            <th>배송주소</th>
            <td>
              <input class="pay__table__address" type="text" /><button
                type="button"
                class="pay__table__address--btn"
              >
                주소찾기
              </button>
            </td>
          </tr>
          <tr>
            <th>휴대폰</th>
            <td>
              <input type="text" style="width: 50px" />-<input
                type="text"
                style="width: 50px"
              />-<input type="text" style="width: 50px" />
            </td>
          </tr>
        </table>
      </div>
    </div>
    <div class="pay__bottom">
      <button class="pay__bottom__btn">결제하기</button>
    </div>
<%@ include file="../footer.jsp"%>

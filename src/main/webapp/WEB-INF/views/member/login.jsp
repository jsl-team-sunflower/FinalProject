<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<div class="login__main__container">
      <div class="login__main">
        <h1 class="login__main__title">로그인</h1>
        <div class="login__main__inputs">
          <div>
            <input
              class="login__main__input"
              type="text"
              placeholder="아이디 입력하기"
            />
          </div>
          <div>
            <input
              class="login__main__input"
              type="text"
              placeholder="비밀번호 입력하기"
            />
          </div>
        </div>
        <div class="login__main__chk">
          <input id="chkbox" type="checkbox" /> <label for="chkbox">아이디 저장</label>
        </div>
        <div class="login__main__btn">로그인</div>
        <div class="login__main__menu">
          <span>아이디 찾기</span>
          <span>|</span>
          <span>비밀번호 찾기</span>
          <span>|</span>
          <span>회원가입</span>
        </div>
      </div>
    </div>
<%@ include file="../footer.jsp"%>
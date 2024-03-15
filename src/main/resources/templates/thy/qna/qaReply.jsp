<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp"%>

<div class="sr-only">
		<p><a href="#contents">본문 바로가기</a></p>
	</div>

	<div class="top_navigation">
	
		<header class="header">
			<nav class="top_left">
			  <ul>
			  	<li class="first"><a href="../index.html">HOME</a></li>
				<li><a href="">모집안내</a></li>
				<li><a href="">입학상담</a></li>
				<li><a href="">교육신청</a></li>
			  </ul>
			</nav>
			<nav class="top_right">
				<ul>
					<li class="first"><a href="">네이버블로그</a></li>
					<li><a href="">페이스북</a></li>
					<li><a href="">인스타그램</a></li>
					<li><a href="">동영상강좌</a></li>
				</ul>
			</nav>
			
			<div class="gnb_group">
				<h1 class="logo">JSL CO</h1>
				<nav class="gnb">
					<ul class="nav_1depth">
						<li><a href="../about/gratings.html">기업소개</a>
							<ul class="nav_2depth">
								<li><a href="../about/gratings.html">인사말</a></li>
								<li><a href="../about/history.html">연혁 및 </a></li>
								<li><a href="../about/gratings.html">교직원소개</a></li>
								<li><a href="../about/photo.html">대우갤러리</a></li>
								<li><a href="../about/map.html">찾아오시는길</a></li>
							</ul>
						</li>
						<!--<li><a href="allclass.html">학과및모집안내</a>
							<ul class="nav_2depth">
								<li><a href="allclass.html">전체모집과정</a></li>
								<li><a href="allclass.html">스마트웹콘텐츠개발과정</a></li>
							</ul>
						</li> -->
						<li><a href="portfolio.html">포트폴리오</a>
							<ul class="nav_2depth">
								<li><a href="portfolio.html">포트폴리오</a></li>
							</ul>
						</li>
						<!-- <li><a href="online.html">온라인접수</a>
							<ul class="nav_2depth">
								<li><a href="online.html">온라인접수</a></li>
								<li><a href="online.html">취업성공패키지</a></li>
							</ul>
						</li> -->
						<li><a href="notice.html">커뮤니티</a>
							<ul class="nav_2depth">
								<li><a href="../notice/notice.html">공지사항</a></li>
								<li><a href="qa.html">질문과답변</a></li>
								<li><a href="../faq/faq.html">FAQ</a></li>
								<li><a href="../pds/pds.html">자료실</a></li>
								<li><a href="../adm/admin.html">관리자</a></li>
							</ul>
						</li>
					</ul>
				</nav>
			</div>
		</header>

		<div class="line">
		</div>

	</div>

	<script>
		//$(document).ready(function() {
		$(function() {
			$(".gnb>.nav_1depth>li").hover(function() {
				$(".gnb>.nav_1depth>li").removeClass();
				$(this).addClass("active");

				//$(this).children(".nav_2depth").show();
				//}, function() {
				//  $(".gnb>.nav_1depth>li").removeClass();
				//  $(this).children(".nav_2depth").hide();
				//	});

				$(this).children(".nav_2depth").stop().slideDown("fast");
				}, function() {
				  $(".gnb>.nav_1depth>li").removeClass();
				  $(this).children(".nav_2depth").stop().slideUp("fast");
					});

				/* $(this).children(".nav_2depth").fadeIn();
				}, function() {
				  $(".gnb>.nav_1depth>li").removeClass();
				  $(this).children(".nav_2depth").fadeOut();
					}); */

			});
	</script>

	
	<!-- sub contents -->
	<div class="sub_title">
		<h2>질문답변</h2>
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
					<a href="">질문답변<i class="fa fa-plus btn_plus"></i></a>
					<div class="dropdown_menu">
						<a href="gratings.html">공지사항</a>
						<a href="gratings.html">질문과답변</a>
						<a href="gratings.html">취업실적</a>
					</div>
				</li>
			</ul>
		  </div>
		</div><!-- container end -->
	</div>

	<div class="container">
	  <div class="write_wrap">
	  <h2 class="sr-only">질문과 답변 글쓰기</h2>
	  <form name="notice" method="post" action="qa_reply.html">
	  <!-- action을 처리하기전에 check()사용자 함수를 실행하고 되돌아 와라-->
			<table class="bord_table">
				<caption class="sr-only">공지사항 입력 표</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
				</colgroup>
				<tbody>
					<tr class="first">
						<th>글쓴이</th>
						<td>홍길동</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>입학절차가 궁금합니다</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>입학하기를 희망하기에 입학절차와 필요한 서류가 무엇인지 자세히 알려주세요</td>
					</tr>
					<tr>
						<th>첨부</th>
						<td><img src="" alt=""></td>
					</tr>
					<tr>
						<th>답변</th>
						<td><textarea name="reply"></textarea></td>
					</tr>
				</tbody>
			</table>
			<div class="btn_wrap">
				<input type="submit" value="저장" class="btn_ok">&nbsp;&nbsp;<input type="reset" value="다시쓰기" class="btn_reset">&nbsp;&nbsp;<input type="button" value="목록" class="btn_list" onClick="location.href='qa.html';">
			</div>
		</form>
	  </div>
	  
	</div>
	
<%@ include file="../footer.jsp"%>
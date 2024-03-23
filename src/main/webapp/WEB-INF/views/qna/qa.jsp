<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="../header.jsp"%>

<!-- sub contents -->
<div class="sub_title">
	<h2>질문과답변</h2>
	<div class="container">
		<div class="location">
			<ul>
				<li class="btn_home"><a href="index.html"><i
						class="fa fa-home btn_plus"></i></a></li>
				<!-- 
				<li class="dropdown">
					<a href="#">커뮤니티<i class="fa fa-plus btn_plus"></i></a>
					<div class="dropdown_menu">
						<a href="gratings.html">공지사항</a>
						<a href="allclass.html">학과및모집안내</a>
						<a href="portfolio.html">포트폴리오</a>
						<a href="online.html">온라인접수</a>
						<a href="notice.html">커뮤니티</a>
					</div>
				</li>
				 -->
				<li class="dropdown"><a href="#">공지사항<i
						class="fa fa-plus btn_plus"></i></a>
					<div class="dropdown_menu">
						<a href="/qa/list">QnA</a>
					</div></li>
			</ul>
		</div>
	</div>
	<!-- container end -->
</div>

<div class="container">
	<div class="search_wrap">
	
	<!-- Google 번역 -->
<div id="google_translate_element" class="hd_lang"></div>
<script>
	function googleTranslateElementInit() {
		new google.translate.TranslateElement({
			pageLanguage: 'ko',
			includedLanguages: 'ko,zh-CN,zh-TW,ja,vi,th,tl,km,my,mn,ru,en,fr,ar',
			layout: google.translate.TranslateElement.InlineLayout.SIMPLE,
			autoDisplay: false
		}, 'google_translate_element');
	}
</script>
<script src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
<!-- //Google 번역 -->
	
		<div class="record_group">
			<c:set var="listSize" value="${fn:length(list)}" />
			<p>
				총 게시글<span>${listSize}</span>건
			</p>
		</div>
		<div class="search_group">
			<form name="myform" action="/qa/list">
				<select name="type" class="select">
					<option value="T" ${pageMaker.cri.type == 'T'?'selected':''}>제목</option>
					<option value="C"  ${pageMaker.cri.type == 'C'?'selected':''}>내용</option>
					<option value="W" ${pageMaker.cri.type == 'W'?'selected':''}>글쓴이</option>
					<option value="TC" ${pageMaker.cri.type == 'TC'?'selected':''}>제목/내용</option>
				</select>
				<input type="text" name="keyword" class="search_word" value="${pageMaker.cri.keyword }">
				<button class="btn_search"><i class="fa fa-search"></i><span class="sr-only">검색버튼</span></button>
				<input type="hidden" name="pageNum" value="1">
				<input type="hidden" name="amount" value="10">
			</form>
		</div>
		
	</div>
	<!-- search end -->
	<div class="bord_list">
		<table class="bord_table"
			summary="이표는 번호,제목,답변상태, 작성자, 작성일, 조회수로 구성되어 있습니다">
			<caption class="sr-only">질문과 답변 리스트</caption>
			<colgroup>
				<col width="10%">
				<col width="*">
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>답변상태</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${list}">
					<tr>
						<td>${list.qnaNum }</td>
							<td class="title">
								<a href="/qa/view?qnaNum=${list.qnaNum }">${list.qnaTitle }</a>
							</td>
							<td>
							<c:choose>
								<c:when test="${list.qnaState == 0 }">
									<span class="waiting">답변대기</span>
								</c:when>
								<c:otherwise>
									<span class="complet">답변완료</span>
								</c:otherwise>
							</c:choose>
							</td>
						<td>${list.qnaWriter }</td>
						<td><fmt:formatDate value="${list.qnaRegdate }"	pattern="yyyy-MM-dd" /></td>
						<td>${list.qnaViewcount }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="paging">

			<c:choose>
				<c:when test="${not empty pageMaker.prev}">
					<a href="${pageMaker.startPage -1}"> <i
						class="fa  fa-angle-double-left"></i>
					</a>
				</c:when>
			</c:choose>

			<c:forEach var="num" begin="${pageMaker.startPage}"	end="${pageMaker.endPage}">
				<a	href="/qa/list?pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}"	class="${pageMaker.cri.pageNum == num ?'active':''}">${num}</a>
			</c:forEach>


			<c:choose>
				<c:when test="${not empty pageMaker.next}">
					<a href="${pageMaker.endPage + 1}"> <i
						class="fa  fa-angle-double-right"></i>
					</a>
				</c:when>
			</c:choose>

			<a href="/qa/write" class="btn_write">글쓰기</a>
		</div>
	</div>
</div>
<!-- end contents -->

<script>
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
		});
	</script>

<%@ include file="../footer.jsp"%>
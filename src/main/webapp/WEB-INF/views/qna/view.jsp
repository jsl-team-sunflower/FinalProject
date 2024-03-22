<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="../header.jsp"%>

		<!-- sub contents -->
	<div class="sub_title">
		<h2>질문답변</h2>
		<div class="container">
		  <div class="location">
			<ul>
				<li class="btn_home">
					<a href="index.html"><i class="fa fa-home btn_plus"></i></a>
				</li>
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
				<li class="dropdown">
					<a href="#">공지사항<i class="fa fa-plus btn_plus"></i></a>
					<div class="dropdown_menu">
						<a href="/qa/list">QnA</a>
					</div>
				</li>
			</ul>
		  </div>
		</div><!-- container end -->
	</div>

	<div class="container">
		<div class="board_view">
			<span>번호 : ${vo.qnaNum }</span>
			<h2>질문제목 : ${vo.qnaTitle }</h2>
			<p class="info"><span class="user">질문자 : ${vo.qnaWriter }</span> | 등록일자 : <fmt:formatDate value="${vo.qnaRegdate}" pattern="yyyy-MM-dd"/> | <i class="fa fa-eye"></i>조회수 : ${vo.qnaViewcount}</p>
			<div class="board_body">
				<span style="text-align:left; font-size:18px; font-weight:bold;">질문내용</span> : ${vo.qnaContent }
				<br><br><br><br><br>
				<div>
					<p style="padding:20px 0; font-weight:bold; font-size:18px;">답변글 >>>>>></p>
					<textarea rows="10" cols="10" style="width:100%; border: 1px solid #ccc;" name="comContent" id="comContent"></textarea>
				</div>
			</div>
			<div class="prev_next">
				<c:choose>
					<c:when test="${not empty prevRecord}">
					<div class="prev_next_ex" >
						<a href="/qa/view?qnaNum=${prevRecord.qnaNum}" class="btn_prev">
							<div class="col-lg-4" >
							<i class="fa fa-angle-left"></i>
							</div>
							<div class="col-lg-8"> 
							<span class="prev_wrap"> 
								<strong>이전글</strong>
								<span>${prevRecord.qnaNum}</span>
								<span>${prevRecord.qnaTitle}</span>
							</span>
							</div>
						</a>
					</div>	
					</c:when>
				</c:choose>	
						<div class="btn_3wrap">
							<a href="/qa/list">목록</a> 
							<a href="qa_modify.html">수정</a> 
							<a href="#myModal" class="" data-toggle="modal" id="delete" value="/qa/delete?qnaNum=${vo.qnaNum}">삭제</a>	
							<a href="/qa/answer" id="reply" name="reply">댓글등록</a>
						</div>
				<c:choose>		
					<c:when test="${not empty nextRecord}">
					<div class="prev_next_ex" >
						<a href="/qa/view?qnaNum=${nextRecord.qnaNum}" class="btn_next">
							<div class="col-lg-8" >
							<span class="next_wrap"> 
								<strong>다음글</strong>
								<span>${nextRecord.qnaNum}</span>
								<span>${nextRecord.qnaTitle}</span>
							</span> 
							</div>
							<div class="col-lg-4" >
							<i class="fa fa-angle-right"></i>
							</div>
						</a>
					</div>	
					</c:when>
				</c:choose>	
			</div>
		</div>
	</div>

	<!-- end contents -->
	<!--  modal -->
	<div id="myModal" class="modal fade" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title"><img src="/resources/images/HIMAWARI.png"></h4>
	      </div>
	      <div class="modal-body">
	        <strong><p>정말 삭제하실껀가요?</p></strong>
	        <p>제목 : ${vo.qnaTitle}</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">rOLl bAcK</button>
	        <button type="button" class="btn btn-primary">삭제해버리라규</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	<script>
	$('#myModal').on('shown.bs.modal', function () {
		$('.btn-primary').click(function() {
		      window.location.href = document.getElementById('delete').getAttribute('value');
		    });
	})
	</script>
	<!-- /.modal -->
	
<script>
	var token = $("meta[name='_csrf']").attr("qnaContent");
	var header = $("meta[name='_csrf_header']").attr("qnaContent");
	$(function() {
		$(".location  .dropdown > a").on("click", function(e) {
			e.preventDefault();
			if ($(this).next().is(":visible")) {
				$(".location  .dropdown > a").next().hide();
			} else {
				$(".location  .dropdown > a").next().hide();
				$(this).next().show();
			}
		});
		$("#reply").on("click", function() {
			var comNum = "${vo.qnaNum}";
			var comContent = $("#comContent").val();
			var jdata = {
				comNum : comNum,
				comContent : comContent
			};
			$.ajax({
				type : 'post',
				contentType : "application/json; charset=utf-8",
				dataType : 'json',
				data : JSON.stringify(jdata),
				url : '/qa/answer',
				beforeSend : function(xhr) {
					xhr.setRequestHeader(header, token);
				},
				success : function(res) {
					if (res.key == 1) {
						alert("성공!")
						location.href = "/qa/list";
					}
				},
				error : function() {
					alert("통신에러");
				}
			})
		})
	});
</script>

<%@ include file="../footer.jsp"%>
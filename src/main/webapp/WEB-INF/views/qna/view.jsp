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
			</div>
		</div>
		<!-- reply start-->
		<div class="reply">
			<h2><i class="icon-comments"></i> Comments <span id="count"> </span></h2>
			<div class="replyForm">
				<textarea name="com_content" id="com_content"></textarea>
				<button id="comment_register">댓글등록</button>
			</div>
			<div class="replylist">
				<ul class="comment_box">

				</ul>
			</div>
		</div>
		<!-- reply end -->
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
	});
	</script>
	
	<!-- /.modal -->
	
<script>
	/* 
	var token = $("meta[name='_csrf']").attr("qnaContent");
	var header = $("meta[name='_csrf_header']").attr("qnaContent");
	 */
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
	
	
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
		
			 $("#comment_register").on("click", function() {
					const com_bno = ${vo.qnaNum};
					const com_writer = '<c:out value="${principal.username}"/>';
					const com_content = $("#com_content").val();
					
					if(com_writer == '') {
						alert("로그인후 이용해 주세요");
						return;
					}else if(com_content == '') {
						alert("내용을 입력하세요");
						return;
					}
					const data = {
							"com_bno":com_bno,
							"com_writer":com_writer,
							"com_content":com_content
					};
					$.ajax({
						type:'post',
						url : "<c:url value='/comment/insert'/>",
						data : JSON.stringify(data),
						contentType : 'application/json',
						beforeSend: function(xhr) {
							xhr.setRequestHeader(header, token);
						},
						success:function(response) {
							if(response === 'InsertSuccess') {
								alert("댓글등록 성공");
								$("#com_writer").val(com_writer);
								$("#com_content").val('');
								//리스트 호출
								getList();
							}else{
								alert("로그인후 이용해 주세요");
							}
						},error:function() {
							alert("통신실패");
						}
					})
				}) //
				
				getList();
				
			}); //
			
			function getList() {
				const com_writer = '<c:out value="${principal.username}"/>';
				const com_bno = ${vo.qnaNum};
				$.getJSON( //json 형식의 데이터를 가져올 때
					"<c:out value='/comment/list/'/>"+com_bno, function(data) {
						
						if(data.total >= 0) {
							var list = data.list;
							var comment_html = "";
							$("#count").html(data.total);
							for(i=0; i < list.length; i++) {
								var content = list[i].com_content;
								var writer = list[i].com_writer;
								var regdate = list[i].com_regdate;
								var no = list[i].com_no;
								comment_html +=
									`<li>
									Writer : `+writer+` | Date : `+regdate;
								comment_html += 
									`<p>ㄴ `+content+` </p>`;
								
								if(writer === com_writer) {
									comment_html += 
										`<span class='delete' style='cursor:pointer' data-com_no=`+no+`>[삭제]</span> 
										<span class='update' style='cursor:pointer' data-toggle="modal" data-target="#myModal"  data-com_no=`+no+`>[수정]</span>`;
								}else{
									comment_html += 
										`</li>`;
								}
							} //
							$(".comment_box").html(comment_html);
						}
					}	
				);
			} //
			
			$(".comment_box").on("click",".delete",function() {
				var com_no = $(this).data("com_no");
				$.ajax({
					type:'delete',
					url:`/comment/`+com_no,
					beforeSend: function(xhr) {
						xhr.setRequestHeader(header, token);
					},
					success:function(data) {
						if(data === 'ok') {
							alert("댓글 삭제 완료!");
							getList();
						}
					},error:function() {
						alert("통신실패");
					}
				})
			})
			
			$(".comment_box").on("click",".update",function() {
				var com_no = $(this).data("com_no");
				$.ajax({
					type:'get',
					url:`/comment/read/`+com_no,
					dataType:'json',
					beforeSend: function(xhr) {
						xhr.setRequestHeader(header, token);
					},
					success:function(res) {
						//alert(res.com_no);
						$(".modal #com_content").val(res.com_content);
						$(".modal button").data("com_no",res.com_no);
					},error:function() {
						alert("통신실패");
					}
				})
			})
			
			$(".modal").on("click","#btnUpdate",function() {
				var com_no = $(this).data("com_no");
				var com_content = $(".modal #com_content").val();
				var reply = {
					com_no:com_no,
					com_content:com_content
				}
				
				$.ajax({
					type:'put',
					url:'/comment/update',
					data:JSON.stringify(reply),
					contentType:"application/json; charset=utf-8",
					beforeSend: function(xhr) {
						xhr.setRequestHeader(header, token);
					},
					success:function(data) {
						$(".modal").modal("hide");
						getList();
					},error:function() {
						alert("통신실패");
					}
				})
			})	
</script>

<%@ include file="../footer.jsp"%>
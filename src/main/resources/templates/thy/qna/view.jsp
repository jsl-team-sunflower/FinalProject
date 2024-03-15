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
						<a href="gratings.html">질문답변</a>
						<a href="gratings.html">취업실적</a>
					</div>
				</li>
			</ul>
		  </div>
		</div><!-- container end -->
	</div>

	<div class="container">
		<div class="board_view">
			<h2>${vo.title}</h2>
			<p class="info"><span class="user">${vo.writer }</span>| <fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd"/> 
			<i class="fa fa-eye"></i>${vo.viewcount }</p>
			<div class="board_body">
				<p>${vo.content }</p>
				<div>
					<p style="padding: 20px 0 ; font-weight: bold; font-size: 18px;"> 답변글 >>>>>>>>>>>>>>> </p>
					<textarea rows="10" cols="10" style="width: 100%; border:1px solid #ccc;" name="content" id="content"></textarea>
				</div>
			</div>
			
			<div class="prev_next">
				<a href="/qa/view?bno=${prevBno.bno }" class="btn_prev"><i class="fa fa-angle-left"></i>
				<span class="prev_wrap">
					<strong>이전글</strong><span>${prevBno.title}</span>
				</span>
				</a>
				
				<div class="btn_3wrap">
				<a href="/qa/list">목록</a> 
				<a href="qa_modify.html">수정</a> 
				<a href="qa_delete.html" onClick="return confirm('삭제하시겠어요?')">삭제</a> 
				<a href="javascript:void(0)" id="reply">답변 등록</a>
				</div>
				
				<a href="/qa/view?bno=${nextBno.bno }" class="btn_next"><i class="icon-angle-right"></i>
				<span class="prev_wrap">
					<strong>다음글</strong><span>${nextBno.title}</span>
				</span>
				</a>
			</div>
		</div>
	</div>

	<!-- end contents -->
	
	<script>
	 var token = $("meta[name='_csrf']").attr("content");
	 var header = $("meta[name='_csrf_header']").attr("content");
	
	
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
			$("#reply").on("click", function(){
				var bno = "${vo.bno}";
				var content = $("#content").val();
				var jdata = {
						bno : bno,
						content : content
				};
				$.ajax({
					type:'post',
					contentType:"application/json; charset=utf-8",
					dataType:'json',
					data:JSON.stringify(jdata),
					url:'/qa/answer',
					beforeSend: function(xhr) {
	                      xhr.setRequestHeader(header, token);
	                   },
					success:function(res){
						if(res.key == 1){
							alert("성공");
							location.href = "/qa/list";
						}
					},error:function(error){
						alert("통신에러");
					}
					
				})
			})
			
		});
	</script>
    
<%@ include file="../footer.jsp"%>
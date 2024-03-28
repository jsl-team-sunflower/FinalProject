<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="../header.jsp"%>
<div class="blank-height"></div>


<div class="content-fluid HWAN_mainClass">
   		<div class="HWAN__container">
   			<div class="row">
   				<div class="HWAN__home-title-section ">
   					<h1 class="onauctionTitle" id="onauctionTitle">라이브경매 </h1>
   				</div>
	   				
   				<!-- 오른쪽 content 영역 -->
   				<div class="col-lg-10 HWAN__ContentSection">
   					<div class="row HWAN__ContentSectionRow">
   					<c:forEach var="list" items="${livelist}">
					  <div class="col-sm-8 HWAN__onauctionCol2">
					    <div class="HWAN__thumbnail-onauction">
					    	<div>
					    	${list.attachVO.productNum }
					    		<iframe width="30" height="80" src="${list.productNum }" title="애교부리는 고양이" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					    	</div>
					    </div>
					    
					    <div class="HWAN__caption">
						      <div class="HWAN__productTiltle">
						      	<span title="HWAN__productTiltle">${list.productName}</span>
						      </div>
						      	<div class="HWAN__productContent">${list.productWriter}</div>
						      	<div class="blank-height" style="border-bottom:1px solid #ccc"></div>
						      <div class="blank-height"></div>
						      <div class="HWAN__productPrice">
						      	<dl class="HWAN__startPproduct">
						      		<dd><span>시작가</span></dd>
						      		<dd><span>KRW ${list.startPrice}</span></dd>	
						      	</dl>
						      	<dl class="HWAN__presentProductList">
						      		<dd><span>현재가</span></dd>
						      		<dd><strong>KRW ${list.tenderPrice}</strong></dd>	
						      	</dl>
						      </div>
	      					  <div class="HWAN__close-date glyphicon glyphicon-time">
	      					  
	      					 	 D-<div id="productNum:${list.productNum}의EndTime"></div>
	      					  </div>
	      					  <div class="blank-height"></div>
	      					  	<div class="HWAN__btn_bid">
							      	<a href="/auction/liveProductDetail?productNum=${list.productNum}" role="button" class="btn btn_default btn-block go-bid-btn">
	        							<span>응찰</span>
	      							</a>
      							</div>
					      </div>
					  </div>
					  </c:forEach>
					</div>
            
					<!-- paging -->  
					<div class="blank-height"></div>
					
					  <div class="paging">
					  <c:if test="${pageMaker.prev}">
						<a href="/auction/onauction?pageNum=${pageMaker.startPage-1}&amount=${pageMaker.cri.amount}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}"><i class="fa fa-angle-left"></i></a>
					  </c:if>
					  <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<a href="/auction/onauction?pageNum=${num}&amount=${pageMaker.cri.amount}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}" class="${pageMaker.cri.pageNum==num?'active':''}">${num}</a>
					  </c:forEach>
					  <c:if test="${pageMaker.next}">
						<a href="/auction/onauction?pageNum=${pageMaker.endPage+1}&amount=${pageMaker.cri.amount}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}"><i class="fa fa-angle-right"></i></a>
					  </c:if>
					</div>
					<!-- //paging -->  
				
   				</div>
   				<!-- // content 영역 -->
   				
   				
   				<!-- 사이드바 -->
   				<div class="col-lg-2 HWAN__sideBar-list">
   					<div class="HWAN__auction-list_filter">
   						<div class="left-title">
                            <span class="title">전체</span>
                            <span class="number ng-binding">${pageMaker.total}</span>
                        </div>
   					</div>
   					<div class="HWAN__wrap-list_filter-input">
                          <div class="search-box HWAN__auction-list_filter_search">
                              <i class="glyphicon glyphicon-search"></i>
                              <form name="search" method="get" action="/auction/onauction">
                              	<input type="hidden" name="pageNum" value="1">
								<input type="hidden" name="amount" value="15">
								<input type="hidden" name="type" value="product">
                                <input onkeyup="enterKey();" type="text" name="keyword" placeholder="상품명 검색" class="auctionSearch" value="${pageMaker.cri.keyword}">
                          	  </form>
                          </div>
                      </div>
   				
   					<h2 class="HWAN__h2title">Category</h2>
   					
   					<div class="HWAN__panel-group" id="accordion" role="tablist" aria-multiselectable="true">
					  <div class="panel HWAN__panel-default">
					    <div class="HWAN__panel-heading" role="tab" id="headingOne">
					     <a type="button" class="__category-on" title="선택됨" href="/auction/onauction">
					     <p> 진행경매</p>
					     </a>
					    </div>
					  </div>
					  <div class="panel HWAN__panel-default">
					    <div class="HWAN__panel-heading" role="tab" id="headingTwo" >
					      <a type="button" class="__category-on" href="/auction/ShortAuction">
					     <p>짧은경매</p>
					     </a>
					    </div>
					  </div>
					  <div class="panel HWAN__panel-default">
					    <div class="HWAN__panel-heading" role="tab" id="headingTwo" >
					      <a type="button" class="__category-on" href="/auction/liveAuction">
					     <p>라이브경매</p>
					     </a>
					    </div>
					  </div>
					  <div class="panel HWAN__panel-default">
					    <div class="HWAN__panel-heading" role="tab" id="headingThree" >
					      <a type="button" class="__category-on" href="/auction/ResultAuction">
					     <p>경매결과</p>
					     </a>
					    </div>
					  </div>
					  <div class="blank-height"></div>
					  	<div class="HWAN__productWrite">
						  	<c:choose>
							  	<c:when test="${principal.username!=''}">
							      	<a href="/auction/live" role="button" class="btn btn_default btn-block go-bid-btn">
		     							<span>위탁 신청</span>
		   							</a>
		  						</c:when>
	  						</c:choose>
						</div>
					</div>
   				</div>
   			<!-- //왼쪽 사이드바 -->	
   			
   			</div> <!-- //row -->
   		
   		</div> <!-- //content  -->
   		
   			<!-- 맨 위로 가는 스크롤 -->
   			<div class="scroll_top-box">
				<div class="box-inner">
					<a href="#" class="btn-scroll_top js-scroll_top show">
						<i class="icon-scroll_top"></i>
					</a>
				</div>
			</div>
	 </div>

<script>
function enterkey() {
	if (window.event.keyCode == 13) {
		submit();
	}
}
</script>

<%@ include file="../footer.jsp"%>
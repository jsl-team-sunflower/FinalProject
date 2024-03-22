<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="../header.jsp"%>
<div class="blank-height"></div>


<div class="content-fluid HWAN_mainClass">
   		<div class="HWAN__container">
   			<div class="row">
   				<div class="HWAN__home-title-section ">
   					<h1 class="onauctionTitle" id="onauctionTitle">경매결과 </h1>
   				</div>
   				<!-- 오른쪽 content 영역 -->
   				<div class="col-lg-10 HWAN__ContentSection">
   					<div class="row HWAN__ContentSectionRow">
   					<c:forEach var="list" items="${list}">
					  <div class="col-sm-8 HWAN__onauctionCol2">
					  
					    <div class="HWAN__thumbnail-onauction">
					    	<c:forEach var="imglist" items="${list.attach}" varStatus="status">
						    	<c:choose>
							    	<c:when test="${status.first}">
							    	<div class="HWAN__auctionImg">
							      		<img src="/photo/${imglist.uploadPath}/${imglist.uuid}_${imglist.uploadFile}" alt="..." id="HWAN__auctionImg">
							      	</div>
							      	</c:when>
						      	</c:choose>
						    </c:forEach>
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
						      	<dl class="HWAN__endProductList">
						      		<dd><span>종료가</span></dd>
						      		<dd><strong>KRW ${list.tenderPrice}</strong></dd>	
						      	</dl>
						      </div>
	      					  <div class="HWAN__close-date glyphicon glyphicon-time">
	      					  경매종료</div>
	      					  <div class="blank-height"></div>
					      </div>
					  </div>
					  </c:forEach>
					</div>
   				</div>
   				<!-- //content 영역 -->
   				
   				
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
                              <form name="search" method="get" action="/auction/ResultAuction">
                              	<input type="hidden" name="pageNum" value="1">
								<input type="hidden" name="amount" value="15">
								<input type="hidden" name="type" value="product">
                                <input onkeyup="enterkey();" type="search" name="keyword" placeholder="상품명 검색" class="auctionSearch" value="${pageMaker.cri.keyword}">
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
					      <a type="button" class="__category-on" href="/auction/ScheduleAuction">
					     <p>상시경매</p>
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
							  	<c:when test="${principal.username}">
							      	<a href="/auction/regist" role="button" class="btn btn_default btn-block go-bid-btn">
		     							<span>위탁 신청</span>
		   							</a>
		  						</c:when>
		  						<c:otherwise>
		  							<a href="/login" role="button" class="btn btn_default btn-block go-bid-btn" onclick="return confirm('로그인 후 이용해주세요.');">
		     							<span>위탁 신청</span>
		   							</a>
		  						</c:otherwise>
	  						</c:choose>
						</div>
					</div>
   				</div>
   			<!-- //사이드바 -->	
   				
   			</div> <!-- //row -->
   		
   		</div> <!-- //content  -->
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
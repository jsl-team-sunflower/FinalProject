<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="../header.jsp"%>
<div class="blank-height"></div>


<div class="content-fluid mainClass">
   		<div class="container">
   			<div class="row">
   			<!-- 왼쪽 사이드바 -->
   				<div class="col-lg-2 sideBar">
   					<h2 class="h2title">Category</h2>
   					
   					<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
					  <div class="panel panel-default">
					    <div class="panel-heading" role="tab" id="headingOne">
					     <a type="button" class="__category-on" title="선택됨" href="/auction/onauction">
					     <p>#진행경매</p>
					     </a>
					    </div>
					  </div>
					  <div class="panel panel-default">
					    <div class="panel-heading" role="tab" id="headingTwo" >
					      <a type="button" class="__category-on" href="#scheduleAuction">
					     <p>#상시경매</p>
					     </a>
					    </div>
					  </div>
					  <div class="panel panel-default">
					    <div class="panel-heading" role="tab" id="headingThree" >
					      <a type="button" class="__category-on" href="#ResultAuction">
					     <p>#경매결과</p>
					     </a>
					    </div>
					  </div>
					</div>
   				</div>
   			<!-- //왼쪽 사이드바 -->
   				
   				<!-- 오른쪽 content 영역 -->
   				<div class="col-lg-10 mainContentSection">
	   				<div class="home-title-section ">
	   					<h1 class="onauctionTitle">진행경매 </h1>
	   				</div>
	   				
   					<div class="row">
					  <div class="col-sm-8 col-md-2">
					  
					    <div class="thumbnail-onauction-onauction">
					    	<div class="img-tab">
					      		<img src="/resources/images/test10.jpg" alt="...">
					      	</div>
					      <div class="caption">
						      <div class="productTiltle">
						      박소담</div>
	      					  <div class="close-date">
	      					  3일 21:18:28</div>
					      </div>
					    </div>
					  </div>
					  
					 <div class="col-sm-8 col-md-2">
					    <div class="thumbnail-onauction">
					      <div class="img-tab">
					      		<img src="/resources/images/test4.jpg" alt="...">
					      	</div>
					      <div class="caption">
						      <div class="productTiltle">
						      김선우</div>
	      					  <div class="close-date">
	      					  4일 01:18:28</div>
					      </div>
					    </div>
					  </div>
					  
					  <div class="col-sm-8 col-md-2">
					    <div class="thumbnail-onauction">
					      <div class="img-tab">
					      		<img src="/resources/images/test1.jpg" alt="...">
					      	</div>
					      <div class="caption">
						      <div class="productTiltle">
						      이우한</div>
	      					  <div class="close-date">
	      					  2일 10:24:28</div>
					      </div>
					    </div>
					  </div>
					  
					  <div class="col-sm-8 col-md-2">
					    <div class="thumbnail-onauction">
					      <div class="img-tab">
					      		<img src="/resources/images/test5.jpg" alt="...">
					      	</div>
					      <div class="caption">
						      <div class="productTiltle">
						      전지현</div>
	      					  <div class="close-date">
	      					  2일 10:24:28</div>
					      </div>
					    </div>
					  </div>
					  
					  <div class="col-sm-8 col-md-2">
					    <div class="thumbnail-onauction">
					      <div class="img-tab">
					      		<img src="/resources/images/test5.jpg" alt="...">
					      	</div>
					      <div class="caption">
						      <div class="productTiltle">
						      전지현</div>
	      					  <div class="close-date">
	      					  2일 10:24:28</div>
					      </div>
					    </div>
					  </div>
					  
					</div><!-- 진행경매 -->
					
					
   					<div class="row">
					  <div class="col-sm-7 col-md-3">
					    <div class="thumbnail-onauction">
					      <div class="img-tab">
					      		<img src="/resources/images/test3.jpg" alt="...">
					      	</div>
					      <div class="caption">
						      <div class="productTiltle">
						      박소담</div>
	      					  <div class="close-date">
	      					  3일 21:18:28</div>
					      </div>
					    </div>
					  </div>
					  
					 <div class="col-sm-7 col-md-3">
					    <div class="thumbnail-onauction">
					      <div class="img-tab">
					      		<img src="/resources/images/test2.jpg" alt="...">
					      	</div>
					      <div class="caption">
						      <div class="productTiltle">
						      김선우</div>
	      					  <div class="close-date">
	      					  4일 01:18:28</div>
					      </div>
					    </div>
					  </div>
					  
					  <div class="col-sm-7 col-md-3">
					    <div class="thumbnail-onauction">
					      <div class="img-tab">
					      		<img src="/resources/images/test10.jpg" alt="...">
					      	</div>
					      <div class="caption">
						      <div class="productTiltle">
						      이우한</div>
	      					  <div class="close-date">
	      					  2일 10:24:28</div>
					      </div>
					    </div>
					  </div>
					  
					  <div class="col-sm-7 col-md-3">
					    <div class="thumbnail-onauction">
					      <div class="img-tab">
					      		<img src="/resources/images/test11.jpg" alt="...">
					      	</div>
					      <div class="caption">
						      <div class="productTiltle">
						      전지현</div>
	      					  <div class="close-date">
	      					  2일 10:24:28</div>
					      </div>
					    </div>
					  </div>
					  
					</div><!-- //예정경매 -->
					
					
   					<div class="row">
					  <div class="col-sm-7 col-md-3">
					    <div class="thumbnail-onauction">
					      <div class="img-tab">
					      		<img src="/resources/images/test1.jpg" alt="...">
					      	</div>
					      <div class="caption">
						      <div class="productTiltle">
						      박소담</div>
	      					  <div class="close-date">
	      					  3일 21:18:28</div>
					      </div>
					    </div>
					  </div>
					  
					 <div class="col-sm-7 col-md-3">
					    <div class="thumbnail-onauction">
					      <div class="img-tab">
					      		<img src="/resources/images/test2.jpg" alt="...">
					      	</div>
					      <div class="caption">
						      <div class="productTiltle">
						      김선우</div>
	      					  <div class="close-date">
	      					  4일 01:18:28</div>
					      </div>
					    </div>
					  </div>
					  
					  <div class="col-sm-7 col-md-3">
					    <div class="thumbnail-onauction">
					      <div class="img-tab">
					      		<img src="/resources/images/test4.jpg" alt="...">
					      	</div>
					      <div class="caption">
						      <div class="productTiltle">
						      이우한</div>
	      					  <div class="close-date">
	      					  2일 10:24:28</div>
					      </div>
					    </div>
					  </div>
					  
					  <div class="col-sm-7 col-md-3">
					    <div class="thumbnail-onauction">
					      <div class="img-tab">
					      		<img src="/resources/images/test3.jpg" alt="...">
					      	</div>
					      <div class="caption">
						      <div class="productTiltle">
						      전지현</div>
	      					  <div class="close-date">
	      					  2일 10:24:28</div>
					      </div>
					    </div>
					  </div>
					  
					</div><!-- //경매결과 -->
					
   				</div>
   				<!-- //오른쪽 content 영역 -->
   					
   				
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



<%@ include file="../footer.jsp"%>

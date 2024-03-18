<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="header.jsp"%>

<!-- 영상 스르릉 영역 시작 -->

 <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox" style="width:100%; height:460px; display:block; margin: 0 auto;  ">
    <div class="item active">
      <img src="/resources//images/mainImage1.jpg" alt="">
    </div>
    <div class="item">
      <img src="/resources//images/mainImage2.jpg" alt="">
    </div>
    <div class="item">
      <img src="/resources//images/mainImage3.jpg" alt="">
    </div>
  </div>
  <!-- Controls -->
  <div class="prevControl">
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev" id="left-control">
    <span class="sr-only">Previous</span>
  </a>
  </div>
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>
  <div class="nextControl">
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next" id="right-control">
    <span class="sr-only">Next</span>
  </a>
  </div>
</div>
 

<div class="blank-height"></div>
<!-- 영상 스르릉 영역 끝 -->


<div class="content-fluid mainClass">
   		<div class="container">
   			<div class="row">
   			<!-- 왼쪽 사이드바 -->
   				<div class="col-lg-2 sideBar">
   					<h2 class="h2title">Category</h2>
   					
   					<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
					  <div class="panel panel-default">
					    <div class="panel-heading" role="tab" id="headingOne">
					     <a type="button" class="__category-on" title="선택됨" href="#ongoingAuction">
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
	   					<h2 class="h2title" id="ongoingAuction">진행경매
	   					<a class="wrap-right" href="/auction/onauction">
	   						<span class="title-total">전체 작품보기</span>
	   							<svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
	   							<path d="M13 9L4 9" stroke="#111111" style="transition: all 0.1s ease 0s;"></path>
	   							<path d="M7 14.25L13 9L7 3.75" stroke="#111111" style="transition: all 0.1s ease 0s;"></path>
	   						</svg>
	   					</a>
	   					</h2>
	   				</div>
	   				
   					<div class="row">
					  <div class="col-sm-7 col-md-3">
					  
					    <div class="thumbnail">
					    	<div class="img-tab">
					      		<img src="/resources/images/test10.jpg" alt="...">
					      	</div>
					       <a class="info-img" href="/">
						      <div class="info-img_content">
						      <h4>"Don't Go" Series - Things to Keep - #.1.</h4>
						      <div class="info-detail">
						      <p class="texture">oil on canvas</p>
						      <p class="size">100×80cm (40)</p>
						      </div>
						      <div class="price">
						      <h5>추정가</h5>
						      <p>KRW 8,000,000 ~15,000,000</p>
						      </div>
						      </div>
						     </a>
					      <div class="caption">
						      <div class="productTiltle">
						      박소담</div>
	      					  <div class="close-date">
	      					  3일 21:18:28</div>
					      </div>
					    </div>
					  </div>
					  
					 <div class="col-sm-7 col-md-3">
					    <div class="thumbnail">
					      <div class="img-tab">
					      		<img src="/resources/images/test4.jpg" alt="...">
					      	</div>
					      <a class="info-img" href="/">
						      <div class="info-img_content">
						      <h4>"Don't Go" Series - Things to Keep - #.1.</h4>
						      <div class="info-detail">
						      <p class="texture">oil on canvas</p>
						      <p class="size">100×80cm (40)</p>
						      </div>
						      <div class="price">
						      <h5>추정가</h5>
						      <p>KRW 8,000,000 ~15,000,000</p>
						      </div>
						      </div>
						     </a>
					      <div class="caption">
						      <div class="productTiltle">
						      김선우</div>
	      					  <div class="close-date">
	      					  4일 01:18:28</div>
					      </div>
					    </div>
					  </div>
					  
					  <div class="col-sm-7 col-md-3">
					    <div class="thumbnail">
					      <div class="img-tab">
					      		<img src="/resources/images/test1.jpg" alt="...">
					      	</div>
					      <a class="info-img" href="/">
						      <div class="info-img_content">
						      <h4>"Don't Go" Series - Things to Keep - #.1.</h4>
						      <div class="info-detail">
						      <p class="texture">oil on canvas</p>
						      <p class="size">100×80cm (40)</p>
						      </div>
						      <div class="price">
						      <h5>추정가</h5>
						      <p>KRW 8,000,000 ~15,000,000</p>
						      </div>
						      </div>
						     </a>
					      <div class="caption">
						      <div class="productTiltle">
						      이우한</div>
	      					  <div class="close-date">
	      					  2일 10:24:28</div>
					      </div>
					    </div>
					  </div>
					  
					  <div class="col-sm-7 col-md-3">
					    <div class="thumbnail">
					      <div class="img-tab">
					      		<img src="/resources/images/test5.jpg" alt="...">
					      	</div>
					      <a class="info-img" href="/">
						      <div class="info-img_content">
						      <h4>"Don't Go" Series - Things to Keep - #.1.</h4>
						      <div class="info-detail">
						      <p class="texture">oil on canvas</p>
						      <p class="size">100×80cm (40)</p>
						      </div>
						      <div class="price">
						      <h5>추정가</h5>
						      <p>KRW 8,000,000 ~15,000,000</p>
						      </div>
						      </div>
						     </a>
					      <div class="caption">
						      <div class="productTiltle">
						      전지현</div>
	      					  <div class="close-date">
	      					  2일 10:24:28</div>
					      </div>
					    </div>
					  </div>
					  
					</div><!-- 진행경매 -->
					
					<div class="home-title-section ">
	   					<h2 class="h2title" id="scheduleAuction">상시경매
	   					<a class="wrap-right" href="/">
	   						<span class="title-total">전체 작품보기</span>
	   							<svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
	   							<path d="M13 9L4 9" stroke="#111111" style="transition: all 0.1s ease 0s;"></path>
	   							<path d="M7 14.25L13 9L7 3.75" stroke="#111111" style="transition: all 0.1s ease 0s;"></path>
	   						</svg>
	   					</a>
	   					</h2>
	   				</div>
					
   					<div class="row">
					  <div class="col-sm-7 col-md-3">
					    <div class="thumbnail">
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
					    <div class="thumbnail">
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
					    <div class="thumbnail">
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
					    <div class="thumbnail">
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
					
					<div class="home-title-section ">
	   					<h2 class="h2title" id="ResultAuction">경매결과
	   					<a class="wrap-right" href="/">
	   						<span class="title-total">전체 작품보기</span>
	   							<svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
	   							<path d="M13 9L4 9" stroke="#111111" style="transition: all 0.1s ease 0s;"></path>
	   							<path d="M7 14.25L13 9L7 3.75" stroke="#111111" style="transition: all 0.1s ease 0s;"></path>
	   						</svg>
	   					</a>
	   					</h2>
	   				</div>
					
   					<div class="row">
					  <div class="col-sm-7 col-md-3">
					    <div class="thumbnail">
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
					    <div class="thumbnail">
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
					    <div class="thumbnail">
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
					    <div class="thumbnail">
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



<%@ include file="footer.jsp"%>

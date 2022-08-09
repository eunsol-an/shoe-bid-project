<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="../common/header.jsp"/>  
<jsp:include page="../common/nav.jsp"/>   
        <!-- PAGE TITLE
        ================================================== -->

        <section class="page-title-section bg-img cover-background" data-background="img/bg/page-title.jpg">
            <div class="container">

                <div class="title-info">
                    <h1>Shop Product Detail</h1></div>
                <div class="breadcrumbs-info">
                    <ul class="ps-0">
                        <li><a href="/">Home</a></li>
                        <li><a id="list" href="/product/list?pageNo=${pgvo.pageNo }&qty=${pgvo.qty}&type=${pgvo.type}&kw=${pgvo.kw}">List</a></li>
                        <li><a href="#">Shop Product Detail</a></li>
                    </ul>
                </div>

            </div>
        </section>
         <!-- PRODUCT DETAILS
        ================================================== -->
        
        <section class="md">
            <div class="container">

                <!-- product section -->
                <div class="row mb-6 mb-md-7 mb-lg-9">
                    <div class="col-lg-5 text-center text-lg-start mb-1-9 mb-lg-0">

                        <!-- product left start -->
                        <div class="xzoom-container">
                            <img class="xzoom5 mb-1-9 mx-auto" id="xzoom-magnific" src="/upload/${fn:replace(pdto.imageList[0].saveDir,'\\','/')}/${pdto.imageList[0].uuid }_${pdto.imageList[0].imageName }" alt="..." />
                            <div class="xzoom-thumbs no-margin">
                            <c:forEach items="${pdto.imageList }" var="ivo">
                                <img class="xzoom-gallery5" width="80" src="/upload/${fn:replace(ivo.saveDir,'\\','/')}/${ivo.uuid }_${ivo.imageName }">
                            </c:forEach>
                            </div>
                        </div>
                        <!-- product left end -->
                    </div>
<c:set var="pvo" value="${pdto.pvo }"/>
                    <div class="col-lg-7 ps-lg-2-3">
                        <div class="product-detail">
                            <h2 class="mb-1">${pvo.pname }</h2>
                            <div class="bg-primary separator-line-horrizontal-full mb-4"></div>
                            <p class="rating-text"><span>SKU:</span> <span class="font-500 theme-color" id="pnoVal">${pvo.pno }</span></p>
                            <ul class="countdown count-style-one text-center m-0 p-0">
    						<!-- start days -->
	    						<li><span  id="days">00</span>
							        <p class="timeRefDays text-center">days</p>
							    </li>
							    <!-- end days -->
							    <!-- start hours -->
							    <li><span  id="hours">00</span>
							        <p class="timeRefHours">hours</p>
							    </li>
							    <!-- end hours -->
							    <!-- start minutes -->
							    <li><span  id="minutes">00</span>
							        <p class="timeRefMinutes">minutes</p>
							    </li>
							    <!-- end minutes -->
							    <!-- start seconds -->
							    <li><span  id="seconds">00</span>
							        <p class="timeRefSeconds">seconds</p>
							    </li>
						    <!-- end seconds -->
							</ul>
                            <div class="mb-4">
                                <div class="d-inline-block me-3 pe-3 borders-end border-color-extra-medium-gray">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star-half-alt"></i>
                                     <div class="d-inline-block">
                                    <a class="text-primary" href="/member/detail?mno=${pvo.writer }">${pdto.nickName }</a>
                                </div>
                                </div>
                            </div>
                            <div class="mb-4">
                                <span class="me-3 display-26 font-weight-600" >시작가 : <span class="display-26 font-weight-700 text-primary" id="reservePriceVal">${pvo.reservePrice }</span></span>
                               <span class="display-26 font-weight-700 text-primary">현재가 :</span> <span class="display-26 font-weight-700 text-primary" id="maxPrice">${pdto.maxPrice }</span>
                            </div>

                            <div class="row">
                                <div class="col-5 col-md-4">
                                    <label>시작시간:</label>
                                    <div class="mb-4 ">
                                        <span>${pvo.regAt }</span>
                                    </div>

                                </div>
                                <div class="col-5 col-md-4">
                                    <label>종료시간:</label>
                                    <div class="mb-4 ">
                                        <span id ="endTime">${pvo.endTime }</span>
                                    </div>
                            </div>
                            <div class="row">
                                <div class="col-4 col-lg-2">
                                    <label>Qty:</label>
                                   <span> ${pvo.readCount }</span>
                                </div>

                            </div>

                            <div class="row mb-4">
                                <div class="col-lg-12">
                                    <button class="butn-style2 me-3 mb-2 mb-md-0"><span><i class="fas fa-shopping-cart me-1"></i> Add to Cart</span></button>
                                    <button type="button" class="butn-style2 me-3 mb-2 mb-md-0"	data-bs-toggle="modal" data-bs-target="#centered">입찰하기</button>
<!-- Vertically centered -->
<div class="modal fade" id="centered" tabindex="-1"
	aria-labelledby="centeredLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="centeredLabel">입찰하기</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form action="/buy_bid/add" method="post"  id="bidAddForm">
				<div class="form-group">
			<input type="hidden" name="buyer" value="1">
			<input type="hidden" name="pno" value="${pvo.pno }">
			<input type="hidden" name="bidStatus" value="0">
					<label>입찰 금액 입력</label> <input type="number" class="form-control"
						name="bidPrice" placeholder="입찰 금액을 입력해주세요" id="bidPriceVal"
						value="${pvo.reservePrice > pdto.maxPrice ? pvo.reservePrice : pdto.maxPrice  }">
				</div>
			</form>
				<div class="form-check">
					<input class="form-check-input is-checked" type="checkbox" value=""
						id="flexCheckDefault"> 
						<label class="form-check-label is-checked"
						for="flexCheckDefault"> 입찰은 취소할 수 없습니다. 모든 약관에 동의합니다.</label>
						<p class="text-center text-danger" id="errorMsg"></p>
				</div>
			</div>
			<div class="modal-footer">
			
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" id="addBtn" disabled>입찰하기</button>
			</div>
			
		</div>
	</div>
</div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-7">
									<a href="/product/modify?pno=${pvo.pno }&pageNo=${pgvo.pageNo }&qty=${pgvo.qty}&type=${pgvo.type}&kw=${pgvo.kw}" id="modBtn" class="butn-style2 me-3 mb-2 mb-md-0" style="display: none;">수정</a>
									<button  class="butn-style2 me-3 mb-2 mb-md-0" id="modBtnFake">수정</button>
                                    <button type="button" class="butn-style2 dark" data-bs-toggle="modal" data-bs-target="#staticBackdrop" id="Remove">삭제</button>
                                      <form action="" method="post" id="productRmForm"  style="display: none;">
                                    <input type="hidden" id="pno" value="" name="pno">
                                    <input type="hidden" value="${pgvo.pageNo }" name="pageNo">  	
  									<input type="hidden" value="${pgvo.qty }" name="qty"> 
  									<input type="hidden" value="${pgvo.type }" name="type"> 
  									<input type="hidden" value="${pgvo.kw }" name="kw"> 
                                    </form>
                                    
                                   <!-- static Modal -->
									<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
									    <div class="modal-dialog">
									        <div class="modal-content">
									            <div class="modal-header">
									                <h5 class="modal-title" id="staticBackdropLabel">삭제요청</h5>
									                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									            </div>
									            <div class="modal-body">
									               정말 삭제하시겠습니까?
									            </div>
									            <div class="modal-footer">
									                <button type="button" class="btn btn-primary" id="productRemove">예</button>
									                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니요</button>
									            </div>
									        </div>
									    </div>
									</div>

                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <!-- end product section -->

                <!-- product description -->
                <div class="row justify-content-center mb-6 mb-md-7">

                    <div class="col-12">
                        <div class="horizontaltab tab-style-two">
                            <ul class="resp-tabs-list hor_1 text-start">
                                <li><i class="ti-line-dashed d-md-block d-none"></i>Description</li>
                                <li><i class="ti-more d-md-block d-none"></i>Additional Info</li>
                                <li><i class="ti-star d-md-block d-none"></i>Reviews (2)</li>
                            </ul>
                            <div class="resp-tabs-container hor_1">
                                <div>

                                    <p>${pvo.description }</p>
                                   
                                </div>
                                <div>
                                    <div class="row">
                                        <div class="col-lg-6 mb-1-9 mb-lg-0">

                                            <h3 class="display-29">Information:</h3>
                                            <ul class="primary-list mb-1-9">
                                                <li><strong>Weight:</strong> 15 grams</li>
                                                <li><strong>Dimensions:</strong> 8.03 x 1.27 x 2.54 Cm</li>
                                                <li><strong>Size:</strong> 64 GB</li>
                                                <li><strong>Color:</strong> White</li>
                                                <li><strong>Guarantee:</strong> 5 Years</li>
                                            </ul>

                                            <p class="mb-0">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto in ea voluptate velit.</p>

                                        </div>
                                        <div class="col-lg-6 ps-lg-1-9">

                                            <div class="table-responsive">
                                                <table class="table bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>Shipping Options</th>
                                                            <th>Delivery Time</th>
                                                            <th>Price</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                Standard Shipping
                                                            </td>
                                                            <td>
                                                                Delivery in 5 - 7 working days
                                                            </td>
                                                            <td>
                                                                $8.00
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Express Shipping
                                                            </td>
                                                            <td>
                                                                28 August 2022
                                                            </td>
                                                            <td>
                                                                $12.00
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                1 - 2 day Shipping
                                                            </td>
                                                            <td>
                                                                27 August 2022
                                                            </td>
                                                            <td>
                                                                $12.00
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Free Shipping
                                                            </td>
                                                            <td>
                                                                25 August 2022
                                                            </td>
                                                            <td>
                                                                $0.00
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>

                                        </div>
                                    </div>

                                </div>
                                <div>
                                    <div class="row">

                                        <div class="col-lg-6 order-lg-2 mb-1-9 mb-lg-0">
                                            <div class="common-block">

                                                <div class="mb-2-3 pb-2-3 border-bottom">

                                                    <div class="media mb-4 product-review">
                                                        <img class="me-3 rounded-circle w-60px" src="img/avatar/t-1.jpg" alt="...">
                                                        <div class="media-body">
                                                            <a href="#" class="mb-1 font-weight-600 text-extra-dark-gray">Jonal Doe</a>
                                                            <span class="d-block text-primary">Sep 15, 2018</span>
                                                        </div>

                                                        <span class="text-primary">
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star-half-alt"></i>
                                                        </span>

                                                    </div>

                                                    <p class="mb-0">Consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.</p>

                                                </div>

                                                <div class="pb-4">

                                                    <div class="media mb-4 product-review">
                                                        <img class="me-3 rounded-circle w-60px" src="img/avatar/t-2.jpg" alt="...">
                                                        <div class="media-body">
                                                            <a href="#" class="mb-1 font-weight-600 text-extra-dark-gray">Marina Modra</a>
                                                            <span class="d-block text-primary">Sep 15, 2018</span>
                                                        </div>

                                                        <span class="text-primary">
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star-half-alt"></i>
                                                        </span>

                                                    </div>

                                                    <p class="mb-0">Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem.</p>

                                                </div>

                                                <div class="text-start">
                                                    <a href="#" class="butn-style2 small">Load More Reviews</a>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-6 order-lg-1">

                                            <div class="common-block">

                                                <div class="inner-title">
                                                    <h4 class="mb-0">Leave Review</h4>
                                                    <p class="mb-0">Leave review takes it to the next level.</p>
                                                </div>

                                                <form>

                                                    <div class="row">

                                                        <div class="col-sm-6">

                                                            <div class="form-group">
                                                                <label>Your Name</label>
                                                                <input type="text" class="form-control" name="name" placeholder="Your name here">
                                                            </div>

                                                        </div>

                                                        <div class="col-sm-6">

                                                            <div class="form-group">
                                                                <label>Your Email</label>
                                                                <input type="email" class="form-control" name="email" placeholder="Your email here">
                                                            </div>

                                                        </div>

                                                    </div>

                                                    <div class="row">

                                                        <div class="col-sm-12 mb-2">

                                                            <div class="form-group">
                                                                <label>Rating</label>
                                                                <select class="form-control form-select">
                                                                    <option>5 Stars</option>
                                                                    <option>4 Stars</option>
                                                                    <option>3 Stars</option>
                                                                    <option>2 Stars</option>
                                                                    <option>1 Star</option>
                                                                </select>
                                                            </div>

                                                        </div>

                                                    </div>

                                                    <div class="row">

                                                        <div class="col-12 mb-4">

                                                            <label>Comment</label>
                                                            <div class="form-group mb-1">
                                                                <textarea rows="2" class="form-control" placeholder="Tell us a few words"></textarea>
                                                            </div>

                                                        </div>

                                                    </div>

                                                    <button type="button" class="butn-style2">Submit Review</button>

                                                </form>

                                            </div>

                                        </div>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
                </div>
                </section>
<script src="/resources/js/product.detail.js"></script>
<script>
  document.addEventListener('DOMContentLoaded', function(){
 let maxPrice = document.getElementById('maxPrice').innerText;
 //maxPrice.substring(maxPrice.lastIndexOf(":"));
 
 console.log(parseInt(maxPrice));
  if(parseInt(maxPrice) >0){
  let modBtn =document.getElementById('modBtnFake').disabled = true;
  let productRemove =document.getElementById('Remove').disabled = true;
   }
   });
  let endTime = new Date(document.getElementById("endTime").innerText);
  console.log(endTime);
</script>
<jsp:include page="../common/footer.jsp"/>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />
<!-- PAGE TITLE
        ================================================== -->
<section class="page-title-section bg-img cover-background"
	data-background="/img/bg/page-title.jpg">
	<div class="container">

		<div class="title-info">
			<h1>Shop Product List</h1>
		</div>
		<div class="breadcrumbs-info">
			<ul class="ps-0">
				<li><a href="home-shop-1.html">Home</a></li>
				<li><a href="/product/list">Shop Product List</a></li>
			</ul>
		</div>

	</div>
</section>
<!-- CATEGORY
================================================== -->
<section class="pt-1 pb-3">
    <div class="container">
        <div class="row  text-center">
            <div class="col-sm-6 col-md-4 col-lg-2 mt-1-9">
                <a href="/product/list?type=s" class="categoty-style2">
                    <div class="category-icon mb-4">
                        <img src="/resources/bootstrap/img/icons/icon-4.png" alt="...">
                    </div>
                    <h3 class="font-weight-500 mb-0">Sneakers</h3>
                </a>
            </div>
            <div class="col-sm-6 col-md-4 col-lg-2 mt-1-9">
                <a href="/product/list?type=a" class="categoty-style2">
                    <div class="category-icon mb-4">
                        <img src="/resources/bootstrap/img/icons/icon-5.png" alt="...">
                    </div>
                    <h3 class="font-weight-500 mb-0">Sandals</h3>
                </a>
            </div>
            <div class="col-sm-6 col-md-4 col-lg-2 mt-1-9">
                <a href="/product/list?type=i" class="categoty-style2">
                    <div class="category-icon mb-4">
                        <img src="/resources/bootstrap/img/icons/icon-6.png" alt="...">
                    </div>
                    <h3 class="font-weight-500 mb-0">Slippers</h3>
                </a>
            </div>
            <div class="col-sm-6 col-md-4 col-lg-2 mt-1-9">
                <a href="/product/list?type=l" class="categoty-style2">
                    <div class="category-icon mb-4">
                        <img src="/resources/bootstrap/img/icons/icon-7.png" alt="...">
                    </div>
                    <h3 class="font-weight-500 mb-0">Loafers</h3>
                </a>
            </div>
            <div class="col-sm-6 col-md-4 col-lg-2 mt-1-9">
                <a href="/product/list?type=f" class="categoty-style2">
                    <div class="category-icon mb-4">
                        <img src="/resources/bootstrap/img/icons/icon-8.png" alt="...">
                    </div>
                    <h3 class="font-weight-500 mb-0">Flat</h3>
                </a>
            </div>
            <div class="col-sm-6 col-md-4 col-lg-2 mt-1-9">
                <a href="/product/list?type=b" class="categoty-style2">
                    <div class="category-icon mb-4">
                        <img src="/resources/bootstrap/img/icons/icon-9.png" alt="...">
                    </div>
                    <h3 class="font-weight-500 mb-0">Boots</h3>
                </a>
            </div>
        </div>
    </div>
</section>
<!-- PRODUCT LIST
        ================================================== -->
<section class="pt-2" >
	<div class="container ">
			<div
				class="col-lg-12 col-12 ps-lg-1-9 order-1 order-lg-2 mb-1-9 mb-lg-0">
				<c:if test="${ses.mno ne null && ses ne null }">
				<div class="col-md-1  text-md-end">
						<a href="/product/register" class="btn btn-info mb-4">register</a>
                  </div>
                  </c:if>
				<div class="row g-0 align-items-center bg-light rounded p-3 mb-1-9">

					<div
						class="col-12 col-md my-1 my-md-0 text-center text-md-start font-weight-600">
						 <div class="col-12 col-lg-12 order-3 order-lg-2 categories-search">
                            <div class="product-search">
                                <form action="/product/list" method="get">
                                    <div class="psearch-content">
                                        <div class="product-cat">
                                          
                                        </div>
                                        <div class="search-wrapper">
                                            <input type="text" name="kw" class="search-field" placeholder="키워드 검색" value=${pgn.pgvo.kw }>
                                        </div>
                                        <button type="submit" class="search-submit"><i class="ti-search d-inline-block d-lg-none"></i><span class="d-none d-lg-inline-block">Search</span></button>
                                    </div>
                                </form>
                            </div>
                        </div>
						</div>
					<div class="col-12 col-md-auto">
					
					</div>
				</div>
				
		 	<c:forEach items="${list }" var="pvo">
					<div class="row g-0 product-listing">
						<div class="col-sm-4">
							<div class="product-img">
								<a href="/product/detail?pno=${pvo.pno }&pageNo=${pgn.pgvo.pageNo }&qty=${pgn.pgvo.qty}&type=${pgn.pgvo.type}&kw=${pgn.pgvo.kw}"> <img
									src="/upload/${fn:replace(pvo.productImg,'\\','/')}" alt="...">
								</a>
							</div>
						</div>
						<div class="col-sm-8">
							<div class="product-list">
								<div class="product-description">
									<h3>
										<a href="/product/detail?pno=${pvo.pno }&pageNo=${pgn.pgvo.pageNo }&qty=${pgn.pgvo.qty}&type=${pgn.pgvo.type}&kw=${pgn.pgvo.kw}">${pvo.pname }</a>
									</h3>
									<h4 class="price">
										<span class="offer-price ">시작가 : <fmt:formatNumber value="${pvo.reservePrice }" pattern="#,###" />원</span> <span
											class="regular-price">현재가 : <fmt:formatNumber value="${pvo.highestPrice }" pattern="#,###" />원</span>
									</h4>
									<p>종료시간 : ${pvo.endTime }</p>
								</div>
								<div class="product-buttons">
									<ul class="ps-0">
										<li><a href="#" class="btn-link" title="Add To Wishlist"><i
												class="far fa-heart"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>



				<!-- pagination -->
				<div class="pagination text-small text-uppercase text-extra-dark-gray mt-4">
					<ul class="ps-0">
					<c:if test="${pgn.prev }">
						<li><a href="/product/list?pageNo=${pgn.startPage-1 }&qty=${pgn.pgvo.qty}&type=${pgn.pgvo.type}&kw=${pgn.pgvo.kw}"><i
								class="fas fa-long-arrow-alt-left me-1 d-none d-sm-inline-block"></i>
								Prev</a></li>
					</c:if>
					<c:forEach begin="${pgn.startPage }" end="${pgn.endPage }" var="i">
						<li class="${pgn.pgvo.pageNo == i ? 'active':'' }"><a href="/product/list?pageNo=${i }&qty=${pgn.pgvo.qty}&type=${pgn.pgvo.type}&kw=${pgn.pgvo.kw}">${i }</a></li>
						</c:forEach>
						<c:if test="${pgn.next }">
						<li><a href="/product/list?pageNo=${pgn.endPage + 1 }&qty=${pgn.pgvo.qty}&type=${pgn.pgvo.type}&kw=${pgn.pgvo.kw}">Next <i
								class="fas fa-long-arrow-alt-right ms-1 d-none d-sm-inline-block"></i></a></li>
						</c:if>
					</ul>
				</div>
				<!-- end pagination -->

			</div>
			<!-- end right panel section -->
		</div>
	
</section>

<jsp:include page="../common/footer.jsp" />
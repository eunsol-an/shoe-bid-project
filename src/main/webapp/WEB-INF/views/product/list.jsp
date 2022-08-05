<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
				<li><a href="#">Shop Product List</a></li>
			</ul>
		</div>

	</div>
</section>
<!-- PRODUCT LIST
        ================================================== -->
<section class="md">
	<div class="container">
		<div class="row">
			<!-- start sidebar panel -->
			<div class="col-lg-3 col-12 side-bar order-2 order-lg-1">

				<div class="widget">
					<div class="widget-title">
						<h5>Categories</h5>
					</div>
					<div id="accordion" class="accordion-style2">
						<div class="card">
							<div class="card-header" id="headingOne">
								<h5 class="mb-0">
									<button class="btn btn-link" data-bs-toggle="collapse"
										data-bs-target="#collapseOne" aria-expanded="true"
										aria-controls="collapseOne">Shirts</button>
								</h5>
							</div>
							<div id="collapseOne" class="collapse show"
								aria-labelledby="headingOne" data-bs-parent="#accordion">
								<div class="card-body">
									<ul class="list-unstyled">
										<li><a href="#">Casual Shirts</a></li>
										<li><a href="#">Formal Shirts</a></li>
										<li><a href="#">Longline Shirts</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header" id="headingTwo">
								<h5 class="mb-0">
									<button class="btn btn-link collapsed"
										data-bs-toggle="collapse" data-bs-target="#collapseTwo"
										aria-expanded="false" aria-controls="collapseTwo">
										Jeans</button>
								</h5>
							</div>
							<div id="collapseTwo" class="collapse"
								aria-labelledby="headingTwo" data-bs-parent="#accordion">
								<div class="card-body">
									<ul class="list-unstyled">
										<li><a href="#">Regular Jeans</a></li>
										<li><a href="#">Denim Jeans</a></li>
										<li><a href="#">Low Rise Jeans</a></li>
										<li><a href="#">Mid Rise Denims</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header" id="headingThree">
								<h5 class="mb-0">
									<button class="btn btn-link collapsed"
										data-bs-toggle="collapse" data-bs-target="#collapseThree"
										aria-expanded="false" aria-controls="collapseThree">
										Shoes</button>
								</h5>
							</div>
							<div id="collapseThree" class="collapse"
								aria-labelledby="headingThree" data-bs-parent="#accordion">
								<div class="card-body">
									<ul class="list-unstyled">
										<li><a href="#">Sports Shoes</a></li>
										<li><a href="#">Wedding Shoes</a></li>
										<li><a href="#">Loafers Shoes</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header" id="headingFour">
								<h5 class="mb-0">
									<button class="btn btn-link collapsed"
										data-bs-toggle="collapse" data-bs-target="#collapseFour"
										aria-expanded="false" aria-controls="collapseFour">
										T-Shirts</button>
								</h5>
							</div>
							<div id="collapseFour" class="collapse"
								aria-labelledby="headingFour" data-bs-parent="#accordion">
								<div class="card-body">
									<ul class="list-unstyled">
										<li><a href="#">Polo T-Shirt</a></li>
										<li><a href="#">V-neck T-Shirt</a></li>
										<li><a href="#">Striped T-Shirt</a></li>
										<li><a href="#">Graphic T-Shirt</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header" id="headingFive">
								<h5 class="mb-0">
									<button class="btn btn-link collapsed"
										data-bs-toggle="collapse" data-bs-target="#collapseFive"
										aria-expanded="false" aria-controls="collapseFive">
										Mobile</button>
								</h5>
							</div>
							<div id="collapseFive" class="collapse"
								aria-labelledby="headingFive" data-bs-parent="#accordion">
								<div class="card-body">
									<ul class="list-unstyled">
										<li><a href="#">Intex</a></li>
										<li><a href="#">Google</a></li>
										<li><a href="#">Samsung</a></li>
										<li><a href="#">Apple</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="widget">
					<div class="widget-title">
						<h5>Price Range</h5>
					</div>
					<input type="text" class="price-range" name="my_range" value="">
					<a href="#" class="butn-style2 small mt-1-9">Filter</a>
				</div>

				<div class="widget">

					<div class="widget-title">
						<h5>Popular Products</h5>
					</div>

					<div class="d-flex mb-4">
						<div class="flex-shrink-0">
							<img src="img/products/thumbs/thumb-06.jpg" alt="...">
						</div>
						<div class="flex-grow-1 ms-3">
							<a href="#" class="mb-1 font-weight-600 text-extra-dark-gray">Men's
								Football Boots</a> <span class="d-block">$15.00</span>
						</div>
					</div>

					<div class="d-flex mb-4">
						<div class="flex-shrink-0">
							<img src="img/products/thumbs/thumb-01.jpg" alt="...">
						</div>
						<div class="flex-grow-1 ms-3">
							<a href="#" class="mb-1 font-weight-600 text-extra-dark-gray">Leather
								Motorcycle Gloves</a> <span class="d-block">$12.10</span>
						</div>
					</div>

					<div class="d-flex">
						<div class="flex-shrink-0">
							<img src="img/products/thumbs/thumb-02.jpg" alt="...">
						</div>
						<div class="flex-grow-1 ms-3">
							<a href="#" class="mb-1 font-weight-600 text-extra-dark-gray">
								Sun Protection Cap </a> <span class="d-block">$10.20</span>
						</div>
					</div>

				</div>

				<div class="widget">

					<div class="widget-title">
						<h5>Select by Discount</h5>
					</div>

					<ul class="list-discount list-unstyled">

						<li class="form-check text-start"><input
							class="form-check-input" type="checkbox" value=""
							id="ten_pecentage"> <label class="form-check-label"
							for="ten_pecentage">10% off or more</label></li>

						<li class="form-check text-start"><input
							class="form-check-input" type="checkbox" value=""
							id="twenty_pecentage"> <label class="form-check-label"
							for="twenty_pecentage">20% off or more</label></li>

						<li class="form-check text-start"><input
							class="form-check-input" type="checkbox" value=""
							id="thirty_pecentage"> <label class="form-check-label"
							for="thirty_pecentage">30% off or more</label></li>

						<li class="form-check text-start"><input
							class="form-check-input" type="checkbox" value=""
							id="fourty_pecentage"> <label class="form-check-label"
							for="fourty_pecentage">40% off or more</label></li>

					</ul>
				</div>

				<div class="offer-slider owl-carousel owl-theme">

					<div class="offer-banner-slider"
						style="background-image: url(img/offer-banner/offer-slide-01.jpg);">
						<div class="offer-text">
							<h6 class="mb-1 text-white font-weight-500">Men's</h6>
							<h4 class="font-weight-500">
								<a href="#">Up to 50% Off</a>
							</h4>
							<p>Lorem ipsum dolor sit amet consectetur</p>
							<a class="butn-style1 fill small" href="#"><span>Buy
									Now</span></a>
						</div>
					</div>

					<div class="offer-banner-slider"
						style="background-image: url(img/offer-banner/offer-slide-02.jpg);">
						<div class="offer-text">
							<h6 class="mb-1 text-white font-weight-500">Women's</h6>
							<h4 class="font-weight-500">
								<a href="#" class="text-white">Up to 70% Off</a>
							</h4>
							<p>Lorem ipsum dolor sit amet consectetur</p>
							<a class="butn-style1 fill small" href="#"><span>Buy
									Now</span></a>
						</div>
					</div>

					<div class="offer-banner-slider"
						style="background-image: url(img/offer-banner/offer-slide-03.jpg);">
						<div class="offer-text">
							<h6 class="mb-1 text-white font-weight-500">Electronics</h6>
							<h4 class="font-weight-500">
								<a href="#" class="text-white">Mega Sale</a>
							</h4>
							<p>Lorem ipsum dolor sit amet consectetur</p>
							<a class="butn-style1 fill small" href="#"><span>Buy
									Now</span></a>
						</div>
					</div>

				</div>

			</div>
			<!-- end sidebar panel -->

			<!-- right panel section -->
			<div
				class="col-lg-9 col-12 ps-lg-1-9 order-1 order-lg-2 mb-1-9 mb-lg-0">

				<div class="row g-0 align-items-center bg-light rounded p-3 mb-1-9">

					<div
						class="col-12 col-md my-1 my-md-0 text-center text-md-start font-weight-600">Showing
						1–9 of 27 results</div>

					<div class="col-12 col-md-auto">

						<div class="row justify-content-center">

							<div class="col-auto my-1 my-md-0">
								<label class="m-0">Show:</label> <select
									class="w-auto d-inline-block form-select">
									<option value="#?limit=24" selected="selected">24</option>
									<option value="#?limit=25">25</option>
									<option value="#?limit=50">50</option>
									<option value="#?limit=75">75</option>
									<option value="#?limit=100">100</option>
								</select>
							</div>

							<div class="col-auto my-1 my-md-0">
								<label class="m-0">Sort By:</label> <select
									class="w-auto d-inline-block form-select">
									<option value="#?sort=p.sort_order&amp;order=ASC">Default</option>
									<option value="#?sort=pd.name&amp;order=ASC">Name (A -
										Z)</option>
									<option value="#?sort=pd.name&amp;order=DESC">Name (Z
										- A)</option>
									<option value="#?sort=p.price&amp;order=ASC" selected="">Price
										(Low &gt; High)</option>
									<option value="#?sort=p.price&amp;order=DESC">Price
										(High &gt; Low)</option>
									<option value="#?sort=rating&amp;order=DESC">Rating
										(Highest)</option>
									<option value="#?sort=rating&amp;order=ASC">Rating
										(Lowest)</option>
									<option value="#?sort=p.model&amp;order=ASC">Model (A
										- Z)</option>
									<option value="#?sort=p.model&amp;order=DESC">Model (Z
										- A)</option>
								</select>
							</div>

						</div>

					</div>

				</div>
				<div class="col-md-6 text-center text-md-end">
						<a href="/product/register" class="btn btn-info mb-4">register</a>
                                </div>
		 	<c:forEach items="${list }" var="pvo">
					<div class="row g-0 product-listing">
						<div class="col-sm-4">
							<div class="product-img">
								<a href="/product/detail?pno=${pvo.pno }"> <img
									src="/upload/${fn:replace(pvo.productImg,'\\','/')}" alt="...">
								</a>
							</div>
						</div>
						<div class="col-sm-8">
							<div class="product-list">
								<div class="product-description">
									<h3>
										<a href="/product/detail?pno=${pvo.pno }">${pvo.pname }</a>
									</h3>
									<h4 class="price">
										<span class="regular-price ">시작가:${pvo.reservePrice }</span> <span
											class="offer-price">현재가:${pvo.highestPrice }</span>
									</h4>
									<p>종료시간 : ${pvo.endTime }</p>
								</div>
								<div class="product-buttons">
									<ul class="ps-0">
										<li><a href="#" class="btn-link" title="Add To Wishlist"><i
												class="far fa-heart"></i></a></li>
										<li><a href="#" class="butn-style2" title="Add to Cart">Add
												to Cart</a></li>
										<li><a href="#" class="btn-link" title="Add To Compare"><i
												class="fas fa-random"></i></a></li>
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
						<li><a href="/product/list?pageNo=${pgn.startPage-1 }&qty=${pgn.pgvo.qty}"><i
								class="fas fa-long-arrow-alt-left me-1 d-none d-sm-inline-block"></i>
								Prev</a></li>
					</c:if>
					<c:forEach begin="${pgn.startPage }" end="${pgn.endPage }" var="i">
						<li class="${pgn.pgvo.pageNo == i ? 'active':'' }"><a href="/product/list?pageNo=${i }&qty=${pgn.pgvo.qty}">${i }</a></li>
						</c:forEach>
						<c:if test="${pgn.next }">
						<li><a href="/product/list?pageNo=${pgn.endPage + 1 }&qty=${pgn.pgvo.qty}">Next <i
								class="fas fa-long-arrow-alt-right ms-1 d-none d-sm-inline-block"></i></a></li>
						</c:if>
					</ul>
				</div>
				<!-- end pagination -->

			</div>
			<!-- end right panel section -->
		</div>
	</div>
</section>

<jsp:include page="../common/footer.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<!-- ACCOUNT WISHLIST
================================================== -->
<section class="md">
	<div class="container">
		<div class="row justify-content-center">

			<!-- left panel -->
			<div class="col-lg-3 col-sm-9 mb-2-3 mb-lg-0">

				<div class="account-pannel rounded">

					<div class="p-4">

						<div class="text-center">
							<div class="pb-3">
								<img class="img-fluid rounded-circle img-thumbnail"
									src="img/avatar/t-3.jpg" alt="...">
							</div>
							<h6 class="mb-0 display-28">Peter Parker</h6>
							<small>Joined February 06, 2017</small>
							<div class="reward-points">
								<i class="ti-star text-primary pe-1"></i> Points: 7386
							</div>
						</div>
					</div>

					<div class="list-group">
						<a class="list-group-items" href="account-orders.html"><i
							class="ti-bag pe-2"></i>Orders<span class="badge badge-pill">6</span></a>
						<a class="list-group-items" href="account-profile.html"><i
							class="ti-user pe-2"></i>Profile</a> <a class="list-group-items"
							href="account-address.html"><i class="ti-location-pin pe-2"></i>Addresses</a>
						<a class="list-group-items active" href="account-wishlist.html"><i
							class="ti-heart pe-2"></i>입찰/낙찰내역<span class="badge badge-pill">3</span></a>
						<a class="list-group-items" href="account-tickets.html"><i
							class="ti-tag pe-2"></i>My Tickets<span class="badge badge-pill">4</span></a>
					</div>

				</div>

			</div>
			<!-- end left panel -->

			<!-- right panel -->
			<div class="col-lg-9">

				<div>

					<div class="inner-title">
						<h4 class="mb-0">입찰/낙찰 내역</h4>
					</div>

					<div class="table-responsive">
						<table class="table v-align-middle text-center">
							<thead>
								<tr>
									<th>상품이미지</th>
									<th>상품명</th>
									<th>입찰가격</th>
									<th>입찰일시</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="bvo" items="${list }">
									<tr>
										<td><a href="#"><img
												src="img/products/top-rated/1.jpg" alt="..." /></a></td>
										<td><a href="#">${bvo.pname }</a></td>
										<td class="product-price">${bvo.bidPrice }원</td>
										<td class="product-quantity">${bvo.bidAt }</td>
										<td><c:if test="${bvo.bidStatus eq 0 }">
												<div>경매진행중</div>
											</c:if> <c:if test="${bvo.bidStatus eq 1 }">
												<div>낙찰완료</div>
												<a href="#" class="butn-style2 small">거래후기 남기기</a>
											</c:if> <c:if test="${bvo.bidStatus eq 2 }">
												<div>낙찰실패</div>
											</c:if></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>


					<div
						class="pagination text-small text-uppercase text-extra-dark-gray">
						<ul>
							<c:if test="${pgn.prev }">
								<li><a
									href="/buy_bid/list/1?pageNo=${pgn.startPage-1 }&qty=${pgn.pgvo.qty }">«</a></li>
							</c:if>
							<c:forEach begin="${pgn.startPage }" end="${pgn.endPage }"
								var="i">
								<li class="${pgn.pgvo.pageNo == i ? 'active' : '' }"><a
									href="/buy_bid/list/1?pageNo=${i }&qty=${pgn.pgvo.qty}">${i }</a></li>
							</c:forEach>
							<c:if test="${pgn.next }">
								<li><a
									href="/buy_bid/list/1?pageNo=${pgn.endPage+1 }&qty=${pgn.pgvo.qty }">»</a></li>
							</c:if>
						</ul>
					</div>

				</div>

			</div>
			<!-- end right panel -->
		</div>
	</div>
</section>

<jsp:include page="../common/footer.jsp" />
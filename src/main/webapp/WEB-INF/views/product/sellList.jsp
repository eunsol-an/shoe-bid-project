<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
							class="ti-heart pe-2"></i>입찰/낙찰내역<span class="badge badge-pill">${pgn.totalCount }</span></a>
						<a class="list-group-items" href="account-wishlist.html"><i
							class="ti-heart pe-2"></i>판매내역<span class="badge badge-pill">3</span></a>
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

					<form class="d-flex col-sm-12 col-md-6 mx-auto"
						action="/product/sellList/${ses.mno }" method="get">
						<input type="hidden" name="pageNo" value="1"> 
						<input type="hidden" name="qty" value="${pgn.pgvo.qty }">
						<div class="input-group">
							<c:set value="${pgn.pgvo.type }" var="typed" />
							<select class="form-select" name="type">
								<option value="psf" ${typed eq 'psf' ? 'selected':'' }>전체</option>
								<option value="p" ${typed eq 'p' ? 'selected':'' }>진행중</option>
								<option value="s" ${typed eq 's' ? 'selected':'' }>낙찰</option>
								<option value="f" ${typed eq 'f' ? 'selected':'' }>유찰</option>
								<option value="sf" ${typed eq 'sf' ? 'selected':'' }>낙찰/유찰</option>
							</select>
							<button class="btn butn-style2" type="submit">
								보기 <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-secondary">${pgn.totalCount }</span>
							</button>
						</div>
					</form>

					<div class="table-responsive mt-5">
						<table class="table v-align-middle text-center">
							<thead>
								<tr>
									<th>상품이미지</th>
									<th>입찰내용</th>
									<th>상품종료시간</th>
									<th>상태</th>
									<th>낙찰자</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="pvo" items="${list }">
									<tr class="bg-transparent">
										<td><a href="/product/detail?pno=${pvo.pno }"><img
												src="/upload/${fn:replace(pvo.productImg,'\\','/')}" alt="img" style="width:200px;"/></a></td>
										<td class="text-start">
											<a href="/product/detail?pno=${pvo.pno }">${pvo.pname }</a>
											<div class="h6 mt-4">입찰가 : <fmt:formatNumber value="${pvo.highestPrice }" pattern="#,###" />원</div>
										</td>
										<td class="product-quantity">${pvo.endTime }</td>
										<td><c:if test="${pvo.status eq 0 }">
												<div>경매진행중</div>
											</c:if> <c:if test="${pvo.status eq 1 }">
												<div>낙찰</div>
												<a href="#" class="butn-style2 small text-nowrap">거래후기 남기기</a>
											</c:if> <c:if test="${pvo.status eq 2 }">
												<div>유찰</div>
											</c:if></td>
											<td>
											<c:if test="${pvo.buyerNick ne null }">
											<div>${pvo.buyerNick }</div>
											<a href="/chat/list?mno=${pvo.buyerMno }" class="butn-style2 small text-nowrap">쪽지보내기</a>
											</c:if>
											</td>
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
									href="/product/sellList/${ses.mno }?pageNo=${pgn.startPage-1 }&qty=${pgn.pgvo.qty }&type=${pgn.pgvo.type }">«</a></li>
							</c:if>
							<c:forEach begin="${pgn.startPage }" end="${pgn.endPage }"
								var="i">
								<li class="${pgn.pgvo.pageNo == i ? 'active' : '' }"><a
									href="/product/sellList/${ses.mno }?pageNo=${i }&qty=${pgn.pgvo.qty}&type=${pgn.pgvo.type }">${i }</a></li>
							</c:forEach>
							<c:if test="${pgn.next }">
								<li><a
									href="/product/sellList/${ses.mno }?pageNo=${pgn.endPage+1 }&qty=${pgn.pgvo.qty }&type=${pgn.pgvo.type }">»</a></li>
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
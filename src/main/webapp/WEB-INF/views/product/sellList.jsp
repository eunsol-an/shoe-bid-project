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
			<jsp:include page="../common/mypageMenu.jsp"/>
			<!-- end left panel -->

			<!-- right panel -->
			<div class="col-lg-9">

				<div class="common-block border-0">

					<div class="mb-5">
						<h4 class="mb-0">판매 내역 (${pgn.totalCount })</h4>
					</div>

					<form class="d-flex col-sm-12 col-md-2 ms-auto"
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
							<button class="btn btn-sm btn-dark" type="submit">
								<i class="ti-search"></i>
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
										<td><a href="/product/detail?pno=${pvo.pno }&mno=${ses.mno}"><img
												src="/upload/${fn:replace(pvo.productImg,'\\','/')}" alt="img" class="mypage_img"/></a></td>
										<td class="text-start">
											<a href="/product/detail?pno=${pvo.pno }&mno=${ses.mno}">${pvo.pname }</a>
											<div class="h6 mt-4">입찰가 : <fmt:formatNumber value="${pvo.highestPrice }" pattern="#,###" />원</div>
										</td>
										<td class="product-quantity">${fn:substring(pvo.endTime, 0, (fn:length(pvo.endTime)-3)) }</td>
										<td><c:if test="${pvo.status eq 0 }">
												<div>경매진행중</div>
											</c:if> <c:if test="${pvo.status eq 1 }">
												<div>낙찰</div>
												<a href="/review/register?pno=${pvo.pno }&mno=${pvo.buyerMno }" class="btn btn-sm btn-dark text-nowrap">거래후기</a>
											</c:if> <c:if test="${pvo.status eq 2 }">
												<div>유찰</div>
											</c:if></td>
											<td>
											<c:if test="${pvo.buyerNick ne null }">
											<div>${pvo.buyerNick }</div>
											<a href="/chat/list?mno=${pvo.buyerMno }" class="btn btn-sm btn-dark text-nowrap">채팅하기</a>
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
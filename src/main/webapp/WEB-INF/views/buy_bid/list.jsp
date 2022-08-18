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
			<div class="col-lg-10">

				<div class="common-block border-0">

					<div class="inner-title">
						<h4 class="mb-0">입찰/낙찰 내역</h4>
					</div>

					<form class="d-flex col-sm-12 col-md-6 mx-auto"
						action="/buy_bid/list/${ses.mno }" method="get">
						<input type="hidden" name="pageNo" value="1"> <input
							type="hidden" name="qty" value="${pgn.pgvo.qty }">
						<div class="input-group">
							<c:set value="${pgn.pgvo.type }" var="typed" />
							<select class="form-select" name="type">
								<option ${typed eq null ? 'selected':'' }>선택</option>
								<option value="pd" ${typed eq 'pd' ? 'selected':'' }>전체</option>
								<option value="p" ${typed eq 'p' ? 'selected':'' }>진행중</option>
								<option value="d" ${typed eq 'd' ? 'selected':'' }>종료</option>
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
									<th>입찰일시</th>
									<th>상태</th>
									<th>판매자</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="bvo" items="${list }">
									<tr class="bg-transparent">
										<td><a href="/product/detail?pno=${bvo.pno }&mno=${ses.mno}"><img
												src="/upload/${fn:replace(bvo.productImg,'\\','/')}" alt="img" style="width:200px;"/></a></td>
										<td class="text-start">
											<a href="/product/detail?pno=${bvo.pno }&mno=${ses.mno}">${bvo.pname }</a>
											<div class="h6 mt-4">입찰가 : <fmt:formatNumber value="${bvo.bidPrice }" pattern="#,###" />원</div>
										</td>
										<td class="product-quantity">${fn:substring(bvo.bidAt, 0, (fn:length(bvo.bidAt)-3)) }</td>
										<td><c:if test="${bvo.bidStatus eq 0 }">
												<div>경매진행중</div>
											</c:if> <c:if test="${bvo.bidStatus eq 1 }">
												<div>낙찰완료</div>
												<a href="/review/register?pno=${bvo.pno }&mno=${bvo.writer }" class="butn-style2 small text-nowrap">거래후기 남기기</a>
											</c:if> <c:if test="${bvo.bidStatus eq 2 }">
												<div>낙찰실패</div>
											</c:if></td>
										<td>
											<div>${bvo.nickName }</div>
											<c:if test="${bvo.bidStatus eq 1}">
											<a href="/chat/list?mno=${bvo.writer }" class="butn-style2 small text-nowrap">채팅하기</a>
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
									href="/buy_bid/list/${ses.mno }?pageNo=${pgn.startPage-1 }&qty=${pgn.pgvo.qty }&type=${pgn.pgvo.type }">«</a></li>
							</c:if>
							<c:forEach begin="${pgn.startPage }" end="${pgn.endPage }"
								var="i">
								<li class="${pgn.pgvo.pageNo == i ? 'active' : '' }"><a
									href="/buy_bid/list/${ses.mno }?pageNo=${i }&qty=${pgn.pgvo.qty}&type=${pgn.pgvo.type }">${i }</a></li>
							</c:forEach>
							<c:if test="${pgn.next }">
								<li><a
									href="/buy_bid/list/${ses.mno }?pageNo=${pgn.endPage+1 }&qty=${pgn.pgvo.qty }&type=${pgn.pgvo.type }">»</a></li>
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
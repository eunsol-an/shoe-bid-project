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
			<div class="col-lg-2 col-sm-9 mb-2-3 mb-lg-0">
	
                 <div class="side-bar">
                     <div class="widget border-0">
                         <div class="mb-3">
                             <h5><i class="ti-user pe-2"></i>내 정보</h5>
                         </div>
                         <ul class="list-discount list-unstyled mb-0">
                             <li><a href="/member/mypage?mno=${ses.mno }">프로필정보</a></li>
                             <li><a href="/chat/list?mno=${ses.mno }">채팅하기</a></li>
                             <li><a href="/report/list/${ses.mno }">신고내역</a></li>
                         </ul>
                     </div>
                     <div class="widget border-0">
                         <div class="mb-3">
                             <h5><i class="ti-bag pe-2"></i>쇼핑 정보</h5>
                         </div>
                         <ul class="list-discount list-unstyled mb-0">
                             <li><a href="/buy_bid/list/${ses.mno }">입찰내역</a></li>
                             <li><a href="/product/sellList/${ses.mno }">판매내역</a></li>
                             <li><a href="/interest/list/${ses.mno }">관심상품</a></li>
                             <li><a href="#">리뷰관리</a></li>
                         </ul>
                     </div>
                 </div>
             </div>
			<!-- end left panel -->

			<!-- right panel -->
			<div class="col-lg-9">

				<div>

					<div class="inner-title">
						<h4 class="mb-0">찜 내역</h4>
					</div>

					
					<div class="table-responsive mt-5">
						<table class="table v-align-middle text-center">
							<thead>
								<tr>
									<th>상품이미지</th>
									<th>상품내용</th>
									<th>시작시간</th>
									<th>종료시간</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="itvo" items="${list }">
								<c:if test="${ses.mno eq itvo.mno}">
									<tr class="bg-transparent">
										<td>
										<a class="h5 mt-4" href="/product/detail?pno=${itvo.pno }&mno=${ses.mno}"><img
												src="/upload/${fn:replace(itvo.productImg,'\\','/')}" alt="img" style="width:200px;"/></a>
										</td>
										<td class="text-start">
										<a class="h5 mt-4" href="/product/detail?pno=${itvo.pno }&mno=${ses.mno}">${itvo.pname }</a>
											
											<div class="h6 mt-4">시작가 : <fmt:formatNumber value="${itvo.reservePrice }" pattern="#,###" />원</div>
										</td>
										<td class="product-quantity">${itvo.regAt }</td>
										<td>${itvo.endTime }</td>
										<td><button type="button" id="itDelBtn"
											class="butn-style2 small">삭제</button>
											<span id="readCk" style="display: none;">false</span>
											<span id="mnoVal" style="display: none;">${ses.mno }</span>
											<span id="pnoVal" style="display: none;">${itvo.pno }</span>
											<span id="sesVal" style="display: none;">${ses.mno }</span></td>
									</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
								<c:if test="${list.size() eq 0}">
										<div class="text-center">
											<p class="lead mb-4 mt-3">추가하신 관심 상품이 없습니다.</p>
											<a class="h6 mt-3" href="/">HOME</a>
										</div>
									</c:if>
					</div>
					<div
						class="pagination text-small text-uppercase text-extra-dark-gray">
						<ul>
							<c:if test="${pgn.prev }">
								<li><a
									href="/interest/list/${ses.mno }?pageNo=${pgn.startPage-1 }&qty=${pgn.pgvo.qty }&type=${pgn.pgvo.type }">«</a></li>
							</c:if>
							<c:forEach begin="${pgn.startPage }" end="${pgn.endPage }"
								var="i">
								<li class="${pgn.pgvo.pageNo == i ? 'active' : '' }"><a
									href="/interest/list/${ses.mno }?pageNo=${i }&qty=${pgn.pgvo.qty}&type=${pgn.pgvo.type }">${i }</a></li>
							</c:forEach>
							<c:if test="${pgn.next }">
								<li><a
									href="/interest/list/${ses.mno }?pageNo=${pgn.endPage+1 }&qty=${pgn.pgvo.qty }&type=${pgn.pgvo.type }">»</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
			<!-- end right panel -->
		</div>
	</div>
</section>
<script src="/resources/js/interest.register.js"></script>
<jsp:include page="../common/footer.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/nav.jsp"/>

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
                             <li><a href="/report/list">신고내역</a></li>
                         </ul>
                     </div>
                     <div class="widget border-0">
                         <div class="mb-3">
                             <h5><i class="ti-bag pe-2"></i>쇼핑 정보</h5>
                         </div>
                         <ul class="list-discount list-unstyled mb-0">
                             <li><a href="/buy_bid/list/${ses.mno }">입찰내역</a></li>
                             <li><a href="/product/sellList/${ses.mno }">판매내역</a></li>
                             <li><a href="#">관심상품</a></li>
                             <li><a href="/review/list/${ses.mno }?type=r">후기내역</a></li>
                         </ul>
                     </div>
                 </div>
             </div>
			<!-- end left panel -->

			<!-- right panel -->
			<div class="col-lg-10">

				<div class="common-block border-0">

					<div class="inner-title">
						<h4 class="mb-0">후기내역</h4>
					</div>

					<form class="d-flex col-sm-12 col-md-6 mx-auto"
						action="/review/list/${ses.mno }" method="get">
						<input type="hidden" name="pageNo" value="1"> <input
							type="hidden" name="qty" value="${pgn.pgvo.qty }">
						<div class="input-group">
							<c:set value="${pgn.pgvo.type }" var="typed" />
							<select class="form-select" name="type">
								<option value="r" ${typed eq 'r' ? 'selected':'' }>받은후기</option>
								<option value="s" ${typed eq 's' ? 'selected':'' }>보낸후기</option>
							</select>
							<button class="btn butn-style2" type="submit">
								보기 <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-secondary">${pgn.totalCount }</span>
							</button>
						</div>
					</form>

					<div class="table-responsive mt-5">
						<table class="table v-align-middle text-center">
							<thead>
								
							</thead>
							<tbody>
								<c:forEach var="rvvo" items="${list }">
									<tr class="bg-transparent">
										<td>
											<div class="text-warning">
												<c:forEach begin="1" end="${rvvo.score }">
													<i class="fas fa-star"></i>
												</c:forEach>
												<c:forEach begin="1" end="${5 - rvvo.score }">
													<i class="far fa-star"></i>
												</c:forEach>
											</div>
											<h3 class="mt-2">${rvvo.score }/5</h3>
										</td>
										<td class="text-start">
											<a href="/product/detail?pno=${rvvo.pno }" class="h6">[상품명] ${rvvo.pname }</a>
											<div class="mt-3">${rvvo.content }</div>
											<c:if test="${rvvo.sendMno eq ses.mno }">
											<a href="/review/modify?pno=${rvvo.pno }&mno=${ses.mno}&rvno=${rvvo.rvno}"><small>수정</small></a>
											</c:if>
										</td>
										<td>
											<div>${rvvo.sendNick }</div>
											<small>${fn:substring(rvvo.regAt, 0, fn:indexOf(rvvo.regAt, " ")) }</small>
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
									href="/review/list/${ses.mno }?pageNo=${pgn.startPage-1 }&qty=${pgn.pgvo.qty }&type=${pgn.pgvo.type }">«</a></li>
							</c:if>
							<c:forEach begin="${pgn.startPage }" end="${pgn.endPage }"
								var="i">
								<li class="${pgn.pgvo.pageNo == i ? 'active' : '' }"><a
									href="/review/list/${ses.mno }?pageNo=${i }&qty=${pgn.pgvo.qty}&type=${pgn.pgvo.type }">${i }</a></li>
							</c:forEach>
							<c:if test="${pgn.next }">
								<li><a
									href="/review/list/${ses.mno }?pageNo=${pgn.endPage+1 }&qty=${pgn.pgvo.qty }&type=${pgn.pgvo.type }">»</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
			<!-- end right panel -->
		</div>
	</div>
</section>

<jsp:include page="../common/footer.jsp"/>
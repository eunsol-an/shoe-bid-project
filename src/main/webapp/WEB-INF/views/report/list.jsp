<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />


<section>
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
			<div class="col-lg-10">
					<div class="inner-title">
						<h4 class="mb-0">신고 내역</h4>
					</div>
					
		<table class="table mb-0">
			<thead>
				<tr>
					<th>#</th>
					<th>신고한 회원 </th>
					<th>신고대상 회원</th>
					<th>신고 제목</th>
					<th>신고 시간</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="rpvo">
				<%-- <c:if test="${ses.mno eq rpvo.mno || ses.grade == 99}"> --%>
				<tr>
					<td>${rpvo.rpno }</td>
					<td>${rpvo.nickName }</td>
					<td>${rpvo.targetNickName}</td>
					<td><a
						href="/report/detail?rpno=${rpvo.rpno }&pageNo=${pgn.pgvo.pageNo }&qty=${pgn.pgvo.qty}">${rpvo.reportTitle}</a></td>
					<td>${rpvo.regAt}</td>
				</tr>
				<%-- </c:if> --%>
				</c:forEach>
			</tbody>
		</table>
		<div class="pagination text-small text-uppercase text-extra-dark-gray mt-3">
                                <ul>
                                <c:if test="${pgn.prev }">
								<li><a
									href="/report/list/${ses.mno }?pageNo=${pgn.startPage-1 }&qty=${pgn.pgvo.qty }&type=${pgn.pgvo.type }">«</a></li>
								</c:if>
								<c:forEach begin="${pgn.startPage }" end="${pgn.endPage }"
								var="i">
								<li class="${pgn.pgvo.pageNo == i ? 'active' : '' }"><a
									href="/report/list/${ses.mno }?pageNo=${i }&qty=${pgn.pgvo.qty}&type=${pgn.pgvo.type }">${i }</a></li>
								</c:forEach>
								<c:if test="${pgn.next }">
								<li><a
									href="/report/list/${ses.mno }?pageNo=${pgn.endPage+1 }&qty=${pgn.pgvo.qty }&type=${pgn.pgvo.type }">»</a></li>
								</c:if>
                                </ul>
                            </div>
                            
	</div>
	</div>
	</div>
</section>
<jsp:include page="../common/footer.jsp" />
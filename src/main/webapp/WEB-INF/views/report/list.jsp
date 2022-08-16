<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />


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
				<%-- <c:if test="${ses.mno eq rpvo.mno}"> --%>
				<tr>
					<td>${rpvo.rpno }</td>
					<td>${rpvo.nickName }</td>
					<td>${rpvo.targetNickName}</td>
					<td><a
						href="/report/detail?rpno=${rpvo.rpno }&pageNo=${pgn.pgvo.pageNo }&qty=${pgn.pgvo.qty}">${rpvo.reportTitle}</a></td>
					<td>${rpvo.regAt}</td>
				</tr>
				<%-- </c:if>  --%>
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
	</div>
</section>
<jsp:include page="../common/footer.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />
<section class="page-title-section bg-img cover-background" data-background="img/bg/page-title.jpg">
	<div class="container">
		<div class="title-info">
			<h1>REPORT</h1>
		</div>
		<div class="breadcrumbs-info">
			<ul class="ps-0">
				<li><a href="/">Home</a></li>
				<li><a href="/report/list">신고 리스트</a></li>
			</ul>
		</div>
	</div>
</section>

<section>
	<div class="container">
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
				<tr>
					<td>${rpvo.rpno }</td>
					<td>${rpvo.nickName }</td>
					<td>${rpvo.targetNickName}</td>
					<td><a
						href="/report/detail?rpno=${rpvo.rpno }&pageNo=${pgn.pgvo.pageNo }&qty=${pgn.pgvo.qty}">${rpvo.reportTitle}</a></td>
					<td>${rpvo.regAt}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="pagination text-small text-uppercase text-extra-dark-gray mt-3">
                                <ul>
                                <c:if test="${pgn.prev }">
                                <li class="page-item">
                                        <a class="page-link" aria-label="Previous" href="/report/list?pageNo=${pgn.startPage-1 }&qty=${pgn.pgvo.qty}">
                                    <span aria-hidden="true">&laquo;</span>
                                  </a>
                                    </li>
                                </c:if>
                                <c:forEach begin="${pgn.startPage }" end="${pgn.endPage }" var="i">
                                    <li class="page-item ${pgn.pgvo.pageNo == i ? 'active': '' }"><a href="/report/list?pageNo=${i }&qty=${pgn.pgvo.qty}">${i }</a></li>
                                </c:forEach>
                                <c:if test="${pgn.next }">
                                    <li class="page-item">
                                        <a class="page-link" href="/report/list?pageNo=${pgn.endPage + 1 }&qty=${pgn.pgvo.qty}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                  </a>
                                    </li>
                                </c:if>
                                </ul>
                            </div>
	</div>
</section>
<jsp:include page="../common/footer.jsp" />
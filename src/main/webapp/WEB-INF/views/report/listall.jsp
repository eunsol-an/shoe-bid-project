<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<c:choose>
<c:when test="${ses.grade == 0 }">
<section class="md">
	<div class="container">
		<div class="row justify-content-center">
			<!-- left panel -->
			<jsp:include page="../common/mypageMenu.jsp" />
			<!-- end left panel -->

			<!-- right panel -->
			<div class="col-lg-10">

				<div class="common-block border-0">

					<div class="inner-title">
						<h4 class="mb-0">신고 리스트</h4>
					</div>


					<table class="table mb-0">
						<thead>
							<tr>
								<th>신고번호</th>
								<th>신고한 회원</th>
								<th>신고대상 회원</th>
								<th>신고 제목</th>
								<th>신고 시간</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${listall }" var="rpvo">
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
					<c:if test="${listall.size() eq 0}">
						<div class="text-center">
							<p class="lead mb-4 mt-3">신고 내역이 없습니다.</p>
							<a class="h6 mt-3" href="/">HOME</a>
						</div>
					</c:if>
					<div
						class="pagination text-small text-uppercase text-extra-dark-gray mt-3">
						<ul>
							<c:if test="${pgn.prev }">
								<li><a
									href="/report/listall/${ses.mno }?pageNo=${pgn.startPage-1 }&qty=${pgn.pgvo.qty }&type=${pgn.pgvo.type }">«</a></li>
							</c:if>
							<c:forEach begin="${pgn.startPage }" end="${pgn.endPage }"
								var="i">
								<li class="${pgn.pgvo.pageNo == i ? 'active' : '' }"><a
									href="/report/listall/${ses.mno }?pageNo=${i }&qty=${pgn.pgvo.qty}&type=${pgn.pgvo.type }">${i }</a></li>
							</c:forEach>
							<c:if test="${pgn.next }">
								<li><a
									href="/report/listall/${ses.mno }?pageNo=${pgn.endPage+1 }&qty=${pgn.pgvo.qty }&type=${pgn.pgvo.type }">»</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>

	</div>
</section>
</c:when>

<c:otherwise>
<section class="md">
			    <div class="container">
			        <div class="row justify-content-center">
			            <div class="col-lg-8">
			
			                <div class="text-center p-5">
			
			                    <div class="mb-5">
			                        <h2>권한이 필요한 페이지입니다.</h2>
			                    </div>
			
			                    <a href="/member/mypage?mno=${ses.mno }" class="btn btn-dark wide m-1"><span><i class="fas fa-arrow-left me-2"></i>마이페이지로 돌아가기</span></a>
			                    <a href="/product/list" class="btn btn-dark wide m-1"><span>다른 상품 둘러보기<i class="fas fa-arrow-right me-2"></i></span></a>
			
			                </div>
			
			            </div>
			        </div>
			    </div>
			</section>
</c:otherwise>
</c:choose>

<jsp:include page="../common/footer.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />
<section class="md">
	<div class="container">
		<div class="row justify-content-center">

			<div class="col-lg-6">

				<div class="common-block">
					<div class="inner-title">
						<h4 class="mb-0">아이디 찾기 결과</h4>

					</div>
					<div class="row">
						<div class="col-sm-12">
					<c:choose>
					<c:when test="${list.size() eq 0 }">
					<p class="mb-0">가입 정보를 찾을 수 없습니다</p>
					</c:when>
						
						<c:otherwise>
					<c:forEach items="${list }" var="id">
						<p class="mb-0">입력하신 정보로 아래의 아이디를 찾았습니다</p>
						<c:if test="${id ne null }">
								<c:set var = "length" value = "${fn:length(id)}"/>
								<p class="mb-0">회원님의 아이디는 ${fn:substring(id, 0, length-3) }
								<c:forEach begin="${fn:length(id)-2 }" end="${fn:length(id) }" step="1">
								*
								</c:forEach> 입니다<br>
								전체아이디는 관리자에게 문의해 주세요</p>
						</c:if>
					</c:forEach>
						</c:otherwise>
						</c:choose>
						</div>

					</div>
					<button type="button" class="butn-style2 mt-4"
					onclick="location.href='/member/login';">로그인
					</button>
					<c:if test="${list.size() eq 0 }">
					<button type="button" class="butn-style2 mt-4"
					onclick="location.href='/member/searchID';">아이디찾기
					</button>
					</c:if>
					<button type="button" class="butn-style2 mt-4"
						onclick="location.href='/member/searchPwd';">비밀번호찾기</button>
					<button type="button" class="butn-style2 mt-4"
						onclick="location.href='/';">취소</button>

				</div>

			</div>

		</div>
	</div>
</section>
<jsp:include page="../common/footer.jsp" />
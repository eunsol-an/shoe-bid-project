<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/nav.jsp"/>

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
							회원정보가 없습니다
						</div>

					</div>
					<button type="button" class="butn-style2 mt-4"
					onclick="location.href='/member/searchPwd';">뒤로가기
					</button>
					<button type="button" class="butn-style2 mt-4"
						onclick="location.href='/';">취소</button>

				</div>

			</div>

		</div>
	</div>
</section>

<jsp:include page="../common/footer.jsp"/>
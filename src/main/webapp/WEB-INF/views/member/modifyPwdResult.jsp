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
						<h4 class="mb-0">비밀번호 변경 결과</h4>

					</div>
					<div class="row">
						<div class="col-sm-12">
					<p class="mb-0">비밀번호가 변경되었습니다</p>
						
						</div>

					</div>
					<button type="button" class="butn-style2 mt-4"
					onclick="location.href='/member/login';">로그인
					</button>
					
					<button type="button" class="butn-style2 mt-4"
						onclick="location.href='/';">메인화면으로가기</button>

				</div>

			</div>

		</div>
	</div>
</section>
<jsp:include page="../common/footer.jsp"/>
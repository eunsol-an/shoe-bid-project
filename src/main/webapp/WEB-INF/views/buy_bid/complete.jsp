<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/nav.jsp"/>

<!-- PAGE TITLE
================================================== -->
<section class="page-title-section bg-img cover-background" data-background="/resources/bootstrap/img/bg/page-title.png">
    <div class="container">

        <div class="title-info text-center">
            <h1>Success!</h1></div>
        <div class="breadcrumbs-info text-center">
            <ul class="ps-0">
                <li><a href="/">Home</a></li>
                <li><a href="#">Success</a></li>
            </ul>
        </div>

    </div>
</section>

<!-- CHECKOUT COMPLETE
================================================== -->
<section class="md">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">

                <div class=" text-center">

                    <div class="mb-5">
                        <h3 class="mb-0">입찰이 완료되었습니다.</h3>
                    </div>

                    <p class="lead mb-4">
                        입찰 내역은 마이페이지에서 확인하실 수 있습니다.
                    </p>

                    <a href="/buy_bid/list/${ses.mno }" class="btn btn-dark">입찰내역확인</a>
                    <a href="/product/list" class="btn btn-dark">다른상품둘러보기</a>

                </div>

            </div>
        </div>
    </div>
</section>

<jsp:include page="../common/footer.jsp"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/nav.jsp"/>

<!-- PASSWORD RECOVERY
        ================================================== -->
        <section class="md">
            <div class="container">
                <div class="row justify-content-center">

                    <div class="col-lg-6">

                        <div class="common-block">

                            <div class="inner-title">
                                <h4 class="mb-0">Forgot your ID?</h4>
                                <p class="mb-0">Forgot your email empowers you.</p>
                            </div>

                            <form method="post" action="/member/searchIDResult" >

                                <div class="row">

                                    <div class="col-sm-12 mb-2">

                                        <div class="form-group">
                                            <label>Enter Your Email Address</label>
                                            <input type="email" class="form-control" name="email" placeholder="이메일을 입력해주세요" id="email">
                                        </div>

                                    </div>

                                </div>
								<div id="emailCheck"></div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <a href="/member/login" class="m-link-muted">로그인</a>
                                    </div>

                                </div>

                                <button type="submit" class="butn-style2 mt-4" id="findBtn">아이디찾기</button>
                                <button type="button" class="butn-style2 mt-4" onclick="location.href='/';">취소</button>
                            </form>

                        </div>

                    </div>

                </div>
            </div>
        </section>
<script src="/resources/js/member.findid.js"></script>
<jsp:include page="../common/footer.jsp"/>
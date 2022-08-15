<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/nav.jsp"/>

<section class="md">
            <div class="container">
                <div class="row">

                    <div class="col-lg-12">

                        <div class="common-block">

                            <div class="inner-title">
                                <h4 class="mb-0">로그인</h4>
                                <p class="mb-0">Everything is simple with Login.</p>
                            </div>

                            <form action="/member/login" method="post">

                                <div class="row">

                                    <div class="col-sm-12">

                                        <div class="form-group">
                                            <label>아이디</label>
                                            <input type="text" class="form-control" name="id" placeholder="아이디">
                                        </div>

                                    </div>

                                    <div class="col-sm-12">

                                        <div class="form-group">
                                            <label>비밀번호</label>
                                            <input type="password" class="form-control" name="pwd" placeholder="비밀번호">
                                        </div>

                                    </div>

                                </div>

                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-check">
                                        </div>
                                    </div>
                                    <div class="col-sm-6 text-start text-md-end">
                                    <button type="button" class="butn-style2 mt-4">
                                    	<a href="/member/register" class="m-link-muted">회원가입</a>
                                    </button>
                                    <button type="button" class="butn-style2 mt-4">
                                    	<a href="/member/searchID" class="m-link-muted">아이디찾기</a>
                                    </button>
                                    <button type="button" class="butn-style2 mt-4">
                                        <a href="account-password-recovery.html" class="m-link-muted">비밀번호찾기</a>
                                    </button>
                                    </div>

                                </div>

                                <button type="submit" class="butn-style2 mt-4">로그인</button>

                            </form>

                        </div>

                    </div>

                </div>
            </div>
        </section>

<jsp:include page="../common/footer.jsp"/>
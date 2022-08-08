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
                                            <input class="form-check-input" type="checkbox" value="" id="login-remember">
                                            <label class="form-check-label" for="login-remember">Keep me signed in</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 text-start text-md-end">
                                        <a href="account-password-recovery.html" class="m-link-muted">Forgot password?</a>
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
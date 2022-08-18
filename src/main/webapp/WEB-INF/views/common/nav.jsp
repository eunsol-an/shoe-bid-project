<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<body>

   

    <!-- MAIN WRAPPER
    ================================================== -->
    <div class="main-wrapper mp-pusher" id="mp-pusher">

        <!-- HEADER
        ================================================== -->
        <header class="fixed header-light-nav header-02">
        
        	<div id="top-bar" class="py-1">
                <div class="container-fluid">
                    <div class="row">
                        <div class="container">
                            <ul class="top-nav display-31 px-2">
                            	<c:if test="${ses.mno eq null }">
                                <li><a href="/member/login">로그인</a></li>
                                <li><a href="/member/register">회원가입</a></li>
                                </c:if>
                                <c:if test="${ses.mno ne null }">
                                <li>${ses.nickName } 님</li>
                                <li><a href="/member/logout">로그아웃</a></li>
                                <li><a href="/product/register">경매등록</a></li>
                                </c:if>
                            </ul>

                        </div>
                    </div>
                </div>
            </div>

            <div class="navbar-default">

                <!-- top search -->
                <div class="top-search bg-primary">
                    <div class="container-fluid">
                        <form class="search-form" action="#" method="GET">
                            <div class="input-group">
                                <span class="input-group-addon cursor-pointer">
                                    <button class="search-form_submit fas fa-search display-27 text-white" type="submit"></button>
                                </span>
                                <input type="text" class="search-form_input form-control" name="s" autocomplete="off" placeholder="Type & hit enter...">
                                <span class="input-group-addon close-search"><i class="fas fa-times display-27 mt-2"></i></span>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- end top search -->

                <div class="container">
                    <div class="row align-items-center g-0">
                        <div class="col-12 col-lg-12">
                            <div class="menu_area alt-font">
                                <nav class="navbar navbar-expand-lg navbar-light p-0">

                                    <div class="navbar-header navbar-header-custom">
                                        <!-- logo -->
                                        <a href="/" class="navbar-brand logodefault"><img id="logo" src="/resources/bootstrap/img/logos/logo_shoebid.png" alt="logo"></a>
                                        <!-- end logo -->
                                    </div>

                                    <!-- menu toggler -->
                                    <div class="navbar-toggler"></div>
                                    <!-- end menu toggler -->

                                    <!-- menu area -->
                                    <ul class="navbar-nav ms-auto" id="nav" style="display: none;">

                                        <li><a href="/product/list">Shop</a>
                                        </li>
                                        <li><a href="/about">About</a>
                                        </li>
                                        <li>
                                        <c:if test="${ses.mno eq null }">
                                        <a href="/member/login">Mypage</a>
                                        </c:if>
                                        <c:if test="${ses.mno ne null }">
                                        <a href="/member/mypage?mno=${ses.mno }">Mypage</a>
                                        </c:if>
                                        </li>
                                    </ul>
                                    <!-- end menu area -->
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </header>
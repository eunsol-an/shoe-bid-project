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
                                            <ul>
                                                <li><a href="/product/list?type=s">Sneakers</a></li>
                                                <li><a href="/product/list?type=ai">Sandals/Slippers</a></li>
                                                <li><a href="/product/list?type=lf">Loafers/Flat</a></li>
                                                <li><a href="/product/list?type=b">Boots</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">About</a>
                                        </li>
                                        <li><a href="#">Mypage</a>
                                            <ul>
                                            <c:if test="${ses.mno eq null }">
                                                <li><a href="/member/login">Login</a></li>
                                            </c:if>
                                            <c:if test="${ses.mno ne null }">
                                                <li><a href="/member/logout">Logout</a></li>
                                                <li><a href="/member/mypage?mno=${ses.mno }">My Profile</a></li>
                                            </c:if>
                                            <c:if test="${ses.mno eq null }">
                                                <li><a href="/member/register">Member Register</a></li>
                                            </c:if>
                                            <c:if test="${ses.grade == 99 }">
                                                <li><a href="/member/list">Member List</a></li>
                                            </c:if>
                                            <c:if test="${ses.mno ne null }">
                                                <li><a href="/product/register">Product Register</a></li>
                                                <li><a href="/report/register">Report Register</a></li>
                                            </c:if>
                                            <c:if test="${ses.grade == 99 }">
                                                <li><a href="/report/list">Report List</a></li>
                                            </c:if>
                                            </ul>
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
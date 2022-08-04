<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<body>

   

    <!-- MAIN WRAPPER
    ================================================== -->
    <div class="main-wrapper mp-pusher" id="mp-pusher">

        <!-- HEADER
        ================================================== -->
        <header class="fixed header-light-nav">

            <div id="top-bar">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-3 col-md-6">
                            <div class="top-bar-info">
                                <ul class="ps-0">
                                    <li><a href="tel:01234567890"><i class="ti-mobile"></i><span class="d-none d-md-inline-block ps-2">(+123) 456 7890</span></a></li>
                                    <li><a href="mailto:addyour@emailhere"><i class="ti-email"></i><span class="d-none d-md-inline-block ps-2">addyour@emailhere</span></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-9 col-md-6">
                            <ul class="top-nav ps-0">
                                <li class="nav-item dropdown">
                                    <a href="#" data-bs-toggle="dropdown" class="dropdown-toggle"><i class="far fa-user"></i></a>
                                    <ul class="dropdown-menu p-4">
                                        <li class="mb-2">
                                            <div class="media align-items-center">
                                                <img class="w-40px rounded-circle me-3" src="resources/bootstrap/img/avatar/01.png" alt="...">
                                                <div class="media-body">Nancy Miller</div>
                                            </div>

                                        </li>
                                        <li>
                                            <a href="#" class="dropdown-item">My Profile</a>
                                        </li>
                                        <li>
                                            <a href="#" class="dropdown-item">Order List</a>
                                        </li>
                                        <li>
                                            <a href="#" class="dropdown-item">Log Out</a>
                                        </li>
                                    </ul>
                                </li>

                                <li><a href="#"><i class="far fa-heart"></i></a></li>
                                <li>
                                    <select>
                                        <option>English</option>
                                        <option>Deutsch</option>
                                        <option>Italiano</option>
                                    </select>
                                </li>
                                <li>
                                    <select>
                                        <option>$ USD</option>
                                        <option>€ EUR</option>
                                        <option>£ UKP</option>
                                        <option>¥ JPY</option>
                                    </select>
                                </li>
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

                <div class="container-fluid p-0">
                    <div class="row align-items-center g-0">
                        <div class="col-12 col-lg-12">
                            <div class="menu_area alt-font">
                                <nav class="navbar navbar-expand-lg navbar-light p-0">

                                    <!-- category toggler -->
                                    <a href="#" id="trigger" class="menu-trigger"><i class="ti-menu"></i></a>
                                    <!-- end category toggler -->

                                    <div class="navbar-header navbar-header-custom">
                                        <!-- d -->
                                        <a href="index.html" class="navbar-brand logodefault"><img id="logo" src="img/logos/logo.png" alt="logo"></a>
                                        <!-- end logo -->
                                    </div>

                                    <!-- menu toggler -->
                                    <div class="navbar-toggler"></div>
                                    <!-- end menu toggler -->

                                    <!-- menu area -->
                                    <ul class="navbar-nav mx-auto" id="nav" style="display: none;">

                                        <li><a href="#">홈</a>
                                            <ul>
                                                <li><a href="home-shop-1.html">Home 01</a></li>
                                               
                                            </ul>
                                        </li>
                                        <li><a href="#">상품</a>
                                            <ul>
                                                <li><a href="about-us.html">About Us</a></li>
                                                <li><a href="contact-us.html">Contacts</a></li>
                                               
                                            </ul>
                                        </li>
                                        <li><a href="#">마이 페이지</a>
                                            <ul>
                                                <li><a href="login-register.html">Login / Register</a></li>
                                                <li><a href="account-password-recovery.html">Password Recovery</a></li>
                                               
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
        
        <!-- CATEGORY MP-MENU
        ================================================== -->
        <div id="mp-menu" class="mp-menu">
            <div class="mp-level">
                <h2>All Categories</h2>
                <ul>
                    <li class="mp-has-sub">
                        <a href="#">Devices</a>
                        <div class="mp-level">
                            <h2>Devices</h2>
                            <a class="mp-back" href="#">back</a>
                            <ul>
                                <li class="mp-has-sub">
                                    <a href="#">Mobiles Phones</a>
                                    <div class="mp-level">
                                        <h2>Mobile Phones</h2>
                                        <a class="mp-back" href="#">back</a>
                                        <ul>
                                            <li><a href="#">Apple Mobile</a></li>
                                            <li><a href="#">OnePlus Mobile</a></li>
                                            <li><a href="#">Lenovo Mobile</a></li>
                                            <li><a href="#">Micromax Mobile</a></li>
                                        </ul>
                                    </div>
                                </li>
                                <li class="mp-has-sub">
                                    <a href="#">Laptops</a>
                                    <div class="mp-level">
                                        <h2>Laptops</h2>
                                        <a class="mp-back" href="#">back</a>
                                        <ul>
                                            <li><a href="#">Thin Laptops</a></li>
                                            <li><a href="#">2-in-1 Laptops</a></li>
                                            <li><a href="#">Gaming Laptops</a></li>
                                            <li><a href="#">Budget Laptops</a></li>
                                            <li><a href="#">Light Laptops</a></li>
                                        </ul>
                                    </div>
                                </li>
                                <li class="mp-has-sub">
                                    <a href="#">Televisions</a>
                                    <div class="mp-level">
                                        <h2>Televisions</h2>
                                        <a class="mp-back" href="#">back</a>
                                        <ul>
                                            <li><a href="#">Smart TV</a></li>
                                            <li><a href="#">Full HD TV</a></li>
                                            <li><a href="#">Android TV</a></li>
                                            <li><a href="#">4K TV</a></li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="mp-has-sub">
                        <a href="#">Beauty &amp; Health</a>
                        <div class="mp-level">
                            <h2>Beauty &amp; Health</h2>
                            <a class="mp-back" href="#">back</a>
                            <ul>
                                <li><a href="#">Grooming</a></li>
                                <li><a href="#">Luxury Beauty</a></li>
                                <li><a href="#">Make-up</a></li>
                                <li><a href="#">Personal Care</a></li>
                                <li><a href="#">Nutrition Care</a></li>
                                <li><a href="#">Health Care</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="mp-has-sub">
                        <a href="#">Store</a>
                        <div class="mp-level">
                            <h2>Store</h2>
                            <a class="mp-back" href="#">back</a>
                            <ul>
                                <li class="mp-has-sub">
                                    <a class="icon icon-t-shirt" href="#">Clothes</a>
                                    <div class="mp-level">
                                        <h2 class="icon icon-t-shirt">Clothes</h2>
                                        <a class="mp-back" href="#">back</a>
                                        <ul>
                                            <li>
                                                <a class="icon icon-female" href="#">Women's Clothing</a>
                                            </li>
                                            <li>
                                                <a class="icon icon-male" href="#">Men's Clothing</a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                                <li>
                                    <a class="icon icon-diamond" href="#">Watches</a>
                                </li>
                                <li>
                                    <a class="icon icon-music" href="#">Shoes</a>
                                </li>
                                <li>
                                    <a class="icon icon-food" href="#">Jewellery</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li><a href="#">Books &amp; Audible</a></li>
                    <li><a href="#">Movies &amp; Games</a></li>
                </ul>

            </div>
        </div>
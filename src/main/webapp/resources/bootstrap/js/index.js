(function($) {

    "use strict";

    var $window = $(window);

    /*------------------------------------
        01. Resize function
    --------------------------------------*/

    $window.resize(function(event) {
        setTimeout(function() {
            SetResizeContent();
        }, 500);
        event.preventDefault();
    });

    /*------------------------------------
        02. FullScreenHeight function
    --------------------------------------*/

    function fullScreenHeight() {
        var element = $(".full-screen");
        var $minheight = $window.height();
        element.css('min-height', $minheight);
    }

    /*------------------------------------
        03. ScreenFixedHeight function
    --------------------------------------*/

    function ScreenFixedHeight() {
        var $headerHeight = $("header").height();
        var element = $(".screen-height");
        var $screenheight = $window.height() - $headerHeight;
        element.css('height', $screenheight);
    }

    /*------------------------------------
        04. FullScreenHeight and screenHeight with resize function
    --------------------------------------*/        

    function SetResizeContent() {
        fullScreenHeight();
        ScreenFixedHeight();
    }

    SetResizeContent();

    $(document).ready(function() {

        // Inner page slider
        $('.inner-page-slide').owlCarousel({
            loop: true,
            nav: false,
            dots: true,
            autoplay: true,
            autoplayTimeout: 5000,
            responsiveClass: true,
            autoplayHoverPause: false,
            smartSpeed:1000,
            margin: 10,
            responsive: {
                0: {
                    items: 1
                },
                576: {
                    items: 2
                },
                992: {
                    items: 3
                },
                1200: {
                    items: 4
                }
            }
        });

        // Inner page slider
        $('.blog-page-slide').owlCarousel({
            loop: true,
            nav: false,
            dots: false,
            autoplay: true,
            autoplayTimeout: 5000,
            responsiveClass: true,
            autoplayHoverPause: false,
            smartSpeed:1000,
            margin: 10,
            responsive: {
                0: {
                    items: 1
                },
                576: {
                    items: 2
                },
                992: {
                    items: 3
                },
                1200: {
                    items: 3
                }
            }
        });

        $(".animate-redirect a[href^='#']").click(function(e) {
            e.preventDefault();

            var position = $($(this).attr("href")).offset().top;

            $("body, html").animate({
                scrollTop: position
            }, 1000);
        });

        // scroll to top
        $window.on('scroll', function() {
            if ($(this).scrollTop() > 500) {
                $(".scroll-to-top").fadeIn(400);

            } else {
                $(".scroll-to-top").fadeOut(400);
            }
        });

        $(".scroll-to-top").on('click', function(event) {
            event.preventDefault();
            $("html, body").animate({
                scrollTop: 0
            }, 600);
        });

        $('.countup').counterUp({
            delay: 50,
            time: 2000
        });  

        // Current Year
        $('.current-year').text(new Date().getFullYear());

    });

})(jQuery);        
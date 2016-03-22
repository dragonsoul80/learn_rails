  $(function () {
    $(window).on("load resize", function() {
        $(".fill-screen").css("height", window.innerHeight);
    });

    // Add Bootstrap's scrollspy
    $('body').scrollspy({
        target: '.navbar',
    });

    //smooth scrolling
    $('nav a, .down-button a').bind('click', function() {
        $('html, body').stop().animate({
            scrollTop: $($(this).attr('href')).offset().top
        }, 1500, 'easeInOutExpo');
        event.preventDefault();
    });
    
    // parallax scrolling with stellar.js
    $(window).stellar();
  });
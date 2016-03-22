$(document).ready(function() {

    $(window).scroll(function(){

        var wScroll = $(this).scrollTop();

        $('.logo').css({
            'transform' : 'translate(0px, '+wScroll /2 +'%)'
        });

        $('.fore-logo').css({
            'transform' : 'translate(0px, -'+wScroll /7 +'%)'
        });
        
        // Add effect to each portfolio pic
        if(wScroll > $('.interest').offset().top - ($(window).height() /1.2) ) {

            $('.interest figure').each(function(i){

                setTimeout(function(){
                $('.interest figure').eq(i).addClass('is-showing');
            }, 150 * (i+1));
            
        });
         
        }

        if(wScroll > $('.specialize').offset().top - $(window).height()){
            $('.specialize').css({'background-position':'center'+ (wScroll - $('.specialize').offset().top) + 'px'});

            var opacity = (wScroll - $('.specialize').offset().top + 400) / (wScroll / 4)

            $('.window-tint').css({'opacity': opacity});
        }

        if(wScroll > $('.portfolio-posts').offset().top - $(window).height()){

            var offset = Math.min(0, wScroll - $('.portfolio-posts').offset().top 
            +$(window).height() - 600);

            $('.post-1').css({'transform': 'translate('+ offset + 'px,' + Math.abs(offset * 0.2) + 'px)'});

            $('.post-3').css({'transform': 'translate('+ Math.abs(offset) + 'px,' + Math.abs(offset * 0.2) + 'px)'});
    }

});

// Animated Skills progress bar with CSS3

   $('.skillbar').each(function(){
        $(this).find('.skillbar-bar').animate({
            width:$(this).attr('data-percent')
        },6000);
    });

});
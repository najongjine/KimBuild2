//gnb menu
(function($){
    $(document).ready(function(){
		$('#gnb').on({
			'mouseenter focusin':function() {
				$(".gnb_bg").stop().animate({"height":"170px"},500);
				$("#gnb .depth2").stop().animate({"height":"230px"},500);
				$("#gnb .depth2 > li").on("mouseenter focusin", function(){
					$("#gnb .depth2 li").not(this).removeClass("on");
					$(this).addClass("on");
				});
			},'mouseleave focusout':function(){
				$("#gnb .depth2").stop().animate({"height":"60px"},500);
				$("#gnb .depth2 li").removeClass("on");
				$(".gnb_bg").stop().animate({"height":"0"},600);
			}
		});

		$('#lnb li.active').addClass('open').children('ul').show();
        $('#lnb li.has_sub>a').on('click', function(){
            $(this).removeAttr('href');
            var element = $(this).parent('li');
            if (element.hasClass('open')) {
                element.removeClass('open');
                element.find('li').removeClass('open');
                element.find('ul').slideUp(200);
            }
            else {
                element.addClass('open');
                element.children('ul').slideDown(200);
                element.siblings('li').children('ul').slideUp(200);
                element.siblings('li').removeClass('open');
                element.siblings('li').find('li').removeClass('open');
                element.siblings('li').find('ul').slideUp(200);
            }
        });
    });
})(jQuery);

$(document).ready(function(){
  $( '.btn_top' ).click( function() {
    $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
  return false;
  } );
	//search
	$(".search_detail").hide();
    $(".search_block").show();
    $(".btn_detail").click(function(){
        if($('.search_detail').is(":hidden")){
             $(".search_detail").slideDown("4000");
             $(".btn_search i").removeClass("fa-caret-down").addClass("fa-caret-up");
        }else{
            $(".search_detail").slideUp("4000");
            $(".btn_search i").removeClass("fa-caret-up").addClass("fa-caret-down");
        }
    });

	var selectTarget = $('.search_select select');
    selectTarget.on('blur', function(){
        $(this).parent().removeClass('focus');
    });
    selectTarget.change(function(){
        var select_name = $(this).children('option:selected').text();
        $(this).siblings('label').text(select_name);
    });

	//tab
	$(".tab_content").hide();
    $(".tab_content:first").show();
	$(".tab_menu a").click(function(event) {
		event.preventDefault(); //주소에 #숨김
		$(this).parent().addClass("current");
		$(this).parent().siblings().removeClass("current");
		var tab = $(this).attr("href");
		$(".tab_content").not(tab).hide();
		$(tab).fadeIn();
	});

});

//팝업
function view_show(num) {
	var left = ( $(window).scrollLeft() + ( $(window).width() - $('.popup').width()) / 2 );
	var top = ( $(window).scrollTop() + ( $(window).height() - $('.popup').height()) / 2 );
	$('.popup').css({'left':left,'top':top, 'position':'absolute'});
	document.getElementById("dispay_view"+num).style.display = "block";
	//document.getElementById("layer_bg").style.display = "block";
 }
 function view_hide(num) {
    document.getElementById("dispay_view"+num).style.display = "none";
    //document.getElementById("layer_bg").style.display = "none";
 }

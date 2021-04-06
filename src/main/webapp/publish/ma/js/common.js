/*$(function(){
	$(".gnb").hover(function(){
		if($(".subWrap").is(":hidden")){
			$(".subWrap").slideDown();
			$(".gnb_bg").slideDown();
		}else{
			$(".subWrap").show();
			$(".gnb_bg").show();
		}
		$(".gnb > li").on("mouseenter focusin",function(){
			$(".gnb > li > a").removeClass("current");
			$(this).children().addClass("current");
		});
	});
	$(".gnb").on("mouseenter focusin",function(){
		if($(".subWrap").is(":hidden")){
			$(".subWrap").slideDown();
			$(".gnb_bg").slideDown();
		}else{
			$(".subWrap").show();
			$(".gnb_bg").show();
		}
		$(".gnb > li").on("mouseenter focusin",function(){
			$(".gnb > li > a").removeClass("current");
			$(this).children().addClass("current");
		});
	});
	$(".gnb").on("mouseleave blur",function(){
		$(".subWrap").slideUp();
		$(".gnb_bg").slideUp();
	});
	$(".gnb > li").on("mouseleave blur",function(){
		$(this).children().removeClass("current");
	});
	$('*:not(".gnb *")').focus(function(){
		$(".subWrap").slideUp();
		$(".gnb > li > a").removeClass("current");
		$(".gnb_bg").slideUp();
	});
});*/

//left menu
(function($){
    $(document).ready(function(){
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
        
        $('.numOnly').keydown(function(event) {
		 	this.value=this.value.replace(/[^0-9]/g,'');
		 });
		 $('.numOnly').keyup(function(event) {
		 	this.value=this.value.replace(/[^0-9]/g,'');
		 });
	     $('body').mousedown(function(event) {
			 $('.numOnly').each(function(){
		 		this.value=this.value.replace(/[^0-9]/g,'');
			 })
		 });
    });
})(jQuery);

$(document).ready(function(){
	//leftarea on off
/*	$('.btn_sideClose').click(function(){
    if ($('.btn_sideClose').hasClass('open')) {
      $(this).removeClass('open');
      $('#left_content').stop().animate({"left":"0"},500);
	  $('#content').stop().animate({"padding-left":"210px"},500);
    }else {
      $(this).addClass('open');
      $('#left_content').stop().animate({"left":"-210px"},500);
	  $('#content').stop().animate({"padding-left":"0"},500);
    }
  });
  $('.btn_sideOpen').click(function(){
    $('#left_content').stop().animate({"left":"0"},500);
	 $('#content').stop().animate({"padding-left":"210px"},500);
    $(this).hide();
    $('.btn_sideClose').show();
});*/


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
		event.preventDefault();
		$(this).parent().addClass("current");
		$(this).parent().siblings().removeClass("current");
		var tab = $(this).attr("href");
		$(".tab_content").not(tab).css("display", "none");
		$(tab).fadeIn();
	});
	
	
	/* tab */
	
	 // main tab
    $(".main_tabCcontent").hide();
    $(".main_tabCcontent:first").show();
    $("#mainTab a").click(function(event) {
        event.preventDefault(); //주소에 #숨김
        $(this).parent().addClass("current");
        $(this).parent().siblings().removeClass("current");
        var tab = $(this).attr("href");
        $(".main_tabCcontent").not(tab).css("display", "none");
        $(tab).fadeIn();
    });
    // main tab
   $(".main_tabCcontent2").hide();
   $(".main_tabCcontent2:first").show();
   $("#mainTab2 a").click(function(event) {
       event.preventDefault(); //주소에 #숨김
       $(this).parent().addClass("current");
       $(this).parent().siblings().removeClass("current");
       var tab = $(this).attr("href");
       $(".main_tabCcontent2").not(tab).css("display", "none");
       $(tab).fadeIn();
   });
    //sub tab1
    $(".tab_content1").hide();
    $(".tab_content1:first").show();
    $("#tab1 a").click(function(event) {
        event.preventDefault(); //주소에 #숨김
        $(this).parent().addClass("current");
        $(this).parent().siblings().removeClass("current");
        var tab = $(this).attr("href");
        $(".tab_content1").not(tab).css("display", "none");
        $(tab).fadeIn();
    });
    //sub tab2
    $(".tab_content2").hide();
    $(".tab_content2:first").show();
    $("#tab2 a").click(function(event) {
        event.preventDefault(); //주소에 #숨김
        $(this).parent().addClass("active");
        $(this).parent().siblings().removeClass("active");
        var tab = $(this).attr("href");
        $(".tab_content2").not(tab).css("display", "none");
        $(tab).fadeIn();
    });
	
	
});

//팝업
function view_show(num) {
  var left = ( $(window).scrollLeft() + ( $(window).width() - $('.popup').width()) / 2 );
  var top = ( $(window).scrollTop() + ( $(window).height() - $('.popup').height()) / 2 );
  $('.popup').css({'left':left,'top':top, 'position':'absolute'});
  document.getElementById("dispay_view"+num).style.display = "block";
  document.getElementById("layer_bg").style.display = "block";
}

function view_hide(num) {
  document.getElementById("dispay_view"+num).style.display = "none";
  document.getElementById("layer_bg").style.display = "none";
}

var fncDate = function(){
	var setDate = arguments;
	var getId;
	var fmt = "yy.mm.dd";
	switch (setDate.length) {
		case 1: getId ="#"+setDate[0];break;
		case 2: if(setDate[1] != ''){getId ="#"+setDate[0]+", #"+setDate[1];break;}else{getId ="#"+setDate[0];break;}
		case 3: if(setDate[1] != ''){getId ="#"+setDate[0]+", #"+setDate[1];fmt=setDate[2];break;}else{getId ="#"+setDate[0];fmt=setDate[2];break;}
	}
	
	 var dates = $( getId ).datepicker({
      changeMonth: true,
      changeYear: true,
      showOn: "button",
      buttonImage: "/publish/ma/images/icon_calendar.png",
      buttonImageOnly: true,
      dateFormat : fmt,
      onSelect: function( selectedDate ) {
          var option = this.id == setDate[0] ? "minDate" : "maxDate",
          instance = $( this ).data( "datepicker" ),
          date = (fmt == 'yy.mm' ? new Date(instance.selectedYear, instance.selectedMonth, 1) : $.datepicker.parseDate( $.datepicker._defaults.dateFormat, selectedDate, instance.settings ))
    	  dates.not( this ).datepicker( "option", option, date );
      }
  });
}

var getMenuCd = function(str){alert(str);
	 var rStr="";
	 var arrStr = str.split("/");
	 if(arrStr.length == 4){
		 rStr = arrStr[1]+"/"+arrStr[2];
	 }else if(arrStr.length == 5){
		 rStr = arrStr[1]+"/"+arrStr[2]+"/"+arrStr[3];
	 }
	 return rStr;
}

var replaceAll = function(str, oldChar, newChar){
	   var tmp = str.split(oldChar).join(newChar);
	   return tmp;
	};
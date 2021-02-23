
$(document).ready(function(){
	
	
	/*$(".gnb > ul").on({
		"click" : function(e){
			e.preventDefault();
			if ( $(".depth2-bg:visible").length < 1 ) {
				$(".gnb .depth2").show();
				$(".depth2-bg").show();
			} else {
				$(".gnb .depth2").hide();
				$(".depth2-bg").hide();
			}		
		}
		, "focusin" : function(){
			$(".gnb .depth2").show();
			$(".depth2-bg").show();
		}
	});*/

	$(".depth2 a").last().on("focusout", function(){
		$(".gnb .depth2").hide();
		$(".depth2-bg").hide();
	});

	/////////////////////

	$('.navi > ul > li > a').click(function(){
		$('.gnb-layer').show();
	//	$('.gnb-layer').css({'height':gnbHeight});
		$('.gnb-layer').animate({left:0},function(){
			$('.bg-gnb').show();
		});
	});

	/* gnb 클릭 */
	$('.gnb-item .title').click(function(){
		if($(this).parent().hasClass('on')){
			$(this).parent().removeClass('on');
		}else{
			$('.gnb-item').removeClass('on');
			$(this).parent().addClass('on');
		}
	});
});

$(window).load(function(){
	var winH = $(window).height();
	$('.gnb-layer, .bg-modal').outerHeight(winH);

	/* gnb 레이어 열기*/
	$('.btn-gnb').click(function(){
		$('.wrap').outerHeight(winH);
		$('.bg-modal').show();
		$('.gnb-layer').css({left:0});
	});

	/* gnb 레이어 닫기*/
	$('.bg-modal').click(function(){
		$('.gnb-layer').css({left:-480}); //animate
		$('.bg-modal').hide();
		$('.wrap').attr('style', '');
	});

	$('.m_close').click(function(){
		$('.gnb-layer').css({left:-480}); //animate
		$('.bg-modal').hide();
		$('.wrap').attr('style', '');
	});
	///////////////////////// 모바일 gnb
	$(".gnb > ul > li").on("mouseenter", function(){
		$(".gnb .depth2").show();
		$(".depth2-bg").show();
	})
	$(".gnb").mouseleave(function(){ //depth2-bg
		$(".gnb .depth2").hide();
		$(".depth2-bg").hide();
	});
	/*
	$(".gnb > ul a").on({
		"click" : function(e){
			e.preventDefault();
			if ( $(".depth2-bg:visible").length < 1 ) {
				$(".gnb .depth2").show();
				$(".depth2-bg").show();
			} else {
				$(".gnb .depth2").hide();
				$(".depth2-bg").hide();
			}		
		}
		, "focusin" : function(){
			$(".gnb .depth2").show();
			$(".depth2-bg").show();
		}
	});
	*/
	$(".gnb > ul a").on("focusin", function(){
			$(".gnb .depth2").show();
			$(".depth2-bg").show();
	});
	/*$(".depth2 a").last().on("focusout", function(){
		$(".gnb .depth2").hide();
		$(".depth2-bg").hide();
	});*/
	///////////////////////////// pc gnb



	$(".view-btn").click(function(){
		$(".calendar-table .target-signup").addClass("signup");
	});

	$(".date-btn").click(function(){
		$(".calendar-table .target-edu").addClass("education");
	});

	$('.calendar-table .target-signup, .calendar-table .target-edu').click(function() { 
		$(".scheduled-popup").show();
	});
	

	$(".close-btn").click(function(){
		$(".scheduled-popup").hide();
	});


	

	

});
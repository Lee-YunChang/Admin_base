
$(document).ready(function(){
	/* 아코디언 */
	fnAcco(".acco-container", ".btn-acco", ".acco-view", 2);
	
	/* 팝업 테이블 */
	$('.tr_open').each(function(){
		$(this).click(function(){
			if ( $(this).parent().parent().next('.styor_tr').length > 0 )
			{
				if ($(this).parent().parent().next('.styor_tr').is(":visible")) {
					$(this).parent().parent().next('.styor_tr').hide();
					$(this).removeClass('open');
				} else {
					$('.styor_tr').hide(); // 다른거 닫을때
					$(this).parent().parent().next('.styor_tr').show();
					$(this).addClass('open');
				}
			}
			
		});
	});

	$("#allCheck").click(function(){
		if($("#allCheck").prop("checked")) {
			$("input[type=checkbox]").prop("checked",true);
		} else {
			$("input[type=checkbox]").prop("checked",false);
		}
	})


	$('.layer-show').click(function() {
		$(this).siblings('.layer_popup').show();
		$('.layer_popup').focus();
	});

	$('.pop_close').click(function() {
		$(this).parents('.layer_popup').hide();
	});	

	
	$('.view').on('click', function () {
	  if(!$(this).parent('.ar').hasClass('on')) { 
		 $(this).parent('.ar').addClass('on');
	  } else {
		 $(this).parent('.ar').removeClass('on');
	  }
    });

	$('.sub-view a').click(function() {
		$(this).css('text-decoration','underline')
	});

//팝업
    showPopup1 = function() {
		$("#layer_01").show();
	}
	showPopup2 = function() {
		$("#layer_02").show();
	}
	showPopup3 = function() {
		$("#layer_03").show();
	}
	showPopup4 = function() {
		$("#layer_04").show();
	}
	showPopup5 = function() {
		$("#layer_05").show();
	}

});

// 비밀번호 변경
function fn_encrypt(str){
	return fn_encode(escape(str));
}

function fn_encode(input){
	var keyStr = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
	var output = "";
	var chr1,chr2,chr3;
	var enc1, enc2, enc3, enc4;
	var i =0;
	do{
		chr1 = input.charCodeAt(i++);
		chr2 = input.charCodeAt(i++);
		chr3 = input.charCodeAt(i++);
		enc1 = chr1 >> 2;
		enc2 = ((chr1 & 3) <<  4 | (chr2 >> 4));
		enc3 = ((chr2 & 15) <<  2 | (chr3 >> 6));
		enc4 = chr3 & 63;
		if(isNaN(chr2)){
			enc3 = enc4 =64;
		}else if(isNaN(chr3)){
			enc4 =64;
		}
		output = output + keyStr.charAt(enc1) + keyStr.charAt(enc2) + keyStr.charAt(enc3) + keyStr.charAt(enc4);
		
	}while(i<input.length);
	return output;
}

/* 아코디언 펑션 
    gbn_act : 1 - 다른 아코디언 닫히지 않음
    gbn_act : 2 - 다른 아코디언 닫힘
*/
	
function fnAcco(sel_acco_container, sel_btn_acco, sel_acco_view, arg_gbn_act) {
    
    var $acc_container  = $(sel_acco_container);
    var $btn_acco       = $(sel_btn_acco, $acc_container);
    var $acc_view       = $(sel_acco_view, $acc_container);
    var gbn_act         = arg_gbn_act || 1;
    var idx_tmp;
    
    $btn_acco.on("click", function(e){
        
        if( $(this)[0].tagName.toLowerCase() == 'a' ) {
            e.preventDefault();
        }
        
        idx_tmp = $btn_acco.index($(this));
        
            
        if ($acc_view.eq(idx_tmp).is(":visible")) {

            $btn_acco.eq(idx_tmp).parent().removeClass("on");
            $acc_view.eq(idx_tmp).stop().slideUp();
            
        } else {
            
            if (gbn_act == 1) {
                $btn_acco.eq(idx_tmp).parent().addClass("on");
                $acc_view.eq(idx_tmp).stop().slideDown();
            } else if (gbn_act == 2) {
                $btn_acco.eq(idx_tmp).parent().addClass("on")
                    .end().end().not(":eq("+ idx_tmp +")").parent().removeClass("on");
                $acc_view.eq(idx_tmp).stop().slideDown()
                    .end().not(":eq("+ idx_tmp +")").stop().slideUp();
            }
        }
            
    });
    
}


jQuery(function($) {

// 탭메뉴
/*	var tabArea = $(".tabArea");
	//var flag_tab = tabArea.hasClass("tabArea-gbn1");

	if (tabArea.length > 0) {
		var tabMenu = tabArea.find("ul.tabMenu > li"),
		tabCon = tabArea.find("div.tabCon");
// 첫번째 탭 바로 보이도록
		tabMenu.removeClass("on").eq(0).addClass("on");
		tabCon.hide().eq(0).show();
		
		tabMenu.on("click", "a", function(){
		var currIdx = $(this).parent().index();

		tabMenu.removeClass("on").eq(currIdx).addClass("on");
		tabCon.hide().eq(currIdx).show();

		return false;
		});

	}*/

});


$(function(){
	$('#select_container').jqTransform();
	$('#select_container1').jqTransform();
	$('#select_container2').jqTransform();
	$('#select_container3').jqTransform();
	$('#select_container4').jqTransform();
	$('#select_container5').jqTransform();
	$('#select_container6').jqTransform();
	$('#select_container7').jqTransform();
	$('#select_container8').jqTransform();
	$('#select_container9').jqTransform();
	$('#select_container10').jqTransform();

});


function w_pop(w_url, w_name, w_width, w_height) {		
	var newwin,
		w_left = (screen.width - w_width)/2,
		w_top = (screen.height - w_height)/2,
		w_options = 'width='+ w_width +', height='+ w_height +', left='+ w_left +', top='+ w_top +', scrollbars=yes';

	newwin = open(w_url, w_name, w_options);
	if(window.focus) newwin.focus();
	return false;
};

jQuery(function($){

	var num_add_pc = 6;
	var num_add_tablet = 8;
	var num_add_mobile = 4;
	var tmp_num_add = 0;

	$(".edu-list > li:lt("+ num_add_pc +")").addClass("add-item-pc");
	$(".edu-list > li:lt("+ num_add_tablet +")").addClass("add-item-tablet");
	$(".edu-list > li:lt("+ num_add_mobile +")").addClass("add-item-mobile");

	$(".more-w").on("click", function(e){
		e.preventDefault();
		
		if( $(".device-check .pc:visible").length > 0 ) {
			tmp_num_add = $(".edu-list .add-item-pc").length + num_add_pc;
			$(".edu-list > li:lt("+ tmp_num_add +")").addClass("add-item-pc");
			if ($(".edu-list > li:last").is(":visible")) {
				$(".more-w").hide();
			}
		} else if( $(".device-check .tablet:visible").length > 0 ) {
			tmp_num_add = $(".edu-list .add-item-tablet").length + num_add_tablet;
			$(".edu-list > li:lt("+ tmp_num_add +")").addClass("add-item-tablet");
			if ($(".edu-list > li:last").is(":visible")) {
				$(".more-w").hide();
			}
		} else if( $(".device-check .mobile:visible").length > 0 ) {
			tmp_num_add = $(".edu-list .add-item-mobile").length + num_add_mobile;
			$(".edu-list > li:lt("+ tmp_num_add +")").addClass("add-item-mobile");
			if ($(".edu-list > li:last").is(":visible")) {
				$(".more-w").hide();
			}
		}

	});

});





function fnPlusFile(arg_obj_this) {
		if ( $(".td-input-wrap .input-wrap").length >= 10 ) {
			alert("10개초과 등록 할수 없습니다.");
		} else {
			var str_obj = "<div class='input-wrap'>";
				str_obj += "<div class='file-wrap'>";
				str_obj += "<input type='text' id='fileName1' class='inputtxt size2' readonly='readonly'>";
				str_obj += "<div class='file_input_div'>";
				str_obj += "<input type='button' value='불러오기' class='btn-m gray'>";
				str_obj += "<input type='file' class='file_input_hidden' onchange='javascript: document.getElementById('fileName1').value = this.value'>";
				str_obj += "</div>";
				str_obj += "</div>";
				str_obj += "<span class='timebtn'>";
				str_obj += "<button class='scale-up' title='추가' onclick='fnPlusFile(this);'>추가</button>";
				str_obj += "&nbsp;<button class='scale-down' title='삭제' onclick='fnMinusFile(this);'>삭제</button>";
				str_obj += "</span>";
				str_obj += "</div>";
			var $new_file = $(str_obj);
			$(".td-input-wrap").append($new_file);

		}
	}

	function fnMinusFile(arg_obj_this) {
		var idx_tmp = $(".td-input-wrap .scale-down").index( $(arg_obj_this) );
		//alert($(".td-input-wrap .input-wrap").length);
		if ( $(".td-input-wrap .input-wrap").length <= 4 ) {
			alert("4개미만 삭제 할수 없습니다.");
		} else {
			$(".td-input-wrap .input-wrap").eq(idx_tmp).remove();
		}
	}

// f2-02 페이지 열림
jQuery(function($){

		var idx_cur;
		var $pair;

		$(".edu-list .btn-m.view").on("click", function(e) {

			e.preventDefault();

			var $self = $(this);
			var idx_self = $(".edu-list .btn-m.view").index( $self );
			var even_odd = idx_self % 2;
			var $li = $(".edu-list > li");
			var $li_cur = $li.eq(idx_self);

			if ( even_odd == 0 ) {
				$pair = $li.eq(idx_self).next();
			} else {
				$pair = $li.eq(idx_self).prev();
			}

			$li.removeClass("li-cur").removeClass("li-pair");

			if ( $li_cur.find(".view-wrap").is(":visible") == false ) {

				$li.removeClass("li-cur").removeClass("li-pair")
					.end().find(".view-wrap").stop().hide();

				$li_cur.addClass("li-cur")
					.find(".view-wrap").stop().slideDown(800);
					
				$pair.addClass("li-pair");
				
			} else {

				$li_cur.find(".view-wrap").stop().hide()
					.removeClass("li-cur");

				$pair.removeClass("li-pair");


			}

		});

	});

	
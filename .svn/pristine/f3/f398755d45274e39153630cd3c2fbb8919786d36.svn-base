
var SANGS = {};

SANGS.Util = {
		
	/**
	 * ajax 공통 모듈
	 * url : 
	 * data :
	 * dataType : json / html / xml / text
	 * callback : 콜백함수
	 */	
	ajax: function(url, data, dataType, callback) {
		$.ajax({
			url : url,
			data : data,
			dataType : dataType,
			type : 'POST',
			success : function(result) {
				callback(result);
			},
			error : function(e) {
				alert("error :" + e.responseText);
			}
		});	
	},
	$id: function(id) {
		return $(this.getId(id));
	},
	getId: function(id) {
		return '#' + id;
	},
	leftPad: function(str, size, padChar) {
		return this.makePadChar(str, size, padChar, 'left');
	},
	rightPad: function(str, size, padChar) {
		return this.makePadChar(str, size, padChar, 'right');
	},
	makePadChar: function(str, size, padChar, position) {
		var length = str.length;
		if (length === 0 || length >= size) {
			return str;
		}
		var padCount = size - length;
		var addStr = '';
		for (var i = 0, n = padCount; i < n; i++) {
			addStr += padChar;
		}
		var result = (position === 'left') ? addStr + str : str + addStr;
		return result;
	},
	isHide: function(id) {
		return ($(this.getId(id)).css('display') === 'none');
	},
	reset: function(selector) {
		$(selector).val('');
		return this;
	},
	checked: function(name, checkedValue) {
		var selector = 'input[name=' + name + ']';
		$(selector).each(function(i) {
			var $checkbox = $(this);
			if ($checkbox.val() === checkedValue) {
				$checkbox.attr('checked', 'checked');
			}
		});
		return this;
	},
	
	checkLen: function(name) {
		return $('input[name=' + name + ']:checkbox:checked').length;
	},
	
	openPopup: function(url, popupName, options) {
		popupName = (popupName == undefined) ? '' : popupName;
		options = (options == undefined) ? '' : options;
		window.open(url, popupName, options);
		//openWin.focus();
	},
	
	
	openPopupSubmit: function(form, popupName, options) {
		popupName = (popupName == undefined) ? '' : popupName;
		options = (options == undefined) ? '' : options;
		$("#"+form.attr("id")).one("submit", function() {
	          window.open('',popupName, options);
	          this.action = form.attr("action");
	          this.method = 'POST';
	          this.target = popupName;
	      }).trigger("submit");
	},
	
	
	addDate: function(subtracted, today) {
		
		if (today == undefined) {
			today = new Date();
		}
		else {
			today = new Date(today);
		}
		if (subtracted != undefined && subtracted != "") {
			today.setMonth(today.getMonth() + Number(subtracted));
		}
		var year = today.getFullYear();
		var month = today.getMonth() + 1;
			month = (month.toString().length > 1) ? month : '0' + month;
		var day = today.getDate();
			day = (day.toString().length > 1) ? day : '0' + day;
			
			
		var dateJSON = {
						"YM" : year.toString()+month.toString(),
						"M" : month.toString(),
						"YMDFOMAT" : year + '-' + month + '-' + day,
						"YMFOMAT" : year + '-' + month
					   };	
			
		return dateJSON;
	},
	
	// datepicker setting
	datepickerCallOptions: function(sDate, eDate) {
		$fromDate = sDate;
		$toDate   = eDate;
		
		
		
		if($fromDate.valueEmpty()){
			$fromDate.val($.datepicker.formatDate($.datepicker.ATOM, new Date()));
		}
		
		if($toDate.valueEmpty()){
			$toDate.val($.datepicker.formatDate($.datepicker.ATOM, new Date()));
		}
	
		
		
		
		
		$fromDate.datepicker({
			//closeText: '닫기',
			//prevTest: '이전달',
			//next: '다음달',
			dayNamesMin:['일','월','화','수','목','금','토'],
			monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			showMonthAfterYear: true, //연월 순서로 보여줌
			changeMonth: true, //월을 셀렉트박스로 표현
			changeYear: true, //년을 셀렉트박스로 표현
			dateFormat: "yy-mm-dd"
		});
		
		$toDate.datepicker({
			//closeText: '닫기',
			//prevTest: '이전달',
			//next: '다음달',
			dayNamesMin:['일','월','화','수','목','금','토'],
			monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			showMonthAfterYear: true, //연월 순서로 보여줌
			changeMonth: true, //월을 셀렉트박스로 표현
			changeYear: true, //년을 셀렉트박스로 표현
			dateFormat: "yy-mm-dd"
		});

		$fromDate.datepicker("option", "maxDate", $toDate.val());
		$fromDate.datepicker("option", "onClose", function ( selectedDate ) {
			$toDate.datepicker("option", "minDate", selectedDate );
		});
		    
		    
		$toDate.datepicker("option", "minDate", $fromDate.val());
		$toDate.datepicker("option", "onClose", function ( selectedDate ) {
			$fromDate.datepicker( "option", "maxDate", selectedDate );
		});
	}
	
	
	
};
	

SANGS.Validate = {
		
		//유효한 주민번호인지 체크	
		isSSN: function(obj1 , obj2) {
			var jumin = obj1.val()+obj2.val();
			  
		    if (jumin.length != 13)  return false;
		  
		    var tval = 	  jumin.charAt(0)*2 + jumin.charAt(1)*3  + jumin.charAt(2)*4
		    			+ jumin.charAt(3)*5 + jumin.charAt(4)*6  + jumin.charAt(5)*7
		    			+ jumin.charAt(6)*8 + jumin.charAt(7)*9  + jumin.charAt(8)*2
		    			+ jumin.charAt(9)*3 + jumin.charAt(10)*4 + jumin.charAt(11)*5;
		  
		    var tval1 = 11- (tval % 11);
		    var tval2 = tval1 % 10;
		
		    if(!(jumin.charAt(12) == tval2 && (jumin.charAt(6) == "1" || jumin.charAt(6) == "2"))){
		    	alert('잘못된 주민등록번호 입니다.\n다시 입력해 주세요.');
		    	obj1.focus();
		    	return false;
		    }
		    
			return true;
		},
		
		
		isEmail: function(obj) {
			var regExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			var $email = obj.val();
			
            if(!regExp.test($email)) {
                alert('이메일 주소가 유효하지 않습니다');
                obj.focus();
                return false;
            }
            
            return true;
		
		},
		
		isNum: function(obj) {
			if(!$(obj).valueEmpty()){
				if(!$.isNumeric($(obj).val())){
					$(obj).val('');
				}
			} 
		
		}
		
		
};



SANGS.Classdesk = {
	/**
	 * 문제 등록 널체크
	 */
	questionNullCheck: function(selector) {
		var nullCheck = true;
		var result = true;
		var qCnt = 0;
		$(selector).each(function(i){
		 	if($(this).valueEmpty()){
		 		nullCheck = false;
				
		 	}else{
		 		qCnt++;
		 		if(!nullCheck){
		 			result = false;
		 			return false;
		 		}
		 	}
		});
		
		if(qCnt == 0){
			result = false;
		}
		
		return result;
	}
		
};



	$.fn.validatePhoneNo = function() {
		var pattern=new RegExp(/^[0-9-+]+$/);
		
		return pattern.test(jQuery.trim(jQuery(this).val()));
	};
	


	/*************************************************************************
	함수명: valueEmpty
	설  명: input,textarea type value가 empty 인지 확인
	리  턴: boolean 
	사용예:
	$("#userid").valueEmpty();
	***************************************************************************/
	$.fn.valueEmpty = function() {
		if (jQuery.trim(jQuery(this).val()).length < 1) {
			return true;
		} else {
			return false;
		}
	};


	/*************************************************************************
	함수명: getLength
	설  명: 글자수 리턴
	인  자: $obj (입력 Object (jQuery Object))
	        type default UTF-8
	리  턴: count (글자수) 
	사용예:
	$.getLength(jQuery('textarea'));
	***************************************************************************/
	var byteLength = 3;
	$.getLength = function($obj, type) {
		var val = $obj.val();
		var len = val.length;
		var c;
		var count = 0;
		
		if (!type) type = "UTF-8";
		
		if (type == "UTF-8") {
			for(var i=0; i<len; i++) {
				c = val.charAt(i);
				if(escape(c).length > 4)
					count += byteLength;
				else if(c == '\r')
					count += 2;
				else if(c == '\n')
					count += 2;
				else
					count++;
			}
		} else {
			count = len;
		}
		
		return count;
	};
	

	/*************************************************************************
	함수명: lfn_keychk
	설  명: input,textarea type value가 number 인지 확인
	리  턴:   
	사용예: onkeyup="lfn_keychk(this);" 
	***************************************************************************/
/*	$.fn.lfn_keychk = function(obj) {
		var val = obj.value;
		var re = /[^0-9|.]/gi;
	
		obj.value = val.replace(re, '');
	
		var split = val.split(".");
	
		if(split.length > 2) {  //콤마 1개 이상 못들어오도록.
			obj.value = val.substr(0,val.length-1);
		}
		if(split[1] != null){  //소수점 아래 두자리 넘지못하도록.
			if(split[1].length > 2) {
				obj.value = val.substr(0,val.length-1);
			}
		}
	};*/

	
	  //테이블 라인 마우스 오버시 표시
	  function onFocusBgCh(obj) {
		  $('.onFocusBgCh').attr("bgcolor","");
		  $(obj).attr("bgcolor","#f7f7f7"); // 회색 
		  //$(obj).attr("bgcolor","#f6faff");	// 노랑
		  // $(obj).attr("bgcolor","#dbeef3");	// 파랑
	  }

		
	 function lfn_keychk(obj){
		 var val = obj.value;
			var re = /[^0-9|.]/gi;
		
			obj.value = val.replace(re, '');
		
			var split = val.split(".");
		
			if(split.length > 2) {  //콤마 1개 이상 못들어오도록.
				obj.value = val.substr(0,val.length-1);
			}
			if(split[1] != null){  //소수점 아래 두자리 넘지못하도록.
				if(split[1].length > 2) {
					obj.value = val.substr(0,val.length-1);
				}
			}
	 }
	  
	  
	  function MsgUserAllCheck(){
		 $("input[type='checkbox']").attr('checked', $('#isall').is(':checked'));
	  }
	  

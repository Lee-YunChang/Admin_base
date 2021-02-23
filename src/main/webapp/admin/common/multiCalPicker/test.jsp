<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*, java.text.*" %>
<%
	Date date = new Date();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	String toDay = dateFormat.format(date);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<html>
<head>
<title>DatePicker - jQuery plugin</title>
<meta content="text/html; charset=ks_c_5601-1987" http-equiv="content-type">
 	<!--  캘린더 스타일 및 스크립트 -->
	<link rel="stylesheet" href="css/datepicker.css" type="text/css" />
    <link rel="stylesheet" media="screen" type="text/css" href="css/layout.css" />
	<script type="text/javascript" src="/resource/js/jquery-1.8.2.js"></script>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/datepicker.js"></script>
    <script type="text/javascript" src="js/eye.js"></script>
    <script type="text/javascript" src="js/utils.js"></script>
    
    
   
    <script type="text/javascript"> 
	// 공통 멀티캘린더 포맷
	function getCalendarMultiFormat(objId){
		
		var objVal = '#'+objId;
		var selectobjVal = $(objVal).val().split(",");
		
		var dateFormatSingle = { 
     			date: selectobjVal, //선택된날짜
    			current: $(objVal).val(), //현재일
    			format: 'Y-m-d',
    			calendars: 2,
    			mode: 'multiple',
    			locale: {
    				days: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"],
    				daysShort: ["일", "월", "화", "수", "목", "금", "토", "일"],
    				daysMin: ["일", "월", "화", "수", "목", "금", "토", "일"],
    				months: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
    				monthsShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
    				weekMin: "주 "
    			},
    			onChange: function(formated, dates) {
     				$(objVal).val(formated);
    			},
    			starts: 0 //요일시작 일요일부터 1은 월요일부터 
    	}
		
		return dateFormatSingle;
		
	}
	
	// 공통 싱글캘린더 포맷
	function getCalendarFormat(objId){
		
		var objVal = '#'+objId;
		var dateFormatSingle = { 
     			date: $(objVal).val(), //선택된날짜
    			current: $(objVal).val(), //현재일
    			format: 'Y-m-d',
    			calendars: 1,
    			mode: 'single',
    			locale: {
    				days: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"],
    				daysShort: ["일", "월", "화", "수", "목", "금", "토", "일"],
    				daysMin: ["일", "월", "화", "수", "목", "금", "토", "일"],
    				months: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
    				monthsShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
    				weekMin: "주 "
    			},
    			onChange: function(formated, dates) {
     				$(objVal).val(formated);
     				$('#calendarArea').DatePickerHide(); 
    			},
    			starts: 0 //요일시작 일요일부터 1은 월요일부터 
    	}
		
		return dateFormatSingle;
		
	}
 	
	
	 // 멀티 달력 호출 onclick이벤트
    function calShowMulti(objId) {
    	$('#calendarArea').DatePicker(getCalendarMultiFormat(objId));
 		$('#calendarArea').DatePickerShow();
    }
	 
    // 싱글 달력 호출 onclick이벤트
    function calShow(objId) {
    	$('#calendarArea').DatePicker(getCalendarFormat(objId));
 		$('#calendarArea').DatePickerShow();
    }
    
   
 
  
    
    </script>
    
</head>
<body>
	
		<p id="calendarArea"></p><!-- 달력스크립트 레이어 -->
	
	

 		<a href="#" onclick="calShowMulti('attendDesDay'); return false;">멀티달력</a>
			<input type="text" name="attendDesDay" id="attendDesDay" size="200" value="2013-07-09">
 	<br/>
 		
 		
 		
 		
 		<a href="#" onclick="calShow('applySdate'); return false;">신청시작</a>
			<input type="text" name="applySdate" id="applySdate" size="200" value="2013-07-09">
	
			
	<br/>
	<a href="#" onclick="calShow('applyEdate'); return false;">신청종료</a>
			<input type="text" name="applyEdate" id="applyEdate" size="200" value="2013-07-08">

	<br/>
	<a href="#" onclick="calShow('stydySdate'); return false;">수강시작</a>
			<input type="text" name="stydySdate" id="stydySdate" size="200" value="2013-07-08">

	<br/>
	<a href="#" onclick="calShow('stydyEdate'); return false;">수강종료</a>
			<input type="text" name="stydyEdate" id="stydyEdate" size="200" value="2013-07-08">

 	 
 	 
</body>
</html>
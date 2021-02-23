<%
/****************************************
	system	: ClassDesk > 강사 > 과제
	title	: 과제 목록
	summary	:	
	wdate   : 2015-04-01
	writer  : SANGS
****************************************/
%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<c:set var="topMenuCode" value="study"/>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/header_inc.jsp"  %> 
<script>
$(document).ready(function(){

	//간이메뉴 클릭시 원 헤더 복원
	//헤더열기	
	$('.menu_toggle').click(function(){
		//$('.menu_toggle').css('display', 'none');
		if($('#pmode').val() == 'E'){
			$('.menu_toggle_close').slideDown(500);
		}
	});
	//헤더 닫기
	$('.menu_toggle_close').click(function(){
		if($('#pmode').val() == 'E'){
			$('.menu_toggle_close').slideUp(500);
		}
		//$('.menu_toggle').css('display', 'block');
	});
	
	
	$(window).on('resize', function(e) { 
	    var h = $(window).height(); 
	    //저해상도에서 수강시 메뉴부분 숨김처리
	    if(h < 790 && $('#pmode').val() == 'E'){
		//$('#gnb').css('display', 'none');
		}else {
			//$('#gnb').css('display', 'block');	
		}
	});
});

</script>
	<!-- //개설과목명 -->
	<!-- 과제리스트 -->
	<div id="eduList" style="display:block;" class="table-type1">

	<div class="table-title clearfix">
		<h3 class="ico-table-blue">온라인학습<span class="small_txt">과정학습에 필요한 학습자료는 자료실에서 다운로드 받으시길 바랍니다.</span></h3>
	</div>
	
	<form name="frm" method="post" action="">
		<input type="hidden" name="subcmd" id="subcmd" value="">	  
		<input type="hidden" name="reportNo" id="reportNo" value="">
		<input type="hidden" name="pmode" id="pmode" value="L"/>
		<div class="table-type1">
			<div class="table-header-left"></div>
			<table>
				<caption>과제 게시판</caption>
				<colgroup>
					<col width="5%" />
					<!-- <col width="*" /> -->
					<col width="*" />
					<col width="8%" />
					<col width="8%" />
					<col width="10%" /> 
 				</colgroup>
				<thead>
					<tr>
						<th>회차</th>
						<th>목차</th>
						<!-- <th>학습시간</th> -->
						<th>페이지</th>
						<th>학생평균<br/>진도율</th>
						<th>학습</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty listData}">
							<c:forEach items="${listData}" var="result" varStatus="stat">
								<tr onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
									<td><%-- <c:out value="${result.RNUM}" />  --%><c:out value="${stat.index + 1}" />  </td>
									<td class="left"><c:if test="${result.LEV==2}">&nbsp;&nbsp;&nbsp;<span style="font-size:11px; color:#999;">L</span> </c:if><c:out value="${result.SUBJECT}" /> </td>
									<%-- <td><c:out value="${result.RUNTIME}" />분</td> --%>
									<td><c:out value="${result.FRAMECNT}"  /></td>
									<td><c:out value="${result.AVG_FRAMSEQ}" />%</td>
									<td> 
										<c:if test="${not empty result.FILE_PATH }"><a href= "#none"  onclick="fnOnlineStudy('<c:out value="${result.TREENO}" />','<c:out value="${result.CON_WIDTH}"/>', '<c:out value="${result.CON_HEIGHT}"/>');"   class="btn-small-orange" ><span>학습하기</span></a></c:if> </td>
 										
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>   
									<tr>
										<td colspan="6" align="center">등록된 정보가 없습니다.</td>
									</tr>
						</c:otherwise>
					</c:choose>	
				</tbody>
			</table>
		</div>
	</form>

	</div>
	
	<div id="eduPlay" style="display:none;" >

	<iframe name="eduPlayFrame" id="eduPlayFrame" src="" style="z-index:-99; width:100%; height:100%; top:54%;" title="eduPlay" allowFullScreen>
	
	</iframe>
	
	</div>

	<!-- //과제리스트 -->
	
	<!-- //게시판 버튼영역 -->
	<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/footer_inc.jsp" %>
	
	<script type="text/javascript"> 
	
		var w1 = parseInt(document.body.scrollWidth);
		var h1 = parseInt(document.body.scrollHeight);
		
		// 학습창 로딩(팝업)
		function fnOnlineStudy(tno,cWidth, cHeight) {

			var w1 = parseInt(document.body.scrollWidth);
			var h1 = parseInt(document.body.scrollHeight);
	
			
		    var courseno =	 '<c:out value="${REQUEST_DATA.SES_COURSENO}"/>';
		    var cseqno = '<c:out value="${REQUEST_DATA.SES_CSEQNO}"/>';
			var cuserNo =	'<c:out value="${REQUEST_DATA.SES_CUSERNO}"/>';
			var treeno =	 tno;
			var subcmd =	'start';
			var MATERIAL ='WEB' ; // 기존 소스상 하드코딩
			var url = '<c:out value="${ctx}"/>/classdesk<c:out value="${rowData.CONURL}"/>?subcmd='+subcmd+'&courseno='+courseno+'&cseqno='+cseqno+'&cuserNo='+cuserNo+'&treeno='+treeno+'&MATERIAL='+MATERIAL; 

			//컨텐츠로 전환
			if($('#pmode').val() == 'L') {				 
				$('#eduList').css('display','none');
				$('#eduPlay').css('display','block');
				$('#pmode').val('E');
				$('#eduPlayFrame').attr('src',url);
				
				//$('#eduPlayFrame').css('width', cWidth+'px');
				//$('#eduPlayFrame').css('height', cHeight+'px');
				
				$('body').addClass('contentsBody');
				
				//기존 메뉴숨김, 컨텐츠용 간이메뉴버튼 보이기
				$('#gnb').css('display', 'none');
				$('.menu_toggle').css('display', 'block');
				$('.menu_toggle_close').css('display', 'none');
				
				alert('마지막까지 학습 완료해야 진도처리됩니다.');
			}

				
		}
		
		function fnList(){
			//console.log('proglist.jsp');
	        location.reload();
 		}

		// 몇초마다 리프레쉬 시킬건지를 설정하세요 
		//var refreshinterval =180 ;

		// 상태바에 남은시간을 보여줄까요? ('yes' 혹은 'no' ) 
		//var displaycountdown='no' ;

		//var starttime ;
		//var nowtime ;
		//var reloadseconds=0 ;
		//var secondssinceloaded=0 ;

		//function starttime() { 
		//        starttime=new Date() ;
		//        starttime=starttime.getTime() ;
		//    countdown(); 
		//} 

		//function countdown() { 
		//       nowtime= new Date() ;
		//        nowtime=nowtime.getTime() ;
		//        secondssinceloaded=(nowtime-starttime)/1000 ;
		//        reloadseconds=Math.round(refreshinterval-secondssinceloaded) ;
		//        if (refreshinterval>=secondssinceloaded) { 
		//        var timer=setTimeout('countdown()',1000) ;
		//                if (displaycountdown=='yes') { 
		//                       // window.status='이 페이지는 '+reloadseconds+ '초 후에 리프레쉬됩니다' 
		//                } 
		//    } 
		//    else { 
		//        clearTimeout(timer) ;
		//              // window.location.reload(true) ;
		//				$('form[name=reFrm]').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/classdesk/user/progress/treeList.do').submit();
 		//    } 
		//} 
		//window.onload=starttime; 
  
	</script>


<%
/****************************************
	system	: ClassDesk > 수강생 > 온라인학습
	title	: 학습목록
	summary	:	
	wdate	:
	writer	: jangs Sun Ah 
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
	<div id="Right_Area" style="display:block;" class="table-type1">
	<br>
	<div class="table-title clearfix">
		<h3 class="ico-table-blue">온라인학습<span class="small_txt">과정학습에 필요한 학습자료는 자료실에서 다운로드 받으시길 바랍니다.</span></h3>
	</div>
    <br>
	<form name="frm" action=""> 
		<input type="hidden" name="pmode" id="pmode" value="L"/>
		
			<div class="table-header-left"></div>
	<c:choose>
		<c:when test="${rowData.OPENTYPE ne 'A' }">
			<!-- 기간제 과정 학습 목차 -->
			<table summary="상상스토리 교육시스템 클래스데스크의 온라인학습입니다.">
				<caption>온라인학습</caption>
				<colgroup>
					<col width="5%" />
					<col width="*" />
					<col width="8%" />
					<col width="8%" />
					<col width="15%" />
					<col width="10%" /> 
				</colgroup>
				<thead>
					<tr>
						<th>회차</th>
						<th>목차</th>
						<th>페이지</th>
						<th>진도율</th>
						<th>마지막 학습일자</th>
						<th>학습</th>
					</tr>
				</thead>
				<tbody>
				<!--  학습 관련 버튼 제어를 위한 변수 -->
				<c:set var="CURSTUDY" value="0"/>
				<c:choose>
					<c:when test="${not empty listData}">
						<c:forEach items="${listData}" var="result" varStatus="stat">
							<tr onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
								<td><%-- <c:out value="${result.RNUM}" />  --%><c:out value="${stat.index + 1}" />  </td>
								<td class="left"><c:if test="${result.LEV==3}">&nbsp;&nbsp;&nbsp;</c:if><c:out value="${result.SUBJECT}" /> </td>
								<td>
									<c:out value="${result.FRAMESEQ}" /> / <c:out value="${result.FRAMECNT}"/>
									<c:choose>
										<c:when test="${result.FRAMECNT eq 3}">
												<!-- 동영상일때 -->
												<c:if test="${result.MOVSEC >= 100}">
												<c:set var="progFrameYn">Y</c:set>
											</c:if>
										</c:when>
										<c:when test="${result.FRAMECNT > 3}">
											<!-- 컨텐츠일때 -->
											<c:if test="${result.FRAMECNT eq result.FRAMESEQ}">
												<c:set var="progFrameYn">Y</c:set>
											</c:if>
										</c:when>
										<c:otherwise><c:set var="progFrameYn">N</c:set></c:otherwise>
									</c:choose>
									<span id="prog_<c:out value="${stat.index + 1}"></c:out>" style="display:none"><c:out value="${progFrameYn}"></c:out></span>
									<c:set var="progFrameYn">N</c:set>
								</td>
								<td>
								<c:if test="${result.FRAMECNT eq 3 }">
									<c:out value="${result.PROGRESS_VAL}" default="0"/>%
								</c:if>
								<c:if test="${result.FRAMECNT ne 3 }">
								<c:out value="${result.AVG_FRAMSEQ}" />%
								</c:if>
								
								</td>
								<td><c:out value="${result.EDATE}" /></td>
								<td> 
								
									<!-- 학습버튼 제어 시작 -->
									<c:choose>
										<c:when test="${rowData.EDUSEQ_YN eq 'Y'}">  <!-- 순차학습 버튼 제어 -->
												<c:choose>
													<c:when test="${result.FRAMECNT == result.FRAMESEQ}"> 
														<a href="#none" onclick="fnOnlineStudy('<c:out value="${result.MOVSEC}" />', '<c:out value="${result.AVG_FRAMSEQ}" />', '<c:out value="${result.TREENO}" />','<c:out value="${result.CON_WIDTH}"/>','<c:out value="${result.CON_HEIGHT}"/>', '0');" class="btn-small-white"  > <span class="orange">복습하기</span></a>
													</c:when> 
													
													<c:when test="${(CURSTUDY == 0 &&    (result.FRAMECNT > result.FRAMESEQ  || result.FRAMESEQ == 0 )) }">
														<a href="#none" class="btn-small-orange" onclick="fnOnlineStudy('<c:out value="${result.MOVSEC}" />', '<c:out value="${result.AVG_FRAMSEQ}" />','<c:out value="${result.TREENO}" />','<c:out value="${result.CON_WIDTH}"/>','<c:out value="${result.CON_HEIGHT}"/>', '<c:out value="${stat.index + 1}"/>');" ><span>학습하기</span></a>
														<c:set var="CURSTUDY" value="1"/>
													</c:when> 
													<c:otherwise></c:otherwise>
												</c:choose>
										</c:when>  
										<c:otherwise> <!-- 비순차학습 -->
												<c:choose>
													<c:when test="${result.FRAMECNT == result.FRAMESEQ}"> 
														<a href="#none" onclick="javascript:fnOnlineStudy('<c:out value="${result.MOVSEC}" />', '<c:out value="${result.AVG_FRAMSEQ}" />','<c:out value="${result.TREENO}" />','<c:out value="${result.CON_WIDTH}"/>', '<c:out value="${result.CON_HEIGHT}"/>', '0');"   class="btn-small-white" ><span class="orange">복습하기</span></a>
													</c:when>
													<c:otherwise>
														<a href="#none" class="btn-small-orange" onclick="fnOnlineStudy('<c:out value="${result.MOVSEC}" />', '<c:out value="${result.AVG_FRAMSEQ}" />','<c:out value="${result.TREENO}" />','<c:out value="${result.CON_WIDTH}"/>','<c:out value="${result.CON_HEIGHT}"/>', '<c:out value="${stat.index + 1}"/>');" ><span>학습하기</span></a>
														
													</c:otherwise>
												</c:choose>
												
										</c:otherwise>
									</c:choose>
									<!-- 학습버튼 제어 끝 -->
									</td>
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
		</c:when>
		<c:otherwise>
			<!-- 상시과정 학습 목차 -->
			<table summary="상상스토리 교육시스템 클래스데스크의 과제 게시판입니다.">
				<caption>과제 게시판</caption>
				<colgroup>
					<col width="5%" />
					<col width="*" />
					<col width="8%" />
					<col width="8%" />
					<col width="15%" />
					<col width="10%" /> 
				</colgroup>
				<thead>
					<tr>
						<th>회차</th>
						<th>목차</th>
						<th>페이지</th>
						<th>진도율</th>
						<th>마지막 학습일자</th>
						<th>학습</th>
					</tr>
				</thead>
				<tbody>
				<!--  학습 관련 버튼 제어를 위한 변수 -->
				<c:set var="CURSTUDY" value="0"/>
					<c:choose>
						<c:when test="${not empty listData}">
							<c:forEach items="${listData}" var="result" varStatus="stat">
								<tr onmouseover="onFocusBgCh(this);" class="onFocusBgCh">
									<td><%-- <c:out value="${result.RNUM}" />  --%><c:out value="${stat.index + 1}" /></td>
									<td class="left">
										<c:if test="${result.LEV==3}">&nbsp;&nbsp;&nbsp;</c:if><c:out value="${result.SUBJECT}" />
									</td>
									<td><!-- 페이지 -->
										<c:out value="${result.FRAMESEQ}" /> / <c:out value="${result.FRAMECNT}"  />
										<c:choose>
											<c:when test="${result.FRAMECNT eq 3}">
												<!-- 동영상일때 -->
												<c:if test="${result.MOVSEC >= 100}">
													<c:set var="progFrameYn">Y</c:set>
												</c:if>
											</c:when>
											<c:when test="${result.FRAMECNT > 3}">
												<!-- 컨텐츠일때 -->
												<c:if test="${result.FRAMECNT eq result.FRAMESEQ}">
													<c:set var="progFrameYn">Y</c:set>
												</c:if>
											</c:when>
											<c:otherwise><c:set var="progFrameYn">N</c:set></c:otherwise>
										</c:choose>
										<span id="prog_<c:out value="${stat.index + 1}"></c:out>" style="display:none"><c:out value="${progFrameYn}"></c:out></span>
										<c:set var="progFrameYn">N</c:set>
									</td>
									<td>
										<c:if test="${result.FRAMECNT eq 3 && result.MOVSEC >=100 && result.FRAMECNT eq result.FRAMESEQ }">
											100%
										</c:if>
										<c:if test="${result.FRAMECNT eq 3 && result.FRAMECNT ne result.FRAMESEQ }">
											<c:if test="${result.MOVSEC > 100 }">
												99%
											</c:if>
											<c:if test="${result.MOVSEC eq null || result.MOVSEC <= 100}">
											<c:out value="${result.MOVSEC}" default="0"/>%
											</c:if>
										</c:if>
										<c:if test="${result.FRAMECNT ne 3 }">
										<c:out value="${result.AVG_FRAMSEQ}" default="0"/>%
										</c:if>
										 
									</td>
									<td><c:out value="${result.EDATE}" /></td>
									<td> 
									<c:choose>
										<c:when test="${rowData.RE_STUDY_YN ne 'Y'}">
										<!-- 학습기간일때. -->
											<c:choose>
												<c:when test="${rowData.EDUSEQ_YN eq 'Y'}">  <!-- 순차학습 버튼 제어 -->
														<c:choose>
																<c:when test="${result.FRAMECNT ne 3 && result.FRAMECNT == result.FRAMESEQ}"> 
																	<a href="#none" onclick="fnOnlineStudy('<c:out value="${result.MOVSEC}" />', '<c:out value="${result.AVG_FRAMSEQ}" />','<c:out value="${result.TREENO}" />','<c:out value="${result.CON_WIDTH}"/>', '<c:out value="${result.CON_HEIGHT}"/>', '0');" class="btn-small-white"> <span class="orange">복습하기</span></a>
																</c:when> 
																
																<c:when test="${result.FRAMECNT ne 3 && (CURSTUDY == 0 &&    (result.FRAMECNT > result.FRAMESEQ  || result.FRAMESEQ == 0 )) }">
																	<a href="#none" class="btn-small-orange" onclick="fnOnlineStudy('<c:out value="${result.MOVSEC}" />', '<c:out value="${result.AVG_FRAMSEQ}" />','<c:out value="${result.TREENO}" />','<c:out value="${result.CON_WIDTH}"/>', '<c:out value="${result.CON_HEIGHT}"/>', '<c:out value="${stat.index + 1}"/>');" ><span>학습하기</span></a>
																	<c:set var="CURSTUDY" value="0"/>
	 															</c:when> 

																<c:when test="${result.FRAMECNT eq 3 && result.MOVSEC >=100 && result.FRAMECNT eq result.FRAMESEQ }"> 
																<a href="#none" onclick="fnOnlineStudy('<c:out value="${result.MOVSEC}" />', '<c:out value="${result.AVG_FRAMSEQ}" />','<c:out value="${result.TREENO}" />','<c:out value="${result.CON_WIDTH}"/>', '<c:out value="${result.CON_HEIGHT}"/>', '0');" class="btn-small-white" > <span class="orange">복습하기</span></a>
																</c:when> 
																
																<c:when test="${result.FRAMECNT eq 3 }">
																<a href="#none" class="btn-small-orange" onclick="fnOnlineStudy('<c:out value="${result.MOVSEC}" />', '<c:out value="${result.AVG_FRAMSEQ}" />','<c:out value="${result.TREENO}" />','<c:out value="${result.CON_WIDTH}"/>', '<c:out value="${result.CON_HEIGHT}"/>', '<c:out value="${stat.index + 1}"/>');" ><span>학습하기</span></a>
																<c:set var="CURSTUDY" value="0"/>
																</c:when>
																<c:otherwise></c:otherwise>
														</c:choose>
												</c:when>  
 												<c:otherwise> <!-- 비순차학습 -->
														<c:choose>
																<c:when test="${result.FRAMECNT ne 3 && result.FRAMECNT == result.FRAMESEQ}"> 
																	<a href="#none" onclick="fnOnlineStudy('<c:out value="${result.MOVSEC}" />', '<c:out value="${result.AVG_FRAMSEQ}" />','<c:out value="${result.TREENO}" />','<c:out value="${result.CON_WIDTH}"/>', '<c:out value="${result.CON_HEIGHT}"/>', '0');" class="btn-small-white"  > <span class="orange">복습하기</span></a>
																</c:when> 
																
																<c:when test="${result.FRAMECNT ne 3 && (CURSTUDY == 0 &&    (result.FRAMECNT > result.FRAMESEQ  || result.FRAMESEQ == 0 )) }">
																	<a href="#none" class="btn-small-orange" onclick="fnOnlineStudy('<c:out value="${result.MOVSEC}" />', '<c:out value="${result.AVG_FRAMSEQ}" />','<c:out value="${result.TREENO}" />','<c:out value="${result.CON_WIDTH}"/>', '<c:out value="${result.CON_HEIGHT}"/>', '<c:out value="${stat.index + 1}"/>');" ><span>학습하기</span></a>
																	<c:set var="CURSTUDY" value="0"/>
	 															</c:when> 

																<c:when test="${result.FRAMECNT eq 3 && result.MOVSEC >=100 && result.FRAMECNT eq result.FRAMESEQ }"> 
																<a href="#none" onclick="fnOnlineStudy('<c:out value="${result.MOVSEC}" />', '<c:out value="${result.AVG_FRAMSEQ}" />','<c:out value="${result.TREENO}" />','<c:out value="${result.CON_WIDTH}"/>', '<c:out value="${result.CON_HEIGHT}"/>', '0');" class="btn-small-white"> <span class="orange">복습하기</span></a>
																</c:when> 
																
																<c:when test="${result.FRAMECNT eq 3 }">
																<a href="#none" class="btn-small-orange" onclick="fnOnlineStudy('<c:out value="${result.MOVSEC}" />', '<c:out value="${result.AVG_FRAMSEQ}" />','<c:out value="${result.TREENO}" />','<c:out value="${result.CON_WIDTH}"/>', '<c:out value="${result.CON_HEIGHT}"/>', '<c:out value="${stat.index + 1}"/>');" ><span>학습하기</span></a>
																<c:set var="CURSTUDY" value="0"/>
																</c:when>
																<c:otherwise></c:otherwise>
														</c:choose>
														
 												</c:otherwise>
											</c:choose> 
										</c:when>
										<c:when test="${rowData.RE_STUDY_YN eq 'Y' && rowData.ISPASS eq 'Y'}">
											<a href="#none" onclick="javascript:fnOnlineStudy('<c:out value="${result.MOVSEC}" />', '<c:out value="${result.AVG_FRAMSEQ}" />','<c:out value="${result.TREENO}" />','<c:out value="${result.CON_WIDTH}"/>', '<c:out value="${result.CON_HEIGHT}"/>', '0');"   class="btn-small-white" ><span class="orange">복습하기</span></a>
										</c:when>
										<c:when test="${rowData.RE_STUDY_YN eq 'Y' && (rowData.ISPASS eq '' || rowData.ISPASS ne 'Y')}">
											<a href="#none" onclick="javascript:fnOnlineReStudy('<c:out value="${result.MOVSEC}" />', '<c:out value="${result.AVG_FRAMSEQ}" />','<c:out value="${result.TREENO}" />','<c:out value="${result.CON_WIDTH}"/>', '<c:out value="${result.CON_HEIGHT}"/>', '0');"   class="btn-small-white" ><span class="orange">복습하기</span></a>
										</c:when>
									</c:choose>
 									</td>
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
		</c:otherwise>
	</c:choose>
		
		
		
		
	</form>
	</div>
	<div id="eduPlay" style="display:none;" >

	<iframe name="eduPlayFrame" id="eduPlayFrame" src="" style="z-index:-99;" title="eduPlay" allowfullscreen>
	
	</iframe>
	
	</div>
		<!-- //과제리스트 -->
	<!-- 게시판 버튼영역 -->
	<div class="table-btn-group">

	<form id="popFrm" name="popFrm" method="POST" action="<c:out value="${ctx}"/>/classdesk/online/prog.do">
		<input type="hidden" name="subcmd" id = "subcmd" value="" />
		<input type="hidden" name="treeno" id="treeno" value="">
		<input type="hidden" name="courseno" id="courseno" value="">
		<input type="hidden" name="cseqno" id="cseqno" value="">
		<input type="hidden" name="cuserNo" id="cuserNo" value="">
		<input type="hidden" name="MATERIAL" id="MATERIAL"  value="">	
	</form>
		
	<form id="reFrm" name="reFrm" method="post" action="<c:out value="${ctx}"/>/classdesk/user/progress/treeList.do">
		<input type="hidden" name="subcmd" id = "subcmd" value="" /> 
	</form>

	</div>
	<!-- //게시판 버튼영역 -->
	<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/footer_inc.jsp" %>
	 
	<script type="text/javascript"> 
	
		var w1 = parseInt(document.body.scrollWidth);
		var h1 = parseInt(document.body.scrollHeight);
		
		// 학습창 로딩(팝업)
		function fnOnlineStudy(movsec, avgFramseq, tno,cWidth, cHeight, cflag){

			var w1 = parseInt(document.body.scrollWidth);
			var h1 = parseInt(document.body.scrollHeight);
			var ispass= "N";
			if( movsec >= 100 || avgFramseq >= 100) {
				ispass = 'Y';
			}
			
		    var courseno =	 '<c:out value="${REQUEST_DATA.SES_COURSENO}"/>';
		    var cseqno = '<c:out value="${REQUEST_DATA.SES_CSEQNO}"/>';
			var cuserNo =	'<c:out value="${REQUEST_DATA.SES_CUSERNO}"/>';
			var treeno =	 tno;
			var subcmd =	'start';
			var MATERIAL ='WEB' ; // 기존 소스상 하드코딩
			var url = '<c:out value="${ctx}"/>/classdesk<c:out value="${rowData.CONURL}"/>?subcmd='+subcmd+'&courseno='+courseno+'&cseqno='+cseqno+'&cuserNo='+cuserNo+'&treeno='+treeno+'&ispass='+ispass+'&MATERIAL='+MATERIAL; 
			var eduseqYn =	'<c:out value="${rowData.EDUSEQ_YN}"/>';
			if(cflag > 0 && eduseqYn == 'Y') { // 복습이 아니고 && 순차학습일때
				if(cflag > 1) {
					// 1차시 이후 학습하기 버튼을 클릭했을때
					var progYn = $('#prog_'+(cflag-1)).text();
					if(progYn != 'Y') {
						// 이전 회차 학습이 완료되지 않았을 경우
						alert('이전 회차 학습을 완료해야만 학습이 가능 합니다.');
						return;
					}
				}
			}
			//컨텐츠로 전환
			if($('#pmode').val() == 'L') {				 
				$('#eduList').css('display','none');
				$('#eduPlay').css('display','block');
				$('#pmode').val('E');
				$('#eduPlayFrame').attr('src',url);
				
				$('#eduPlayFrame').css('width', cWidth+'px');
				$('#eduPlayFrame').css('height', cHeight+'px');
				
				$('body').addClass('contentsBody');
				
				//기존 메뉴숨김, 컨텐츠용 간이메뉴버튼 보이기
				$('#gnb').css('display', 'none');
				$('.menu_toggle').css('display', 'block');
				$('.menu_toggle_close').css('display', 'none');
				
				alert('마지막까지 학습 완료해야 진도처리됩니다.');
			}

				
		}
		
		
		// 학습창 로딩(팝업)
		function fnOnlineReStudy(movsec, avgFramseq, tno,cWidth, cHeight, cflag){

			var w1 = parseInt(document.body.scrollWidth);
			var h1 = parseInt(document.body.scrollHeight);
			var ispass= "N";
			if( movsec >= 100 || avgFramseq >= 100) {
				ispass = 'Y';
			}
			var msg = "학습기간이 종료되어 진도처리가 되지 않습니다.\n진도처리를 원하실 경우 관리자에게 학습기간 연장을 요청해주세요.";
			if(confirm(msg)) {
			
			    var courseno =	 '<c:out value="${REQUEST_DATA.SES_COURSENO}"/>';
			    var cseqno = '<c:out value="${REQUEST_DATA.SES_CSEQNO}"/>';
				var cuserNo =	'<c:out value="${REQUEST_DATA.SES_CUSERNO}"/>';
				var treeno =	 tno;
				var subcmd =	'start';
				var MATERIAL ='WEB' ; // 기존 소스상 하드코딩
				var url = '<c:out value="${ctx}"/>/classdesk<c:out value="${rowData.CONURL}"/>?subcmd='+subcmd+'&courseno='+courseno+'&cseqno='+cseqno+'&cuserNo='+cuserNo+'&treeno='+treeno+'&ispass='+ispass+'&MATERIAL='+MATERIAL; 
				var eduseqYn =	'<c:out value="${rowData.EDUSEQ_YN}"/>';
				if(cflag > 0 && eduseqYn == 'Y') { // 복습이 아니고 && 순차학습일때
					if(cflag > 1) {
						// 1차시 이후 학습하기 버튼을 클릭했을때
						var progYn = $('#prog_'+(cflag-1)).text();
						if(progYn != 'Y') {
							// 이전 회차 학습이 완료되지 않았을 경우
							alert('이전 회차 학습을 완료해야만 학습이 가능 합니다.');
							return;
						}
					}
				}
				//컨텐츠로 전환
				if($('#pmode').val() == 'L') {				 
					$('#eduList').css('display','none');
					$('#eduPlay').css('display','block');
					$('#pmode').val('E');
					$('#eduPlayFrame').attr('src',url);
					
					$('#eduPlayFrame').css('width', cWidth+'px');
					$('#eduPlayFrame').css('height', cHeight+'px');
					
					$('body').addClass('contentsBody');
					
					//기존 메뉴숨김, 컨텐츠용 간이메뉴버튼 보이기
					$('#gnb').css('display', 'none');
					$('.menu_toggle').css('display', 'block');
					$('.menu_toggle_close').css('display', 'none');
					
					//alert('마지막까지 학습 완료해야 진도처리됩니다.');
				}
			}
				
		}
		
		function fnList(){
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
		//
		//function countdown() { 
		//        nowtime= new Date() ;
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
		//              -window.location.reload(true) ;
		//				$('form[name=reFrm]').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/classdesk/user/progress/treeList.do').submit();
 		//    } 
		//} 
		//window.onload=starttime; 
		
	</script>




<%--
    Description : 아카데미 메인
    Modification Information
    
         수정일     		수정자         			수정내용
    -------     -----------------------------------
    2016.03.28  이진영        최초작성

--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>
<%
	String noticeBcate= StringUtil.getContent(SangsProperties.getProperty("Globals.bbsBcateSiteNotice")); // 공지사항
	String answerBcate= StringUtil.getContent(SangsProperties.getProperty("Globals.bbsBcateSiteAnswer")); // 일대일문의
	String guideBcate= StringUtil.getContent(SangsProperties.getProperty("Globals.bbsBcateSiteGuide")); // 교육소식
%>	
 <script type="text/javascript">

	$(document).ready(function(){
		
		// 접속 차트
		var chart02SeriesLabel = [{label : '접속자'}];
		var chart02Tick = "";
		var chart02Data01 = "";
		chart02Tick = [
	   	<c:forEach var="result" items="${accessList}" varStatus="status">
	   		'${result.SDAY}',
	   	</c:forEach>
	   	];    
	   	
		chart02Data01 = [
	   	<c:forEach var="result2" items="${accessList}" varStatus="status">
	   		'${result2.ACCES_CNT}',
	   	</c:forEach>
	   	];
		
		var nullChart02Data01 = [0,0,0,0,0,0];
		if(String(nullChart02Data01) == String(chart02Data01) || chart02Data01 == null || chart02Data01.length == 0) chart02Data01 = nullChart02Data01;
	   	
		
		$('#accessStatsList').bind('resize', function(event, ui) {
	        plot1.replot( { resetAxes: true } );
	    });
		var plot1 =$.jqplot ('accessStatsList', [chart02Data01], $.setBarChartOption01(chart02Tick, '',0, 5000));
		 
		// 수료현황 차트
		var chart01SeriesLabel = [{label : '대출'}, {label : '기관별'}, {label : '일반'}];
		var chart01Tick = "";
		var chart01Data01 = "";
		var chart01Data02 = "";
		var chart01Data03 = "";
		
		var cpseduSuryoCnt = '${fn:length(cpseduSuryoList)}';
		var enfsnSuryoCnt = '${fn:length(enfsnSuryoList)}';
		var gnrlSuryoCnt = '${fn:length(gnrlSuryoList)}';
		
		if(cpseduSuryoCnt > 0) {
			chart01Tick = [
		   	<c:forEach var="result0" items="${cpseduSuryoList}" varStatus="status1">
		   		'${result0.MONTH}',
		   	</c:forEach>
		   	]; 
		}
		else if(enfsnSuryoCnt > 0) {
			chart01Tick = [
   		   	<c:forEach var="result0" items="${enfsnSuryoList}" varStatus="status1">
   		   		'${result0.MONTH}',
   		   	</c:forEach>
   		   	]; 
		}
		else {
			chart01Tick = [
	    	   	<c:forEach var="result1" items="${gnrlSuryoList}" varStatus="status2">
			   		'${result1.MONTH}',
			   	</c:forEach>
	    	]; 
		}
		
		chart01Data01 = [
	   		<c:forEach var="result2" items="${cpseduSuryoList}" varStatus="status3">
			   	'${result2.SURYO_CNT}',
			</c:forEach>
	   	];
		
		chart01Data02 = [
	   		<c:forEach var="result3" items="${enfsnSuryoList}" varStatus="status4">
			   	'${result3.SURYO_CNT}',
			</c:forEach>
	   	];
		chart01Data03 = [
   	   		<c:forEach var="result4" items="${gnrlSuryoList}" varStatus="status5">
   			   	'${result4.SURYO_CNT}',
   			</c:forEach>
   	   	];

		var nullChart01Data01 = [0,0,0,0,0,0];
	    var nullChart01Data02 = [0,0,0,0,0,0];
	    var nullChart01Data03 = [0,0,0,0,0,0];
	    if(String(nullChart01Data01) == String(chart01Data01) || chart01Data01 == null || chart01Data01.length == 0) chart01Data01 = nullChart01Data01;
	    if(String(nullChart01Data02) == String(chart01Data02) || chart01Data02 == null || chart01Data02.length == 0) chart01Data02 = nullChart01Data02;
	    if(String(nullChart01Data03) == String(chart01Data03) || chart01Data03 == null || chart01Data03.length == 0) chart01Data03 = nullChart01Data03;

	    // 수료 차트
	    $.jqplot ('suryoStatsList', [chart01Data01, chart01Data02, chart01Data03], $.setMultiBarChartOption03("", chart01Tick, '', chart01SeriesLabel, 0, 3000, true));
	    $(".jqplot-axis").css("margin", "5px");
		
	});
	
	// 게시판 상세보기
	function view_page(bbsNo, pFlag){
		var frm = document.pform;
		var cmmnSubMenuCode = "";
		var bcateno = "";
		if(pFlag == 'notice') {
			$("#pform").attr("action", "/admin/site/bbsView.do");
			bcateno = "<%=noticeBcate%>";
			cmmnSubMenuCode = "ADM004002";
		}
		else {
			$("#pform").attr("action", "/admin/site/bbsView.do");
			bcateno = "<%=guideBcate%>";
			cmmnSubMenuCode = "ADM004010"; 
		}
		frm.bbsNo.value = bbsNo;
		frm.cmmnSubMenuCode.value = cmmnSubMenuCode;
		frm.bcateno.value= bcateno;
		frm.submit();
	}
	
	// 게시판 더보기
	function fnBbsMoreList(pFlag) {
		var frm = document.pform;
		var bcateno = "";
		var cmmnSubMenuCode = "";
		if(pFlag == 'notice') {
			$("#pform").attr("action", "/admin/site/bbsList.do");
			bcateno = "<%=noticeBcate%>";
			cmmnSubMenuCode = "ADM004002";
		}
		else {
			$("#pform").attr("action", "/admin/site/bbsList.do");
			bcateno = "<%=guideBcate%>";
			cmmnSubMenuCode = "ADM004010"; 
		}
		frm.bcateno.value= bcateno;
		frm.cmmnSubMenuCode.value = cmmnSubMenuCode;
		frm.submit();
	}
	
	// 팝업 더보기
	function fnPopupMoreList() {
		var frm = document.pform;
		$("#pform").attr("action", "/admin/site/popupList.do");
		frm.cmmnSubMenuCode.value = "ADM004005";
		frm.submit();
	}
	// 팝업 글 상세보기
	function fnPopupView(popNo) {
		var frm = document.pform;
		frm.popNo.value = popNo;
		$("#pform").attr("action", "/admin/site/popupView.do");
		frm.cmmnSubMenuCode.value = "ADM004005";
		frm.submit();
	}
	
	// 공지사항 일대일문의 탭 이동
	function fnBbsTapList(pFlag) {
		if(pFlag == 'notice') {
			// 공지사항 탭
			$("#noticeTab").addClass("on");
			$("#answerTab").removeClass("on");
			$("#popupTab").removeClass("on");
			$("#noticeBox").show();
			$("#answerBox").hide();
			$("#popupBox").hide();
			$("#classGuide").hide();
		}
		else if(pFlag == 'answer') {
			// 일대일문의 탭
			$("#answerTab").addClass("on");
			$("#noticeTab").removeClass("on");
			$("#popupTab").removeClass("on");
			$("#answerBox").show();
			$("#noticeBox").hide();
			$("#popupBox").hide();
		}
		else if(pFlag == 'classGuide') {
			// 일대일문의 탭
			$("#popupTab").addClass("on");
			$("#noticeTab").removeClass("on");
			$("#answerTab").removeClass("on");
			$("#classGuide").show();
			$("#noticeBox").hide();
			$("#popupBox").hide();
		}
		else {
			// 팝업 탭
			$("#popupTab").addClass("on");
			$("#answerTab").removeClass("on");
			$("#noticeTab").removeClass("on");
			$("#popupBox").show();
			$("#noticeBox").hide();
			$("#answerBox").hide();
		}
	}
	
	// 수강신청현황 과정탭
	function fnCourseTap(pFlag) {
		/* if(pFlag == 'cpsedu') {
			// 대출의무
			$("#cpseduTab").addClass("on");
			$("#enfsnTab").removeClass("on");
			$("#gnrlTab").removeClass("on");
			
			$("#cpseduBox").show();
			$("#enfsnBox").hide();
			$("#gnrlBox").hide();
		}
		else if(pFlag == 'enfsn') {
			// 종사자
			$("#enfsnTab").addClass("on");
			$("#cpseduTab").removeClass("on");
			$("#gnrlTab").removeClass("on");
			
			$("#enfsnBox").show();
			$("#cpseduBox").hide();
			$("#gnrlBox").hide();
		}
		else {
			// 일반
			$("#gnrlTab").addClass("on");
			$("#cpseduTab").removeClass("on");
			$("#enfsnTab").removeClass("on");
			
			$("#gnrlBox").show();
			$("#cpseduBox").hide();
			$("#enfsnBox").hide();
		} */
		
		if(pFlag == 'off') {
			// 집합
			$("#offlineTab").addClass("on");
			$("#onlineTab").removeClass("on");
			$("#lectureTab").removeClass("on");
			
			$("#offlineBox").show();
			$("#onlineBox").hide();
			$("#lectureBox").hide();
		}
		else if(pFlag == 'on') {
			// 온라인
			$("#onlineTab").addClass("on");
			$("#offlineTab").removeClass("on");
			$("#lectureTab").removeClass("on");
			
			$("#onlineBox").show();
			$("#offlineBox").hide();
			$("#lectureBox").hide();
		}
		else {
			// 특강
			$("#lectureTab").addClass("on");
			$("#offlineTab").removeClass("on");
			$("#onlineTab").removeClass("on");
			
			$("#lectureBox").show();
			$("#offlineBox").hide();
			$("#onlineBox").hide();
		}
	}
	
	function fnPayMentView(cseqNo, mtCtypeCode) {
		var frm = document.uform;
		frm.cseqno.value = cseqNo;
		frm.mtCtypeCode.value = mtCtypeCode;
		frm.submit();
	}
	
	// 접속자 통계 더보기
	function fnAccessMore() {
		var frm = document.pform;
		frm.action = "/admin/stats/accessStats.do";
		frm.cmmnRootMenuCode.value = "ADM006";
		frm.cmmnSubMenuCode.value = "ADM006005";
		frm.submit();
				
	}
	
	// 수료자수 통계 더보기
	function fnStats01More() {
		var frm = document.pform;
		frm.action = "/admin/stats/eduStats01.do";
		frm.cmmnRootMenuCode.value = "ADM006";
		frm.cmmnSubMenuCode.value = "ADM006001";
		frm.submit();
	} 
</script>

<div class="main_area">
	<ul class="status_group">
		<li>
			<a href="/admin/user/userList.do?cmmnRootMenuCode=ADM001&cmmnSubMenuCode=ADM001001">
				<div class="today_join">
					<dl>
						<dt>오늘 가입자</dt>
						<dd>
							<c:set var="joinInfo" value="${joinInfomap}"/>
							<c:choose>
								<c:when test="${joinInfo.CNT eq '' || joinInfo.CNT eq null}">0</c:when>
								<c:otherwise><c:out value='${joinInfo.CNT}'/></c:otherwise>
							</c:choose>
						</dd>
						<dd class="stat_icon">
							<c:if test="${joinInfo.COMPARE_INFO == 'UP'}">
								<img src="/admin/images/ico_grow.png" alt="증가" />
							</c:if>
							<c:if test="${joinInfo.COMPARE_INFO == 'DOWN'}">
								<img src="/admin/images/ico_fall.png" alt="감소" />
							</c:if>
						</dd>
					</dl>
				</div>
			</a>
		</li>
		<li>
			<a href="/admin/stats/accessStats.do?subcmd=access&cmmnRootMenuCode=ADM006&cmmnSubMenuCode=ADM006005">
				<div class="today_visit">
					<dl>
						<dt>오늘 방문자</dt>
						<dd>
							<c:set var="accessInfo" value="${accessInfomap}"/>
							<c:choose>
								<c:when test="${accessInfo.ACCES_CNT eq '' || accessInfo.ACCES_CNT eq null}">0</c:when>
								<c:otherwise><c:out value='${accessInfo.ACCES_CNT}'/></c:otherwise>
							</c:choose>
						</dd>
						<dd class="stat_icon">
							<c:if test="${accessInfo.COMPARE_INFO == 'UP'}">
								<img src="/admin/images/ico_grow.png" alt="증가" />
							</c:if>
							<c:if test="${accessInfo.COMPARE_INFO == 'DOWN'}">
								<img src="/admin/images/ico_fall.png" alt="감소" />
							</c:if>
						</dd>
					</dl>
				</div>
			</a>
		</li>
		<li>
			<!-- <a href="/admin/study/cuserList.do?cmmnRootMenuCode=ADM002&&cmmnSubMenuCode=ADM002002004&courseStatus=1"> -->
			<a href="/admin/study/cuserList.do?cmmnRootMenuCode=ADM002&&cmmnSubMenuCode=ADM002002004">
				<div class="studying">
					<dl>
						<dt>현재 수강자</dt>
						<dd><c:out value="${studyUserCnt}"/></dd>
						<dd class="stat_icon"><img src="/admin/images/ico_link.png" alt="바로가기" /></dd>
					</dl>
				</div>
			</a>
		</li>
		<li>
			<a href="/admin/study/cuserList.do?cmmnRootMenuCode=ADM002&&cmmnSubMenuCode=ADM002002004&courseStatus=8">
				<div class="wait_confirm">
					<dl>
						<dt>금월 수료자</dt>
						<dd><c:out value="${isPassCnt}"/></dd>
						<dd class="stat_icon"><img src="/admin/images/ico_link.png" alt="바로가기" /></dd>
					</dl>
				</div>
			</a>
		</li>
	</ul>
	<div class="row">
		<div class="col_2">
			<div class="tab">
				<ul>
					<li class="on" id="noticeTab"><a href="#" onclick="fnBbsTapList('notice');return false;">공지사항</a></li>
				</ul>
			</div>
			<!-- 1:1 문의 -->
			<div class="bbs_list" id="answerBox" style="display: none;">
				<table cellpadding="0" cellspacing="0">
					<caption>1:1 문의 목록</caption>
					<colgroup>
						<col width="60%" />
						<col width="25%" />
						<col width="15%" />
					</colgroup>
					<thead>
						<tr>
							<th>제목</th>
							<th>작성일</th>
							<th>답변</th>
						</tr>
					</thead>
					<tbody>
					<c:choose>
						<c:when test="${fn:length(answerList) > 0}">
							<c:forEach var="result" items="${answerList}" varStatus="status">
							<tr>
								<td class="left"><a href="#" onclick="view_page('<c:out value="${result.BBSNO}"/>', 'answer')"><c:out value='${result.TITLE}'/></a></td>
								<td><c:out value="${result.WDATE}"/></td>
								<td>
									<c:choose>
										<c:when test="${result.ANYN == 'Y'}">
											<img src="/admin/images/ico_o.png" alt="답변완료" />
										</c:when>
										<c:otherwise>
											<img src="/admin/images/ico_x.png" alt="답변대기" />
										</c:otherwise>
									</c:choose>		
								</td>
							</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr><td class="center" colspan="3">등록된 1:1 문의가 없습니다.</td></tr>
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
				<a href="#" onclick="fnBbsMoreList('answer');return false;" class="btn_more"><img src="/admin/images/btn_more.png" alt="더보기" /></a>
			</div>
			<!-- // 1:1 문의 -->
			<!-- 공지사항 -->
			<div class="bbs_list" id="noticeBox" style="display: block;">
				<table cellpadding="0" cellspacing="0">
					<caption>공지사항 목록</caption>
					<colgroup>
						<col width="75%" />
						<col width="25%" />
					</colgroup>
					<thead>
						<tr>
							<th>제목</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
					<c:choose>
						<c:when test="${fn:length(noticeList) > 0}">
							<c:forEach var="result" items="${noticeList}" varStatus="status">
							<tr>
								<td class="left"><a href="#" onclick="view_page('<c:out value="${result.BBSNO}"/>', 'notice');"> <c:out value="${result.TITLE}"/> </a></td>
								<td><c:out value="${result.WDATE}"/></td>
							</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr><td class="center" colspan="2">등록된 공지사항이 없습니다.</td></tr>
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
				<a href="#" onclick="fnBbsMoreList('notice');return false;" class="btn_more"><img src="/admin/images/btn_more.png" alt="더보기" /></a>
			</div>
			<form name="pform" id="pform" action="/admin/site/bbsList.do" method="post">
			<input type="hidden" name="cmmnRootMenuCode" value="ADM004"/>
			<input type="hidden" name="bbsNo" value=""/>
			<input type="hidden" name="popNo" value=""/>
			<input type="hidden" name="bcateno" value=""/>
			<input type="hidden" name="cmmnSubMenuCode" value=""/>
			</form>
			<!-- // 공지사항 -->
			<!-- 팝업 -->
			<div class="bbs_list" id="popupBox" style="display: none;">
				<table cellpadding="0" cellspacing="0">
					<caption>팝업 목록</caption>
					<colgroup>
						<col width="75%" />
						<col width="25%" />
					</colgroup>
					<thead>
						<tr>
							<th>제목</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
					<c:choose>
						<c:when test="${fn:length(popupList) > 0}">
						<c:forEach var="result" items="${popupList}" varStatus="status">
						<tr>
							<td class="left"><a href="#" onclick="fnPopupView('<c:out value="${result.POP_NO}"/>')"><c:out value="${result.POP_TITLE}"/></a></td>
							<td><c:out value="${result.WRITE_DATE}"/></td>
						</tr>
						</c:forEach>
						</c:when>
						<c:otherwise>
							<tr><td class="center" colspan="3">등록된 팝업이 없습니다.</td></tr>
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
				<a href="#" onclick="fnPopupMoreList();return false;" class="btn_more"><img src="/admin/images/btn_more.png" alt="더보기" /></a>
			</div>
			<!-- // 팝업 -->
		</div>
		<div class="col_2" id="accessStatsBox">
			<div style="position: relative;">
				<h5>접속자 통계(최근 일주일)</h5>
				<div id="accessStatsList" style="height:205px;background-color:#CCCCCC;text-align:cneter;vertical-align:middle;"></div>
				<a href="#" onclick="fnAccessMore();return false;" class="btn_more_graph"><img src="/admin/images/btn_more.png" alt="더보기" /></a>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col_1">
			<div class="tab">
				<ul>
					<li class="on" id="onlineTab"><a href="#" onclick="fnCourseTap('on');return false;">메뉴1</a></li>
					<li id="offlineTab"><a href="#" onclick="fnCourseTap('off');return false;">메뉴2</a></li>
				</ul>
			</div>
			<form name="uform" id="uform" action="/admin/payment/payForm.do" method="post">
			<input type="hidden" name="cmmnRootMenuCode" value="ADM005"/>
			<input type="hidden" name="cmmnSubMenuCode" value="ADM005001"/>
			<input type="hidden" name="cseqno" value=""/>
			<input type="hidden" name="mtPmTypeCode" value="SFCOUR"/>
			<input type="hidden" name="mtCtypeCode" value=""/>
			
			<div class="bbs_list" id="offlineBox" style="display:none">
				<table cellpadding="0" cellspacing="0">
					<colgroup>
						<col style="width:8%">
						<col style="width:35%">
						<col style="width:17.5%">
						<col style="width:17.5%">
						<col style="width:12%">
					</colgroup>	
					<thead>
						<tr>
							<th>구분</th>
							<th>과정명</th>
							<th>신청기간</th>
							<th>교육기간</th>
							<th>신청자/정원</th>
						</tr>
					</thead>
					<tbody>
					<c:choose>
						<c:when test="${fn:length(offlineCourseList) > 0}">
						<c:forEach var="result" items="${offlineCourseList}" varStatus="status">
						<tr align=middle>
							<td>${result.MT_CTYPE_NAME}</td> 
							<td class="left"><c:out value="${result.SEQ_TITLE}"/></td> 
							<td><c:out value="${result.APPLY_SDATE}"/> ~ <c:out value="${result.APPLY_EDATE}"/></td>
							<td><c:out value="${result.STUDY_SDATE}"/> ~ <c:out value="${result.STUDY_EDATE}"/></td>
							<td><c:out value="${result.TOT_STUDY_USER}"/>/<c:out value="${result.FIX_CNT}"/></td> 
						</tr> 
						</c:forEach>
						</c:when>
						<c:otherwise>
							<tr><td class="center" colspan="6">등록된 정보가 없습니다.</td></tr>
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
			<a href="/admin/course/seqList.do?cmmnRootMenuCode=ADM002&cmmnSubMenuCode=ADM002001003&mtCtypeCode=DAAA01" class="btn_more"><img src="/admin/images/btn_more.png" alt="더보기" /></a>
			</div>
			
			<div class="bbs_list" id="onlineBox">
				<table cellpadding="0" cellspacing="0">
					<colgroup>
						<col style="width:8%">
						<col style="width:35%">
						<col style="width:17.5%">
						<col style="width:10%">
						<col style="width:12%">
					</colgroup>	
					<thead>
						<tr>
							<th>구분</th>
							<th>과정명</th>
							<th>교육기간</th>
							<th>신청자</th>
							<th>수료자</th>
						</tr>
					</thead>
					<tbody>
					<c:choose>
						<c:when test="${fn:length(onlineCourseList) > 0}">
						<c:forEach var="result" items="${onlineCourseList}" varStatus="status">
						<tr align=middle>
							<td>${result.MT_CTYPE_NAME}</td> 
							<td class="left"><c:out value="${result.SEQ_TITLE}"/></td> 
							<td>
								<c:if test="${result.OPENTYPE == 'A'}">상시운영</c:if>
								<c:if test="${result.OPENTYPE != 'A'}"><c:out value="${result.STUDY_SDATE}"/> ~ <c:out value="${result.STUDY_EDATE}"/></c:if>
							</td>
							<td><c:out value="${result.TOT_STUDY_USER}"/></td>
							<td><c:out value="${result.TOT_PASS_USER}"/></td>		
						</tr> 
						</c:forEach>
						</c:when>
						<c:otherwise>
							<tr><td class="center" colspan="6">등록된 정보가 없습니다.</td></tr>
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
				<a href="/admin/course/seqList.do?cmmnRootMenuCode=ADM002&cmmnSubMenuCode=ADM002001003&mtCtypeCode=DAAA00" class="btn_more"><img src="/admin/images/btn_more.png" alt="더보기" /></a>
			</div>
			
			<div class="bbs_list" id="lectureBox" style="display:none">
				<table cellpadding="0" cellspacing="0">
					<colgroup>
						<col style="width:8%">
						<col style="width:12%">
						<col style="width:25%">
						<col style="width:17%">
						<col style="width:10%">
						<col style="width:12%">
					</colgroup>	
					<thead>
						<tr>
							<th>구분</th>
							<th>신청구분</th>
							<th>신청기관(특강명)</th>
							<th>교육기간</th>
							<th>신청일</th>
							<th>진행상황</th>
						</tr>
					</thead>
					<tbody>
					<c:choose>
						<c:when test="${fn:length(lectureList) > 0}">
						<c:forEach var="result" items="${lectureList}" varStatus="status">
						<tr align="middle">
							<td>특강교육</td> 
							<td><c:out value="${result.MT_SC_NAME}"/></td> 
							<td class="left"><c:out value="${result.APPLY_ORGAN_NM}"/> <c:if test="${result.MT_SC_CODE == 'SC0006'}">(<c:out value="${result.TITLE}"/>)</c:if></td> 
							<td><c:out value="${result.EDU_DATE}"/></td>
							<td><c:out value="${result.REGDATE}"/></td>
							<td>
								 <c:if test="${result.MT_SPECIAL_STAT_CODE eq '1' || 
								 (result.MT_SPECIAL_STAT_CODE != '2' && result.MT_SPECIAL_STAT_CODE != '3')}">승인요청</c:if>
								 <c:if test="${result.MT_SPECIAL_STAT_CODE eq '2'}">승인취소</c:if>
								 <c:if test="${result.MT_SPECIAL_STAT_CODE eq '3'}">승인완료</c:if>
							</td>		
						</tr> 
						</c:forEach>
						</c:when>
						<c:otherwise>
							<tr><td class="center" colspan="5">등록된 특강이 없습니다.</td></tr>
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
				<a href="/admin/lecture/lectureList.do?cmmnRootMenuCode=ADM002" class="btn_more"><img src="/admin/images/btn_more.png" alt="더보기" /></a>
			</div>
			</form>
		</div>
	</div>

	<div class="row">
		<div class="col_1">
			<h5>회원분류별 접속 통계(최근 6개월)</h5>
			<div id="suryoStatsList" style="height:205px;background-color:#CCCCCC;text-align:cneter;vertical-align:middle;"></div>
			<a href="#" onclick="fnStats01More();return false;" class="btn_more_graph"><img src="/admin/images/btn_more.png" alt="더보기" /></a>
		</div>
	</div>

</div>

<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>
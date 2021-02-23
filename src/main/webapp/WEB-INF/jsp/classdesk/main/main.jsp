<%
/* *******************************************
    system  : 클래스데스크 > 강사&사용자 > 메인화면
    title   : 메인
    summary :	
    wdate   : 2015-04-01
    writer  : SANGS
******************************************* */
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<c:set var="topMenuCode" value="main"/>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript"> 
	function errimg(img){ 
		img.src='/classdesk/images/thumb_noimage.gif';
	}
	
	jQuery(document).ready(function() {
		// 클래스 데스크 필수 파라미터 쿠키 저장
		if ("<c:out value="${REQUEST_DATA.paramCourseNo}"/>") {
			$.cookie('classdeskCookieParamCourseNo','',{expires:-1, path:'/'});
			$.cookie('classdeskCookieParamcSeqNo','',{expires:-1, path:'/'});
			$.cookie('classdeskCookieParamcUserNo','',{expires:-1, path:'/'});
			$.cookie('classdeskCookieParamUserNo','',{expires:-1, path:'/'});
			
			$.cookie('classdeskCookieParamCourseNo',"<c:out value="${REQUEST_DATA.paramCourseNo}"></c:out>",{expires:7, path:'/'});
			$.cookie('classdeskCookieParamcSeqNo',"<c:out value="${REQUEST_DATA.paramcSeqNo}"></c:out>",{expires:7, path:'/'});
			$.cookie('classdeskCookieParamcUserNo',"<c:out value="${REQUEST_DATA.paramcUserNo}"></c:out>",{expires:7, path:'/'});
			$.cookie('classdeskCookieParamUserNo',"<c:out value="${REQUEST_DATA.userNo}"></c:out>",{expires:7, path:'/'});
		}
	});
</script>
<c:choose>
    <c:when test="${REQUEST_DATA.SES_GRADENO eq SUPERGRADENO ||  REQUEST_DATA.SES_GRADENO eq TUTORGRADENO}">
        <!-- 관리자 or 강사 -->
        <c:set var="strText" value="학생 평균 진도율"/>
        <c:set var="progVal" value="${progItem.AVG_PER}" /> <!-- 학생평균 진도율 -->
        
        <c:set var="strText2" value="진도 학습 완료 인원"/>
        
        
    </c:when>
    <c:otherwise>
        <!-- 사용자 -->
        <c:set var="strText" value="진도율"/>
        <c:set var="progVal" value="${progItem.PROG_PER}"/> <!-- 학생평균 진도율 -->
        <c:set var="strText2" value="마지막학습일자"/>
    </c:otherwise>
</c:choose> 



    <!-- 강의정보 & 목차 -->
    <div id="content" class="round-box">
        <div class="lecture-container">
			<!-- 과정명 -->
			<div class="teacher-info "> 
				<div class="thumb-img">
						<img src="/classdesk/images/thumb01.jpg" width="98" height="58" alt="과정이미지">
					<!--<img src="<c:out value="${DOMAIN}"/>/<c:out value="${FILR_ROOT}"/>/<c:out value="${COURSE_PATH}"/>/<c:out value="${tchItem.IMG1}"/>" width="98" height="58" alt="과정이미지"  >
					-->
				</div>
				<h3 class="info-title">
					<c:out value="${tchItem.SEQ_TITLE}" />
					&nbsp;
					<a href="<c:out value="${ctx}"/>/classdesk/user/progress/treeList.do?from=E320" class="btn-small-orange" target="_self"><span style="height:22px !important;">강의보기</span></a>
				</h3>
			</div>
 			<!-- //과정명 -->
        </div>

        <div class="half-box-wrap clearfix">
			<!-- 강의정보 -->
			<div class="box50">
				<div class="main-half-box">
					<div class="in-box-type2">
						<ul style="overflow: auto;">
							<li><strong>학습기간 : </strong>
							<c:choose>
								<c:when test="${tchItem.OPENTYPE eq 'A'}">
										<c:choose>
											<c:when test="${REQUEST_DATA.SES_GRADENO eq SUPERGRADENO ||  REQUEST_DATA.SES_GRADENO eq TUTORGRADENO}">
												<span>상시</span>
											</c:when>
											<c:otherwise>
												<span><fmt:formatDate value="${cuserItem.STARTDATE}" pattern="yyyy.MM.dd" /> ~ <fmt:formatDate value="${cuserItem.ENDDATE}" pattern="yyyy.MM.dd" /> (<c:out value="${COMMON_DATA.EDUDAY}"/>일)</span>
											</c:otherwise>
										</c:choose>
								</c:when>
								<c:otherwise>
									<span><fmt:formatDate value="${tchItem.STUDY_SDATE}" pattern="yyyy.MM.dd" /> ~ <fmt:formatDate value="${tchItem.STUDY_EDATE}" pattern="yyyy.MM.dd" /></span>
								</c:otherwise>
							</c:choose></li>
							<li><strong>과정설명 : </strong><c:out value="${tchItem.DESCRIPTION}"/></li>
							<li><strong>교육대상 : </strong><c:out value="${tchItem.TARGET}"/></li>
							<li><strong>수료점수 : </strong><c:out value="${tchItem.COMP_VAL}"/> 점</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- //강의정보 -->
			<!-- 목차 -->
			<div class="box50">
				<div class="main-half-box">
					<div class="in-box-type2">
						<ul style="overflow: auto;">
							<li><strong>목차</strong>
								<%-- <pre><c:out value="${fn:replace(tchItem.PROGRESS, crlf, '<br />')}"/></pre> --%>
								<c:if test="${fn:length(trees) > 0}">
									<c:forEach var="tree" items="${trees}">
										<p style="line-height: 10px;">${tree.SUBJECT}</p>
									</c:forEach>
								</c:if>
							</li>
						</ul>
						<a href="/classdesk/user/progress/treeList.do" class="btn_more2"><img src="/classdesk/images/btn_more2.png" alt="더보기" style="padding-right: 5px;"/></a>
					</div>
				</div>
			</div>
			<!-- //목차 -->
        </div>

    </div>
    <!-- //강의정보&목차 -->

    <div class="main-content clearfix">
		<!-- 진도율 표시 테이블 -->
        <div class="in-box-type2">
			<div class="table-title clearfix">
				<h3 class="ico-table-blue">진도</h3>
			</div>
			<div class="table-type2">
				<table summary="상상스토리 교육시스템 클래스데스크의 진도율 표시 테이블입니다.">
					<caption>진도율 표시 테이블</caption>
					<colgroup>
						<col width="200" />
						<col width="" />
					</colgroup>
					<tbody>
						<tr>
							<th>진도율 </th>
							<td>
								<!-- 진도율 게이지 표시 : class="gauge"의 width값으로 조절 -->
								<div class="progress-bar">
									<div class="progress-in">
										<span><c:out value="${progVal}" default="0"   />% </span>
										  <div class="gauge" style="width: <c:out value="${progVal}"  default="0" />%"></div>
									</div> 
								</div>
								<!-- //진도율 게이지 표시 -->
							</td>
						</tr>
						 <tr>
							<th>마지막학습일자</th>
							<td><c:out value="${progItem.EDATE}"/></td>
						</tr> 
					</tbody>
				</table>
			</div>
		</div>
		<!-- //진도율 표시 테이블 -->
         <!-- 공지사항 -->
        <div class="main-content-box3">
            <div class="in-box-type3">
                <div class="table-title clearfix">
                    <h3 class="ico-table-blue">공지사항</h3>
                    <div class="btn-group">
                        <ul class="btn-scroll">
                            <li>
								<a href="/classdesk/bbs/list.do?pbcateno=<%=SangsProperties.getProperty("Globals.bbsPcateClassNotice")%>&bcateno=<%=SangsProperties.getProperty("Globals.bbsBcateClassNotice")%>"><img src="/classdesk/images/btn_more.png" alt="더보기" /></a>    
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- 공지사항 게시판 -->
                <div class="table-type1">
                    <table summary="상상스토리 교육시스템 클래스데스크의 공지사항 게시판입니다.">
                        <caption>공지사항 게시판</caption>
                        <colgroup>
                            <col width="*" />
                            <col width="30%" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>제목</th>
                                <th>날짜</th>
                            </tr>
                        </thead>
                        <tbody>
						<c:choose>
							<c:when test="${not empty boardList}">
								<c:forEach items="${boardList}" begin="0" end="4" var="result" varStatus="stat">
								<tr>
									<td class="left"><a href="<c:out value="${ctx}"/>/classdesk/bbs/view.do?pbcateno=<%=SangsProperties.getProperty("Globals.bbsPcateClassNotice")%>&bcateno=<%=SangsProperties.getProperty("Globals.bbsBcateClassNotice")%>&bbsNo=<c:out value="${result.BBSNO }"/>"><c:out value="${result.TITLE }"/></a></td>
									<td class="date"><c:out value="${result.WDATE}"/></td>
								</tr>
								</c:forEach>
							</c:when>
							<c:otherwise> 
								<tr>
									<td colspan="2" align="center">등록된 정보가 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
						</tbody>
                    </table>
                </div>
                <!-- //공지사항 게시판 -->
            </div>
        </div>
        <!-- //공지사항 -->
        <!-- 자료실 -->
        <div class="main-content-box3 middle">
            <div class="in-box-type3">
                <div class="table-title clearfix">
                    <h3 class="ico-table-blue">자료실</h3>
                    <div class="btn-group">
                        <ul class="btn-scroll">
                            <li>
								<a href="/classdesk/bbs/list.do?pbcateno=<%=SangsProperties.getProperty("Globals.bbsPcateClassData")%>&bcateno=<%=SangsProperties.getProperty("Globals.bbsBcateClassData")%>"><img src="/classdesk/images/btn_more.png" alt="더보기" /></a>    
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- 자료실 게시판 -->
                <div class="table-type1">
					<table summary="상상스토리 교육시스템 클래스데스크의 자료실 게시판입니다.">
						<caption>자료실 게시판</caption>
						<colgroup>
                            <col width="*" />
                            <col width="30%" />
						</colgroup>
						<thead>
							<tr>
                                <th>제목</th>
                                <th>날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
							<c:when test="${not empty courselistData}">
								<c:forEach items="${courselistData}" begin="0" end="4" var="result" varStatus="stat">
								<tr>
									<td class="left"><a href="<c:out value="${ctx}"/>/classdesk/bbs/view.do?pbcateno=<c:out value="${REQUEST_DATA.pbcateno}"/>&bdateno=<c:out value="${REQUEST_DATA.bcateno}"/>&bbsNo=<c:out value="${result.BBSNO }"/>"><c:out value="${result.TITLE }"/></a></td>
									<td class="date"><c:out value="${result.WDATE}"/></td>
								</tr>
								</c:forEach>
							</c:when>
							<c:otherwise> 
								<tr>
									<td colspan="2" align="center">등록된 정보가 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
						</tbody>
					</table>
                </div>
                <!-- //자료실 게시판 -->
            </div>
        </div>
        <!-- //자료실 -->
        <!-- 설문 -->
        <div class="main-content-box3">
            <div class="in-box-type3">
              <div class="table-title clearfix">
                    <h3 class="ico-table-blue">설문</h3>
                    <div class="btn-group">
                        <ul class="btn-scroll">
                            <li>
                            	<c:choose>
                                    <c:when test="${REQUEST_DATA.SES_GRADENO eq SUPERGRADENO ||  REQUEST_DATA.SES_GRADENO eq TUTORGRADENO}">
									<a href="/classdesk/tutor/poll/list.do"><img src="/classdesk/images/btn_more.png" alt="더보기" /></a>    
									</c:when>
									<c:otherwise>
									<a href="/classdesk/user/poll/list.do"><img src="/classdesk/images/btn_more.png" alt="더보기" /></a>
									</c:otherwise>
								</c:choose>
                            </li>
                        </ul>
                    </div>
                </div> 
                
                <!-- 설문게시판 -->
                <div class="table-type1">
                    <div class="table-header-left"></div>
                    <table summary="상상스토리 교육시스템 클래스데스크의 설문게시판입니다.">
                        <caption>설문 게시판</caption>
                        <colgroup>
                            <col width="*" />
                            <col width="40%"/>
                        </colgroup>
                        <thead>
                            <tr>
                                <th>설문명</th>
                                <th>설문기간</th>
                            </tr>
                        </thead>
                        <tbody>                                
						<c:choose>
                            <c:when test="${fn:length(pollList) > 0}">
                                <c:forEach items="${pollList}" begin="0" end="4" var="result" varStatus="stat">
                                
                                <tr>
                                    <td class="left">
                                    	<c:choose>
                                    		<c:when test="${REQUEST_DATA.SES_GRADENO eq SUPERGRADENO ||  REQUEST_DATA.SES_GRADENO eq TUTORGRADENO}">
                                          		<a href="/classdesk/tutor/poll/list.do"><c:out value="${fn:substring(result.TITLE,0,20)}" /><c:if test="${fn:length(result.TITLE) > 20}">&sdot;&sdot;&sdot;</a></c:if>
                                         	</c:when>
                                         	<c:otherwise>
                                         		<a href="/classdesk/user/poll/list.do"><c:out value="${fn:substring(result.TITLE,0,20)}" /><c:if test="${fn:length(result.TITLE) > 20}">&sdot;&sdot;&sdot;</a></c:if>
                                         	</c:otherwise>
                                         </c:choose> 
                                    </td>
                                    <td class="date">
                                    	<c:choose>
                                    	<c:when test="${result.OPENTYPE eq 'A'}">상시</c:when>
										<c:otherwise>
											<c:out value="${result.SDATE}" />~<c:out value="${result.EDATE}" /> 
<%-- 											<fmt:formatDate value="${result.SDATE}" pattern="yyyy.MM.dd" /> ~ <fmt:formatDate value="${result.EDATE}" pattern="yyyy.MM.dd" /> --%>
										</c:otherwise>
										</c:choose>
                                    </td>
                                </tr>
                                
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                     <td colspan="2" align="center">등록된 정보가 없습니다.</td>                                   
                                </tr>
                            </c:otherwise>
                        </c:choose>
                        </tbody>
                    </table>
                </div>
                <!-- //설문 게시판 -->
                
            </div>
        </div>
    </div>

        </div>
<!-- content -->

<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/footer_inc.jsp" %>

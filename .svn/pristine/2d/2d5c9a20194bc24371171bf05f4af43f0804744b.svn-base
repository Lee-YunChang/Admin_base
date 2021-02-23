<%
/****************************************************
    system  : 클래스데스크 > 강사&사용자 > 메인화면
    title   : 메인
    summary :	
    wdate   : 2015-04-01
    writer  : SANGS
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<c:set var="topMenuCode" value="main"/>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/header_inc.jsp"  %> 

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
 
 
    <!-- //개설과목명 -->
    <!-- 강의정보 & 공지사항 -->
    <div class="round-box">
        <div class="lecture-container">
                <!-- 강의정보 영역 -->
                <div class="teacher-info"> 
                    <div class="thumb-img">
                        <img src="<c:out value="${DOMAIN}"/>/<c:out value="${FILR_ROOT}"/>/<c:out value="${COURSE_PATH}"/>/<c:out value="${tchItem.IMG1}"/>"  onerror="errimg(this);" width="231" height="138" alt="과정이미지"  >
                    </div>
                    <h3 class="info-title"><c:out value="${COMMON_DATA.SEQ_TITLE}" /></h3>
                    <ul>  
                        <%-- <li class="ico-teacher">
                            <strong>강사 :</strong>
                            
                            <c:choose>
                                <c:when test="${ not empty tutorItem.USERNAME }">
                                    <span><c:out value="${tutorItem.USERNAME }" default=""/> (<c:out value="${tutorItem.EMAIL }" default=""/> )</span>
                                </c:when>
                                <c:otherwise>
                                    <span>상상스토리 튜터</span>
                                </c:otherwise>
                            </c:choose>
                                
                                
                        </li> --%>
                        <li class="ico-dot">
                            <strong>학습기간 :</strong>
                            <c:choose>
                                <c:when test="${tchItem.OPENTYPE eq 'A'}">
                                        <c:choose>
                                            <c:when test="${REQUEST_DATA.SES_GRADENO eq SUPERGRADENO ||  REQUEST_DATA.SES_GRADENO eq TUTORGRADENO}">
                                                <span>상시</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span><fmt:formatDate value="${cuserItem.STARTDATE}" pattern="yyyy.MM.dd" /> ~ <fmt:formatDate value="${cuserItem.ENDDATE}" pattern="yyyy.MM.dd" /></span>
                                            </c:otherwise>
                                        </c:choose>
                                </c:when>
                                <c:otherwise>
                                    <span><fmt:formatDate value="${tchItem.STUDY_SDATE}" pattern="yyyy.MM.dd" /> ~ <fmt:formatDate value="${tchItem.STUDY_EDATE}" pattern="yyyy.MM.dd" /></span>
                                </c:otherwise>
                            </c:choose>
                        </li>
                        <li class="ico-dot">
                            <strong>평가방법 :</strong>
                            <div class="assess-graph clearfix">
                            
                                <span class="attend" style="width:0<c:out value="${COMMON_DATA.EVAL_ATTEND }"/>%;<c:if test="${COMMON_DATA.EVAL_ATTEND < 1}">;disaply:none;</c:if>">출석 <c:out value="${COMMON_DATA.EVAL_ATTEND }"/></span>
                                <span class="progress" style="width:0<c:out value="${COMMON_DATA.EVAL_PROGRESS }"/>%;<c:if test="${COMMON_DATA.EVAL_PROGRESS < 1}">;disaply:none;</c:if>">진도 <c:out value="${COMMON_DATA.EVAL_PROGRESS }"/></span>
                                <span class="report" style="width:0<c:out value="${COMMON_DATA.EVAL_REPORT }"/>%;<c:if test="${COMMON_DATA.EVAL_REPORT < 1}">;disaply:none;</c:if>">과제 <c:out value="${COMMON_DATA.EVAL_REPORT }"/></span>
                                <span class="exam" style="width:0<c:out value="${COMMON_DATA.EVAL_EXAM_SUM }"/>%;<c:if test="${COMMON_DATA.EVAL_EXAM_SUM < 1}">;disaply:none;</c:if>">시험 <c:out value="${COMMON_DATA.EVAL_EXAM_SUM }"/></span>
                            </div>
                        </li>
                        
                        <c:if test="${REQUEST_DATA.SES_GRADENO eq SUPERGRADENO ||  REQUEST_DATA.SES_GRADENO eq TUTORGRADENO}">
                        <li class="ico-dot">
                            <strong>정원 :</strong>
                            <span><em class="red_b"><c:out value="${tchItem.TOTCNT}" default="0"/> </em> / <c:out value="${tchItem.FIX_CNT}" default="0"/> </span>
                        </li>
                        </c:if>
                    </ul>
                </div>
                <!-- //강의정보 영역 -->
        </div>

        <div class="half-box-wrap clearfix">
            <!-- 진도 -->
            <div class="main-half-box">
                <div class="in-box-type2">
                    <div class="table-title clearfix">
                        <h3 class="ico-table-blue">진도</h3>
                    </div>
                    <div class="round-box-small blue">
                        <!-- 진도율 표시 테이블 -->
                        <div class="table-type2">
                            <table summary="상상스토리 교육시스템 클래스데스크의 진도율 표시 테이블입니다.">
                                <caption>진도율 표시 테이블</caption>
                                <colgroup>
                                    <col width="200" />
                                    <col width="" />
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th><c:out value="${strText}" /> </th>
                                        <td>
                                            <!-- 진도율 게이지 표시 : class="gauge"의 width값으로 조절 -->
                                            <div class="progress-bar">
                                                <div class="progress-in">
                                                    <span> 
                                                         <c:out value="${progVal}" default="0"   />% 
                                                    </span>
                                                    <div class="gauge" style="width: <c:out value="${progVal}"  default="0" />%"></div>
                                                </div> 
                                            </div>
                                            <!-- //진도율 게이지 표시 -->
                                        </td>
                                    </tr>
                                     <tr>
                                        <th><c:out value="${strText2}" /></th>
                                        <td>
                                            <c:choose>
                                                <c:when test="${REQUEST_DATA.SES_GRADENO eq SUPERGRADENO ||  REQUEST_DATA.SES_GRADENO eq TUTORGRADENO}">
                                                    <!-- 관리자 or 강사 -->
                                                    <em class="red_b"><c:out value="${progItem.COMPUSER_CNT}" default="0"/></em>/<c:out value="${tchItem.TOTCNT}" default="0"/>
                                                </c:when>
                                                <c:otherwise>
                                                    <!-- 사용자 -->
                                                    <c:out value="${progItem.EDATE}" default="-"/>
                                                </c:otherwise>
                                            </c:choose>                             
                                        </td>
                                    </tr> 
                                </tbody>
                            </table>
                        </div>
                        <!-- //진도율 표시 테이블 -->
                    </div>
                </div>
            </div>
            <!-- //진도 -->
            <!-- 공지사항 영역 -->
            <div class="main-half-box">
                <div class="in-box-type2">
                    <div class="notice">
                        <div class="table-title clearfix">
                            <h3 class="ico-table-orange">공지사항</h3>
                            
                            <c:if test="${REQUEST_DATA.SES_GRADENO eq SUPERGRADENO ||  REQUEST_DATA.SES_GRADENO eq TUTORGRADENO}">
                            <div class="btn-group">
                                <a href="/classdesk/bbs/form.do?pbcateno=<%=SangsProperties.getProperty("Globals.bbsBcateClassNotice")%>&bbsNo=0" class="btn-small-white" ><span class="blue">등록</span></a>
                            </div>
                            </c:if>
                        </div>
                        <div class="table-type1">
                            <table summary="상상스토리 교육시스템 클래스데스크의 공지사항 게시판입니다.">
                                <caption>공지사항 게시판</caption>
                                <colgroup>
                                    <col width="" />
                                    <col width="100" />
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
                                            <c:forEach items="${boardList}" begin="0" end="3" var="result" varStatus="stat">
                                            <tr>
                                                <td style="overflow:hidden;" class="left"><div class="notice_txt">· <c:if test="${result.COMYN eq 'Y'}"><font color="blue">[과정공통]</font></c:if> <a href="<c:out value="${ctx}"/>/classdesk/bbs/view.do?pbcateno=<c:out value="${REQUEST_DATA.pbcateno}"/>&bbsNo=<c:out value="${result.BBSNO }"/>"><c:out value="${result.TITLE }"/></a></div></td>
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
                    </div>
                </div>
            </div>
            <!-- //공지사항 영역 -->
        </div>

    </div>
    <!-- //강의정보 & 공지사항 -->
    <div class="main-content clearfix">
        <!-- 과제 -->
        <c:if test="${fn:substring(COMMON_DATA.CLASS_DESK,1,2) == 1}">
        <div class="main-content-box3">
            <div class="in-box-type3">
                <div class="table-title clearfix">
                    <h3 class="ico-table-blue">과제</h3>
                    <div class="btn-group">
                        <ul class="btn-scroll">
                            <li>
                                <c:choose>
                                    <c:when test="${REQUEST_DATA.SES_GRADENO eq SUPERGRADENO ||  REQUEST_DATA.SES_GRADENO eq TUTORGRADENO}">
                                        <!-- 관리자 or 강사 -->
                                        <a href="/classdesk/tutor/report/list.do"  class="btn-small-green"><img src="/classdesk/images/btn_more.png" alt="더보기" /></a>      
                                    </c:when>
                                    <c:otherwise>
                                        <!-- 사용자 -->
                                        <a href="/classdesk/user/report/list.do"  class="btn-small-green"><img src="/classdesk/images/btn_more.png" alt="더보기" /></a>       
                                    </c:otherwise>
                                </c:choose>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- 과제 게시판 -->
                <div class="table-type1">
                    <table summary="상상스토리 교육시스템 클래스데스크의 과제 게시판입니다.">
                        <caption>과제 게시판</caption>
                        <colgroup>
                            <col width="*" />
                            <col width="30%" />
                            <c:if test="${REQUEST_DATA.SES_GRADENO eq SUPERGRADENO ||  REQUEST_DATA.SES_GRADENO eq TUTORGRADENO}">
                                <col width="10%" />
                            </c:if>
                        </colgroup>
                        <thead>
                            <tr>
                                <th>과제명</th>
                                <th>과제기간</th>
                                <c:if test="${REQUEST_DATA.SES_GRADENO eq SUPERGRADENO ||  REQUEST_DATA.SES_GRADENO eq TUTORGRADENO}">
                                    <th>제출</th>
                                </c:if>
                            </tr>
                        </thead>
                        <tbody>
                            
                        <c:choose>
                            <c:when test="${not empty reportList}">
                                <c:forEach items="${reportList}" begin="0" end="2" var="result" varStatus="stat">
                    
                                <tr>
                                    <td class="left">
                                        <%-- <a href="<c:out value="${ctx}"/>/classdesk/tutor/report.do?subcmd=user_list&reportNo=<c:out value="${result.REPORTNO}"/>"> --%>
                                            <c:out value="${fn:substring(result.TITLE,0,20)}" /> <c:if test="${fn:length(result.TITLE) > 20}">&sdot;&sdot;&sdot;</c:if>
                                        <!-- </a> -->
                                    </td>
                                    <td><fmt:formatDate value="${result.SDATE}" pattern="yyyy.MM.dd" />   ~ <fmt:formatDate value="${result.EDATE}" pattern="yyyy.MM.dd" /></td>
                                    
                                    <c:if test="${REQUEST_DATA.SES_GRADENO eq SUPERGRADENO ||  REQUEST_DATA.SES_GRADENO eq TUTORGRADENO}">
                                        <td><em class="red_b"><c:out value="${result.SCNT}"/></em>/<c:out value="${result.TOTCNT}"/></td>
                                    </c:if>
                                    
                                </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    
                                    <c:choose>
                                        <c:when test="${REQUEST_DATA.SES_GRADENO eq SUPERGRADENO ||  REQUEST_DATA.SES_GRADENO eq TUTORGRADENO}">
                                            <!-- 관리자 or 강사 -->
                                            <td colspan="3" align="center">등록된 정보가 없습니다.</td>
                                        </c:when>
                                        <c:otherwise>
                                            <!-- 사용자 -->
                                            <td colspan="2" align="center">등록된 정보가 없습니다.</td>
                                        </c:otherwise>
                                </c:choose>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                        </tbody>
                    </table>
                </div>
                <!-- //과제 게시판 -->
            </div>
        </div>
        </c:if>
        <!-- //과제 -->
        <!-- 시험 -->
        <c:if test="${fn:substring(COMMON_DATA.CLASS_DESK,2,3) == 1}">
        <div class="main-content-box3 middle">
            <div class="in-box-type3">
                <div class="table-title clearfix">
                    <h3 class="ico-table-blue">시험</h3>
                    <div class="btn-group">
                        <ul class="btn-scroll">
                            <li>
                                <c:choose>
                                    <c:when test="${REQUEST_DATA.SES_GRADENO eq SUPERGRADENO ||  REQUEST_DATA.SES_GRADENO eq TUTORGRADENO}">
                                        <!-- 관리자 or 강사 -->
                                        <a href="/classdesk/tutor/exam/list.do"   class="btn-small-green"><img src="/classdesk/images/btn_more.png" alt="더보기" /></a>
                                    </c:when>
                                    <c:otherwise>
                                        <!-- 사용자 -->
                                        <a href="/classdesk/user/exam/list.do" class="btn-small-green"><img src="/classdesk/images/btn_more.png" alt="더보기" /></a>
                                    </c:otherwise>
                                </c:choose>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- 시험 게시판 -->
                <div class="table-type1">
                    <c:choose>
                            <c:when test="${tchItem.OPENTYPE eq 'A'}">
                                    <table summary="상상스토리 교육시스템 클래스데스크의 시험  게시판입니다.">
                                        <caption>시험 게시판</caption>
                                        <colgroup>
                                            <col width="10%" />
                                            <col width="" />
                                            <col width="30%" />
                                            <c:if test="${REQUEST_DATA.SES_GRADENO eq SUPERGRADENO ||  REQUEST_DATA.SES_GRADENO eq TUTORGRADENO}">
                                                    <col width="10%" />
                                                </c:if>
                                            
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th>구분</th>
                                                <th>시험명</th>
                                                <th>시험기간</th>
                                                <c:if test="${REQUEST_DATA.SES_GRADENO eq SUPERGRADENO ||  REQUEST_DATA.SES_GRADENO eq TUTORGRADENO}">
                                                    <th>응시</th>
                                                </c:if>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:choose>
                                            <c:when test="${not empty examList}">
                                                <c:forEach items="${examList}" begin="0" end="2" var="result" varStatus="stat">
                                                
                                                        <c:if test="${result.USEYN eq 'Y'}">
                                                                <tr>
                                                                    <td><c:out value="${result.EXAM_TYPE_NM}"/></td>
                                                                    <td class="left">
                                                                        <%-- <a href="${ctx}/classdesk/tutor/exam.do?subcmd=user_list&examNo=<c:out value="${result.EXAMNO}"/>"> --%>
                                                                            <c:out value="${fn:substring(result.TITLE,0,20)}" /> <c:if test="${fn:length(result.TITLE) > 20}">&sdot;&sdot;&sdot;</c:if>
                                                                        <!-- </a> -->
                                                                    </td>
                                                                    <td><fmt:formatDate value="${result.SDATE}" pattern="yyyy.MM.dd" />   ~ <fmt:formatDate value="${result.EDATE}" pattern="yyyy.MM.dd" /></td>
                                                                    <c:if test="${REQUEST_DATA.SES_GRADENO eq SUPERGRADENO ||  REQUEST_DATA.SES_GRADENO eq TUTORGRADENO}">
                                                                        <td><em class="red_b"><c:out value="${result.SCNT}"/></em>/<c:out value="${result.TOTCNT}"/></td>
                                                                    </c:if>
                                                                    
                                                                </tr>
                                                        </c:if>
                                                
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <tr>
                                                    
                                                    <c:choose>
                                                        <c:when test="${REQUEST_DATA.SES_GRADENO eq SUPERGRADENO ||  REQUEST_DATA.SES_GRADENO eq TUTORGRADENO}">
                                                            <!-- 관리자 or 강사 -->
                                                            <td colspan="4" align="center">등록된 정보가 없습니다.   </td>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <!-- 사용자 -->
                                                            <td colspan="3" align="center">등록된 정보가 없습니다.   </td>
                                                        </c:otherwise>
                                                </c:choose>
                                                </tr>
                                                
                                            </c:otherwise>
                                        </c:choose>
                                        </tbody>
                                    </table>
                            
                            
                            </c:when>
                            <c:otherwise>
                                    <table summary="상상스토리 교육시스템 클래스데스크의 시험  게시판입니다.">
                                        <caption>시험 게시판</caption>
                                        <colgroup>
                                            <col width="10%" />
                                            <col width="" />
                                            <col width="30%" />
                                            <c:if test="${REQUEST_DATA.SES_GRADENO eq SUPERGRADENO ||  REQUEST_DATA.SES_GRADENO eq TUTORGRADENO}">
                                                    <col width="10%" />
                                                </c:if>
                                            
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th>구분</th>
                                                <th>시험명</th>
                                                <th>시험기간</th>
                                                <c:if test="${REQUEST_DATA.SES_GRADENO eq SUPERGRADENO ||  REQUEST_DATA.SES_GRADENO eq TUTORGRADENO}">
                                                    <th>응시</th>
                                                </c:if>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:choose>
                                            <c:when test="${not empty examList}">
                                                <c:forEach items="${examList}" begin="0" end="2" var="result" varStatus="stat">
                                                <tr>
                                                    <td><c:out value="${result.EXAM_TYPE_NM}"/></td>
                                                    <td class="left">
                                                        <%-- <a href="${ctx}/classdesk/tutor/exam.do?subcmd=user_list&examNo=<c:out value="${result.EXAMNO}"/>"> --%>
                                                            <c:out value="${fn:substring(result.TITLE,0,20)}" /> <c:if test="${fn:length(result.TITLE) > 20}">&sdot;&sdot;&sdot;</c:if>
                                                        <!-- </a> -->
                                                    </td>
                                                    <td><fmt:formatDate value="${result.SDATE}" pattern="yyyy.MM.dd" />   ~ <fmt:formatDate value="${result.EDATE}" pattern="yyyy.MM.dd" /></td>
                                                    <c:if test="${REQUEST_DATA.SES_GRADENO eq SUPERGRADENO ||  REQUEST_DATA.SES_GRADENO eq TUTORGRADENO}">
                                                        <td><em class="red_b"><c:out value="${result.SCNT}"/></em>/<c:out value="${result.TOTCNT}"/></td>
                                                    </c:if>
                                                    
                                                </tr>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <tr>
                                                    
                                                    <c:choose>
                                                        <c:when test="${REQUEST_DATA.SES_GRADENO eq SUPERGRADENO ||  REQUEST_DATA.SES_GRADENO eq TUTORGRADENO}">
                                                            <!-- 관리자 or 강사 -->
                                                            <td colspan="4" align="center">등록된 정보가 없습니다.   </td>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <!-- 사용자 -->
                                                            <td colspan="3" align="center">등록된 정보가 없습니다.   </td>
                                                        </c:otherwise>
                                                </c:choose>
                                                </tr>
                                                
                                            </c:otherwise>
                                        </c:choose>
                                        </tbody>
                                    </table>
                            </c:otherwise>
                        </c:choose>
                    
                    
                </div>
                <!-- //시험 게시판 -->
            </div>
        </div>
        </c:if>
        <!-- //시험 -->
        <!-- 설문 -->
        <c:if test="${fn:substring(COMMON_DATA.CLASS_DESK,4,5) == 1}">
        <div class="main-content-box3">
            <div class="in-box-type3">
              <div class="table-title clearfix">
                    <h3 class="ico-table-blue">설문</h3>
                    
                    
                    <%-- 
                    <c:if test="${REQUEST_DATA.SES_GRADENO eq SUPERGRADENO ||  REQUEST_DATA.SES_GRADENO eq TUTORGRADENO}">
                        <c:if test="${empty pollList}">
                            <div class="btn-group">
                                <a href="#none" class="btn-large-blue"><span>설문등록</span></a>
                            </div>
                        </c:if>
                    
                    </c:if> --%>
                    
                    <div class="btn-group">
                        <ul class="btn-scroll">
                            <li>
                                <c:choose>
                                    <c:when test="${REQUEST_DATA.SES_GRADENO eq SUPERGRADENO ||  REQUEST_DATA.SES_GRADENO eq TUTORGRADENO}">
                                        <!-- 관리자 or 강사 -->
                                        <a href="/classdesk/tutor/poll/list.do" class="btn-small-green"><img src="/classdesk/images/btn_more.png" alt="더보기" /></a> 
                                    </c:when>
                                    <c:otherwise>
                                        <!-- 사용자 -->
                                        <a href="/classdesk/user/poll/list.do" class="btn-small-green"><img src="/classdesk/images/btn_more.png" alt="더보기" /></a>  
                                    </c:otherwise>
                                </c:choose>
                            </li>
                        </ul>
                    </div>
                </div> 
                
                <!-- 설문게시판 -->
                <div class="table-type1">
                    <div class="table-header-left"></div>
                    <table summary="상상스토리 교육시스템 클래스데스크의 설문  게시판입니다.">
                        <caption>설문 게시판</caption>
                        <colgroup>
                            <col width="*" />
                            <col width="30%" />
                            <c:if test="${REQUEST_DATA.SES_GRADENO eq SUPERGRADENO ||  REQUEST_DATA.SES_GRADENO eq TUTORGRADENO}">
                                    <col width="10%" />
                                </c:if>
                        </colgroup>
                        <thead>
                            <tr>
                                <th>설문명</th>
                                <th>설문기간</th>
                                <c:if test="${REQUEST_DATA.SES_GRADENO eq SUPERGRADENO ||  REQUEST_DATA.SES_GRADENO eq TUTORGRADENO}">
                                    <th>응답인원</th>
                                </c:if>
                            </tr>
                        </thead>
                        <tbody>
                        <c:choose>
                            <c:when test="${not empty pollList}">
                                <c:forEach items="${pollList}" begin="0" end="1" var="result" varStatus="stat">
                                <tr>
                                    <td class="left">
                                        <%-- <a href="${ctx}/classdesk/tutor/poll.do?subcmd=stats"> --%>
                                            <c:out value="${fn:substring(result.TITLE,0,20)}" /> <c:if test="${fn:length(result.TITLE) > 20}">&sdot;&sdot;&sdot;</c:if>
                                    <!--    </a>     -->    
                                    </td>
    
                                    <td><fmt:formatDate value="${result.SDATE}" pattern="yyyy.MM.dd" />   ~ <fmt:formatDate value="${result.EDATE}" pattern="yyyy.MM.dd" /></td>
                                    
                                    <c:if test="${REQUEST_DATA.SES_GRADENO eq SUPERGRADENO ||  REQUEST_DATA.SES_GRADENO eq TUTORGRADENO}">
                                        <td><em class="red_b"><c:out value="${result.SCNT}"/></em>/<c:out value="${result.TOTCNT}"/></td>
                                    </c:if>
                                </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    
                                    <c:choose>
                                    <c:when test="${REQUEST_DATA.SES_GRADENO eq SUPERGRADENO ||  REQUEST_DATA.SES_GRADENO eq TUTORGRADENO}">
                                        <!-- 관리자 or 강사 -->
                                        <td colspan="3" align="center">등록된 정보가 없습니다.</td>
                                    </c:when>
                                    <c:otherwise>
                                        <!-- 사용자 -->
                                        <td colspan="2" align="center">등록된 정보가 없습니다.</td>
                                    </c:otherwise>
                                </c:choose>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                        </tbody>
                    </table>
                </div>
                <!-- //설문 게시판 -->
                
            </div>
        </div>
        </c:if>
        <!-- //설문 -->
    </div>
    <script type="text/javascript"> 
        function errimg(img){ 
            img.src='/classdesk/images/thumb_noimage.gif';
        }
        
        jQuery(document).ready(function() {
            // 클래스 데스크 필수 파라미터 쿠키 저장
            if ("<c:out value='${REQUEST_DATA.paramCourseNo}'></c:out>") {
                $.cookie('classdeskCookieParamCourseNo','',{expires:-1, path:'/'});
                $.cookie('classdeskCookieParamcSeqNo','',{expires:-1, path:'/'});
                $.cookie('classdeskCookieParamcUserNo','',{expires:-1, path:'/'});
                $.cookie('classdeskCookieParamUserNo','',{expires:-1, path:'/'});
                
                $.cookie('classdeskCookieParamCourseNo',"<c:out value='${REQUEST_DATA.paramCourseNo}'></c:out>",{expires:7, path:'/'});
                $.cookie('classdeskCookieParamcSeqNo',"<c:out value='${REQUEST_DATA.paramcSeqNo}'></c:out>",{expires:7, path:'/'});
                $.cookie('classdeskCookieParamcUserNo',"<c:out value='${REQUEST_DATA.paramcUserNo}'></c:out>",{expires:7, path:'/'});
                $.cookie('classdeskCookieParamUserNo',"<c:out value='${REQUEST_DATA.userNo}'></c:out>",{expires:7, path:'/'});
            }
        });
    </script>
	<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/footer_inc.jsp" %>
	
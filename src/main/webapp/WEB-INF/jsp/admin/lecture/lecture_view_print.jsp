<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ page import="com.sangs.support.SangsProperties" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="/admin/common/js/jquery-1.8.2.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var str = $('#eduFacCode').val();
	var res = str.split(',');
	for(var i = 1 ; i < 8 ; i++) {
		for(var j = 0 ; j < res.length ; j++) {
			if($('#eduFacCodeArr'+i).val() == res[j]) {
				$('#eduFacCodeArr'+i).attr("checked","checked");
			}
		}
	}
	
});

</script>
<style>
table,th,td{border: 1px solid black;}
</style>
<br/><br/><div class="title title_top">방문교육 관리 
</div>
<form name="pform" id="pform" action="/admin/lecture/lectureTutorExec.do" method="post" enctype="multipart/form-data">
<input type="hidden" id="eduFacCode" value="${map.EDU_FAC_CODE }"/>
<input type="hidden" id="checkLength" name="checkLength" value=""/>
<input type="hidden" id="deleteYn" name="deleteYn" value=""/>
<br /><table class="table-type1 search_form">
    <colgroup>
        <col class="cellc" width="10%">
        <col class="celll" width="33%">
        <col class="cellc" width="10%">
        <col class="celll" width="33%">
    </colgroup>
    <tbody>
        <tr>
            <th>신청번호</th>
            <td colspan="3"><c:out value="${map.SLNO}"/></td>
        </tr>
        <tr>
            <th>지역</th>
            <td colspan="3">
	            <c:forEach var="emap2" items="${categoryData1}" varStatus="status2">
	            	<c:if test="${map.MT_AREA_CODE ne null && emap2.MT_SUB_CODE eq map.MT_AREA_CODE}"><c:out value="${emap2.MT_SUB_NAME}"/></c:if>
				</c:forEach>
            </td>
        </tr>
        <c:if test="${REQUEST_DATA.mtScCode.trim() eq 'SC0006' }">
        <tr>
            <th>제목</th>
            <td colspan="3"><c:out value="${map.TITLE}"/></td>
        </tr>
        </c:if>
        <c:if test="${REQUEST_DATA.mtScCode.trim() ne 'SC0004' }">
	        <tr>
	            <th>교육장소</th>
	            <td colspan="3"><c:out value="${map.EDU_AREA}"/></td>
	        </tr>
        </c:if>
			<tr>
	        <c:if test="${REQUEST_DATA.mtScCode.trim() eq 'SC0004' }">
	            <th>방문요청일시</th>
            </c:if>
            <c:if test="${REQUEST_DATA.mtScCode.trim() ne 'SC0004' }">
	            <th>교육일시</th>
            </c:if>
            
	            <td colspan="3">
	            		<c:out value="${map.EDU_DATE}"/>
						<c:forEach var="sh" begin="0" end="24" step="1">
						<c:if test="${sh < 10}"><c:set var="sh">0${sh}</c:set></c:if>
						<c:if test="${map.EDU_SDATE_HOUR == sh}"><c:out value="${sh}" /></c:if>
						</c:forEach>시
						<c:forEach var="sh" begin="0" end="59" step="1">
						<c:if test="${sh < 10}"><c:set var="sh">0${sh}</c:set></c:if>
						<c:if test="${map.EDU_SDATE_MINUTE == sh}"><c:out value="${sh}"/></c:if>
						</c:forEach>분

                ~
						<c:forEach var="sh" begin="0" end="24" step="1">
						<c:if test="${sh < 10}"><c:set var="sh">0${sh}</c:set></c:if>
						<c:if test="${map.EDU_EDATE_HOUR == sh}"><c:out value="${sh}" /></c:if>
						</c:forEach>시
						<c:forEach var="sh" begin="0" end="59" step="1">
						<c:if test="${sh < 10}"><c:set var="sh">0${sh}</c:set></c:if>
						<c:if test="${map.EDU_EDATE_MINUTE == sh}"><c:out value="${sh}" /></c:if>
						</c:forEach>분
            </td>
	            
        	</tr>
        <c:if test="${REQUEST_DATA.mtScCode.trim() ne 'SC0007' }">
        <tr>
        	 <c:if test="${REQUEST_DATA.mtScCode.trim() eq 'SC0004' }">
	            <th>방문시간</th>
            </c:if>
            <c:if test="${REQUEST_DATA.mtScCode.trim() ne 'SC0004' }">
            	<th>교육시간</th>
            </c:if>
            <td colspan="3"><c:out value="${map.EDU_TIME}"/> 시간</td>
        </tr>
        </c:if>
        <tr>
        	<th>교육대상</th>
            <td>
            	<c:out value="${map.EDU_TARGET}"/>
            </td>
            <th>인원</th>
            <td><c:out value="${map.PERSON_CNT}"/> 명</td>
        </tr>
        <tr>
            <th>신청기관명</th>
            <td><c:out value="${map.APPLY_ORGAN_NM}"/></td>
            <th>신청기관 주소</th>
            <td><c:out value="${map.APPLY_ORGAN_ADDR}"/></td>
        </tr>
        <c:if test="${REQUEST_DATA.mtScCode.trim() eq 'SC0005' }">
        <tr>
            <th>강의분야</th>
            <td colspan="3">${map.MT_LCTRE_CODE_NAME}
			</td>
        </tr>
        </c:if>
        <c:if test="${REQUEST_DATA.mtScCode.trim() ne 'SC0004' }">
        <tr>
            <th>교육시설정보</th>
            <td>
				<c:forEach var="data" items="${edufacilitiesList}" varStatus="status">
					<div class="input-add">
						<span class="chk-wrap">
							<span class="checks">
								<input type="checkbox" id="eduFacCodeArr${status.count}" name="eduFacCodeArr" value="${data.MT_SUB_CODE}"/>
								<label for="eduFacCodeArr${status.count}">  ${data.MT_SUB_NAME}&nbsp; </label>
								<c:if test="${data.MT_SUB_CODE eq 'FA07'}">
									:&nbsp;<c:out value="${map.EDU_FAC_CONTENT}"/>
								</c:if>
							</span>
						</span>
					 </div>
				</c:forEach>
			</td>
            <th>강사료</th>
            <td><fmt:formatNumber value="${map.LEC_PAY}" pattern="#,###" />원</td>
        </tr>
        </c:if>
        <tr>
            <th>신청자</th>
            <td><c:out value="${map.APPLY_NM}"/></td>
            <th>신청자 연락처</th>
            <td><c:out value="${map.APPLY_PHONE}"/></td>
        </tr>
        <tr>
            <th>신청자 이메일</th>
            <td><c:out value="${map.APPLY_EMAIL}"/></td>
			<th>신청일시</th>
			<td><c:out value="${map.REGDATE}"/></td>
        </tr>
        <tr>
            <th>기타내용</th>
            <td colspan="3"><c:out value="${map.ETC}"/></td>
        </tr>
    </tbody>
</table>
</br>
<div class="tb_title">강사 및 관리 정보</div>
</br>
<!-- 본문 > 메인 > 목록 시작  -->

<input type="hidden" name="slno" value="<c:out value="${REQUEST_DATA.slno}"/>"/>
<input type="hidden" name="sltno" value="<c:out value="${REQUEST_DATA.sltno}"/>"/>
<input type="hidden" name="lecUserno" id="lecUserno" value="<c:out value="${map.LEC_USERNO}"/>"/>
<input type="hidden" name="UPLOAD_DIR" value="<%=SangsProperties.getProperty("Globals.lectureFilePath")%>"/>
<input type="hidden" name="delCheckFile" value=""/>
<input type="hidden" name="searchType" value="NAME"/>
<input type="hidden" name="searchWord" id="searchWord" value=""/>
<input type="hidden" name="checkLecUserNo" id="checkLecUserNo" value="<c:out value="${map.LEC_USERNO}"/>"/>
<input type="hidden" name="checkLecUserNm" id="checkLecUserNm" value="<c:out value="${map.LEC_USERNM}"/>"/>
<input type="hidden" name="checkLecPhone" id="checkLecPhone" value="<c:out value="${map.LEC_PHONE}"/>"/>
<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage }"/>"/>
<input type="hidden" name="totalCount" id="totalCount" value="<c:out value="${totalCount}"/>"/>
<input type="hidden" name="pageMode" id="pageMode" value=""/>
<input type="hidden" name="mtScCode" id="mtScCode" value="<c:out value="${REQUEST_DATA.mtScCode}"/>"/>
<input type="hidden" name="mtTutorFileCode" id="mtTutorFileCode" value=""/>
<table class="table-type1 search_form">
      <colgroup>
        <col class="cellc" width="10%">
        <col class="celll" width="33%">
        <col class="cellc" width="10%">
        <col class="celll" width="33%">
    </colgroup>
    <tbody>
        <tr>
            <th>교육일시</th>
            <td><c:out value="${map.EDU_DATE}"/> <c:out value="${map.EDU_SDATE_HOUR}"/>:<c:out value="${map.EDU_SDATE_MINUTE}"/>~<c:out value="${map.EDU_EDATE_HOUR}"/>:<c:out value="${map.EDU_EDATE_MINUTE}"/></td>
            <th>진행현황</th>
            <td>
				<c:if test="${map.MT_LEC_STATUS_CODE eq '1'}">승인요청</c:if>
				<c:if test="${map.MT_LEC_STATUS_CODE eq '2'}">승인취소</c:if>
				<c:if test="${map.MT_LEC_STATUS_CODE eq '3'}">승인완료</c:if>
            </td>
        </tr>
        <c:if test="${REQUEST_DATA.mtScCode.trim() ne '4' }">
        <tr>
            <th>강사명</th>
            <td><c:out value="${map.LEC_USERNM}"/></td>
            <th>강사 연락처</th>
            <td><c:out value="${map.LEC_PHONE}"/></td>
        </tr>
        
        <tr>
            <th>강사구분</th>
            <td id="mtTutorName">
		        <c:forEach var="emap2" items="${categoryData4}" varStatus="status2">
		        <c:if test="${map.MT_TUTOR_CODE eq emap2.MT_SUB_CODE}"><c:out value="${emap2.MT_SUB_NAME}"/></c:if>
		        </c:forEach>
            </td>
            <th>소속</th>
            <td id="mtFieldName">
            </td>
        </tr>
        </c:if>
        <tr>
            <th>강의계획서</th>
             <td colspan="3">
				<input type="hidden" id="mtTutorFileCode1" name="mtTutorFileCode" value="TF0002">
		            <c:if test="${map.SLTNO ne null && not empty fileList}">
		            	<c:forEach var="fmap" items="${fileList}" varStatus="status">
		            		<c:if test="${fmap.MT_TUTOR_FILE_CODE eq 'TF0002' }">
								<div  id="fileBox1">
									<c:out value="${fmap.ORGFILE}"/>(<c:out value="${fmap.FSIZE}"/> KB) 
								</div>
							</c:if>
						</c:forEach>
					</c:if>
					 <c:if test="${map.SLTNO ne null && empty fileList2}">
				 </c:if>
            </td>
        </tr>
        <tr>
            <th>강의교안</th>
            <td colspan="3">
				<input type="hidden" id="mtTutorFileCode2" name="mtTutorFileCode" value="TF0001">
	            <c:if test="${map.SLTNO ne null && not empty fileList}">
	            	<c:forEach var="fmap" items="${fileList}" varStatus="status">
	            		<c:if test="${fmap.MT_TUTOR_FILE_CODE eq 'TF0001' }">
	            			<div  id="fileBox2">
								<c:out value="${fmap.ORGFILE}"/>(<c:out value="${fmap.FSIZE}"/> KB) 
							</div>
						</c:if>
					</c:forEach>
				</c:if>
				 <c:if test="${map.SLTNO ne null && empty fileList1}">
				 </c:if>
            </td>
        </tr>
        <tr>
            <th>설문</th>
             <td colspan="3">
				<input type="hidden" id="mtTutorFileCode3" name="mtTutorFileCode" value="TF0006">
	            <c:if test="${map.SLTNO ne null && not empty fileList}">
	            	<c:forEach var="fmap" items="${fileList}" varStatus="status">
	            		<c:if test="${fmap.MT_TUTOR_FILE_CODE eq 'TF0006' }">
							<div  id="fileBox3">
								<c:out value="${fmap.ORGFILE}"/>(<c:out value="${fmap.FSIZE}"/> KB) 
							</div>
						</c:if>
					</c:forEach>
				</c:if>
				 <c:if test="${map.SLTNO ne null && empty fileList3}">
				 </c:if>
            </td>
        </tr>
        <tr>
            <th>기타정보</th>
            <td colspan="3">
            	<c:out value="${map.LEC_ETC}"/>
            </td>
        </tr>
    </tbody>
 </table>
</div>
</form>
<script type="text/javascript">
// window.print();
</script>
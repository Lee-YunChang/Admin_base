<%
/****************************************************
	system	: 과정관리 > 과정진행관리 > 이름표출력 목록
	title	: 이름표 출력 목록
	summary	:	
	wdate	: 2016-05-10
	writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>

<script type="text/javascript"> 
//window.print();  
</script> 
</head>
<body>

<div class="tb_title">신청정보</div>
<table  border="1" width="100%">
    <colgroup>
        <col class="cellc" width="15%">
        <col class="celll" width="35%">
        <col class="cellc" width="15%">
        <col class="celll" width="35%">
    </colgroup>
    <tbody>
        <tr>
            <th>신청번호</th>
            <td colspan="3"><c:out value="${map.SLNO}"/></td>
        </tr>
        <tr>
            <th>지역</th>
            <td colspan="3"><c:out value="${map.MT_AREA_NAME}"/></td>
        </tr>
        <c:if test="${map.MT_SC_CODE == 'SC0006'}">
        <tr>
            <th>특강명</th>
            <td colspan="3"><c:out value="${map.TITLE}"/></td>
        </tr>
        </c:if>
        <tr>
            <th>교육장소</th>
            <td colspan="3"><c:out value="${map.EDU_AREA}"/></td>
        </tr>
        <tr>
            <th>교육일시</th>
            <td colspan="3">
				<c:forEach var="time" items="${timeList}">
					${time.EDU_DATE}(${time.EDU_WEEK})&nbsp;${time.EDU_SDATE_HOUR}:${time.EDU_SDATE_MINUTE} ~ ${time.EDU_EDATE_HOUR}:${time.EDU_EDATE_MINUTE}
					<br /> 
				</c:forEach>
            </td>
        </tr>
        <tr>
            <th>교육시간</th>
            <td colspan="3"><c:out value="${map.EDU_TIME}"/> 시간</td>
        </tr>
        <tr>
            <th>교육대상</th>
            <td>
            	<c:if test="${map.MT_SC_CODE == 'SC0005'}">
	            	<c:out value="${map.EDU_TARGET}"/> 학년
	            </c:if>
	            <c:if test="${map.MT_SC_CODE != 'SC0005'}">
	            	<c:out value="${map.EDU_TARGET}"/>
	            </c:if>
            </td>
            <th>인원</th>
            <td>
	            <c:out value="${map.PERSON_CNT}"/> 명
            </td>
        </tr>
        <tr>
            <th>신청기관</th>
            <td><c:out value="${map.APPLY_ORGAN_NM}"/></td>
            <th>신청기관 소재지</th>
            <td><c:out value="${map.APPLY_ORGAN_ADDR}"/></td>
        </tr>
        <tr>
            <th>교육시설정보</th>
            <td>
                <c:set var="eduFacArr" value="${fn:split(map.EDU_FAC_CODE,',')}"/>
                <c:forEach var="data" items="${edufacilitiesList}" varStatus="status">
                	<c:forEach var="i" begin="0" end="${fn:length(eduFacArr)}">
						<c:if test="${data.MT_SUB_CODE eq eduFacArr[i]}">
							${data.MT_SUB_NAME}<c:if test="${eduFacArr[i] eq 'FA07'}">(<c:out value="${map.EDU_FAC_CONTENT}"/>)</c:if>&nbsp;
						</c:if>
					</c:forEach>
				</c:forEach>
            </td>
            <th>강의료</th>
            <td><fmt:formatNumber value="${map.LEC_PAY}" pattern="#,###" /> 원</td>
        </tr>
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

<!-- 본문 > 메인 > 목록 시작  -->
<form name="pform" id="pform" action="/admin/lecture/lectureTutorExec.do" method="post" enctype="multipart/form-data">
<input type="hidden" name="slno" value="<c:out value="${REQUEST_DATA.slno2}"/>"/>
<input type="hidden" name="sltno" value="<c:out value="${REQUEST_DATA.sltno2}"/>"/>
<input type="hidden" name="lecUserno" id="lecUserno" value="<c:out value="${map.LEC_USERNO}"/>"/>
<input type="hidden" name="UPLOAD_DIR" value="<%=SangsProperties.getProperty("Globals.lectureFilePath")%>"/>
<input type="hidden" name="delCheckFile" value=""/>
<input type="hidden" name="searchType" value="NAME"/>
<input type="hidden" name="searchWord" id="searchWord" value=""/>


<table  border="1" width="100%">
      <colgroup>
        <col class="cellc" width="15%">
        <col class="celll" width="35%">
        <col class="cellc" width="15%">
        <col class="celll" width="35%">
    </colgroup>
    <tbody>
        <tr>
            <th>교육일시</th>
            <td><c:out value="${map.EDU_DATE}"/> <c:out value="${map.EDU_SDATE_HOUR}"/>:<c:out value="${map.EDU_SDATE_MINUTE}"/>~<c:out value="${map.EDU_EDATE_HOUR}"/>:<c:out value="${map.EDU_EDATE_MINUTE}"/></td>
            <th>진행현황</th>
            <td>
            	<select name="mtLecStatusCode" id="mtLecStatusCode">
					<option value="1" <c:if test="${map.MT_LEC_STATUS_CODE eq '1'}">selected="selected"</c:if>>승인요청</option>
					<option value="2" <c:if test="${map.MT_LEC_STATUS_CODE eq '2'}">selected="selected"</c:if>>승인취소</option>
					<option value="3" <c:if test="${map.MT_LEC_STATUS_CODE eq '3'}">selected="selected"</c:if>>승인완료</option>
				</select>
            </td>
        </tr>
        <tr>
            <th>강사명</th>
            <td><input type="text" name="lecUsernm" id="lecUsernm" class="line" value="<c:out value="${map.LEC_USERNM}"/>"/>
            	<a href="#" onclick="fnLecTutorSearch();" class="btn search brown">검색</a>
            </td>
            <th>강사 연락처</th>
            <td><input type="text" name="lecPhone" id="lecPhone" class="line" value="<c:out value="${map.LEC_PHONE}"/>" style="width:150px;"/>
            </td>
        </tr>
        <tr>
            <th>강사구분</th>
            <td id="mtTutorName">
		        <c:forEach var="emap2" items="${categoryData4}" varStatus="status2">
		        <input type="radio" name="mtTutorCode" id="mtTutorCode" value="${emap2.MT_SUB_CODE}" <c:if test="${map.MT_TUTOR_CODE eq emap2.MT_SUB_CODE}"> checked="checked"</c:if>/> <c:out value="${emap2.MT_SUB_NAME}"/>&nbsp;
		        </c:forEach>
            </td>
            <th>분야</th>
            <td id="mtFieldName">
            	<select id="mtFieldCode" name="mtFieldCode" title="분야">
					<option value="">선택</option>
					<c:forEach var="code" items="${categoryData3}">
						<option value="${code.MT_SUB_CODE}" <c:if test="${code.MT_SUB_CODE eq map.MT_FIELD_CODE}">selected="selected"</c:if>>${code.MT_SUB_NAME}</option>
					</c:forEach>
				</select>
            </td>
        </tr>
        <tr>
            <th>첨부파일</th>
            <td colspan="3">
            	<input type="file" name="uploadFile1" style="width:400px;height:20px;background-color:white;border:1 solid #b7b7b7;"/><br/>
                <input type="file" name="uploadFile2" style="width:400px;height:20px;background-color:white;border:1 solid #b7b7b7;"/><br/>
                <input type="file" name="uploadFile3" style="width:400px;height:20px;background-color:white;border:1 solid #b7b7b7;"/><br/>
                <input type="file" name="uploadFile4" style="width:400px;height:20px;background-color:white;border:1 solid #b7b7b7;"/>
            </td>
        </tr>
        <tr> 
        	<c:if test="${map.SLTNO ne null && not empty fileList}">
            <th> 첨부된 파일</th>
            <td>    
            	<font class=extext> * 체크박스 선택 후 저장하시면 파일이 삭제됩니다.</font><br/><br/>
            	<c:forEach var="fmap" items="${fileList}" varStatus="status">
					<input type="checkbox" name="delFileChk" value='<c:out value="${fmap.FILENO}"/>' /><a href="#" onclick="filedown('<c:out value="${fmap.FILENO}"/>');"><c:out value="${fmap.ORGFILE}"/></a>(<c:out value="${fmap.FSIZE}"/> KB)<br/>
				</c:forEach>
				
			</td>
			</c:if>
	  	</tr>
        <tr>
            <th>기타정보</th>
            <td colspan="3">
            	<textarea rows="5" name="lecEtc"  id="lecEtc"  style="width:100%;" maxlength="80"><c:out value="${map.LEC_ETC}"/></textarea>
            </td>
        </tr>
    </tbody>
 </table>

<script type="text/javascript">
//window.print(); 
	if( navigator.userAgent.indexOf('MSIE') >= 0 ) {
		factory.printing.header = "" ;		//머릿말 설정
		factory.printing.footer = "" ;		//꼬릿말 설정
		factory.printing.portrait = false;         //출력방향 설정: true-가로, false-세로
		factory.printing.leftMargin = 1.0;         //왼쪽 여백 설정
		factory.printing.rightMargin = 1.0;        //오른쪽 여백 설정
		factory.printing.topMargin = 1.0;          //위쪽 여백 설정
		factory.printing.bottomMargin = 1.0;       //아래쪽 여백 설정
		factory.printing.Print(false, window);
	}else{ 
		//alert('** 주의 ** 인쇄시 인쇄 옵션에서 \n1. [머리글과 바닥글] 체크를 해제\n2.레이아웃 가로방향 선택 후 출력해야 합니다.');
		window.print();  
	} 
</script>
</body>
</html>

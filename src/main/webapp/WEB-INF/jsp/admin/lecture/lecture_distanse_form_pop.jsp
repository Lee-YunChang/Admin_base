<%
/****************************************************
	system	: 특강강사 검색
	title	: 특강강사 검색
	summary	: 
	wdate	: 2016-09-01
	writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_header_inc.jsp"%>
<script type="text/javascript">
	function execForm(flag) {
		$.ajax({
			url : '/admin/lecture/lectureDsGradeExec.do',
			data : {flag:flag, startAddr:$('#startAddr').val(), endAddr:$('#endAddr').val(), grade:$('#grade').val(), dsSeq:$('#dsSeq').val()},
			dataType : 'json',
			type : 'post',
			async: 'false',
			success : function(result) { 
				if(result === 'SUCCESS'){
					alert('등록되었습니다.');
					opener.document.location.reload();
					self.close();

				}else if(result === 'DUP'){
					alert('이미 등록된 급지 정보 입니다.');
				}else{
					alert('오류발생');
				}
			},
			error : function(e) {
				alert("error :" + e.responseText);
			}
		});	
	}
</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">급지등록</div>
<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="pform" action="/admin/lecture/lectureDistanseSearch.do" method="post">
<input type="hidden" name="atciveYn" id="atciveYn" value="popup"/>
<input type="hidden" name="dsSeq" id="dsSeq" value="<c:out value="${REQUEST_DATA.seq}"/>"/>

	<!-- 본문 > 상단 > 검색영역 끝 -->
	
	<div class="space5"></div>	
	<table class="tb table-type1">
		<colgroup>
	        <col width="3%">
	        <col width="10%">
	    </colgroup>
	    <tr class="rndbg">
	        <th>출발지</th>
	        <td>
	        	<c:choose>
	        		<c:when test="${REQUEST_DATA.flag == 'reg'}">
	        			<select name='startAddr' id='startAddr'  title='출발지'>
			        		<option value='서울특별시'>서울특별시</option>
			        		<option value='부산광역시'>부산광역시</option>
			        		<option value='대구광역시'>대구광역시</option>
			        		<option value='인천광역시'>인천광역시</option>
			        		<option value='광주광역시'>광주광역시</option>
			        		<option value='대전광역시'>대전광역시</option>
			        		<option value='울산광역시'>울산광역시</option>
			        		<option value='세종특별자치시'>세종특별자치시</option>
			        		<option value='경기도'>경기도</option>
			        		<option value='강원도'>강원도</option>
			        		<option value='충청북도'>충청북도</option>
			        		<option value='충청남도'>충청남도</option>
			        		<option value='전라북도'>전라북도</option>
			        		<option value='전라남도'>전라남도</option>
			        		<option value='경상북도'>경상북도</option>
			        		<option value='경상남도'>경상남도</option>
			        		<option value='제주특별자치도'>제주특별자치도</option>
			        	</select>
	        		</c:when>
	        		<c:otherwise>
	        			<input name='startAddr' id='startAddr' type="text" style="background-color: #a9a9a9;" readonly="readonly" value="<c:out value="${resultList.DS_START_ADDR}"/>"/>
	        		</c:otherwise>
	        	</c:choose>
	        </td>
	    </tr>
	    <tr>
			<th>도착지</th>
			<td>
				<c:choose>
	        		<c:when test="${REQUEST_DATA.flag == 'reg'}">
						<select name='endAddr' id='endAddr'  title='도착지'>
			        		<option value='서울특별시'>서울특별시</option>
			        		<option value='부산광역시'>부산광역시</option>
			        		<option value='대구광역시'>대구광역시</option>
			        		<option value='인천광역시'>인천광역시</option>
			        		<option value='광주광역시'>광주광역시</option>
			        		<option value='대전광역시'>대전광역시</option>
			        		<option value='울산광역시'>울산광역시</option>
			        		<option value='세종특별자치시'>세종특별자치시</option>
			        		<option value='경기도'>경기도</option>
			        		<option value='강원도'>강원도</option>
			        		<option value='충청북도'>충청북도</option>
			        		<option value='충청남도'>충청남도</option>
			        		<option value='전라북도'>전라북도</option>
			        		<option value='전라남도'>전라남도</option>
			        		<option value='경상북도'>경상북도</option>
			        		<option value='경상남도'>경상남도</option>
			        		<option value='제주특별자치도'>제주특별자치도</option>
			        	</select>
		        	</c:when>
		        	<c:otherwise>
		        		<input name='endAddr' id='endAddr' type="text" style="background-color: #a9a9a9;" readonly="readonly" value="<c:out value="${resultList.DS_END_ADDR}"/>"/>
		        	</c:otherwise>
	        	</c:choose>
			</td>	    
	    </tr>
	    <tr>
	    	<th>등급</th>
	    	<td>
	    		<select name='grade' id='grade'  title='급지'>
	        		<option value='1' <c:if test="${resultList.DS_GRADE == 1}">selected="selected" </c:if>>1</option>
	        		<option value='2' <c:if test="${resultList.DS_GRADE == 2}">selected="selected" </c:if>>2</option>
	        		<option value='3' <c:if test="${resultList.DS_GRADE == 3}">selected="selected" </c:if>>3</option>
	        	</select>
	    	</td>
	    </tr>
	</table>
	
	<hr/>
	
	<table style="width:100%;text-align:center">
		<tr>
			<td align="center">
				<c:choose>
	        		<c:when test="${REQUEST_DATA.flag == 'reg'}">
	        			<a href="#" onclick="execForm('reg')" class= "btn big orange">등록</a>
	        		</c:when>
	        		<c:otherwise>
	        			<a href="#" onclick="execForm('modi',<c:out value="${REQUEST_DATA.seq}"/>)" class= "btn big orange">수정</a>
	        		</c:otherwise>
        		</c:choose>
				<a href="#" onclick="window.close();" class= "btn big gray">취소</a>
			</td>
		</tr>
	</table>
</form>
<br/>
<div class="space"></div>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/popup_footer_inc.jsp"%>	
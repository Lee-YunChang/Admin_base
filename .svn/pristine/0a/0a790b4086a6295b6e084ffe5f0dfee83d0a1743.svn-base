<%
/****************************************************
	system	: 교육과정관리 > 과정
	title	: 최종평가 > (팝업) 출제 문제 목록 
	summary	:	
	wdate	: 2013-07-19
	writer	: 심위보 
*****************************************************/
%>
<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import="com.sangs.support.DataMap"%>
<%@ page import="com.sangs.support.EduMap"%>
<%@ page import="com.sangs.util.NumberFormatUtil" %>
<%@ page import="java.util.List"%>
<%
	DataMap requestMap = (DataMap)request.getAttribute("REQUEST_DATA"); 
	requestMap.setNullToInitialize(true);
	List list = (List)request.getAttribute("LIST_DATA"); 
%>
 

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">수료증 번호 발급 체계</div>

<div class="cer_num_page">
	<div class="cer_page_tit">
		<strong>집합교육 수료코드 정책</strong>
		<span>- 제C{수료연도4자리} - {일련번호4자리}호</span>
		<span>- 수료구분코드 사용하지 않으며 집합교육 수료자의 연도별로 통합하여 일련번호 부여함</span>
	</div>
	<table class="table_cer">
		<thead>
			<tr>
				<th>과정유형</th>
				<th>코드</th>
				<th>연도</th>
				<th>과정명</th>
				<th>일련번호</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>집합교육</td>
				<td><b>C</b></td> 
				<td><b>4자리</b></td>
				<td>집합교육 전체</td>
				<td><b>4자리</b></td>
			</tr>
			 
		</tbody>
	</table>
	<p class="cer_txt"><span>예) 집합교육장외영향평가서작성자교육과정 : 제C2015-0001호</span></p>
	
	<div class="space"></div><!-- 공백 default 20px --> 
	
	<div class="cer_page_tit">
		<strong>온라인교육 수료코드 정책</strong>
		<span>- 제E{수료연도4자리} - {수료구분코드} - {알파벳1자리}{일련번호4자리}호</span>
		<span>- 과정별 수료구분코드 사용</span>
		<span>- 일련번호 앞 1자리를 알파벳(A~)을 사용하여 증가 처리</span>
	</div>
	<table class="table_cer">
		<thead>
			<tr>
				<th>과정유형</th>
				<th>코드</th>
				<th>연도</th>
				<th>수료구분코드</th>
				<th>일련번호</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>온라인교육</td>
				<td><b>E</b></td> 
				<td><b>4자리</b></td>
				<td><b>2자리</b></td>
				<td><b>알파벳1자리 + 일련번호4자리</b></td>
			</tr>
			 
		</tbody> 
	</table>
	
	<p class="cer_txt">
	<span>예) 취급자정기교육공통과정 : 제E2015-IN-A0021호</span>
	<div></div>
	<span>예) 협회콘텐츠 : 제E2015-IA-A0021호</span>
	</p>
</div>


			 
<!-- 본문 > 메인 > 목록 끝 -->
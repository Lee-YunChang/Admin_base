<%
/****************************************************
	system	: 과정관리 > 과정진행관리 > 과정별 출석부
	title	: 30시간 이상 출석부 출력
	summary	:	
	wdate	: 2016-05-11
	writer	: 
*****************************************************/
%>
<%@ page contentType="application/x-msdownload; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/cfn.tld" prefix="cfn"%>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="ext" %>
<%@ taglib uri = "/WEB-INF/tlds/admin-paging-taglib.tld" prefix="paging" %>
<%@ page import="com.sangs.support.DataMap"%>
<%@ page import="com.sangs.support.EduMap"%>
<%@ page import="com.sangs.support.SangsProperties" %>
<%@ page import="com.sangs.util.ParamUtil"%> 
<%@ page import="com.sangs.util.NumberFormatUtil"%>
<%@ page import="com.sangs.util.StringUtil"%>
<%@ page import="com.sangs.util.SangsUtil" %>
<%@ page import="java.util.List"%>
<%@ page import ="sun.misc.Sort"%>
<%@ page import ="java.util.*"%>
<%@ page import ="java.text.*"%>
<%
   	response.setContentType("application/vnd.ms-excel; charset=UTF-8");
	response.setHeader("Content-Disposition", "attachment;filename=admin_con_list.xls;");
 	response.setHeader("Content-Description", "JSP Generated Data");
 %>
<head>
<meta http-equiv='Content-Type' content='application/x-msdownload; charset=utf-8'/>
 
<style type="text/css">
table th { background-color:#6EE3F7;}
</style>
</head>
<body>
<div>출석부</div>
<div>o 과정명 : <c:out value="${mapInfo.TITLE}"/></div>
<div>o 수강생 수 : <c:out value="${mapInfo.USER_CNT}"/>명</div>
<div>o 수강기간 : 
	<c:choose>
   	<c:when test="${mapInfo.OPENTYPE eq 'A'}">
           	상시운영
     </c:when>
     <c:otherwise>
          <c:out value="${mapInfo.STUDY_SDATE}"/> ~ <c:out value="${mapInfo.STUDY_EDATE}"/>
     </c:otherwise>
     </c:choose>
</div>

<%
	
	List list = (List)request.getAttribute("resultList");
	
	// 과정 차수 정보
	EduMap mapInfo = (EduMap)request.getAttribute("mapInfo"); 
	if(mapInfo == null) mapInfo = new EduMap(); 

	List<Date> dates = new ArrayList<Date>();
	List dateList = new ArrayList();
	DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	
	if (!mapInfo.getString("OPENTYPE").equals("A")){
		
		String str_date = mapInfo.getString("STUDY_SDATE");
		String end_date = mapInfo.getString("STUDY_EDATE");

		Date startDate = (Date)formatter.parse(str_date); 
		Date endDate = (Date)formatter.parse(end_date);
		
		long interval = 24*1000*60*60; 
		long endTime = endDate.getTime() ; 
		long curTime = startDate.getTime();
		
		while (curTime <= endTime) {
			dates.add(new Date(curTime));
			curTime += interval;
		}
	}

	// 출석일자 지정시 해당 데이터를 받아와 돌림
	if(mapInfo.getString("ATTEND_DES_YN").equals("Y")){
		String selectDay=mapInfo.getString("ATTEND_DES_DAY");
		String [] dayStr = selectDay.split(",");
		dateList = Arrays.asList(dayStr);
		
		Arrays.sort(dayStr);// 지정된 날짜 순서별 오름차순하기.
		
  	}else{
		for ( int i = 0 ; i < dates.size() ; i++ ){
			Date lDate = (Date)dates.get(i);
			String ds = formatter.format(lDate);
			dateList.add( ds ); 
			
			//**********************주말제외 Start***************************//
			List realDay = new ArrayList(); //주말제외한 날
			for(int j = 0 ; j < dateList.size(); j++) {
				
				String yyyymmdd = (String)dateList.get(j);
				Calendar cal = Calendar.getInstance();
				String[] date = yyyymmdd.split("-");
				cal.set(Calendar.YEAR, Integer.parseInt(date[0]));
				cal.set(Calendar.MONTH, Integer.parseInt(date[1]) - 1);
				cal.set(Calendar.DATE, Integer.parseInt(date[2]) - 1);
				
				//6 , 7  - > 토, 일
				int day = cal.get(Calendar.DAY_OF_WEEK);
				if(day != 6 && day != 7) {
					realDay.add(dateList.get(j));
				}
			}
			dateList.clear(); //초기화 
			dateList = realDay; //주말제외한 날짜 넣음 
			//**********************주말제외 End***************************//
		} 
	}


 	// 총 페이지 수
	int pageCnt = ( dateList.size() -1 )  / 3 + 1;
		
	// 시작번호
	int startNo = 0;
		
	// 끝번호
	int endNo = 0;
		
	// 노출 일자 
	int showDay = 5 ;
		
	// 3회로 나누어 루프
	int dayRow = 0;
 
	// 일일 학습 시간 + 2(시작, 종료)
	int todayStudyTime = mapInfo.getInt("STUDYTIME")+2;
 	%> 

 	 <table border=1 cellspacing=0 cellpadding=0>	 

		 	 	<tr>
		 	 		
		 	 		<%
		 	 		
 		 	 		// 총 페이지 수
		 	 		pageCnt = ( dateList.size() -1 )  / 5 + 1;
		 	 		
		 	 		// 시작번호
		 	 		startNo = 0;
		 	 		
		 	 		// 끝번호
		 	 		endNo = 0;
		 	 		
		 	 		// 노출 일자 
		 	 		showDay = 5 ;
		 	 		
		 	 		// 3회로 나누어 루프
 		 	 		dayRow = 0;
		 	 		
		 	 		for(  dayRow = 1 ; dayRow <= pageCnt ; dayRow ++ ){
		 	 			
		 	 			startNo = ( dayRow - 1) * showDay + 1 ;
		 	 			
		 	 			if( dayRow * showDay > dateList.size() ) {
		 	 				endNo = dateList.size()  ;
		 	 			}else {
		 	 				endNo = dayRow * showDay ;
		 	 			} 
		 	 		%>
		 	 			<th colspan="3">날짜</th> 	 
		 	 		<%
		 	 			for( int a = startNo ; a <= endNo  ; a ++ ){
		 	 				String str = (String)dateList.get(a-1);  
		 	 				%>
		 	 				<th colspan="3"><%=StringUtil.getContent(str)%></th>
		 	 		<%
		 	 			}
		 	 			 
		 	 		}
		 	 	 	%>
		 	 	 		<th rowspan="4">환급지원대상</th> 
				 	 	<th rowspan="4">소정출석일수</th>
				 	 	<th rowspan="4">실제출석일수</th>
				 	 	<th rowspan="4">출석률</th>
				 	 	<th rowspan="4">결석</th>
				 	 	<th rowspan="4">지각</th>
				 	 	<th rowspan="4">조퇴</th>
				 	 	<th rowspan="4">확인</th>
				 	 	<th rowspan="4">수료/미수료</th> 	  	 
				</tr>
				 	 	
		 	 	<tr>
		 	 		
		 	 		<%
 					
					
		 	 		
 		 	 		// 총 페이지 수
		 	 		pageCnt = ( dateList.size() -1 )  / 5 + 1;
		 	 		
		 	 		// 시작번호
		 	 		startNo = 0;
		 	 		
		 	 		// 끝번호
		 	 		endNo = 0;
		 	 		
		 	 		// 노출 일자 
		 	 		showDay = 5 ;
		 	 		
		 	 		// 3회로 나누어 루프
 		 	 		dayRow = 0;
		 	 		
		 	 		for(  dayRow = 1 ; dayRow <= pageCnt ; dayRow ++ ){
		 	 			
		 	 			startNo = ( dayRow - 1) * showDay + 1 ;
		 	 			
		 	 			if( dayRow * showDay > dateList.size() ) {
		 	 				endNo = dateList.size()  ;
		 	 			}else {
		 	 				endNo = dayRow * showDay ;
		 	 			} 
		 	 		%>
		 	 			<th colspan="3">기관장결제</th> 	 
		 	 		<%
		 	 			for( int a = startNo ; a <= endNo  ; a ++ ){
		 	 				String str = (String)dateList.get(a-1);  
		 	 				%>
		 	 				<th colspan="3"></th>
		 	 		<%
		 	 			}
		 	 			 
		 	 		}
		 	 	 	%>
				</tr>
		 	 <tr>
		 	 		<%
 		 	 		// 총 페이지 수
		 	 		pageCnt = ( dateList.size() -1 )  / 5 + 1;
		 	 		
		 	 		// 시작번호
		 	 		startNo = 0;
		 	 		
		 	 		// 끝번호
		 	 		endNo = 0;
		 	 		
		 	 		// 노출 일자 
		 	 		showDay = 5 ;
		 	 		
		 	 		// 3회로 나누어 루프
 		 	 		dayRow = 0;
		 	 		
		 	 		for(  dayRow = 1 ; dayRow <= pageCnt ; dayRow ++ ){
		 	 			
		 	 			startNo = ( dayRow - 1) * showDay + 1 ;
		 	 			
		 	 			if( dayRow * showDay > dateList.size() ) {
		 	 				endNo = dateList.size()  ;
		 	 			}else {
		 	 				endNo = dayRow * showDay ;
		 	 			} 
		 	 		%>
		 	 			<th colspan="3">확인(교사)</th> 	 
		 	 		<%
		 	 			for( int a = startNo ; a <= endNo  ; a ++ ){
		 	 				String str = (String)dateList.get(a-1);  
		 	 				%>
		 	 				<th>시작</th>
			 	  	 		<th>종료</th>
			 	  	 		<th>외출</th>
		 	 		<%
		 	 			}
		 	 			 
		 	 		}
		 	 	 	%>
		 	 	 	 
				</tr>
				<tr>
		 	 		
		 	 		<%
 		 	 		// 총 페이지 수
		 	 		pageCnt = ( dateList.size() -1 )  / 5 + 1;
		 	 		
		 	 		// 시작번호
		 	 		startNo = 0;
		 	 		
		 	 		// 끝번호
		 	 		endNo = 0;
		 	 		
		 	 		// 노출 일자 
		 	 		showDay = 5 ;
		 	 		
		 	 		// 3회로 나누어 루프
 		 	 		dayRow = 0;
		 	 		
		 	 		for(  dayRow = 1 ; dayRow <= pageCnt ; dayRow ++ ){
		 	 			
		 	 			startNo = ( dayRow - 1) * showDay + 1 ;
		 	 			
		 	 			if( dayRow * showDay > dateList.size() ) {
		 	 				endNo = dateList.size()  ;
		 	 			}else {
		 	 				endNo = dayRow * showDay ;
		 	 			} 
		 	 		%>
			 	 	<th></th>
	 	  	 		<th>소속</th>
	 	  	 		<th>성명</th>

		 	 		<%
		 	 			for( int a = startNo ; a <= endNo  ; a ++ ){
		 	 				String str = (String)dateList.get(a-1);  
		 	 				%>
				 	 	<th></th>
		 	  	 		<th></th>
		 	  	 		<th></th>
		 	 		<%
		 	 			}
		 	 			 
		 	 		}
		 	 	 	%>
		 	 	 	 
				</tr>
		 		<% 
		 	 		// 총 페이지 수
		 	 		pageCnt = ( dateList.size() -1 )  / 5 + 1;
		 	 		
		 	 		// 시작번호
		 	 		startNo = 0;
		 	 		
		 	 		// 끝번호
		 	 		endNo = 0;
		 	 		
		 	 		// 노출 일자 
		 	 		showDay = 5 ;
		 	 		
		 	 		// 3회로 나누어 루프
 		 	 		dayRow = 0;
		 	 		
		 	 		// 사용자 수만큼 tr
		 	 		int forCd =3 ;
						if(list.size() > 0){
							for(int m = 0; m < list.size(); m++){
									EduMap map = (EduMap)list.get(m);
		 	 						%>
		 	 						<tr> 
		 	 						<%
						 	 		for(  dayRow = 1 ; dayRow <= pageCnt ; dayRow ++ ){
						 	 			
						 	 			startNo = ( dayRow - 1) * showDay + 1 ;
						 	 			
						 	 			if( dayRow * showDay > dateList.size() ) {
						 	 				endNo = dateList.size()  ;
						 	 			}else {
						 	 				endNo = dayRow * showDay ;
						 	 			} 
						 	 		%>
						 	 				<td><%=m+1%></td>
						 	 				<td align="center"><%=ParamUtil.getStrParam(StringUtil.getContent(map.getString("COMNAME")), "개인")  %></td>
						 	 				<td align="center"><%=StringUtil.getContent(map.getString("USERNAME")) %></td>
						 				<%
											%>
				  							<%
						 	 							for( int a = startNo ; a <= endNo  ; a ++ ){
						 	 				%>
									 	 				<%
															for(int n = 0 ; n < forCd ; n ++ ){
														%>
															<td></td> 
														<%	
															}
														%>
				 		 	 			
						 	 				<%
						 	 						}
											%>
				 							<% 
						 	 		}
						 	 	 	%>
						 	 	 	<td></td>
						 	 	 	<td></td>
						 	 	 	<td></td>
						 	 	 	<td></td>
						 	 	 	<td></td>
						 	 	 	<td></td>
						 	 	 	<td></td>
						 	 	 	<td></td>
						 	 	 	<td></td>
						 	 	 	</tr>
						 	 <%
							}
						}
						 	 %>
 	 </table>
 	 
</body>

<%
/****************************************************
	system	: 과정관리 > 과정진행관리 > 과정별 출석부
	title	: 30시간 미만 출석부 출력
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
table th { background-color:#7CB342;}

</style>
</head>
<body>
<div><c:out value="${mapInfo.SUBJECT}"/></div>

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
 
	
	
	int dayStydyTime = mapInfo.getInt("STUDYTIME"); // 일일 학습 시간
		if( dayStydyTime < 1 )  dayStydyTime = 0;
	%>
	
 	<%
 	// 총 페이지 수
	int pageCnt = ( dateList.size() -1 )  / 3 + 1;
		
	// 시작번호
	int startNo = 0;
		
	// 끝번호
	int endNo = 0;
		
	// 노출 일자 
	int showDay = 3 ;
		
	// 3회로 나누어 루프
	int dayRow = 0;
 
	// 일일 학습 시간 + 2(시작, 종료)
	int todayStudyTime = dayStydyTime + 2;
 	 %>  
 	 <table border=1 cellspacing=0 cellpadding=0>	
 	 	
		 	 	<tr>
		 	 		<%		 	 		
 		 	 		// 총 페이지 수
		 	 		pageCnt = ( dateList.size() -1 )  / 3 + 1;
		 	 		// 시작번호
		 	 		startNo = 0;
		 	 		// 끝번호
		 	 		endNo = 0;
		 	 		// 노출 일자 
		 	 		showDay = 3 ;
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
		 	 			<th>no</th>
		 	 			<th>이름</th>
		 	 			<th>소속기관명</th>
		 	 			<th>시설유형</th>
		 	 			<th>직종</th>
		 	 			<th>전화번호</th>
		 	 			<th>서명</th>
		 	 		<%
		 	 		}
		 	 	 	%>
		 	 	</tr>
		 	 	
		 	 		<% 
		 	 		// 총 페이지 수
		 	 		pageCnt = ( dateList.size() -1 )  / 3 + 1;
		 	 		// 시작번호
		 	 		startNo = 0;
		 	 		// 끝번호
		 	 		endNo = 0;
		 	 		// 노출 일자 
		 	 		showDay = 3 ;
		 	 		// 3회로 나누어 루프
 		 	 		dayRow = 0;
		 	 		// 사용자 수만큼 tr
		 	 		int forCd =(dayStydyTime+2) ;
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
						 	 				<td align="center"><%=StringUtil.getContent(map.getString("USERNAME")) %></td>
						 	 				<td align="center"><%=ParamUtil.getStrParam(StringUtil.getContent(map.getString("COMNAME")), "개인")  %></td>
						 	 				<td align="center"><%=ParamUtil.getStrParam(StringUtil.getContent(map.getString("JOB_KND_CODE_NAME")), "")  %></td>
						 	 				<td align="center"><%=ParamUtil.getStrParam(StringUtil.getContent(map.getString("FCLTS_TYPE_CODE_NAME")), "")  %></td>
						 	 				<td align="center"><%=ParamUtil.getStrParam(StringUtil.getContent(map.getString("MOBILE")), "")  %></td>
						 	 				<td></td> 
				 							<% 
						 	 		}
						 	 	 	%>
						 	 	 	</tr>
						 	 <%
							}
						}
				%>
		   
 	 </table>
</body>
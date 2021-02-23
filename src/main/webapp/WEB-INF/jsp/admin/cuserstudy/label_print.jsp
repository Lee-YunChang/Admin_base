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
<style>
	html, body, div, a, h1, p, span, img, input, dl, dt, dd {
		margin:0;
		padding:0;
	}
	.imgTopic {
		position:relative;
		width:340px;
		height:155px;
		margin:0;
		padding:0;
	}
	.imgTopic .topic_bg {
		position:absolute;
		z-index:1;
		top:0;
		left:0;
	}
	h1.title {
		position:absolute;
		z-index:10;
		top:20px;
		left:0;
		display:block;
		width:100%;
	}
	h1.title input {
		color:#000 !important;
		font-size:25px;
		text-align:center;
		font-family:Malgun Gothic !important;
		font-weight:600;
		background:transparent;
		border:0;
		width:100%;
	}
	p.content {
		position:absolute;
		font-size:11px;
		color:#ccc;
		z-index:10;
		display:block;
		width:100%;
		top:40%;
	}
	p.content input {
		color:#000 !important;
		font-size:50px;
		text-align:center;
		font-family:Malgun Gothic !important;
		font-weight:800;
		background:transparent;
		border:0;
		width:100%;
	}
	dl {
		width:700px;
		margin:15px auto;
	}
	dt {
		text-align:center;
		font-weight:bold;
		padding:10px 0;
	}
	dd {
		float:left;
		padding:5px;
	}
	span.date {position:absolute;display:block;left:0;bottom:0;width:295px;height:25px;padding:35px 0 0 5px;} 
</style>
</head>
<body>
<dl>
	<dt>[<c:out value="${mapInfo.MT_CGRP_NAME}"/>] <c:out value="${mapInfo.TITLE}"/> 차수 : <c:out value="${mapInfo.CSEQNO}"/></dt>
	<c:forEach var="result" items="${resultList}" varStatus="status">
	<dd>
		<div class="imgTopic">
		<h1 class="title" style="font-size: 15px;width:98%;margin-left:8px;"><c:out value="${result.SEQ_TITLE}"/></h1>
		<p class="content"><input type="text" value="<c:out value="${result.USERNAME}"/>"/></p>
		<!-- <img src="/admin/images/eduform/bg_name.gif" alt=""> -->
		</div>
	</dd>
	</c:forEach>
</dl> 

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

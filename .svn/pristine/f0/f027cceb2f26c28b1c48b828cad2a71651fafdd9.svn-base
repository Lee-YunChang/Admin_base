<%
/****************************************
	subject	: 과정수료관리 > 수료증발급(온라인)
	summary	: 수료증 발급
	wdate	: 2016-05-12
	writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ page import="java.net.URLDecoder" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>수료증 | 상상스토리 - 교육센터</title>
<meta name="title" content="상상스토리 - 교육센터">
<meta name="keywords" content="상상스토리, 교육센터">
<meta name="description" content="상상스토리 교육센터에 오신것을 환영합니다.">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" href="../common/css/certificate/common.css">
<link rel="stylesheet" href="../common/css/certificate/main.css">
<link rel="stylesheet" href="../common/css/certificate/sub.css">
<link rel="stylesheet" href="../common/css/certificate/mobile.css"> -->
<script src="../common/js/certificate/jquery.min.js"></script>
<script src="../common/js/certificate/jquery-ui.min.js"></script>
<script src="../common/js/certificate/jquery.bxslider.min.js"></script>
<script src="../common/js/certificate/jquery.jqtransform.js" ></script>
<script src="../common/js/certificate/common.js"></script>
<script src="../common/js/certificate/main.js"></script>
<!--[if lte IE 9]>
<link rel="stylesheet" href="./css/common_ie9.css">
<![endif]-->
<!--[if lt IE 9]>
<script src="./plugins/html5shiv.min.js"></script>
<script src="./plugins/respond.min.js"></script>
<![endif]--> 
<style>
	*{margin:0;padding:0; list-style:none;font-style: normal;text-align:left}
	.compleat-wrap *{font-family:Gungseo,궁서;letter-spacing:-1px}
	.compleat-wrap { margin:20px auto; width:900px;height:1200px}
	.compleat {height:1200px;background:url('/admin/common/css/images/complete.png') no-repeat; color:#000;
	 -webkit-box-sizing:border-box; -moz-box-sizing:border-box; box-sizing:border-box;}

	.compleat {position: relative;}
	.compleat_txt {font-size:27px; font-weight:bold;position: absolute;left:110px;top:100px}
	.compleat h2 {font-size:66px; text-align:center; text-indent:-9999px; overflow:hidden;}
	.floatwrap {position: absolute;left:110px;top:444px}
	.compleat_list span {font-size:25px; font-weight:bold; display:inline-block; width:154px;  text-indent:-9999px}
	.compleat_list em {font-size:25px; display:inline-block;}
	.compleat_tit {font-size:32px; line-height:49px;text-align:center;position: absolute;top:690px;left:110px;right:110px;height:200px;font-weight: bold;letter-spacing:-2px}

	.compleat_list.fr li em {margin-left:0;}
	.compleat_list.al {text-align:left;}
	.compleat_list li {margin-top:17px;}
	.compleat_list li:first-child {margin-top:0;}
	.compleat_list li.last span {display:inline-block; width:160px;}
	.compleat_data {text-align:center; font-size:25px;position: absolute;bottom:235px;width:100%}

	.compleat h3 {font-size:44px; letter-spacing:-0.5px; margin-top:30px; font-weight:bold;}
	.compleat h3 span {font-size:16px; vertical-align:text-top; font-weight:normal;}
	.compleat_list span.indent_name {display:inline-block; text-indent: 0;font-weight:normal;}
</style>
</head>
<body> 

	<div class="wrap">
			<div class="compleat-wrap">
				<div class="compleat">
					<p class="compleat_txt"><c:out value="${map.COMPCODE}"/></p>
					<h2>수료증</h2>
					<div class="floatwrap">
						<ul class="compleat_list al">
							<li><span>과정 :</span><em><c:out value="${map.SEQ_TITLE}"/></em></li>
							<li><span>성명 :</span><em><span class="indent_name"><c:out value="${map.USERNAME}"/></span></em></li>
							<li><span>생년월일 :</span><em><c:out value="${map.YYYY}"/><c:out value="${map.MM}"/><c:out value="${map.DD}"/></em></li>
							<%-- <li><span>기간 :</span><em><c:out value="${map.STUDY_SDATE}"/> ~ <c:out value="${map.STUDY_EDATE}"/>(<c:out value="${map.STUDYTIME_TOT}"/>시간)</em></li> --%>
							<li><span>기간 :</span><em><c:out value="${map.WDATE}"/> ~ <c:out value="${map.COMPDATE}"/>(<c:out value="${map.STUDYTIME_TOT}"/>분)</em></li>
						</ul>
					</div>
					<p class="compleat_tit">
						위 사람은 상상스토리에서 시행하는<br>
						『<c:out value="${map.SEQ_TITLE}"/>』교육을<br>
						성실히 이수하였기에 이 증서를 수여합니다.
					</p>
					<%-- <p class="compleat_data"><c:out value="${fn:substring(map.STUDY_EDATE, 0, 4)}"/>년 <c:out value="${fn:substring(map.STUDY_EDATE, 5, 7)}"/>월 <c:out value="${fn:substring(map.STUDY_EDATE, 8, 10)}"/>일</p> --%>
					<p class="compleat_data"><c:out value="${fn:substring(map.COMPDATE, 0, 4)}"/>년 <c:out value="${fn:substring(map.COMPDATE, 5, 7)}"/>월 <c:out value="${fn:substring(map.COMPDATE, 8, 10)}"/>일</p>
				</div>
			</div>
	</div><!-- / wrap-->
	
	<script type="text/javascript">
 		window.print();
 	</script>

</body>
</html> 

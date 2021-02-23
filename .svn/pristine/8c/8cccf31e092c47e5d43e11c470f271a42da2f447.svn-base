<%
/****************************************
	subject	: 영수증 출력
	summary	: 영수증 출력
	wdate	: 2016-06-10
	writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>영수증</title>
<script type="text/javascript" src="/admin/common/js/appcommon.js"></script>
<script type="text/javascript" src="/admin/common/js/message.js"></script>
<script type="text/javascript" src="/admin/common/js/jquery-1.8.2.js"></script>
<script type="text/javascript" src="/admin/common/js/jquery-ui-1.9.0.custom.js"></script>

<style type="text/css">
		html, body, div, p { margin: 0; padding: 0; }
		.receipt { position: relative; width: 326px; height: 640px; background: url('/admin/images/receipt.png') no-repeat; }
		p { position: absolute; font-family: 'Batang'; font-size: 15px; font-weight: bold; }
		p.t_part { width: 160px; top: 37px; left: 135px; text-align: center; }
		p.t_name1 { width: 160px; top: 70px; left: 135px; text-align: center; letter-spacing: 7px; }
		p.t_name2 { width: 160px; top: 95px; left: 135px; text-align: center; letter-spacing: 7px; }
		p.t_tel { width: 160px; top: 120px; left: 135px; text-align: center; }
		p.t_num { width: 160px; top: 145px; left: 135px; text-align: center; }
		p.no { top: 230px; left: 82px; font-size: 16px; }
		p.team { top: 263px; left: 90px; font-size: 16px; }
		p.name { top: 296px; left: 90px; letter-spacing: 7px; font-size: 16px; }
		p.cls { top: 327px; left: 90px; line-height: 22px; font-size: 16px; }
		p.pay { top: 384px; left: 90px; font-size: 16px; letter-spacing: -0.5px; }
		p.year { top: 507px; left: 116px; font-size: 14px; }
		p.month { top: 507px; right: 149px; font-size: 14px; }
		p.day { top: 507px; right: 122px; font-size: 14px; }
	</style>	
</head>
<body>
	<div class="receipt">
		<p class="t_part"><c:out value="${payBillInfo.INFO1}"/></p>
		<p class="t_name1"><c:out value="${payBillInfo.INFO2}"/></p>
		<p class="t_name2"><c:out value="${payBillInfo.INFO3}"/></p>
		<p class="t_tel"><c:out value="${payBillInfo.INFO4}"/></p>
		<p class="t_num"><c:out value="${payBillInfo.INFO5}"/></p>
		<p class="no"><c:out value="${payBillInfo.BILL_NO}"/></p>
		<p class="team"><c:out value="${payBillInfo.COMNAME}"/></p>
		<p class="name"><c:out value="${payBillInfo.USERNAME}"/></p>
		<c:set var="title1" value="${fn:substring(payBillInfo.SEQ_TITLE,0,12)}"/>
		<c:set var="title2" value="${fn:substring(payBillInfo.SEQ_TITLE,12,20)}"/>
		<c:set var="title3" value="${fn:substring(payBillInfo.SEQ_TITLE,20,30)}"/>
		<p class="cls"><c:out value="${title1}<br/>${title2}<br/>${title3}" escapeXml="false"/></p>
		<p class="pay">\<fmt:formatNumber value="${payBillInfo.PAYMENT_PRC}" type="number" groupingUsed="true"/></p>
		<p class="year"><c:out value="${payBillInfo.NOWYEAR}"/></p>
		<p class="month"><c:out value="${payBillInfo.NOWMONTH}"/></p>
		<p class="day"><c:out value="${payBillInfo.NOWDAY}" /></p>
	</div>
	<script type="text/javascript">
		window.print();
	</script>
</body>
</html> 

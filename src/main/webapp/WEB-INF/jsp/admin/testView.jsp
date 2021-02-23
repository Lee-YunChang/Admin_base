<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>광물생산보고서 서브페이지 / 광산포털시스템</title>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=yes" />
<meta name="format-detection" content="telephone=no"/>

<link rel="stylesheet" type="text/css" href="/admin/common/assets/css/default.css" />
<link rel="stylesheet" type="text/css" href="/admin/common/assets/css/NotoSansKR.css" />
<link rel="stylesheet" type="text/css" href="/admin/common/assets/css/SCDream.css" />
<link rel="stylesheet" type="text/css" href="/admin/common/assets/css/layout.css" />
<link rel="stylesheet" type="text/css" href="/admin/common/assets/css/styleguide.css" /><!-- 공통 -->
<link rel="stylesheet" type="text/css" href="/admin/common/assets/css/style.css" /><!-- 공통 -->


<script src="../js/jquery-1.11.1.min.js"></script>
</head>
<body>

<!-- skip nav -->
<!-- <div id="skip_nav">
	<ul>
		<li><a href="#fullpage" onclick="document.getElementById('fullpage').tabIndex = -1;document.getElementById('fullpage').focus();return false;">본문 바로가기</a></li>
		<li><a href="#gnb" class="pc_allmenu" onclick="document.getElementById('gnb').tabIndex = -1;document.getElementById('gnb').focus();return false;">주메뉴 바로가기</a></li>
	</ul>
</div> -->
<!--// skip nav -->

<header class="header">

	<div class="head_top">
		<h1 class="logo pc"><a href="#"><img src="/admin/common/assets/images/logo.png" alt="KORES 광산포털시스템 상단 로고 이미지" /></a></h1>

		<ul class="top_nav clearfix pc">
			<li class="admin"><a href="#"><img src="/admin/common/assets/images/ico_admin.png" alt="">관리자</a></li>
			<li class="logout"><a href="#"><img src="/admin/common/assets/images/ico_logout.png" alt="">로그아웃</a></li>
		</ul>
	</div>

	<div class="black_line"></div>
	<nav class="head_wrap pc">
		<ul class="gnb_area">
			<li><a href="#">기준정보</a></li>
			<li><a href="#">사업관리</a></li>
			<li><a href="#">실적관리</a></li>
			<li><a href="#">통계관리</a></li>
			<li><a href="#">정보공유</a></li>
			<li><a href="#">시스템관리</a></li>
		</ul>
	</nav>
	<div class="gray_line"></div>

</header>
<!-- //header -->


<div class="contents_wrap">
	<div class="container clearfix">
		<ul class="lnb_area pc">
			<!-- <li>
				<a href="javascript:void(0);" class="dep">생산보고</a>
				<ul class="depth3">
					<li><a href="#">- 기상청 정책</a></li>
					<li><a href="#">- 기상청 정책</a></li>
				</ul>
			</li> -->
			<li class="depth2">
				<a href="javascript:void(0);" class="dep">생산보고</a>
			</li>
			<li class="depth2">
				<a href="javascript:void(0);" class="dep">실적관리</a>
			</li>
			<li class="depth2">
				<a href="javascript:void(0);" class="dep">현황관리</a>
			</li>
		</ul>

		<!-- 서브내용 시작 -->
		<section class="sub_body sub">
			<!-- location -->
			<div class="titleline">
				<div>
					<ul class="location">
						<li class="home"><a href="/solomonbs/index.do" data-role="gohome" title="메인으로 이동"><img src="/admin/common/assets/images/ico_home.png" alt=""></a></li>
						<li>&gt;  <a href="#">실적관리</a>  &gt; <a href="#">생산보고</a> &gt; <a href="#">광물생산보고서</a></li>
					</ul>
				</div>
				<h2 class="page_title">광물생산보고서</h2>
			</div>


			<!-- form -->
			<div class="btn_right">
				<button class="btn type1">초기화</button>
				<button class="btn type1">수정</button>
				<button class="btn type1">입력</button>
			</div>

			<table class="table_list list_type01">
			  <caption class="caption">게시판 목록</caption>
			  <rowgroup>
				  <row width="">
				  <row width="">
				  <row width="">
				  <row width="">
				  <row width="">
				  <row width="">
				  <row width="">
				  <row width="">
			  </rowgroup>

			  <tbody>
				  <tr class="border_bottom">
				    <th data-table-type="" scope="row" class="text_center">경유</th>
				    <td data-table-type="" scope="row" class="text_center">시, 도지사</td>

				    <th data-table-type="receive" scope="row" class="text_center">수신</th>
				    <td data-table-type="" scope="row" class="text_center">산업자원부장관</td>

				    <th data-table-type="" scope="row" class="text_center">업체명</th>
				    <td data-table-type="" scope="row" class="text_center">대일광업주식회사</td>

				    <th data-table-type="subject" scope="row" class="text_center">제목</th>
				    <td data-table-type="" scope="row" class="text_center">2018년 12월 분 광물생산 보고서</td>
				  </tr>
			  </tbody>

			</table>


			<h3>광산정보</h3>
			<!-- form -->
			<form class="searchForm" action="" method="post">

				<!-- 서브내용 시작 -->
				<table class="table_list list_type02">
				   <caption class="caption">광산정보 목록</caption>
				  <colgroup>
					  <col width="25%">
					  <col width="25%">
					  <col width="25%">
					  <col width="25%">
				  </colgroup>

				  <tbody>

						<tr>
					    <th data-table-type="" scope="col" colspan="1" class="bu_orange">소멸 여부</th>
					    <td data-table-type="" scope="col" colspan="3">Yes No</td>
					  </tr>

						<tr>
							<th data-table-type="" scope="col" class="bu_orange">광산명</th>
							<td data-table-type="" scope="col">춘천연옥 활석광산</td>
							<th data-table-type="" scope="col" class="bu_orange">광종</th>
							<td data-table-type="" scope="col">연혹, 활석</td>
						</tr>

						<tr>
							<th data-table-type="" scope="col" class="bu_orange">광산 주소</th>
							<td data-table-type="" scope="col">강원 춘천시 동면 금옥길 228 (월곡리)</td>
							<th data-table-type="" scope="col" class="bu_orange">광산 전화번호</th>
							<td data-table-type="" scope="col">032-2222-1234</td>
						</tr>

						<tr>
							<th data-table-type="" scope="col">본사 주소</th>
							<td data-table-type="" scope="col">상동</td>
							<th data-table-type="" scope="col">본사 전화번호</th>
							<td data-table-type="" scope="col"></td>
						</tr>

						<tr class="border_bottom">
							<th data-table-type="" scope="col" class="bu_orange">광업권자 성명</th>
							<td data-table-type="" scope="col">대일광업(주)</td>
							<th data-table-type="" scope="col">조광권자 성명</th>
							<td data-table-type="" scope="col"></td>
						</tr>

					  <!-- <tr>
					    <td data-table-type="number">33</td>

					    <td data-table-type="subject" class="text_left">
					    	<a href="#" onclick="javascript:fn_view('52')">[20.5.19.]부산솔로몬로파크, 덕분에 챌린지 참여!!</a>

					    	<span class="btn btn-xs btn-primary">new</span>
					    </td>
					    <td data-table-type="date">2020.05.19</td>
					    <td data-table-type="count">240</td>
					  </tr> -->

				  </tbody>
				</table>

			</form>


			<h4 class="bu_orange">광업권</h4>
			<!-- form -->
			<form class="searchForm" action="" method="post">
				<table class="table_list list_type03">
				  <caption class="caption">광업권 목록</caption>
				  <colgroup>
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
				  </colgroup>

					<thead>
						<tr>
							<th data-table-type="" scope="col">광업권 등록번호</th>
							<th data-table-type="" scope="col">지적명</th>
							<th data-table-type="" scope="col">지적번호</th>
							<th data-table-type="" scope="col">면적</th>
							<th data-table-type="" scope="col">조광권 등록번호</th>
							<th data-table-type="" scope="col">존속기간</th>
							<th data-table-type="" scope="col">의무이행상태</th>
							<th data-table-type="" scope="col">체굴계획안가일자</th>
						</tr>
					</thead>

				  <tbody>
						<tr>
							<td data-table-type="" scope="col">423421</td>
							<td data-table-type="" scope="col">2020.02.17</td>
							<td data-table-type="" scope="col">124</td>
							<td data-table-type="" scope="col">345</td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col">2010.11.25 ~ 2020.12.21</td>
							<td data-table-type="" scope="col">생산실적인정</td>
							<td data-table-type="" scope="col">1950.11.25</td>
						</tr>
						<tr>
							<td data-table-type="" scope="col">323421</td>
							<td data-table-type="" scope="col">2020.02.16</td>
							<td data-table-type="" scope="col">786</td>
							<td data-table-type="" scope="col">324</td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col">2010.11.25 ~ 2020.12.21</td>
							<td data-table-type="" scope="col">생산실적인정</td>
							<td data-table-type="" scope="col">1952.09.15</td>
						</tr>
						<tr>
							<td data-table-type="" scope="col">623421</td>
							<td data-table-type="" scope="col">2020.02.15</td>
							<td data-table-type="" scope="col">231</td>
							<td data-table-type="" scope="col">678</td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col">2010.11.25 ~ 2020.12.21</td>
							<td data-table-type="" scope="col">생산실적인정</td>
							<td data-table-type="" scope="col">1940.10.21</td>
						</tr>
						<tr class="border_bottom">
							<td data-table-type="" scope="col">223421</td>
							<td data-table-type="" scope="col">2020.02.16</td>
							<td data-table-type="" scope="col">112</td>
							<td data-table-type="" scope="col">221</td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col">2010.11.25 ~ 2020.12.21</td>
							<td data-table-type="" scope="col">생산실적인정</td>
							<td data-table-type="" scope="col">1950.11.25</td>
						</tr>

				  </tbody>
				</table>

				<table class="table_list list_type05 mt20">
				  <caption class="caption">광업권 목록</caption>
				  <colgroup>
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
						<col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
				  </colgroup>

					<thead>
						<tr>
							<th data-table-type="" scope="col" colspan="18" class="font16">노무 및 급여상황</th>
						</tr>
					</thead>

				  <tbody>
						<tr>
							<th data-table-type="" scope="col" colspan="2">보고년도</th>
							<td data-table-type="" scope="col" colspan="7">2018</td>
							<th data-table-type="" scope="col" colspan="5">보고월</th>
							<td data-table-type="" scope="col" colspan="4">12</td>
						</tr>
						<tr>
							<th data-table-type="" scope="col" colspan="2" rowspan="2">구분</th>
							<th data-table-type="" scope="col" colspan="6">직영</th>
							<th data-table-type="" scope="col" colspan="6">도급</th>
							<th data-table-type="" scope="col" colspan="1" rowspan="2">가동공수</th>
							<th data-table-type="" scope="col" colspan="1" rowspan="2">작업일수</th>
							<th data-table-type="" scope="col" colspan="1" rowspan="2">기동률<br/>(%)</th>
							<th data-table-type="" scope="col" colspan="1" rowspan="2">전월 급여액<br/>(천원)</th>
						</tr>
						<tr>
							<th data-table-type="" scope="col" class="padding5"><span class="one bg_bl">남</span>갱내</th>
							<th data-table-type="" scope="col" class="padding5"><span class="one bg_ye">여</span>갱내</th>
							<th data-table-type="" scope="col" class="padding5"><span class="one bg_bl">남</span>노천</th>
							<th data-table-type="" scope="col" class="padding5"><span class="one bg_ye">여</span>노천</th>
							<th data-table-type="" scope="col" class="padding5"><span class="one bg_bl">남</span>소계</th>
							<th data-table-type="" scope="col" class="padding5"><span class="one bg_ye">여</span>소계</th>

							<th data-table-type="" scope="col"><span class="one bg_bl">남</span>갱내</th>
							<th data-table-type="" scope="col"><span class="one bg_ye">여</span>갱내</th>
							<th data-table-type="" scope="col"><span class="one bg_bl">남</span>노천</th>
							<th data-table-type="" scope="col"><span class="one bg_ye">여</span>노천</th>
							<th data-table-type="" scope="col"><span class="one bg_bl">남</span>소계</th>
							<th data-table-type="" scope="col"><span class="one bg_ye">여</span>소계</th>
						</tr>

						<tr>
							<td data-table-type="" scope="col" rowspan="5" class="txt_bold border_bottom">노무자</td>
							<td data-table-type="" scope="col" class="txt_bold">탐사</td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col">10</td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col">10</td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col">812</td>
							<td data-table-type="" scope="col">12</td>
							<td data-table-type="" scope="col">100</td>
							<td data-table-type="" scope="col"></td>
						</tr>
						<tr>
							<td data-table-type="" scope="col" class="txt_bold">채광</td>
							<td data-table-type="" scope="col">20</td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col">20</td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col">43</td>
							<td data-table-type="" scope="col">4</td>
							<td data-table-type="" scope="col">100</td>
							<td data-table-type="" scope="col"></td>
						</tr>
						<tr>
							<td data-table-type="" scope="col" class="txt_bold">선광</td>
							<td data-table-type="" scope="col">10</td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col">10</td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col">435</td>
							<td data-table-type="" scope="col">43</td>
							<td data-table-type="" scope="col">100</td>
							<td data-table-type="" scope="col"></td>
						</tr>
						<tr>
							<td data-table-type="" scope="col" class="txt_bold">윤광</td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col">5</td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col">5</td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col">789</td>
							<td data-table-type="" scope="col">7</td>
							<td data-table-type="" scope="col">100</td>
							<td data-table-type="" scope="col"></td>
						</tr>
						<tr class="border_bottom">
							<td data-table-type="" scope="col" class="txt_bold">기타</td>
							<td data-table-type="" scope="col">3</td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col">3</td>
							<td data-table-type="" scope="col">6</td>
							<td data-table-type="" scope="col">6</td>
							<td data-table-type="" scope="col">6</td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col">435</td>
							<td data-table-type="" scope="col">35</td>
							<td data-table-type="" scope="col">100</td>
							<td data-table-type="" scope="col"></td>
						</tr>

						<tr>
							<td data-table-type="" scope="col" rowspan="5" class="txt_bold border_bottom">기술직원</td>
							<td data-table-type="" scope="col" class="txt_bold">탐사</td>
							<td data-table-type="" scope="col">3</td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col">3</td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col">211</td>
							<td data-table-type="" scope="col">21</td>
							<td data-table-type="" scope="col">100</td>
							<td data-table-type="" scope="col"></td>
						</tr>
						<tr>
							<td data-table-type="" scope="col" class="txt_bold">전기</td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col">5</td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col">5</td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col">778</td>
							<td data-table-type="" scope="col">7</td>
							<td data-table-type="" scope="col">100</td>
							<td data-table-type="" scope="col"></td>
						</tr>
						<tr>
							<td data-table-type="" scope="col" class="txt_bold">기계</td>
							<td data-table-type="" scope="col">3</td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col">3</td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col">564</td>
							<td data-table-type="" scope="col">54</td>
							<td data-table-type="" scope="col">100</td>
							<td data-table-type="" scope="col"></td>
						</tr>
						<tr>
							<td data-table-type="" scope="col" class="txt_bold">장비</td>
							<td data-table-type="" scope="col">3</td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col">3</td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col">112</td>
							<td data-table-type="" scope="col">12</td>
							<td data-table-type="" scope="col">100</td>
							<td data-table-type="" scope="col"></td>
						</tr>
						<tr class="border_bottom">
							<td data-table-type="" scope="col" class="txt_bold">기타</td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col">435</td>
							<td data-table-type="" scope="col">43</td>
							<td data-table-type="" scope="col">100</td>
							<td data-table-type="" scope="col">3,445,234</td>
						</tr>

						<tr>
							<td data-table-type="" scope="col" colspan="2" class="txt_bold">사무직원</td>
							<td data-table-type="" scope="col">2</td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col">4</td>
							<td data-table-type="" scope="col">1</td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
						</tr>
						<tr class="border_bottom sum">
							<td data-table-type="" scope="col" colspan="2" class="txt_bold">합계</td>
							<td data-table-type="" scope="col" class="txt_bold">42</td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col" class="txt_bold">23</td>
							<td data-table-type="" scope="col" class="txt_bold">6</td>
							<td data-table-type="" scope="col" class="txt_bold">69</td>
							<td data-table-type="" scope="col" class="txt_bold">7</td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
						</tr>

				  </tbody>
				</table>
				<div class="btn_right">
					<button class="btn type2">노무 및 급여 이력보기</button>
				</div>

				<table class="table_list list_type05 mt20">
				  <caption class="caption">광업권 목록</caption>
				  <colgroup>
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
						<col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
				  </colgroup>

				  <tbody>
						<tr>
							<th data-table-type="" scope="col">조회기간</th>
							<td data-table-type="" scope="col" colspan="2">2018년 10월</td>
							<td data-table-type="" scope="col" colspan="2">~</td>
							<td data-table-type="" scope="col" colspan="2">2018년 11월</td>
							<th data-table-type="" scope="col" colspan="10"></th>
						</tr>
						<tr>
							<th data-table-type="" scope="col" colspan="1" rowspan="2">구분</th>
							<th data-table-type="" scope="col" colspan="6">직영</th>
							<th data-table-type="" scope="col" colspan="6">도급</th>
							<th data-table-type="" scope="col" colspan="1" rowspan="2">가동공수</th>
							<th data-table-type="" scope="col" colspan="1" rowspan="2">작업일수</th>
							<th data-table-type="" scope="col" colspan="1" rowspan="2">기동률<br/>(%)</th>
							<th data-table-type="" scope="col" colspan="1" rowspan="2">전월 급여액<br/>(천원)</th>
						</tr>
						<tr>
							<th data-table-type="" scope="col" class="padding5"><span class="one bg_bl">남</span>갱내</th>
							<th data-table-type="" scope="col" class="padding5"><span class="one bg_ye">여</span>갱내</th>
							<th data-table-type="" scope="col" class="padding5"><span class="one bg_bl">남</span>노천</th>
							<th data-table-type="" scope="col" class="padding5"><span class="one bg_ye">여</span>노천</th>
							<th data-table-type="" scope="col" class="padding5"><span class="one bg_bl">남</span>소계</th>
							<th data-table-type="" scope="col" class="padding5"><span class="one bg_ye">여</span>소계</th>

							<th data-table-type="" scope="col"><span class="one bg_bl">남</span>갱내</th>
							<th data-table-type="" scope="col"><span class="one bg_ye">여</span>갱내</th>
							<th data-table-type="" scope="col"><span class="one bg_bl">남</span>노천</th>
							<th data-table-type="" scope="col"><span class="one bg_ye">여</span>노천</th>
							<th data-table-type="" scope="col"><span class="one bg_bl">남</span>소계</th>
							<th data-table-type="" scope="col"><span class="one bg_ye">여</span>소계</th>
						</tr>

						<tr>
							<td data-table-type="" scope="col" class="txt_bold">2018년 10월</td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
						</tr>
						<tr>
							<td data-table-type="" scope="col" class="txt_bold">2018년 11월</td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
						</tr>
						<tr class="border_bottom">
							<td data-table-type="" scope="col" class="txt_bold">기간 평균</td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
						</tr>

				  </tbody>
				</table>
				<table class="table_list list_type05 mt20">
				  <caption class="caption">광업권 목록</caption>
				  <colgroup>
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
				  </colgroup>

					<thead>
						<tr>
							<th data-table-type="" scope="col" colspan="9" class="font16">생산상황</th>
						</tr>
					</thead>

				  <tbody>
						<tr>
							<th data-table-type="" scope="col">보고년도</th>
							<td data-table-type="" scope="col">2018</td>
							<th data-table-type="" scope="col">보고월</th>
							<td data-table-type="" scope="col">12</td>
							<th data-table-type="" scope="col"></th>
							<th data-table-type="" scope="col">연간생산 계획량(톤)</th>
							<td data-table-type="" scope="col">1,200</td>
							<th data-table-type="" scope="col">누적 생산량(톤)</th>
							<td data-table-type="" scope="col">1,200</td>
						</tr>
						<tr>
							<th data-table-type="" scope="col" rowspan="2">광종</th>
							<th data-table-type="" scope="col" colspan="2">원광</th>
							<th data-table-type="" scope="col" colspan="2">급광</th>
							<th data-table-type="" scope="col" colspan="4">정광</th>
						</tr>
						<tr>
							<th data-table-type="" scope="col" colspan="1">채굴량(Kg)</th>
							<th data-table-type="" scope="col" colspan="1">품위(%)</th>
							<th data-table-type="" scope="col" colspan="1">급광량(kg)</th>
							<th data-table-type="" scope="col" colspan="1">품위(%)</th>
							<th data-table-type="" scope="col" colspan="1">종별</th>
							<th data-table-type="" scope="col" colspan="1">정광량(kg)</th>
							<th data-table-type="" scope="col" colspan="1">품위(%)</th>
							<th data-table-type="" scope="col" colspan="1">선광실수율(%)</th>
						</tr>
						<tr>
							<td data-table-type="" scope="col" colspan="1" class="txt_bold">연옥</td>
							<td data-table-type="" scope="col" colspan="1" class="txt_r">138,290 Kg</td>
							<td data-table-type="" scope="col" colspan="1" class="txt_r">Mg0(29%)</td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1" class="txt_r">138,290 Kg</td>
							<td data-table-type="" scope="col" colspan="1" class="txt_r">Mg0(29%)</td>
							<td data-table-type="" scope="col" colspan="1"></td>
						</tr>
						<tr>
							<td data-table-type="" scope="col" colspan="1" class="txt_bold">활석</td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1" class="txt_r">Si02(61%)</td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
						</tr>
						<tr>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
						</tr>
						<tr>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
						</tr>
						<tr>
							<th data-table-type="" scope="col" colspan="1">합계</th>
							<td data-table-type="" scope="col" colspan="1"></td>
							<th data-table-type="" scope="col" colspan="1"></th>
							<td data-table-type="" scope="col" colspan="1"></td>
							<th data-table-type="" scope="col" colspan="1"></th>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<th data-table-type="" scope="col" colspan="1"></th>
							<th data-table-type="" scope="col" colspan="1"></th>
						</tr>
						<tr class="border_bottom sum">
							<th data-table-type="" scope="col" colspan="1">기타사항</th>
							<td data-table-type="" scope="col" colspan="8"></td>
						</tr>

				  </tbody>
				</table>
				<div class="btn_right">
					<button class="btn type3">생산 이력보기</button>
				</div>

				<table class="table_list list_type03 mt20">
				  <caption class="caption">광업권 목록</caption>
				  <colgroup>
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
						<col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
				  </colgroup>

				  <tbody>
						<tr>
							<th data-table-type="" scope="col">조회기간</th>
							<td data-table-type="" scope="col" colspan="1">2018년 10월</td>
							<td data-table-type="" scope="col" colspan="1">~</td>
							<td data-table-type="" scope="col" colspan="1">2018년 11월</td>
							<th data-table-type="" scope="col" colspan="6"></th>
						</tr>
						<tr>
							<th data-table-type="" scope="col" colspan="1" rowspan="2">구분</th>
							<th data-table-type="" scope="col" colspan="1" rowspan="2">광종</th>
							<th data-table-type="" scope="col" colspan="2" rowspan="1">원광</th>
							<th data-table-type="" scope="col" colspan="2" rowspan="1">급광</th>
							<th data-table-type="" scope="col" colspan="4" rowspan="1">정광</th>
						</tr>
						<tr>
							<th data-table-type="" scope="col" colspan="1" rowspan="1">채굴량(Kg)</th>
							<th data-table-type="" scope="col" colspan="1" rowspan="1">품위(%)</th>
							<th data-table-type="" scope="col" colspan="1" rowspan="1">급광량(kg)</th>
							<th data-table-type="" scope="col" colspan="1" rowspan="1">품위(%)</th>
							<th data-table-type="" scope="col" colspan="1" rowspan="1">종별</th>
							<th data-table-type="" scope="col" colspan="1" rowspan="1">정광량(kg)</th>
							<th data-table-type="" scope="col" colspan="1" rowspan="1">품위(%)</th>
							<th data-table-type="" scope="col" colspan="1" rowspan="1">선광실수율(%)</th>
						</tr>

						<tr>
							<td data-table-type="" scope="col" class="txt_bold">2018년 10월</td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
						</tr>
						<tr>
							<td data-table-type="" scope="col" class="txt_bold">2018년 11월</td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
						</tr>
						<tr class="border_bottom">
							<td data-table-type="" scope="col" class="txt_bold">합계</td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
						</tr>

				  </tbody>
				</table>
				<table class="table_list list_type05 mt20">
				  <caption class="caption">광업권 목록</caption>
				  <colgroup>
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
				  </colgroup>

					<thead>
						<tr>
							<th data-table-type="" scope="col" colspan="10" class="font16">처분상황</th>
						</tr>
					</thead>

				  <tbody>
						<tr>
							<th data-table-type="" scope="col">보고년도</th>
							<td data-table-type="" scope="col">2018</td>
							<th data-table-type="" scope="col">보고월</th>
							<td data-table-type="" scope="col">12</td>
							<th data-table-type="" scope="col" colspan="6"></th>
						</tr>
						<tr>
							<th data-table-type="" scope="col" rowspan="1">광종</th>
							<th data-table-type="" scope="col" rowspan="1">품위(%)</th>
							<th data-table-type="" scope="col" rowspan="1">생산단가(원)</th>
							<th data-table-type="" scope="col" rowspan="1">판매량(kg)</th>
							<th data-table-type="" scope="col" rowspan="1">판매액(원)</th>
							<th data-table-type="" scope="col" rowspan="1">판매액(천원)</th>
							<th data-table-type="" scope="col" rowspan="1">판매처</th>
							<th data-table-type="" scope="col" rowspan="1">전월 이월량(kg)</th>
							<th data-table-type="" scope="col" rowspan="1">월말 재고량(kg)</th>
							<th data-table-type="" scope="col" rowspan="1">비고</th>
						</tr>
						<tr>
							<td data-table-type="" scope="col" colspan="1" rowspan="2" class="txt_bold">연옥</td>
							<td data-table-type="" scope="col" colspan="1" rowspan="2">Mg0(29%)</td>
							<td data-table-type="" scope="col" colspan="1" class="txt_r">6,696</td>
							<td data-table-type="" scope="col" colspan="1" class="txt_r">138,290 Kg</td>
							<td data-table-type="" scope="col" colspan="1" class="txt_r">987,675,000</td>
							<td data-table-type="" scope="col" colspan="1" class="txt_r">987,675</td>
							<td data-table-type="" scope="col" colspan="1" class="txt_r">에스엠</td>
							<td data-table-type="" scope="col" colspan="1" class="txt_r"></td>
							<td data-table-type="" scope="col" colspan="1" class="txt_r">1,345,38,290 Kg</td>
							<td data-table-type="" scope="col" colspan="1" class="txt_r"></td>
						</tr>
						<tr>
							<td data-table-type="" scope="col" colspan="1" class="txt_r">12,600</td>
							<td data-table-type="" scope="col" colspan="1" class="txt_r">500 Kg</td>
							<td data-table-type="" scope="col" colspan="1" class="txt_r">7,895,000</td>
							<td data-table-type="" scope="col" colspan="1" class="txt_r">7,895</td>
							<td data-table-type="" scope="col" colspan="1" class="txt_r">대일생활건강</td>
							<td data-table-type="" scope="col" colspan="1" class="txt_r"></td>
							<td data-table-type="" scope="col" colspan="1" class="txt_r"></td>
							<td data-table-type="" scope="col" colspan="1" class="txt_r"></td>
						</tr>
						<tr>
							<td data-table-type="" scope="col" colspan="1" rowspan="1" class="txt_bold">활석</td>
							<td data-table-type="" scope="col" colspan="1">Si02(61%)</td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
						</tr>
						<tr>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
						</tr>
						<tr>
							<th data-table-type="" scope="col" colspan="1">합계</th>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
							<td data-table-type="" scope="col" colspan="1"></td>
						</tr>
						<tr class="border_bottom sum">
							<th data-table-type="" scope="col" colspan="1">기타사항</th>
							<td data-table-type="" scope="col" colspan="9"></td>
						</tr>

				  </tbody>
				</table>
				<div class="btn_right">
					<button class="btn type3">처분 이력보기</button>
				</div>

				<table class="table_list list_type03 mt20">
				  <caption class="caption">광업권 목록</caption>
				  <colgroup>
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
					  <col width="%">
						<col width="%">
					  <col width="%">
					  <col width="%">
				  </colgroup>

				  <tbody>
						<tr>
							<th data-table-type="" scope="col">조회기간</th>
							<td data-table-type="" scope="col" colspan="1">2018년 10월</td>
							<td data-table-type="" scope="col" colspan="1">~</td>
							<td data-table-type="" scope="col" colspan="1">2018년 11월</td>
							<th data-table-type="" scope="col" colspan="4"></th>
						</tr>
						<tr>
							<th data-table-type="" scope="col" colspan="1" rowspan="1">구분</th>
							<th data-table-type="" scope="col" colspan="1" rowspan="1">광종</th>
							<th data-table-type="" scope="col" colspan="1" rowspan="1">품위(%)</th>
							<th data-table-type="" scope="col" colspan="1" rowspan="1">생산단가(원)</th>
							<th data-table-type="" scope="col" colspan="1" rowspan="1">판매량(kg)</th>
							<th data-table-type="" scope="col" colspan="1" rowspan="1">판매액(원)</th>
							<th data-table-type="" scope="col" colspan="1" rowspan="1">판매액(천원)</th>
							<th data-table-type="" scope="col" colspan="1" rowspan="1">비고</th>
						</tr>
						<tr>
							<th data-table-type="" scope="col" colspan="1" rowspan="2">2018년 1월</th>
							<td data-table-type="" scope="col" class="txt_bold">탈황용</td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
						</tr>
						<tr>
							<td data-table-type="" scope="col" class="txt_bold">제철용</td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
						</tr>
						<tr>
							<th data-table-type="" scope="col" colspan="1" rowspan="2">2018년 2월</th>
							<td data-table-type="" scope="col" class="txt_bold">탈황용</td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
						</tr>
						<tr>
							<td data-table-type="" scope="col" class="txt_bold">제철용</td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
						</tr>
						<tr>
							<th data-table-type="" scope="col" colspan="1" rowspan="2" class="border_bottom">합계</th>
							<td data-table-type="" scope="col" class="txt_bold">탈황용</td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
						</tr>
						<tr class="border_bottom">
							<td data-table-type="" scope="col" class="txt_bold">제철용</td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
							<td data-table-type="" scope="col"></td>
						</tr>

				  </tbody>
				</table>
				<div class="btn_right">
					<button class="btn type1">초기화</button>
					<button class="btn type1">수정</button>
					<button class="btn type1">입력</button>
				</div>
			</form>













			<!-- 서브내용 끝 -->

		</section>
		<!-- // sub_body -->

	</div>
	<!-- // container -->
</div>
<!-- // content_wrap -->


<footer class="footer">

	<div class="foot_top">
		<div class="container">
			<div class="foot_txt">
				<span><a href="#" class="txt_blue">개인정보처리방침</a></span>
				<span><a href="#">찾아오시는 길</a></span>
			</div>
		</div>
	</div>
	<!-- //foot_top -->

	<div class="foot_area">
		<div class="container foot_inner">
			<div class="foot_logo">
				<a href="#"><img src="/admin/common/assets/images/foot_logo.png" alt="KORES 광산포털시스템 하단 로고 이미지"></a>
			</div>

			<em>
				<address>(우) 26464 강원도 원주시 혁신로 199 한국광물자원공사<span>TEL 033-736-5000</span></address>
				COPYRIGHT 2013 KORES Corp. All RIGHTS RESERVED.
			</em>

			<span class="mark">
				<a href="http://www.webwatch.or.kr/Situation/WA_Situation.html?MenuCD=110" target="_blank" title="국가 공인 인증기관 : 웹와치"><span>과학기술정보통신부 WEB ACCESSIBILITY 마크(웹 접근성 품질인증 마크)</span></a>
			</span>
		</div>
	</div>
	<!-- // foot_area -->

</footer>
<!-- // footer -->








	<!-- 모바일상단 : 로그인전 -->
	<!-- <div class="mobile_head">
		<a href="javascript:toggleMobileAllMenu()" class="btn_allmenu">전체메뉴</a>
		<div class="btns">
			<a href="#" class="btn_login"><img src="../images/m_btn_login.png" alt="로그인" /></a>
		</div>
	</div>
	<div class="m_allmenu_wrap">
		<div class="mask" onclick="toggleMobileAllMenu()"></div>
		<div class="m_allmenu">
			<div class="allmenu_head">
				<a href="#" class="btn_login">로그인</a>
			</div>
			<ul class="allmenu_list">
				<li class="is_ul">
					<a href="javascript:void(0);">인재개발원 소개</a>
					<ul class="depth">
						<li><a href="#">ㆍ원장인사말</a></li>
						<li><a href="#">ㆍ조직및연혁</a></li>
						<li><a href="#">ㆍ비전및주요사업</a></li>
						<li><a href="#">ㆍ교육현장속으로</a></li>
						<li><a href="#">ㆍ인재원소식</a></li>
						<li><a href="#">ㆍ시설및대관안내</a></li>
						<li><a href="#">ㆍ찾아오시는길</a></li>
					</ul>
				</li>
				<li class="is_ul">
					<a href="javascript:void(0);">스마트교육</a>
					<ul class="depth">
						<li><a href="#">ㆍ교육체계도</a></li>
						<li><a href="#">ㆍ집합교육</a></li>
						<li><a href="#">ㆍ이러닝</a></li>
						<li><a href="#">ㆍMOOC</a></li>
						<li><a href="#">ㆍ인재온</a></li>
					</ul>
				</li>
				<li class="is_ul">
					<a href="javascript:void(0);">공무원 채용</a>
					<ul class="depth">
						<li><a href="#">ㆍ시험안내</a></li>
						<li><a href="#">ㆍ시험공고</a></li>
						<li><a href="#">ㆍ시험문제&정답</a></li>
						<li><a href="#">ㆍ자료실</a></li>
						<li><a href="#">ㆍFAQ</a></li>
						<li><a href="#">ㆍ수렵면허</a></li>
					</ul>
				</li>
				<li>
					<a href="javascript:void(0);">국제연수</a>
				</li>
				<li class="is_ul">
					<a href="javascript:void(0);">강사등록신청</a>
					<ul class="depth">
						<li><a href="#">ㆍ강사등록</a></li>
						<li><a href="#">ㆍ출강확인서신청/출력</a></li>
						<li><a href="#">ㆍ출결현황</a></li>
						<li><a href="#">ㆍ출결입력</a></li>
					</ul>
				</li>
			</ul>
			<a href="javascript:toggleMobileAllMenu();" class="btn_close">닫기</a>
		</div>
	</div> -->
	<!--// 모바일상단 : 로그인전 -->

	<!-- 모바일GNB -->
	<!-- <div class="mobile_gnb">
		<ul>
			<li><a href="#">인재개발원 소개</a></li>
			<li><a href="#">찾아오시는길</a></li>
			<li><a href="#">주차안내</a></li>
		</ul>
	</div> -->
	<!--// 모바일GNB -->

</div>


</body>
</html>

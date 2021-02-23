<%
	/****************************************************
	 system	: 시스템관리 > 공통코드 관리
	 title	: 공통 코드 목록 조회
	 summary	:
	 wdate	: 2016-05-16
	 writer	: sangs
	 *****************************************************/
%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>

<style type="text/css">
/* 커스텀 스타일 */
.left {
	text-align:left;
}
.c-red {
	color:#CC3D3D;
	font-weight:bold;
}

/* 그리드 오버 시 행 선택자 만들기 */
.aui-grid-body-panel table tr:hover {
	background:#D9E5FF;
	color:#000;
}
.aui-grid-main-panel .aui-grid-body-panel table tr td:hover {
	background:transparent;
	color:#000;
}

.aui-grid-tree-branch-open-icon {
	display: none;
}

.aui-grid-tree-branch-icon {
	display: none;
}

</style>

<script type="text/javascript">
	
function fn_location() {
	location.href = '/admin/sysman/minrgtManageDt.do';
}
	
</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">
	광업권 관리 상세<span></span>
</div>

<div>

	<div id="SUB">

		<div class="contents_area">
			<!-- div class="guide_box">
				<p>
					※ 공통코드 생성시 공통코드권한관리에서 공통코드에 대한 권한을 등록 해야 공통코드가 해당 사용자에게 공통코드가 노출 됩니다.<br />
					※ 상세페이지 여부 항목은 등록 폼과 같이 상세 화면에 Y 로 설정합니다. 상세 페이지에 대한 리스트 페이지에 공통코드 선택 처리를 하기 위합니다.<br />
					※ 공통코드는 4뎁스 까지 생성 가능하며 4뎁스 구조로 공통코드를 생성시에는 상단1뎁스 왼쪽은 2~4뎁스 구조로 공통코드를 구성해야 합니다.
				</p>
			</div> -->
			
			<div class="menu_admin_layout">
				<!-- <div class="m_list">

					공통코드 트리
					<div id="treeList" class="list_box" style="height: 500px">
						<div id="grid_wrap" style="width:100%;height:480px;"></div>
					</div>

					<div class="tb_bottom_area" style="line-height: 50px;">
						<div class="btn_right">
							<button type="button" class="btn gray" onclick="doDel(); return false;">삭제</button>
							<button type="button" class="btn blue" onclick="viewNewForm(); return false;">하위메뉴생성</button>
						</div>
					</div>

				</div> -->

				<div>
					<span style="font-size:16px;"><b> &nbsp;&nbsp; 일반 정보</b></span>
					<div class="table_wrap">


							<table class="row_type">
								<caption>테이블</caption>
								<colgroup>
									<col style="width: 12%;" />
									<col style="width: 38%;" />
									<col style="width: 12%;" />
									<col style="width: 38%;" />
								</colgroup>
								<tbody>
									<tr>
										<th>업체 구분</th>
										<td style="text-align:center;">법인</td>
									</tr>
									<tr>
										<th>상호 또는 명칭</th>
										<td style="text-align:center;">OO광산</td>
										<th>설립 연월일</th>
										<td style="text-align:center;">1980.02.01</td>
									</tr>
									<tr>
										<th>성명</th>
										<td style="text-align:center;">OOO</td>
										<th>주민등록번호</th>
										<td style="text-align:center;">681209-1234567</td>
									</tr>
									<tr>
										<th>연락처</th>
										<td style="text-align:center;">010-123-4567</td>
									</tr>
									<tr>
										<th>지역선택</th>
										<td style="text-align:center;">경기도 고양시</td>
										<th>상세주소</th>
										<td style="text-align:center;"></td>
									</tr>
								</tbody>
							</table>
						</div>	
						
						<span style="font-size:16px;"><b> &nbsp;&nbsp; 상세 정보</b></span>
						<div class="table_wrap">
							<table class="row_type">
								<caption>테이블</caption>
								<colgroup>
									<col style="width: 12%;" />
									<col style="width: 17%;" />
									<col style="width: 17%;" />
									<col style="width: 17%;" />
									<col style="width: 17%;" />
									<col style="width: 16%;" />
								</colgroup>
								<tbody>
									<tr>
										<th>직원현황</th>
										<td style="text-align:center;">10명</td>
									</tr>
									<tr>
										<th rowspan="2">광업권 현황</th>
										<td style="text-align:center; border-right:1px solid #ddd;">등록번호</td>
										<td style="text-align:center; border-right:1px solid #ddd;">출원소재지</td>
										<td style="text-align:center; border-right:1px solid #ddd;">광업지적</td>
										<td style="text-align:center; border-right:1px solid #ddd;">광종명</td>
										<td style="text-align:center; border-right:1px solid #ddd;">면적</td>
									</tr>
									<tr>
										<td style="text-align:center; border-right:1px solid #ddd; height:20px;"></td>
										<td style="text-align:center; border-right:1px solid #ddd;"></td>
										<td style="text-align:center; border-right:1px solid #ddd;"></td>
										<td style="text-align:center; border-right:1px solid #ddd;"></td>
										<td style="text-align:center; border-right:1px solid #ddd;"></td>
									</tr>
 								</tbody>
							</table>
 						</div>
					<div class="table_wrap">
						<table>
							<caption>테이블</caption>
							<colgroup>
								<col style="width: 12%;" />
							</colgroup>
							<tbody>
							<tr>
								<td style="border-top: 1px solid #ddd; border-bottom: 1px solid #ddd;">
									마지막 수정일자 : 2020/05월/02일 &nbsp;&nbsp; <input type="button" class="btn blue" value="상세보기"/>
								</td>
							</tr>
							</tbody>
						</table>
					</div>
					<div style="position:relative; text-align:center;"><input type="button" class="btn blue" value="수정"/></div>
				</div>
			</div>

		</div>
		<!-- //contents_area -->
	</div>
	<!-- //#SUB -->

</div>

<br />

<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>

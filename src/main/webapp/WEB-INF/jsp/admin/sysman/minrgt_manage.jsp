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

.my-column {
	text-align:right;
}
</style>

<script type="text/javascript">
	
var myGridID;

var columnLayout = [{
	dataField : "id",
	headerText : "등록번호",
	editable : false,
}, {
	dataField : "class",
	headerText : "광업권 구분",
	editable : false,
}, {
	dataField : "name",
	headerText : "광업권자",
	editable : false,
}, {
	dataField : "country",
	headerText : "지역",
	editable : false,
}, {
	dataField : "date",
	headerText : "등록일자",
	editable : false,
}, {
	dataField : "product",
	headerText : "광물",
	editable : false,
}, {
	dataField : "state",
	headerText : "상태",
	editable : false,
	dataType : "numeric",
	renderer : {
		type : "ButtonRenderer",
		onClick : function(event) {
			fn_location();
		},
	}
}];

$(function() {
	createAUIGrid(columnLayout);
	
	requestJsonData();
});

function createAUIGrid(columnLayout) {
	
	// 그리드 속성 설정
	var gridPros = {
			
			// 페이징 사용		
			usePaging : true,
			
			// 한 화면 페이징 버턴 개수 5개로 지정
			showPageButtonCount : 5,
			
			// 페이지 행 개수 select UI 출력 여부 (기본값 : false)
			showPageRowSelect : true,
			
			pageRowCount : 30,

			// 편집 가능 여부 (기본값 : false)
			editable : true,
			
			// 엔터키가 다음 행이 아닌 다음 칼럼으로 이동할지 여부 (기본값 : false)
			enterKeyColumnBase : true,
			
			// 셀 선택모드 (기본값: singleCell)
			selectionMode : "multipleCells",
			
			// 컨텍스트 메뉴 사용 여부 (기본값 : false)
			useContextMenu : true,
			
			// 필터 사용 여부 (기본값 : false)
			enableFilter : true,
		
			// 그룹핑 패널 사용
// 			useGroupingPanel : true,
			
			// 상태 칼럼 사용
			showStateColumn : true,
			
			// 그룹핑 또는 트리로 만들었을 때 펼쳐지게 할지 여부 (기본값 : false)
// 			displayTreeOpen : true,
			
// 			noDataMessage : "출력할 데이터가 없습니다.",
			
// 			groupingMessage : "여기에 칼럼을 드래그하면 그룹핑이 됩니다."
	};

	// 실제로 #grid_wrap 에 그리드 생성
	myGridID = AUIGrid.create("#grid_wrap", columnLayout, gridPros);
}

function requestJsonData() {
	
	// 요청 URL
	var url = "/admin/common/aui/samples/data/normal_500.json";
	
	// ajax 요청 전 그리드에 로더 표시
	AUIGrid.showAjaxLoader(myGridID);
	console.log(url);
	// ajax (XMLHttpRequest) 로 그리드 데이터 요청
	$.ajax({
		url : url,
		success : function(data) {
			
			console.log(data);
				
			// 그리드에 JSON 데이터 설정
			// data 는 JSON 을 파싱한 Array-Object 임
			AUIGrid.setGridData(myGridID, data);
			
			// 로더 제거
			AUIGrid.removeAjaxLoader(myGridID);
		},
		error : function(status, e) {
			alert("데이터 요청에 실패하였습니다.\r\n status : " + status + "\r\nWAS 를 IIS 로 사용하는 경우 json 확장자가 web.config 의 handler 에 등록되었는지 확인하십시오.");
			// 로더 제거
			AUIGrid.removeAjaxLoader(myGridID);
		}
	});
};
	
function fn_location() {
	location.href = '/admin/sysman/minrgtManageDt.do';
}
	
</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">
	광업권 관리<span></span>
</div>


<!-- 본문 > 상단 > 검색영역 시작 -->
    <table class="table-type1 search_form">
      <colgroup>
        <col class="cellc" width="8%">
        <col class="celll" width="22%">
        <col class="celll" width="8%">
        <col class="celll" width="62%">
        </colgroup>
        <tbody>
        <tr>	
			<th>광업권 구분</th>
			<td colspan="3">
				<input type="radio" name="rd" >전체</input>
				<input type="radio" name="rd" >탐사권</input>
				<input type="radio" name="rd" >채굴권</input>
				<input type="radio" name="rd" >조광권</input>
			</td>
		  </tr>
        <tr>	
			<th>등록번호</th>
			<td colspan="3">
	            <input type="text" class="line" name="searchWord" id="searchWord" style="width:300px;" title="검색어입력" value="" />
			</td>
		  </tr>
        <tr>	
			<th>검색</th>
			<td >
	            <select id="dataFieldSelect" style="width:150px;">
					<option value="cmmnCodeSn">경기도 고양시</option>
					<option value="cmmnCodeNm" selected="selected">서울시 구로구</option>
				</select>
			</td>
			<th>등록일자</th>
			<td >
	            <input type="text" class="line" name="searchWord" id="searchWord" style="width:100px;" title="검색어입력" value="" />
	            ~
	            <input type="text" class="line" name="searchWord" id="searchWord" style="width:100px;" title="검색어입력" value="" />
			</td>
		  </tr>
        </tbody>
    </table>
    
    <br />
	<br />
	
    <div class="button_top" style="position:relative; right:46%;">
    	<a href="#" onclick="searchClick();" class="btn search brown" style="line-height: 20px;">검색</a>
    </div>
<!-- 본문 > 상단 > 검색영역 끝 -->
<br />
<br />
<!-- 본문 > 메인 > 서브   영역 시작 -->
<table width="100%" class="btn_Group">  <tbody>
    <tr>
        <td class="pageinfo"> &lt 검색결과 : <span class="red"><fmt:formatNumber value="3" groupingUsed="true" /></span> 건 &gt </td>
        <td align=right>
            <a href="#" onclick="insertMtCode();" class="btn blue" style="position: relative; right: -46%;">엑셀 업로드</a>
      </td>
        <td align=right>
            <a href="#" onclick="insertMtCode();" class="btn blue">추가</a>
      </td>
    </tr>
  </tbody>
</table>
<!-- 본문 > 메인 > 서브   영역 끝 -->

<div>

	<div id="SUB">

		<div class="contents_area">
			
			<div class="menu_admin_layout">
				<div>
					<div id="grid_wrap" style="width:100%;height:480px;"></div>
				</div>

<!-- 				<div>
					<div class="table_wrap">

						<form name="frm" id="frm" method="post" action="/admin/common/mtCodeCudExec.do">
							<input type="hidden" name="pmode" id="pmode" />
							<input type="hidden" name="dbChk" id="dbChk" value="N"/>
							<input type="hidden" name="cmmnCdSnDp" id="cmmnCdSnDp" /> 
							<input type="hidden" name="cmmnGpCd" id="cmmnGpCd" />
							<input type="hidden" name="cmmnCodeDpNo" id="cmmnCodeDpNo" />

							<table class="row_type">
								<caption>테이블</caption>
								<colgroup>
									<col style="width: 12%;" />
									<col style="width: 12%;" />
									<col style="width: 12%;" />
									<col style="width: 12%;" />
									<col style="width: 12%;" />
									<col style="width: 12%;" />
									<col style="width: 12%;" />
									<col style="width: 12%;" />
								</colgroup>
								<tbody>

									<tr>
										<th>NO</th>
										<th>등록번호</th>
										<th>광업권 구분</th>
										<th>광업권자</th>
										<th>지역</th>
										<th>등록일자</th>
										<th>광물</th>
										<th>상세</th>
									</tr>
									<tr>
										<td style="text-align:center;">3</td>
										<td style="text-align:center;">1111</td>
										<td style="text-align:center;">탐사권</td>
										<td style="text-align:center;">김OO</td>
										<td style="text-align:center;">경기도 고양시</td>
										<td style="text-align:center;">2020/02/02</td>
										<td style="text-align:center;">금광</td>
										<td style="text-align:center;"><input class="btn blue" type="button" name="btn_button" value="보기" onclick="fn_location();" /></td>
									</tr>
									<tr>
										<td style="text-align:center;">2</td>
										<td style="text-align:center;">1234</td>
										<td style="text-align:center;">채굴권</td>
										<td style="text-align:center;">박OO</td>
										<td style="text-align:center;">서울시 구로구</td>
										<td style="text-align:center;">2020/01/01</td>
										<td style="text-align:center;">금광</td>
										<td style="text-align:center;"><input class="btn blue" type="button" name="btn_button" value="보기" onclick="fn_location();" /></td>
										<tdstyle="text-align:center;"><input class="btn blue" type="button" name="btn_button" value="보기" style="position:relative;width:200px;left:0;right:0;margin-left:auto;margin-right:auto;"/></td>
									</tr>
									<tr>
										<td style="text-align:center;">1</td>
										<td style="text-align:center;">1213</td>
										<td style="text-align:center;">조광권</td>
										<td style="text-align:center;">이OO</td>
										<td style="text-align:center;">경기도 고양시</td>
										<td style="text-align:center;">2020/01/01</td>
										<td style="text-align:center;">금광</td>
										<td style="text-align:center;"><input class="btn blue" type="button" name="btn_button" value="보기" onclick="fn_location();" /></td>
									</tr>
								</tbody>
							</table>
						</form>

					</div>


				</div>
 -->			</div>

		</div>
		<!-- //contents_area -->
	</div>
	<!-- //#SUB -->

</div>

<br />

<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>

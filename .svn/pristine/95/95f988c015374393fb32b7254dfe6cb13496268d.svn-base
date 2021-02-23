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
	var myGridID;
	
	//AUIGrid 컬럼 설정
	var columnLayout = [{
		dataField : "CMMN_CODE_NM",
		headerText : "CODE NAME",
		editRenderer : {
			type : "InputEditRenderer",
			
			//ID는 고유값만 가능하도록 에디팅 유효성 검사
			validator : function(oldValue, newValue, rowItem, dataField) {
				if(oldValue != newValue) {
					//datgaField 에서 newValue 값이 유일한 값인지 조사
					var isValid = AUIGrid.isUniqueValue(myGridID, dataField, newValue);
					
					//리턴값은 Object 이며 validate의 값이 true 라면 패스, false 라면 message를 띄움
					return { "validate" : isValid, "message" : newValue + " 값으 고유값이 아닙니다. 다른 값을 입력해주십시오."};
				}
			}
		}
		
	}, {
	    dataField: "CMMN_CODE_SN",
	    headerText: "CODE ID",
		style : "left",
		width:120
	}];

	$(function(){
		$('#searchWord').keypress(function (e) {
			if(e.which == 13) {
				searchClick();
			}
		});
		
		createAUIGrid(columnLayout);
		
		requestAjax();
		
		/* window.onload = function() {
		} */
		
	});
	
	// AUIGrid 를 생성합니다.
	function createAUIGrid(columnLayout) {
		
		var auiGridProps = {
				
				// singleRow 선택모드
				selectionMode : "multipleCells",
				
				displayTreeOpen : true,
				
				editable : false,
				
				// 일반 데이터를 트리로 표현할지 여부(treeIdField, treeIdRefField 설정 필수)
				flat2tree : true,
				
				// 행의 고유 필드명
				rowIdField : "CMMN_CODE_SN",
				
				// 트리의 고유 필드명
				treeIdField : "CMMN_CODE_SN",
				
				// 계층 구조에서 내 부모 행의 treeIdField 참고 필드명
				treeIdRefField : "UPPER_CMMN_CODE_SN"
		};
		
		// 실제로 #grid_wrap 에 그리드 생성
		myGridID = AUIGrid.create("#grid_wrap", columnLayout, auiGridProps);
		
		AUIGrid.bind(myGridID, "cellClick", function(event) {
			fn_detailAjax(event);
		})
		
		// 검색(search) Not Found 이벤트 바인딩
		AUIGrid.bind(myGridID, "notFound", searchNotFoundHandler);
	}
	
	//json 트리 데이터 가져오기  
	function requestAjax() {
		// ajax 요청 전 그리드에 로더 표시
		AUIGrid.showAjaxLoader(myGridID);
		
		// ajax (XMLHttpRequest) 로 그리드 데이터 요청
		$.ajax({
		        url : "/admin/common/mtAsciiCodeAjax.do",
				type : 'post',
				dataType : 'json',
		        success : function(data) {
		        	
		                  if(!data) {
		                             return;
		                  }
		                  // 그리드 데이터
		                  var gridData = data;
 	                      // 로더 제거
		                  AUIGrid.removeAjaxLoader(myGridID);
                          // 그리드에 데이터 세팅
		                  AUIGrid.setGridData(myGridID, gridData);
		        },
		        error : function(e) {
		        	alert("Error :" + e.responseText);
		        }
		});
		
	}
	
	//테이블에 상세정보 입력
	function fn_detailAjax(event) {
		$("#pmode").val('UPD');
		$('#dbChk').val('Y');
		
		var evtVal = event.item.CMMN_CODE_SN;
		
		$.ajax({
			url : "/admin/common/mtCodeDetailAsciiAjax.do",
			data : {cmmnCodeSn : evtVal},
			type : 'post',
			dataType : 'json',
			success : function(data) {
				var dtInfo = data.detailInfo;
				
				$('#cmmnCdSnDp').val(dtInfo[0].cmmnCodeSn);
				$('#cmmnCodeDpNo').val(dtInfo[0].cmmnCodeDpNo);
				
				$('#cmmnCodeNm').val(dtInfo[0].cmmnCodeNm);
				$('#cmmnCodeCn').val(dtInfo[0].cmmnCodeCn);
				$('#cmmnCodeSn').val(dtInfo[0].cmmnCodeSn);
				$('#inqireOrdr').val(dtInfo[0].inqireOrdr);
				$('#registDt').val(dtInfo[0].registDt);
				$('#registUserId').val(dtInfo[0].registUserId);
				$('#updtDt').val(dtInfo[0].updtDt);
				$('#updtUserId').val(dtInfo[0].updtUserId);
				$('#upperCmmnCodeSn').val(dtInfo[0].upperCmmnCodeSn);
				$('#useAt').val(dtInfo[0].useAt);
				
				$("input:radio[name=sysTy][value='"+dtInfo[0].sysTy+"']").prop('checked', true);
				
			}, error : function(e) {
				alert("Error : " + e.responseText);
			}
		});
	}
	
	//중복확인
	function fn_doubleChk() {
		
		$.ajax({
			url : "/admin/common/mtDoubleChkAjax.do",
			data : {cmmnCodeSn : $('#cmmnCodeSn').val(), upperCmmnCodeSn : $('#upperCmmnCodeSn').val()},
			type : 'post',
			dataType : 'json',
			success : function(data) {
				var result = data.result;
				var preCdSn = $('#cmmnCdSnDp').val();
				var chgCdSn = $('#cmmnCodeSn').val();
				
				if((result == 'true') || (preCdSn == chgCdSn)) {
					$('#dbChk').val('Y');
					
					alert("사용가능한 번호입니다.");
				} else {
					$('#dbChk').val('N');
					
					alert("이미 등록된 번호입니다.");
				}
				
			}, error : function(e) {
				alert("Error : " + e.responseText);
			}
			
		});
	}
	
	
	function fn_defaultChk() {
		//중복확인 초기화
		$('#dbChk').val('N');
		
		//공백 입력 제한
		var textVal = $('#cmmnCodeSn').val().replace(/ /gi,'');
		
		$('#cmmnCodeSn').val(textVal);
	}

	// 검색 notFound 이벤트 핸들러
	function searchNotFoundHandler(event) {
		var term = event.term; // 찾는 문자열
		var wrapFound = event.wrapFound; // wrapSearch 한 경우 만족하는 term 이 그리드에 1개 있는 경우.
		
		if(wrapFound) {
			alert('그리드 마지막 행을 지나 다시 찾았지만 다음 문자열을 찾을 수 없습니다 - ' + term );
		} else {
			alert('다음 문자열을 찾을 수 없습니다 - "' + term + '"');
		}
	};

	// 검색 버튼 클릭
	function searchClick() {
		var dataField = document.getElementById("dataFieldSelect").value;
		var term = document.getElementById("searchWord").value;
		if(term.trim() == "") {
			alert("검색 하고자 하는 단어를 입력하십시오.");
			return;
		}
		
		var options = {
			direction : true, // 검색 방향  (true : 다음, false : 이전 검색)
			caseSensitive : false, // 대소문자 구분 여부 (true : 대소문자 구별, false :  무시)
			wholeWord : false, // 온전한 단어 여부
			wrapSearch : true, // 끝에서 되돌리기 여부
		};
		
		// 검색 실시
		AUIGrid.search(myGridID, dataField, term, options);
	};
	
	// 삭제 
	function doDel() {
		$("#pmode").val("DEL");
		
		if($("#cmmnCodeSn").val() == '0') {
			alert("최상위 메뉴는 삭제 할수 없습니다.");
			return;
		}
		
		if($("#cmmnCdSnDp").val() == '') {
			alert("삭제할 코드를 선택해주세요 ");
			return;
		}
		
		if(confirm("삭제후에는 복구가 불가능합니다. 해당 메뉴를 삭제 하시겠습니까?  ")) {
			var cmmnCdSnDp = $('#cmmnCdSnDp').val();
			var pmode = $("#pmode").val();
			
			$.ajax({
		        url : "/admin/common/mtCodeSaveAsciiAjax.do",
		        data : {
		        	cmmnCdSnDp : cmmnCdSnDp,
		        	pmode : pmode
		        		},
				type : 'post',
				dataType : 'json',
		        success : function(data) {
		                  alert(data.msg);
		                  
		                  if(data.result == 'true') {
		                  	requestAjax();
		                  }
		        },
		        error : function(e) {
		        	alert("Error :" + e.responseText);
		        }
			});
		}
		
		/* $("#frm").submit(); */
		
	}
	
	// 하위메뉴생성 폼
	function viewNewForm() {
		/* $('#dbChk').val('N'); */
		
		if($("#pmode").val() == "INS") {
			alert("신규 메뉴 등록 상태 입니다. 코드 정보를 입력하고 저장해주세요");
			return;
		}

		if($("#cmmnCodeDpNo").val() >= 3) {
			alert("3뎁스 이상 메뉴를 생성할수 없습니다.");
			return;
		}
		
		clearfield();
		
		var cmmnCodeDpNo = $('#cmmnCodeDpNo').val();
		var cmmnCodeSn = $('#cmmnCdSnDp').val();
		var resultVal = parseInt(cmmnCodeDpNo) + 1;
		
		$('#cmmnCdSnDp').val(''); //선택 셀과 같은 번호 중복확인 체크
		
		$('#upperCmmnCodeSn').val(cmmnCodeSn);
		
		$("#pmode").val("INS");
		
		$("#cmmnCodeDpNo").val(resultVal);
		
		//ASCII 코드 자동생성
		var evtVal = $('#upperCmmnCodeSn').val();
		
		$.ajax({
			url : "/admin/common/mtCodeSnAsciiAjax.do",
			data : {upperCmmnCodeSn : evtVal, cmmnCodeDpNo : resultVal, cmmnCodeSn : cmmnCodeSn},
			type : 'post',
			dataType : 'json',
			success : function(data) {
				var dtInfo = data.autoCdSn;
				var dpNoChk = $('#cmmnCodeDpNo').val();
				/* var pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi; */
				var pattern = /[[\]]/g;

				var cdSnSt = null;
				
				//처음
				var cdSnSt1 = dtInfo[0].cmmnCodeSn.substring(0,1);
				
				if( !$.isNumeric(cdSnSt1) ) {
					cdSnSt = cdSnSt1.charCodeAt(0);
				} else {
					cdSnSt = cdSnSt1;
				}
				
				//중간
				var cdSnCt = dtInfo[0].cmmnCodeSn.substring(1,3);
					
				//마지막
				var cdSnEd = null;
				var cdSnEd1 = dtInfo[0].cmmnCodeSn.substring(3,4);
				
				if( !$.isNumeric(cdSnEd1) ) {
					cdSnEd = cdSnEd1.charCodeAt(0);
				} else {
					cdSnEd = cdSnEd1;
				}
				
				// 대ㆍ중ㆍ소분류 중 하위메뉴 추가
				if(dpNoChk == '1') { 
					cdSnSt ++;
					
					if(cdSnSt == 10) {
						cdSnSt = parseInt(cdSnSt) + 55;
						cdSnSt = String.fromCharCode(cdSnSt);
					} else if(cdSnSt > 10) {
						cdSnSt = String.fromCharCode(cdSnSt);
					}
					
				} else if(dpNoChk == '2') {
					cdSnCt ++;
					
					if(cdSnCt < 10) {
						cdSnCt = '0' + cdSnCt;
					}
				} else if(dpNoChk == '3') {
					cdSnEd ++;
					
					if(cdSnEd == 10) {
						cdSnEd = parseInt(cdSnEd) + 55;
						cdSnEd = String.fromCharCode(cdSnEd);
					} else if(cdSnEd > 10) {
						cdSnEd = String.fromCharCode(cdSnEd);
					}
				}
				
				// Z이후로 추가할 수 없음
				var flag = pattern.test(cdSnEd);
				
				if(!flag) {
					var result = cdSnSt + cdSnCt + cdSnEd;
					$('#cmmnCodeSn').val(result);
				} else {
					alert('더이상 생성할 수 없습니다.');
					return false;
				}
				
			}, error : function(e) {
				alert("Error : " + e.responseText);
			}
		});
		
	}
	
	//필드 초기화
	function clearfield() {
		
		$('#dbChk').val('N');
		
		$('#cmmnCodeNm').val('');
		$('#cmmnCodeCn').val('');
		$('#cmmnCodeSn').val('');
		$('#inqireOrdr').val('');
		$('#registDt').val('');
		$('#registUserId').val('');
		$('#updtDt').val('');
		$('#updtUserId').val('');
		$('#useAt').val('Y');
		
		$("input:radio[name=sysTy][value='WWW']").prop('checked', true);
		
	}
	
	// 저장
	function doSave() {
		
		if(($("#pmode").val() == "" || $("#pmode").val() == "UPD") && $("#upperCmmnCodeSn").val() == '') {
			alert("수정할 공통코드를 선택해주세요 ");
			return;
		}
		
		if($("#cmmnCodeSn").val() == '0') {
			alert("최상위 메뉴는 수정할수 없습니다.");
			return;
		}
		
		if($('#cmmnCodeSn').val() == '' || $('#cmmnCodeSn').val() == null) {
			alert("더이상 추가할 수 없습니다.");
			
			return;
		}
		
		if($("#inqireOrdr").val() == '' || $("#inqireOrdr").val() == null) {
			alert("코드순서를 입력해주세요.");
			
			return;
		}
		
		if($("#cmmnCodeNm").val() == '' || $("#cmmnCodeNm").val() == null) {
			alert("코드명을 입력해주세요.");
			
			return;
		}
		
		if(confirm('저장하시겠습니까?')) {
			var upperCmmnCodeSn = $('#upperCmmnCodeSn').val();
			var inqireOrdr = $('#inqireOrdr').val();
			var cmmnCodeSn = $('#cmmnCodeSn').val();
			var cmmnCodeNm = $('#cmmnCodeNm').val();
			var sysTy = $('input[name=sysTy]').val();
			var useAt = $('#useAt').val();
			var cmmnCodeCn = $('#cmmnCodeCn').val();
			
			var pmode = $('#pmode').val();
			var cmmnCodeDpNo = $('#cmmnCodeDpNo').val();
			var cmmnCdSnDp = $('#cmmnCdSnDp').val();
			
			$.ajax({
		        url : "/admin/common/mtCodeSaveAsciiAjax.do",
		        data : {
		        		upperCmmnCodeSn : upperCmmnCodeSn,
		        		inqireOrdr : inqireOrdr,
		        		cmmnCodeSn : cmmnCodeSn,
		        		cmmnCodeNm : cmmnCodeNm,
		        		sysTy : sysTy,
		        		useAt : useAt,
		        		cmmnCodeCn : cmmnCodeCn,
		        		pmode : pmode,
		        		cmmnCodeDpNo : cmmnCodeDpNo,
		        		cmmnCdSnDp : cmmnCdSnDp
		        		},
				type : 'post',
				dataType : 'json',
		        success : function(data) {
		                  alert(data.msg);
		                  requestAjax();
		        },
		        error : function(e) {
		        	alert("Error :" + e.responseText);
		        }
			});
		}
	}
	
</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">
	공통코드 관리<span></span>
</div>


<!-- 본문 > 상단 > 검색영역 시작 -->
    <table class="table-type1 search_form">
      <colgroup>
        <col class="cellc" width="8%">
        <col class="celll" width="92%">
        </colgroup>
        <tbody>
        <tr>	
			<th>검색</th>
			<td colspan="3">
	            <select id="dataFieldSelect">
					<option value="CMMN_CODE_SN">코드ID</option>
					<option value="CMMN_CODE_NM" selected="selected">코드명</option>
				</select>
	            <input type="text" class="line" name="searchWord" id="searchWord" style="width:300px;" title="검색어입력" value="" />
	            <a href="#" onclick="searchClick();" class="btn search brown">검색</a>
			</td>
		  </tr>
        </tbody>
    </table>
<!-- 본문 > 상단 > 검색영역 끝 -->

<div>

	<div id="SUB">

		<div class="contents_area">
		
			<h4>공통코드</h4>
			
			<!-- div class="guide_box">
				<p>
					※ 공통코드 생성시 공통코드권한관리에서 공통코드에 대한 권한을 등록 해야 공통코드가 해당 사용자에게 공통코드가 노출 됩니다.<br />
					※ 상세페이지 여부 항목은 등록 폼과 같이 상세 화면에 Y 로 설정합니다. 상세 페이지에 대한 리스트 페이지에 공통코드 선택 처리를 하기 위합니다.<br />
					※ 공통코드는 4뎁스 까지 생성 가능하며 4뎁스 구조로 공통코드를 생성시에는 상단1뎁스 왼쪽은 2~4뎁스 구조로 공통코드를 구성해야 합니다.
				</p>
			</div> -->
			
			<div class="menu_admin_layout">
				<div class="m_list">

					<!-- 공통코드 트리 -->
					<div id="treeList" class="list_box" style="height: 500px">
						<div id="grid_wrap" style="width:100%;height:480px;"></div>
						<!-- <ul class="jui">
							<br/><br/>
							<li><a href="#" class="cl_menuLink" data-menuSn="0">전체</a>
							<ul id="ulMenuTree"></ul>
							</li>
						</ul> -->
					</div>

					<div class="tb_bottom_area" style="line-height: 50px;">
						<div class="btn_right">
							<button type="button" class="btn gray" onclick="doDel(); return false;">삭제</button>
							<button type="button" class="btn blue" onclick="viewNewForm(); return false;">하위메뉴생성</button>
						</div>
					</div>

				</div>

				<div class="m_table">
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
									<col style="width: 15%;" />
									<col style="width: 35%;" />
									<col style="width: 15%;" />
									<col style="width: 35%;" />
								</colgroup>
								<tbody>

									<tr>
										<th>상위 코드번호</th>
										<td><input type="text" name="upperCmmnCodeSn" id="upperCmmnCodeSn" value="" style="border : none; box-shadow : none;" readOnly /></td>
										
										<th><label for="inqireOrdr">코드순서</label> <span class="star">*</span></th>
										<td><input type="text" name="inqireOrdr" id="inqireOrdr" /></td>
									</tr>
									<tr>
										<th>코드번호</th>
										<td colspan="3">
											<input type="text" name="cmmnCodeSn" id="cmmnCodeSn" style="width: 25%; border : none; box-shadow : none;" onKeyup="fn_defaultChk();" readOnly></input>
											<!-- <button type="button" class="btn gray" name="btnCd" id="btnCd" onclick="fn_doubleChk();">중복<br />확인</button> -->
										</td>
									</tr>
									<tr>
										<th><label for="cmmnCodeNm">코드명</label> <span class="star">*</span></th>
										<td colspan="3">
											<input type="text" name="cmmnCodeNm" id="cmmnCodeNm" style="width: 90%"/>
										</td>
									</tr>
									<tr>
										<th><label for="sysTy">사용형태</label></th>
										<td>
											<input type="radio" id="sysTyW" name="sysTy" value="WWW" />&nbsp; <span style="line-height: 25px;">WWW</span> </input><br />
											<input type="radio" id="sysTyA" name="sysTy" value="ADM" />&nbsp; <span>ADM</span> </input>
										</td>
										
										<th><label for="useAt">사용여부</label></th>
										<td>
											<select id="useAt" name="useAt">
													<option value="Y">Y</option>
													<option value="N">N</option>
											</select>
										</td>
									</tr>
									<tr>
										<th><label for="cmmnCodeCn">설명</label></th>
										<td colspan="3"><input type="text" name="cmmnCodeCn" id="cmmnCodeCn" style="width: 90%" /></td>
									</tr>
									<tr>
										<th>등록자ID</th>
										<td><input type="text" name="registUserId" id="registUserId" value="" style="border : none; box-shadow : none;" readOnly /></td>
										<th>등록일시</th>
										<td><input type="text" name="registDt" id="registDt" value="" style="border : none; box-shadow : none;" readOnly /></td>
									</tr>
									<tr>
										<th>수정자ID</th>
										<td><input type="text" name="updtUserId" id="updtUserId" value="" style="border : none; box-shadow : none;" readOnly /></td>
										<th>수정일시</th>
										<td><input type="text" name="updtDt" id="updtDt" value="" style="border : none; box-shadow : none;" readOnly /></td>
									</tr>
									<!-- <tr>
										<th>그룹코드</th>
										<td colspan="3">
											<input type="text" name="cmmnGroupCode" id="cmmnGroupCode" style="width: 25%"></input>
										</td>
									</tr> -->

								</tbody>
							</table>
						</form>

					</div>

					<div class="tb_bottom_area">
						<div class="btn_right">
							<button type="button" class="btn blue" onclick="doSave(); return false;">저장</button>
						</div>
					</div>

				</div>
			</div>

		</div>
		<!-- //contents_area -->
	</div>
	<!-- //#SUB -->

</div>

<br />

<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>

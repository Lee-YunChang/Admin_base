<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_pop_inc.jsp"%>

<script type="text/javascript">
	$(document).ready(function(){
		
		// 엔터 검색
		$('#srchText').bind('keydown', function(e) {
            if (e.keyCode == 13) { // enter key
            	getAddr();
                return false;
            }
        });

		
	    $('#zipTable').on('click','.blue',function(e){
	    	e.preventDefault();
	    	var data = {
	            'zip_code' : $(this).parents('tr').find('.zipCode').text(),
	            'adres' : $(this).text(),
	            'gubun' : '${params.gubun}'
	        };
	        if (opener) {
	            opener.fnZipCodePopupCallBack(data);
	            self.close();
	        }
	    });
	});

	function getAddr(){
		if( $("#srchText").val() == '') {
			alert('도로명이나 지역명을 입력해주세요.');
			$("#srchText").focus();
		}
		else {
			$('#zipTable').showLoading();
			$.ajax({
				url: '/admin/common/getPostAjax.do',
		        type: 'POST'
				,data:$("#form").serialize()
				,dataType:"xml"
				,success:function(xmlStr){
					
					$('#zipBody').html('');
		        	$('#zipTable').hideLoading();
		            if ($(xmlStr).find('totalCount').text() == '0'){
		            	alert('검색결과가 없습니다. 검색어에 잘못된 철자가 없는지, 정확한 주소인지 다시 한번 확인해 주세요.');
		            	return;
		            }
					if(xmlStr != null){
						makeList(xmlStr);
					}
				}
			});
		}
	}
	
	function makeList(xmlStr){
		var htmlStr = "";
		$(xmlStr).find("juso").each(function(){
			htmlStr += "<tr>";
			htmlStr += "<td class='zipCode'>"+$(this).find('zipNo').text() +"</td>";
			htmlStr += "<td><a href='javascript:fnZipSelect();'><span class='blue'>"+$(this).find('roadAddr').text() +"</span></a><br/>"+ $(this).find('jibunAddr').text()+"</td>";
			htmlStr += "</tr>";
		});

		$("#zipBody").html(htmlStr);
	}

	function enterSearch() {
		if (event.keyCode==13) getAddr();
	}
	
	
</script>
</head>

<!-- 팝업 타이틀 -->
<div id="pop_header">
    <div class="title title_top">우편번호찾기</div>
</div>
<!-- //팝업 타이틀 -->

<div id="pop_content">
    <!-- 설명문구 -->		
    <div class="pop_txt_field">
        <p style="font-size:12px;"><p>도로명이나 지역명을 이용해서 검색해 보세요.<br/>건물번호, 번지를 함께 입력하시면 더욱 정확한 결과가 검색됩니다. <font class="blue"> 예) 가정북로 90, 장동 23-7</font></p></p>
    </div>
    <!-- //설명문구 -->
    
    <!-- 검색영역 -->
    <form name="form" id="form" method="post">
	<input type="hidden" name="currentPage" value="1"/><!-- 현재 페이지. -->
	<input type="hidden" name="countPerPage" value="50"/> <!-- 페이지당 출력 목록 수. 기본값은 10 -->
	
    <div class="pop_search clearfix" style="margin-top:15px;">
        <div class="pop_search_box">
        	<div class="pop_search_in">
                <input type="text" id="srchText" name="srchText" title="주소 검색" style="width: 250px;height:22px" placeholder="예) 가정북로 90, 장동 23-7"/>
                <a href="#" onclick="getAddr(); return false;" class= "btn gray">찾기</a>
            </div>
        </div>
    </div>
    <p style="margin-top:5px;padding-bottom:10px; border-bottom:1px solid #ddd;">
    
    <fieldset style="border:1px solid #ddd;">
    <table class="table-type1 search_form" id="zipTable" summary="주소검색">
        <colgroup>
            <col style="width: 20%" />
            <col style="width: 80%" />
        </colgroup>
    	<thead>
        	<tr>
            	<th scope="col">우편번호</th>
                <th scope="col">주소</th>
            </tr>
        </thead>
		<tbody id="zipBody">
        </tbody>
    </table>
    </fieldset>
    </form>
    
</div>

 <%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_pop_inc.jsp"%>
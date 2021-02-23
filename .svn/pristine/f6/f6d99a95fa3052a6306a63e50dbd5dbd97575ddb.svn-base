<% /****************************************************
system	: 팝업 등록/수정 폼
title	: 팝업  등록/수정 폼
summary	:
wdate	: 2015-05-18
writer	: 이진영
*****************************************************/%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>
<!-- <script type="text/javascript" src="/admin/common/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script> -->
<script type="text/javascript" src="/admin/common/smarteditor2/js/service/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">
	//날짜를 입력 하면 오늘 날짜로부터 숫자만큼 전날의 날짜를 mm/dd/yyyy 형식으로 돌려 준다.
	var dateFormat={
		dayNamesMin:['일','월','화','수','목','금','토'],
		monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		showMonthAfterYear: true, //연월 순서로 보여줌
		changeMonth: true, //월을 셀렉트박스로 표현
		changeYear: true, //년을 셀렉트박스로 표현
		dateFormat: "yy-mm-dd",
		changeMonth: true,   
		changeYear: true,	
		yearRange: '2014:2025'
	};	
	
	$(document).ready(function(){
		$("#sdate").datepicker(dateFormat);
		$("#edate").datepicker(dateFormat);
	});
	
</script>

<!-- 본문 > 상단 > 타이틀 -->
<c:set var="pageMode"><%=SangsProperties.getProperty("Globals.PAGE_MODE_REG")%></c:set>
<c:set var="titleMode"></c:set>
<c:choose>
	<c:when test="${pageMode == REQUEST_DATA.pageMode}"><c:set var="titleMode" value="등록"/></c:when>
	<c:otherwise><c:set var="titleMode" value="수정"/></c:otherwise>
</c:choose>
<div class="title title_top">팝업 ${titleMode}</div>

<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="form" id="form" action="/admin/site/popupExec.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
    <input type="hidden" name="searchWord" value="<c:out value="${REQUEST_DATA.searchWord}"/>"/>
    <input type="hidden" name="searchMode" value="<c:out value="${REQUEST_DATA.searchMode}"/>"/>
    <input type="hidden" name="qu" value="<c:out value="${REQUEST_DATA.qu}"/>"/>
    <input type="hidden" name="popNo" value="<c:out value="${popupInfo.POP_NO}"/>"/>
    <input type="hidden" name="UPLOAD_DIR" value="<%=SangsProperties.getProperty("Globals.bbsFilePath")%>"/>

    <table class="table-type1 search_form">
    <colgroup>
        <col style="width:15%;" />
        <col style="width:35%;" />
        <col style="width:15%;" />
        <col style="width:35%;" />
    </colgroup>
    <tbody>
    <tr>
        <th><em>*</em>제목</th>
        <td colspan="3">
            <input type="text" class="line" name="popTitle" id="popTitle" style="width:600px" value="<c:out value="${popupInfo.POP_TITLE}" escapeXml="false"/>"/>
        </td>
    </tr>
      <tr>
            <th><em>*</em>노출시작일</th>
       		<td>
				<input type="text" class="line" name="sdate" id="sdate"  value="<c:out value="${popupInfo.START_DATE}"/>" readonly="readonly" style="width: 75px;"/>
			 	<a href="#" onclick="$('#sdate').focus(); return false;">
			 		<img src="/admin/images/btn_calendar.png" alt="시작일">
			 	</a>
			 	<select  id="startHour" name="startHour">
				 	<c:set var="startHourSet"><c:out value="${popupInfo.START_HOUR}"/></c:set>
                    <c:forEach begin="1" end="24" step="1" varStatus="timeStatus2">
                        <option value="<c:if test="${timeStatus2.index < 10}">0</c:if><c:out value="${timeStatus2.index}"/>" <c:if test='${timeStatus2.index eq startHourSet}' >selected="selected" </c:if>><c:if test="${timeStatus2.index < 10}">0</c:if><c:out value="${timeStatus2.index}"/></option>
                    </c:forEach>
                </select> 시
			</td>
            <th><em>*</em>노출 종료일</th>
          	<td>
				<input type="text" class="line" name="edate" id="edate" value="<c:out value="${popupInfo.END_DATE}"/>" readonly="readonly" style="width: 75px;"/>
				<a href="#" onclick="$('#edate').focus(); return false;">
					<img src="/admin/images/btn_calendar.png" alt="종료일">
				</a>
				<select id="endHour" name="endHour">
					<c:set var="endHourSet"><c:out value="${popupInfo.END_HOUR}"/></c:set>
                    <c:forEach begin="1" end="24" step="1" varStatus="timeStatus2">
                        <option value="<c:if test="${timeStatus2.index < 10}">0</c:if><c:out value="${timeStatus2.index}"/>" <c:if test='${timeStatus2.index eq startHourSet}' >selected="selected" </c:if>><c:if test="${timeStatus2.index < 10}">0</c:if><c:out value="${timeStatus2.index}"/></option>
                    </c:forEach>
                </select> 시
			</td>
          </tr>
          
          <%-- <tr>
            <th><em>*</em>넓이 사이즈</th>
            <td><input type="text" name="widthSize" id="widthSize" value="<c:if test="${empty popupInfo.WIDTH_SIZE}">50</c:if><c:if test="${not empty popupInfo.WIDTH_SIZE}"><c:out value="${popupInfo.WIDTH_SIZE}"/></c:if>" numberonly="true"/></td>
            <th><em>*</em>높이 사이즈</th>
            <td><input type="text" name="heightSize" id="heightSize" value="<c:if test="${empty popupInfo.HEIGHT_SIZE}">50</c:if><c:if test="${not empty popupInfo.HEIGHT_SIZE}"><c:out value="${popupInfo.HEIGHT_SIZE}"/></c:if>" numberonly="true"/></td>
        </tr> --%>
        <tr>
            <th><em>*</em>top 위치 </th>
            <td><input type="text" name="locTopPx" id="locTopPx" value="<c:if test="${REQUEST_DATA.qu eq 'insert'}">50</c:if><c:out value="${popupInfo.LOC_TOP_PX}"/>" numberonly="true" /></td>
            <th><em>*</em>left 위치 </th>
            <td><input type="text" name="locLefPx" id="locLefPx"  value="<c:if test="${REQUEST_DATA.qu eq 'insert'}">50</c:if><c:out value="${popupInfo.LOC_LEF_PX}"/>" numberonly="true" /></td>
        </tr>
        <tr>
            <th><em>*</em>사용여부</th>
            <td  colspan="3">
 				<input type="radio" name="useAt" value="Y" <c:if test="${popupInfo.USE_AT eq 'Y'}"> checked="checked" </c:if> /> 사용 &nbsp;
				<input type="radio" name="useAt" value="N" <c:if test="${popupInfo.USE_AT eq 'N'}"> checked="checked" </c:if> /> 미사용         
          </td>
        </tr>
          <tr>
              <th><em>*</em>내용</th>
             <td style="padding:20px 10px 20px 10px;" colspan="3" >
                <div>
                    <!-- [필수]에디터 안에 글내용 영역 -->
                    <textarea name="content" id="content" rows="22" style="width:100%;" ><c:out value="${popupInfo.POP_CONTENT}" escapeXml="false"/></textarea>
                </div>
         </td>
        </tr>
        
    </tbody>
    </table>
    
    <div class="layer_popup" id="layer_popup" style="display: none;">
		<div class="layer-tit" id="layer-tit">
			<p id="preview-tit">미리보기</p>
			<button class="layer_close pop_close" onclick="layerPop();return false;">닫기</button>
		</div>
		<div class="layer_bg bg3" id="layer_bg">
		</div>
		<div class="layer_bottom" id="layer_bottom" align="right">
		<input type="checkbox" name="close_view" id ="close_view" style="margin-left:10px;" /><label for="close_view"> 오늘 하루 이 창을 열지 않음 </label>
		<button class="layer_btn" onclick="layerPop();return false;">닫기</button>
		</div>
	</div>
    
    
    
    <div class="button" >
        <a href="#" onclick="fnPreview(); return false;" class="btn sky big">미리보기</a>
        <c:choose>
        	<c:when test="${pageMode eq REQUEST_DATA.pageMode}">
            	<a href="#" onclick="fnExec(); return false;" class= "btn big blue">등록</a>
        	</c:when>
        	<c:otherwise>
            	<a href="#" onclick="fnExec(); return false;" class= "btn big green">수정</a>
        	</c:otherwise>
        </c:choose>
        <a href="#" onclick="history.back();return false;" class="btn gray big">취소</a>
    </div>
    
</form>

<script type="text/javascript">

	$(document).ready(function(){
		//숫자만 입력
        $("input:text[numberOnly]").live("keyup", function() {
            $(this).val( $(this).val().replace(/[^0-9]/gi,"") );
            if($(this).val() > 100){
            	alert('기본값을 100미만으로 설정해주세요');
            	$(this).val('');
            	$(this).focus();
            }
        });
		
    });

    // 저장
    function fnExec(){
    	
        var form = document.form;
        oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
        form.content.value = document.getElementById("content").value;
	    //내용 필수 입력
		var str=form.content.value;
		
		str = str.replace(/&nbsp;/g,"");
		str = str.replace(/<p>/g,"");
		str = str.replace(/<\/p>/g,"");
		str = str.replace(/\r\n/g,"");
		if(str.length<=0) {
			alert("내용을 입력해 주세요.");
			return false;
		}
        
        //유효성 체크 시작
        //제목
        if('' ==$("#popTitle").val()){
            alert("제목을 입력해주세요.");
            $("#popTitle").focus();
            return;
        }

        //노출 시작일
        if('' ==$("#sdate").val()){
            alert("노출 시작일을 입력해주세요.");
            $("#sdate").focus();
            return;
        }

        //노출 종료일
        if('' ==$("#edate").val()){
            alert("노출 종료일을 입력해주세요.");
            $("#edate").focus();
            return;
        }

        //사이즈 width
        /* if('' ==$("#widthSize").val()){
            alert("사이즈를 정해주세요.");
            $("#widthSize").focus();
            return;
        } */

        //사이즈 height
        /* if('' ==$("#heightSize").val()){
            alert("사이즈를 정해주세요.");
            $("#heightSize").focus();
            return;
        } */

        //위치 top
        if('' ==$("#locTopPx").val()){
            alert("위치를 정해주세요.");
            $("#locTopPx").focus();
            return;
        }

        //위치 left
        if('' ==$("#locLefPx").val()){
            alert("위치를 정해주세요.");
            $("#locLefPx").focus();
            return;
        }
        
        //사용여부
	    if(!$(':input:radio[name=useAt]:checked').val()) {
	    	alert("사용여부를 선택해주세요.");
	        return;
	    }
        
        var msg = '${titleMode}';
        if(confirm( msg+ ' 하시겠습니까?')){
            $("#form").attr("action", "/admin/site/popupExec.do");
            //form.target = '_self';
            form.submit();
        }
    }

    //팝업 미리보기
    function fnPreview(){
        var frm = document.form;
        frm.target = 'hiddenSaveFrame';  // hidden frame 에 submit
        oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);

        var width= frm.widthSize.value;
        var height= frm.heightSize.value;
        var form = $("#form").serialize();
        var top = frm.locTopPx.value;
        var left = frm.locLefPx.value;
        var content = frm.content.value;
		var popTitle = frm.popTitle.value;
		
        content = content.replace(/&nbsp;/g,"");
		content = content.replace(/<p>/g,"");
		content = content.replace(/<\/p>/g,"<br>");
		content = content.replace(/\r\n/g,"");
        
        /* top = Number(Number(top) + (height/2));
        left = Number(Number(left) + (width/2));  
         */
         
        if(popTitle.length > 0){
	        $('#preview-tit').text(popTitle);
        }else{
        	$('#preview-tit').text("미리보기");
        }
        $('#layer_bg').html(content);
        $('.layer_popup').css('display' , 'block');

        document.getElementById("layer_popup").style.width = width+"%";
        document.getElementById("layer_popup").style.height = height +"%";
        document.getElementById("layer_popup").style.top = top +"%";
        document.getElementById("layer_popup").style.left = left +"%";
        document.getElementById("layer_bg").style.height = height +"%";
        
    }
    
    //미리보기 닫기
    function layerPop(){
    	$('.layer_popup').css('display' , 'none');
    }
</script>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "content",
    sSkinURI: "/admin/common/smarteditor2/SmartEditor2Skin.html",
    fCreator: "createSEditor2"
});

</script>
<style type="text/css">

.layer_popup {display:none; width:426px;  z-index:1000;
 position:fixed; left: 50%; top: 50%; 
-ms-transform: translate(-50%, -50%);
-webkit-transform: translate(-50%, -50%);
-moz-transform: translate(-50%, -50%);
transform: translate(-50%, -50%); -webkit-box-sizing:border-box; -moz-box-sizing:border-box; box-sizing:border-box;
}
.layer_bg.bg3 {background:#fff 50% 30px no-repeat;}
.layer-tit {position:relative; background:#00aee7;}
.layer-tit p { font-size:16px; color:#fff; font-family:'ng_bold'; line-height:35px; padding-left:16px;}
.layer_close {position:absolute; top:50%; right:17px; text-indent:-9999px; background:url('/admin/images/layerclose.png') no-repeat; width:18px; height:18px; margin-top:-8px;}
.layer_bg {text-align:center; background:#fff;overflow-y:scroll; width: 100%; }
.layer_bg .btn-m {padding:0 15px; font-size:1.154em; min-width:auto; border-radius:2px; line-height:28px;}
.layer_bottom{position:relative; padding-right: 2px; padding-top:1%; padding-bottom:1%; background:#dad7d9;}
.layer_btn{border: none;}

</style>
<iframe name="hiddenSaveFrame" style="width: 0px; height:0px" title="팝업 미리보기"></iframe>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/footer_inc.jsp"%>
<%
/****************************************************
    system  : 시스템관리 > 공통코드 상세
    title   : 공통 코드 목록 조회
    summary :
    wdate   : 2016-05-16
    writer  : sangs
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">
$(document).ready(function(){
    onlyNum2("numCd");
});


    // 등록 및 수정 실행
    function writeFormCheck(){
         var form = document.writeform;

         var qu=$("#qu").val();
         var mode=$("#mode").val();

         var pageModeReg = '<%=SangsProperties.getProperty("Globals.PAGE_MODE_REG")%>';
         var pageMode = "<c:out value='${REQUEST_DATA.pageMode}'/>";
         var titleMode = '<c:out value="${cfn:clearXSSMinimum(titleMode)}" />';

         if(pageMode == pageModeReg){
             titleMode = "등록";
         }else {
             titleMode = "수정";
         }
        // 대분류 등록/수정
         if(mode=='mt'){

             if (qu == 'insert' && $("#mtCode").val() == '') {
                 alert("코드ID를 입력하세요!");
                 $("#mtCode").focus();
                 return false;
             } else if ($("#mtName").val() == '') {
                 alert("코드명을 입력하세요!");
                 $("#mtName").focus();
                 return false;
             } else if ($(":radio[name='useGb']:checked").length < 1) {
                 alert("사용구분을 선택하세요!");
                 $("#useGb1").focus();
                 return false;
             } else {

                 if (confirm(titleMode+"하시겠습니까?")){
                     $("#writeform").submit();
                 }
             }

         //소분류 등록/수정
         }else if(mode=='mtsub'){
             if ($("#mtSubCode").val() == ''){
                 alert("서브 코드ID를 입력하세요!");
                 $("#mtSubCode").focus();
                 return;
             }

             if ($("#useGb").val() == '') {
                 alert("사업구분을 입력하세요!");
                 $("#mtName").focus();
                 return false;
             }

             if ($("#mtSubName").val() == ''){
                 alert("서브 코드명 입력하세요!");
                 $("#mtSubName").focus();
                 return;
             }else {
            	 
            	 if('${REQUEST_DATA.qu}' == 'update') {
            		 titleMode = '수정';
            	 }
            	 else {
            		 titleMode = '등록';
            	 }
                 if (confirm(titleMode+"하시겠습니까?")){
                     $("#writeform").submit();
                 }
             }
         }
    }

    //취소
    function cancel(){
        var form = document.writeform;
        var mode=$("#mode").val();

        $("#writeform").submit();
     }

    //대문자 치환
    function filterKey(filter) {
      if(filter){
          var sKey = String.fromCharCode(event.keyCode);
          var re = new RegExp(filter);
          if(!re.test(sKey)) event.returnValue=false;
      }
    }

</script>

<c:set var="pageModeReg" value='<%=SangsProperties.getProperty("Globals.PAGE_MODE_REG") %>' />

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top"> 공통코드 <c:out value="${cfn:clearXSSMinimum(titleMode)}" /> <span> 시스템에 사용되는 공통 코드를 관리합니다.</span></div>


<!-- 본문 > 메인 > 목록 시작  -->
    <form name="writeform" id="writeform" action="/admin/sysman/mtcodeFormExec.do" method="post">
        <input type="hidden" name="subcmd" id="subcmd" value="exec"/>
        <input type="hidden" name="mode" id="mode" value="<c:out value="${cfn:clearXSSMinimum(REQUEST_DATA.mode)}" />"/>
        <input type="hidden" name="qu" id="qu" value="<c:out value="${cfn:clearXSSMinimum(REQUEST_DATA.qu)}" />"/>
		<input type="hidden" name="mtCode" id="mtCode" value="<c:out value="${REQUEST_DATA.mtCode}" />"/>




        <!-- 대분류  등록/수정 -->
        <c:if test="${REQUEST_DATA.mode eq 'mt'}">
            <table class="table-type1 search_form">
                <colgroup>
                    <col class="cellc" width="15%">
                    <col class="celll" width="85%">
                </colgroup>

                <tbody>
                    <tr>
                        <th>코드ID</th>
                        <td>
                            <input class="lline" value="<c:out value="${cfn:clearXSSMinimum(VIEW_DATA.MT_CODE)}" />"  name="mtCode" id="mtCode" <c:if test="${REQUEST_DATA.qu eq 'update'}">disabled = "disabled"</c:if>/>
                            <c:if test="${REQUEST_DATA.qu eq 'update'}">
                                <input type="hidden" name="mtCode" id="mtCode" style="text-transform: uppercase;" value="<c:out value="${cfn:clearXSSMinimum(VIEW_DATA.MT_CODE)}" />" />
                            </c:if>
                        </td>
                    </tr>
                      <tr>
                        <th>코드명</th>
                        <td>
                             <input class="lline" value="<c:out value="${cfn:clearXSSMinimum(VIEW_DATA.MT_NAME)}" />" name="mtName" id="mtName" />
                        </td>
                    </tr>
                    <tr>
                        <th>컬럼아이디</th>
                        <td>
                             <input class="lline" value="<c:out value="${cfn:clearXSSMinimum(VIEW_DATA.CID)}" />" name="cid" id="cid"/>
                        </td>
                    </tr>
                    <tr>
                        <th>사용구분</th>
                        <td>

                            <input type="radio" name="useGb" id="useGb1" value="U" <c:if test="${VIEW_DATA.USE_GB eq 'U' or VIEW_DATA.USE_GB eq ''}">checked</c:if>/> 업무용도 <font class="extext">※ 분류형태로 가감이 가능한 코드</font>
                            <br/>
                            <input type="radio" name="useGb" id="useGb2" value="S" <c:if test="${VIEW_DATA.USE_GB eq 'S' or VIEW_DATA.USE_GB eq ''}">checked</c:if>/> 시스템용도 <font class="extext">※ 시스템 전체적인 사용으로 변경 불가</font>

                        </td>
                    </tr>
                    <tr>
                        <th>사용여부</th>
                        <td>
                            <select name="useYn">
                                <option value="Y" <c:if test="${VIEW_DATA.USEYN eq 'Y'}">selected</c:if>>사용</option>
                                <option value="N" <c:if test="${VIEW_DATA.USEYN eq 'N'}">selected</c:if>>사용안함</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>설명</th>
                        <td>
                             <textarea class="lline" name="etc" id="etc" style="width:90%" rows="10"><c:out value="${cfn:clearXSSMinimum(VIEW_DATA.ETC)}" /></textarea>
                        </td>
                    </tr>
                </tbody>
            </table>

        <!-- 소분류 등록/수정  -->
        </c:if>
        <c:if test="${REQUEST_DATA.mode ne 'mt'}">

            <input type="hidden" name="mtCode" id="mtCode" value="<c:out value="${cfn:clearXSSMinimum(VIEW_DATA.MT_CODE)}" />"  onkeypress="fnUppercase();"/>
            <table class="table-type1 search_form">
                <colgroup>
                    <col class="cellc" width="15%">
                    <col class="celll" width="85%">
                </colgroup>

                <tbody>
                    <tr>
                        <th>대분류코드 ID</th>
                        <td colspan="3"><c:out value="${cfn:clearXSSMinimum(VIEW_DATA.MT_CODE)}" /></td>
                    </tr>
                    <tr>
                        <th>대분류코드 명</th>
                        <td colspan="3"><c:out value="${cfn:clearXSSMinimum(VIEW_DATA.MT_NAME)}" /></td>
                    </tr>
                    <tr>
                        <th>서브코드 ID</th>
                        <td colspan="3">
                            <input class="lline" value="<c:out value="${cfn:clearXSSMinimum(SUB_VIEW_DATA.MT_SUB_CODE)}" />" name="mtSubCode" id="mtSubCode" size="6" maxlength="6"  <c:if test="${REQUEST_DATA.qu eq 'update'}"> disabled = "disabled"</c:if>/>
                            <c:if test="${REQUEST_DATA.qu eq 'update'}">

                                <input type="hidden" name="mtSubCode" id="mtSubCodeHid" value="<c:out value="${cfn:clearXSSMinimum(SUB_VIEW_DATA.MT_SUB_CODE)}" />"  onkeypress="fnUppercase();"/>
                            </c:if>
                            <font class="extext">※ 영문,숫자로 6자리설정 : 대분류ID 2자리 + 서브ID 4자리</font>
                        </td>
                    </tr>
                    <tr>
                        <th>서브코드 명</th>
                        <td colspan="3">
                             <input class="lline" value="<c:out value="${cfn:clearXSSMinimum(SUB_VIEW_DATA.MT_SUB_NAME)}" />" name="mtSubName" id="mtSubName"  onkeypress="fnUppercase();"/>
                        </td>
                    </tr>
                    <tr>
                        <th>서브코드 설명</th>
                        <td colspan="3">
                             <textarea class="lline"name="summary" id="summary"><c:out value="${cfn:clearXSSMinimum(SUB_VIEW_DATA.SUMMARY)}" /></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th>순서</th>
                        <td colspan="3">
                            <input class="lline" value="<c:out value="${SUB_VIEW_DATA.ORDR}"/>" name="ordr" id="ordr"/>
                        </td>
                    </tr>
                    <tr>
                        <th>숫자형 코드</th>
                        <td colspan="3">
                            <input class="lline" value="<c:out value="${SUB_VIEW_DATA.NUM_CD}"/>" name="numCd" id="numCd"/>
                        </td>
                    </tr>
                    <tr>
                        <th>문자형 코드</th>
                        <td colspan="3">
                            <input class="lline" value="<c:out value="${cfn:clearXSSMinimum(SUB_VIEW_DATA.ABC_CD)}" />" name="abcCd" id="abcCd"/>
                        </td>
                    </tr>
                    <tr>
                        <th>사용여부</th>
                        <td>
                            <select name="useYn">
                                <option value="Y" <c:if test="${VIEW_DATA.USEYN eq 'Y'}">selected</c:if>>사용</option>
                                <option value="N" <c:if test="${VIEW_DATA.USEYN eq 'N'}">selected</c:if>>사용안함</option>
                            </select>
                        </td>
                    </tr>
                </tbody>
            </table>
        </c:if>

        <div class="button">

            <c:if test="${REQUEST_DATA.qu eq 'insert'}">
                <a href="#" onclick="writeFormCheck(); return false;" class= "btn big blue">등록</a>
            </c:if>
            <c:if test="${REQUEST_DATA.qu eq 'update'}">
                <a href="#" onclick="writeFormCheck(); return false;" class= "btn big green">수정</a>
            </c:if>
            <a href="javascript:window.history.back();" class="btn gray big">취소</a>
        </div>
    </form>

<!-- 본문 > 메인 > 목록 끝 -->


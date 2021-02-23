<%
/****************************************
	system	: ClassDesk > 강사 > 시험 
	title	: 세트방식 시험 문제 수정 / 등록 양식  팝업
	summary	:	
	wdate   : 2015-04-01
	writer  : SANGS 
****************************************/
%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/popup_header_inc.jsp"  %>

<!-- header -->
<div id="header" class="clearfix">
	<!-- tnb영역 -->
	<div id="tnb">
		<h1 class="popup-title">문제등록</h1>
		<div class="bg-tnb-line"></div>
	</div>
	<!-- //tnb영역 -->
</div>
<!-- //header -->
<!-- content -->
<div id="content">
	<!-- 문제등록 -->
	<!-- <div class="table-title clearfix">
		<h3 class="ico-table-blue">문제등록</h3>
	</div> -->
	<div class="round-box-small blue">
		<!-- 문제등록 테이블 -->
		<form id="qform" name="qform" enctype="multipart/form-data" >
		<input type="hidden" name="setno" id="setno" value="<c:out value="${REQUEST_DATA.setno}"/>">
		<input type="hidden" name="qno" id="qno" value="<c:out value="${REQUEST_DATA.qno}"/>">
		<input type="hidden" name="UPLOAD_DIR" id="UPLOAD_DIR" value='<c:out value="${UPLOADQUIZ}"/>'/>
		<div class="table-type2">
			<table summary="상상스토리 교육시스템 클래스데스크의 문제등록입니다.">
				<caption>문제등록</caption>
				<colgroup>
					<col width="100">
					<col width="">
				</colgroup>
				<tbody>
					<tr>
						<th>문제유형</th>
						<td>
							<label for="qtype">문제유형</label>
							<select name="qtype" id="qtype">
							<option value="1" label="" <c:if test="${rowData.QTYPE eq '1'}"> selected="selected"</c:if>>OX</option>
							<option value="2" label="" <c:if test="${rowData.QTYPE eq '2'}"> selected="selected"</c:if>>객관식</option>
							<%-- <option value="3" label="" <c:if test="${rowData.QTYPE eq '3'}"> selected="selected"</c:if>>주관식</option> --%>
							<option value="4" label="" <c:if test="${rowData.QTYPE eq '4'}"> selected="selected"</c:if>>단답형</option>
							<option value="5" label="" <c:if test="${rowData.QTYPE eq '5'}"> selected="selected"</c:if>>서술형</option>
						</select>

						</td>
					</tr>
					<tr>
						<th>배점</th>
						<td><input type = "text" name = "allot" id = "allot" value = "<c:out value="${rowData.ALLOT}"/>"   onkeyup="lfn_keychk(this);"  maxlength="3"/>점</td>
					</tr>
					<tr>
						<th>문제</th>
						<td><pre><textarea rows="12" cols="*" style="width: 99%" name="qsubject" id="qsubject" maxlength="1333"><c:out value="${rowData.QSUBJECT}"/></textarea></pre></td>
					</tr>
					<tr>
						<th>문제이미지</th>
						<td>
							<label for="question-img">과제명</label><input type="file" class="w70" name="qsubjectFile" id="qsubjectFile" />
							<!-- 20130821일자 삭제버튼을 체크박스로 변경 -->
							<div class="image-delete">
								<input type = "hidden" name="file_path" id="file_path" value="<c:out value='${rowData.FILE_PATH}'/>"/>
								<c:if test= "${not empty rowData.QSUBJECT_FILE}">
 									<img src="<c:out value="${ctx}"/>/classdesk/fileview.do?type=S&qno=<c:out value="${rowData.QNO}"/>&targetFile=QSUBJECT_FILE"  alt="문제이미지" onerror="this.src='/classdesk/images/thumb_noimage.gif'" style="max-width: 500px" /> 
									<input type = "hidden" name="qsubjectFile" id= "qsubjectFile" value="<c:out value="${rowData.QSUBJECT_FILE}"/>"/> 
									<input type="checkbox" name="delQsubjectFile" id="delQsubjectFile" class="check-mid" value="<c:out value="Y"/>" /><label for="img-delete" class="visible">삭제</label>
								</c:if>
								
							</div>
						</td>
					</tr>
					<tr id="questionArea">
						<th>보기</th>
						<td>
							<div class="question-list">
								<ul>
									<li>
										<strong>1)</strong>
										<blockquote>
											<label for="a01">지문입력</label>
											
											<pre><textarea rows="2" cols="*" style="width: 60%" name="a01" id="a01" maxlength="333"><c:out value="${rowData.A01}"/></textarea></pre>
											<input type="radio" id="rcode" name="rcode" value="1" <c:if test="${rowData.RCODE eq '1'}"> checked</c:if>> <label for="rcode" class="visible">정답</label>
											<label for="question-img1">이미지선택</label><input type="file" class="w80" name="a01File" id="a01File">
											<div class="image-delete"> 
												<c:if test= "${not empty rowData.A01_FILE}">
 													<img src="<c:out value="${ctx}"/>/classdesk/fileview.do?type=S&qno=${rowData.QNO}&targetFile=A01_FILE"  alt="문제이미지" onerror="this.src='/classdesk/images/thumb_noimage.gif'" style="max-width: 500px" /> 
													<input type = "hidden" name="a01File" id= "a01File" value="<c:out value="${rowData.A01_FILE}"/>"/> 
													<input type="checkbox" name="delA01File" id="delA01File" class="check-mid" value="<c:out value="Y"/>" /><label for="img-delete" class="visible">삭제</label>
												</c:if>
											</div>
										</blockquote>
									</li>
									<li>
										<strong>2)</strong>
										<blockquote>
											<label for="a01">지문입력</label>
											<pre><textarea rows="2" cols="*" style="width: 60%" name="a02" id="a02" maxlength="333"><c:out value="${rowData.A02}"/></textarea></pre>
											<input type="radio" id="rcode" name="rcode" value="2" <c:if test="${rowData.RCODE eq '2'}"> checked</c:if>> <label for="rcode" class="visible">정답</label>
											<label for="question-img1">이미지선택</label><input type="file" class="w80" name="a02File" id="a02File">
											<div class="image-delete">
  												<c:if test= "${not empty rowData.A02_FILE}">
 													<img src="<c:out value="${ctx}"/>/classdesk/fileview.do?type=S&qno=<c:out value="${rowData.QNO}"/>&targetFile=A02_FILE"  alt="문제이미지" onerror="this.src='/classdesk/images/thumb_noimage.gif'" style="max-width: 500px" /> 
													<input type = "hidden" name="a02File" id= "a02File" value="<c:out value="${rowData.A02_FILE}"/>"/> 
													<input type="checkbox" name="delA02File" id="delA02File" class="check-mid" value="<c:out value="Y"/>" /><label for="img-delete" class="visible">삭제</label>
												</c:if>
											</div>
										</blockquote>
									</li>
									<li>
										<strong>3)</strong>
										<blockquote>
											<label for="a03">지문입력</label>
											<pre><textarea rows="2" cols="*" style="width: 60%" name="a03" id="a03" maxlength="333"><c:out value="${rowData.A03}"/></textarea></pre>
											<input type="radio" id="rcode" name="rcode" value="3" <c:if test="${rowData.RCODE eq '3'}"> checked</c:if>> <label for="rcode" class="visible">정답</label>
											<label for="question-img1">이미지선택</label><input type="file" class="w80" name="a03File" id="a03File">
											<div class="image-delete"> 
												<c:if test= "${not empty rowData.A03_FILE}">
 													<img src="<c:out value="${ctx}"/>/classdesk/fileview.do?type=S&qno=${rowData.QNO}&targetFile=A03_FILE"  alt="문제이미지" onerror="this.src='/classdesk/images/thumb_noimage.gif'" style="max-width: 500px" /> 
													<input type = "hidden" name="a03File" id= "a03File" value="<c:out value="${rowData.A03_FILE}"/>"/> 
													<input type="checkbox" name="delA03File" id="delA03File" class="check-mid" value="<c:out value="Y"/>" /><label for="img-delete" class="visible">삭제</label>
												</c:if>
											</div>
										</blockquote>
									</li>
									<li>
										<strong>4)</strong>
										<blockquote>
											<label for="a01">지문입력</label>
											<pre><textarea rows="2" cols="*" style="width: 60%" name="a04" id="a04" maxlength="333"><c:out value="${rowData.A04}"/></textarea></pre>
											<input type="radio" id="rcode" name="rcode" value="4" <c:if test="${rowData.RCODE eq '4'}"> checked</c:if>> <label for="rcode" class="visible">정답</label>
											<label for="question-img1">이미지선택</label><input type="file" class="w80" name="a04File" id="a04File">
											<div class="image-delete"> 
												<c:if test= "${not empty rowData.A04_FILE}">
 													<img src="<c:out value="${ctx}"/>/classdesk/fileview.do?type=S&qno=<c:out value="${rowData.QNO}"/>&targetFile=A04_FILE"  alt="문제이미지" onerror="this.src='/classdesk/images/thumb_noimage.gif'" style="max-width: 500px" /> 
													<input type = "hidden" name="a04File" id= "a04File" value="<c:out value="${rowData.A04_FILE}"/>"/> 
													<input type="checkbox" name="delA04File" id="delA04File" class="check-mid" value="<c:out value="Y"/>" /><label for="img-delete" class="visible">삭제</label>
												</c:if>
											</div>
										</blockquote>
									</li>
									<li>
										<strong>5)</strong>
										<blockquote>
											<label for="a01">지문입력</label>
											<pre><textarea rows="2" cols="*" style="width: 60%" name="a05" id="a05" maxlength="333"><c:out value="${rowData.A05}"/></textarea></pre>
											<input type="radio" id="rcode" name="rcode" value="5" <c:if test="${rowData.RCODE eq '5'}"> checked</c:if>> <label for="rcode" class="visible">정답</label>
											<label for="question-img1">이미지선택</label><input type="file" class="w80" name="a05File" id="a05File">
											<div class="image-delete">
												<c:if test= "${not empty rowData.A05_FILE}">
 													<img src="<c:out value="${ctx}"/>/classdesk/fileview.do?type=S&qno=<c:out value="${rowData.QNO}"/>&targetFile=A05_FILE"  alt="문제이미지" onerror="this.src='/classdesk/images/thumb_noimage.gif'" style="max-width:500px" /> 
													<input type = "hidden" name="a05File" id= "a05File" value="<c:out value="${rowData.A05_FILE}"/>"/> 
													<input type="checkbox" name="delA05File" id="delA05File" class="check-mid" value="<c:out value="Y"/>" /><label for="img-delete" class="visible">삭제</label>
												</c:if> 
											</div>
										</blockquote>
									</li>
								</ul>
							</div>
						</td>
					</tr>
					<tr  id="recpdeTextArea">
						<th>정답</th>
						<td><pre><textarea rows="3" cols="*" style="width: 99%" name="rtext" id="rtext" maxlength="333"><c:out value="${rowData.RTEXT}"/></textarea></pre></td>
					</tr>
					<tr>
						<th>해설</th>
						<td><textarea rows="3" cols="*" style="width: 99%" name="summary" id="summary" maxlength="1333"><c:out value="${rowData.SUMMARY}"/></textarea></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td colspan="3"><input type="text" style="width: 80%" name="writer" id="writer" maxlength="16" value="<c:out value="${rowData.WRITER}" default="${REQUEST_DATA.SES_USERNAME}"/>" readonly="readonly" > </td>
					</tr>
					<tr>
						<th>사용여부</th>
						<td>
							<input type="radio" class="mid"   id="use-ok" name="useyn" value="Y" <c:if test="${rowData.USEYN ne 'N'}"> checked</c:if>><label for="use-ok" class="visible">사용</label>
							<input type="radio" class="mid"   id="use-no" name="useyn" value="N" <c:if test="${rowData.USEYN eq 'N'}"> checked</c:if>><label for="use-no" class="visible">사용안함</label></td>
					</tr>
				</tbody>
			</table>
		</div>
		</form>
		<!-- //문제등록 테이블 -->
		<!-- 라운드박스 구성요소 -->
		<div class="top"></div>
		<div class="bottom"></div>
		<div class="left"></div>
		<div class="right"></div>
		<div class="top-left"></div>
		<div class="top-right"></div>
		<div class="bottom-left"></div>
		<div class="bottom-right"></div>
		<!-- //라운드박스 구성요소 -->
	</div>
	<!-- //문제등록 -->
</div>
 
	 
<!-- content -->
<!-- 팝업 버튼영역 -->
<div class="popup-btn-group clearfix">
	<div class="btn-popup"> 
 		<a href="#none" onclick="fnSave();"  class="btn-large-blue"><span>등록</span></a>
 		<a href="#none" onclick="self.close();"  class="btn-large-orange"><span>닫기</span></a>
 	</div> 
</div>
<!-- //팝업 버튼영역 -->

<script type="text/javascript">
<!--

	$(document).ready(function(e){
		qtypeElementTrigger('<c:out value="${rowData.QTYPE}" default="1"/>');
		 
		$('#qtype').change(function(){
			qtypeElementTrigger($(this).val());
		});		 
	});
	
	function qtypeElementTrigger(val){
	 
	    switch(Number(val)){
		
		case 1:   
			$('#questionArea').show();
			$('#questionArea div ul li').eq(2).hide();
			$('#questionArea div ul li').eq(3).hide();
			$('#questionArea div ul li').eq(4).hide();
			$('#recpdeTextArea').hide();
			
			$('#a01').val('O');
			$('#a02').val('X');
			break;
		
		case 2: 
			$('#questionArea').show();
			$('#questionArea div ul li').eq(2).show();
			$('#questionArea div ul li').eq(3).show();
			$('#questionArea div ul li').eq(4).show();
			$('#recpdeTextArea').hide();
			break;
		
		case 4: case 5:
			$('input[name=rcode]').attr('checked', false);
			$('input[name=a01File]').val('');
			$('#questionArea').hide(); 
			$('#recpdeTextArea').show();
			break;
		
		default : break;
		
		};
	}
          
	// 페이징 이동 
	function fnList(){
		$('#qform').attr('target', '_self').attr('method', 'POST').attr('action', '/classdesk/tutor/quizset/q_form.do').submit();
	} 
	
	//등록후 창 새로고침 
	function fnReload(){  
		 window.close();
		 $( opener.location ).attr( 'href' ,  'javascript:fnList();'); 

	} 
	
	// 수정/ 등록 폼
	function fnSave(){
		if($('#qsubject').valueEmpty()){
			alert('문제를 입력해 주세요.');
			$('#qsubject').focus();
			return false;
		}
		
		/* OX 문항 선택 */
		if($('#qtype').val() == 1){
			//지문 전체 3,4,5 null처리
			$('#a03').val('');
			$('#a04').val('');
			$('#a05').val('');
			
			if(!SANGS.Classdesk.questionNullCheck($('textarea[name*=a0]'))){
				alert('지문을 입력해 주세요.');
				return false;
			}
			
			//지문 첨부파일이 있는 경우 삭제 체크후 서버로 전송
			if(!$('input[name=delA03File]:checkbox').valueEmpty()){
				$('input[name=delA03File]:checkbox').attr('checked', true);
			}
			if(!$('input[name=delA04File]:checkbox').valueEmpty()){
				$('input[name=delA04File]:checkbox').attr('checked', true);
			}	
			if(!$('input[name=delA05File]:checkbox').valueEmpty()){
				$('input[name=delA05File]:checkbox').attr('checked', true);
			}	
		}
		
		if($('#qtype').val() == 2){ 
			if(!SANGS.Classdesk.questionNullCheck($('textarea[name*=a0]'))){
				alert('지문을 입력해 주세요.');
				return false;
			}
		}
		
		/* 주관식 문항 선택 */
		if(  $('#qtype').val() == 4 || $('#qtype').val() == 5){
			
			//지문 전체 null처리
			$('textarea[name*=a0]').val('');
 			
			//지문 첨부파일이 있는 경우 삭제 체크후 서버로 전송 
			if(!$('input[name=delA01File]:checkbox').valueEmpty()){
				$('input[name=delA01File]:checkbox').attr('checked', true);
			}
			if(!$('input[name=delA02File]:checkbox').valueEmpty()){
				$('input[name=delA02File]:checkbox').attr('checked', true);
			}
			if(!$('input[name=delA03File]:checkbox').valueEmpty()){
				$('input[name=delA03File]:checkbox').attr('checked', true);
			}
			if(!$('input[name=delA04File]:checkbox').valueEmpty()){
				$('input[name=delA04File]:checkbox').attr('checked', true);
			}	
			if(!$('input[name=delA05File]:checkbox').valueEmpty()){
				$('input[name=delA05File]:checkbox').attr('checked', true);
			}	
		}
		
		
		if ($('input[name=allot]').valueEmpty()) {
			alert('배점을 입력해주세요.');
			$('input[name=allot]').focus();
			return false;
		}	

		$('#qform').attr('target', '_cm').attr('method', 'POST').attr('action', '<c:out value="${ctx}"/>/classdesk/tutor/quizset/q_exec.do').submit();
	}
	 
//-->
</script>
	
	
</body>
</html>

<%
/****************************************
	system	: ClassDesk > 강사 > 시험 
	title	: 세트방식 시험 문제 미리보기
	summary	:	
	wdate	: 2013-11-13
	writer	: jang sun ah 
****************************************/
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%-- <%@ include file="../common/include/popup_header.jsp"  %> --%>



<!-- header -->
<div id="header" class="clearfix">
	<!-- tnb영역 -->
	<div id="tnb">
		<h1 class="popup-title">문제 상세보기</h1>
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
		<input type="hidden" name="subcmd" id="subcmd">
		<input type="hidden" name="setno" id="setno" value="${REQUEST_DATA.setno}">
		<input type="hidden" name="qno" id="qno" value="${REQUEST_DATA.qno}">
		<input type="hidden" name="UPLOAD_DIR" id="UPLOAD_DIR" value='<c:out value="${UPLOADQUIZ}"/>'/>
		<div class="table-type2">
			<table summary="상상스토리 교육시스템 클래스데스크의 문제등록입니다.">
				<caption>문제등록</caption>
				<colgroup>
					<col width="100px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>문제유형</th>
						<td>
							<label for="qtype">문제유형</label>
							 <c:if test="${rowData.QTYPE eq '1'}">OX</c:if>
							 <c:if test="${rowData.QTYPE eq '2'}">객관식</c:if>
							 <c:if test="${rowData.QTYPE eq '4'}">단답형</c:if>
							 <c:if test="${rowData.QTYPE eq '5'}">서술형</c:if>
						</td>
					</tr>
					<tr>
						<th>배점</th>
						<td><c:out value="${rowData.ALLOT}"/>점</td>
					</tr>
					<tr>
						<th>문제</th>
						<td><pre><c:out value="${rowData.QSUBJECT}"/></pre>
								<c:if test= "${not empty rowData.QSUBJECT_FILE}">
 									<img src="<c:out value="${ctx}"/>/classdesk/fileview.do?type=S&qno=<c:out value="${rowData.QNO}"/>&targetFile=QSUBJECT_FILE"  alt="문제이미지" onerror="this.src='/classdesk/images/thumb_noimage.gif'" style="max-width: 500px" /> 
								</c:if>
						</td>
					</tr>
					<tr id="questionArea">
						<th>보기</th>
						<td>
							<div class="question-list">
								<ul>
									<li>
										
										<blockquote>
											<label for="a01">지문 1</label>
 											<pre><strong>1)</strong> <c:out value="${rowData.A01}"/></pre>
											<c:if test="${rowData.RCODE eq '1'}">정답</c:if>
											<div class="image-delete"> 
												<c:if test= "${not empty rowData.A01_FILE}">
 													<img src="<c:out value="${ctx}"/>/classdesk/fileview.do?type=S&qno=<c:out value="${rowData.QNO}"/>&targetFile=A01_FILE"  alt="문제이미지" onerror="this.src='/classdesk/images/thumb_noimage.gif'" style="max-width: 500px" /> 
													<input type = "hidden" name="a01File" id= "a01File" value="<c:out value="${rowData.A01_FILE}"/>"/> 
													<input type="checkbox" name="delA01File" id="delA01File" class="check-mid" value="<c:out value="Y"/>" /><label for="img-delete" class="visible">삭제</label>
												</c:if>
											</div>
										</blockquote>
									</li>
									<li>
										<blockquote>
											<label for="a01">지문 2</label>
 											<pre><strong>2)</strong> <c:out value="${rowData.A02}"/></pre>
											<c:if test="${rowData.RCODE eq '2'}">정답</c:if>
											<div class="image-delete"> 
												<c:if test= "${not empty rowData.A02_FILE}">
 													<img src="<c:out value="${ctx}"/>/classdesk/fileview.do?type=S&qno=<c:out value="${rowData.QNO}"/>&targetFile=A02_FILE"  alt="문제이미지" onerror="this.src='/classdesk/images/thumb_noimage.gif'" style="max-width: 500px" /> 
												</c:if>
											</div>
										</blockquote>
									</li>
									<li>
										<blockquote>
											<label for="a01">지문 3</label>
 											<pre><strong>3)</strong> <c:out value="${rowData.A03}"/></pre>
											<c:if test="${rowData.RCODE eq '3'}">정답</c:if>
											<div class="image-delete"> 
												<c:if test= "${not empty rowData.A03_FILE}">
 													<img src="<c:out value="${ctx}"/>/classdesk/fileview.do?type=S&qno=<c:out value="${rowData.QNO}"/>&targetFile=A03_FILE"  alt="문제이미지" onerror="this.src='/classdesk/images/thumb_noimage.gif'" style="max-width: 500px" /> 
												</c:if>
											</div>
										</blockquote>
									</li>
									<li>
										<blockquote>
											<label for="a01">지문 4</label>
 											<pre><strong>4)</strong> <c:out value="${rowData.A04}"/></pre>
											<c:if test="${rowData.RCODE eq '4'}">정답</c:if>
											<div class="image-delete"> 
												<c:if test= "${not empty rowData.A04_FILE}">
 													<img src="<c:out value="${ctx}"/>/classdesk/fileview.do?type=S&qno=<c:out value="${rowData.QNO}"/>&targetFile=A04_FILE"  alt="문제이미지" onerror="this.src='/classdesk/images/thumb_noimage.gif'" style="max-width: 500px" /> 
												</c:if>
											</div>
										</blockquote> 
									</li>
									<li>
										<blockquote>
											<label for="a01">지문 5</label>
 											<pre><strong>5)</strong> <c:out value="${rowData.A05}"/></pre>
											<c:if test="${rowData.RCODE eq '5'}">정답</c:if>
											<div class="image-delete"> 
												<c:if test= "${not empty rowData.A01_FILE}">
 													<img src="<c:out value="${ctx}"/>/classdesk/fileview.do?type=S&qno=<c:out value="${rowData.QNO}"/>&targetFile=A05_FILE"  alt="문제이미지" onerror="this.src='/classdesk/images/thumb_noimage.gif'" style="max-width: 500px" /> 
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
						<td><pre><c:out value="${rowData.RTEXT}"/></pre></td>
					</tr>
					<tr>
						<th>해설</th>
						<td><c:out value="${rowData.SUMMARY}"/></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td colspan="3"><c:out value="${rowData.WRITER}" default=""/></td>
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
 	<!-- 	<a href="#none" onclick="fnSave();"  class="btn-large-blue"><span>등록</span></a> -->
 		<a href="#none" onclick="self.close();"  class="btn-large-orange"><span>닫기</span></a>
 	</div> 
</div> 
<!-- <div class="popup-btn-group clearfix">
	<div class="btn-popup"> 
		<a href="#none" onclick="fnSave();"  class="btn-large-blue"><span>등록</span></a>
 	</div>
	
	<div class="btn-popup left"> 
 		<a href="#none" onclick="self.close();"  class="btn-large-orange"><span>닫기</span></a> 
	</div>
 --></div> 

<!-- //팝업 버튼영역 -->

<script type="text/javascript"><!--

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
		$('#subcmd').val('q_form');
		$('#qform').attr('target', '_self').attr('method', 'POST').attr('action', '<c:out value="${ctx}"/>/classdesk/tutor/quizset.do').submit();
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
		
		
		$('#subcmd').val('q_exec');
		$('#qform').attr('target', '_cm').attr('method', 'POST').attr('action', '<c:out value="${ctx}"/>/classdesk/tutor/quizset.do').submit();
	}
	 
		//-->
	</script>
	
	
</body>
</html>

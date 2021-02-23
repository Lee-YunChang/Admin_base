<%
/****************************************
	system	: ClassDesk > 강사 > 시험
	title	: 시험 목록
	summary	:	
	wdate   : 2015-04-01
	writer  : SANGS 
****************************************/
%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/top_inc.jsp"%>
 

 		<div id="binderAllotTotal"   name = "binderAllotTotal" style="margin-bottom:10px;padding-right:10px;text-align:right;font-weight:bold;color:#4c4c4c;">
 		   	<c:if test="${courseData.OPENTYPE eq 'A'}">
 		   사용여부 
                 <label for="searchMode">검색조건</label>
                <select name="addObject" id="addObject" onchange="bndListChang('<c:out value="${REQUEST_DATA.examNo}"/>' , this.value); return false;"> 
                    <option value="A" <c:if test="${REQUEST_DATA.addObject eq 'A' }"> selected</c:if>>전체</option>
                    <option value="Y" <c:if test="${REQUEST_DATA.addObject eq 'Y' }"> selected</c:if>>사용</option>
                    <option value="N" <c:if test="${REQUEST_DATA.addObject eq 'N' }"> selected</c:if>>미사용</option>
                </select>  &nbsp;&nbsp;&nbsp;     
           </c:if>
 		문항 총 배점 : <font style="color:#b54141;"><c:out value="${totlaAllotData.TOTAL_ALLOT}"/></font>&nbsp;&nbsp; <a href="#none"  onclick="fnPopFrm('0')" class="btn-small-white"><span class="blue">+문제추가</span></a></div>
		
		<div class="mg-t18 clearfix" style="position:relative;">		
		
		<div class="exam-list"  id="binderList" style="width:100%;">
		
			<c:choose>
					<c:when test="${not empty subListData}">
 						<c:forEach items="${subListData}" var="result" varStatus="stat">
 						
 							<dl style="margin-right:0;">
 								<dt>
									<div>
										<pre><c:out value="${stat.count}"/>. <c:out value="${fn:replace(result.QSUBJECT, crlf, '<br />')}" escapeXml="false"/></pre>
										<c:if test="${not empty result.QSUBJECT_FILE}">
											<%-- <br><img alt="" style="padding-top: 10px;" src="<c:out value="${FILEROOTURL}${result.QSUBJECT_FILE}"/>"> --%>
											<br><img src="/classdesk/fileview.do?type=B&qno=<c:out value="${result.QNO}"/>&targetFile=QSUBJECT_FILE&examno=<c:out value="${REQUEST_DATA.examNo}"/>"  alt="문제이미지" onerror="this.src='/classdesk/images/thumb_noimage.gif'" style="padding-top: 10px; max-width: 99%" />							
										</c:if>
										<div class="exam-list-control" style="margin-top:10px;border-top:1px solid #f08200; padding-top:10px;">
											<div class="exam-use" style="display:inline-block;">
											<font style="color:#2c2c2c;">사용여부 :</font> 
											<c:choose>
												<c:when test="${courseData.OPENTYPE ne 'A'}">
													<c:choose>
														<c:when test="${result.USEYN eq 'Y'}">
															<span class="blue_b">Y</span>
														</c:when>
														<c:otherwise>
															<span class="red_b">N</span>
														</c:otherwise>
													</c:choose>
												</c:when>
												<c:otherwise>
													<select id="openUseYn" name="openUseYn"  onchange="javascript:fnChangUseYn('<c:out value="${result.SEQ}"/>', 'B', this.value);">
														<option value="Y" <c:if test="${result.USEYN eq 'Y'}">selected="selected" </c:if>>Y</option>
														<option value="N" <c:if test="${result.USEYN eq 'N'}">selected="selected" </c:if>>N</option>
													</select>
												</c:otherwise>
											
											</c:choose>
											
											
											</div>
											/
											<div class="exam-score" style="display:inline-block;margin-right:10px;"><font style="color:#2c2c2c;">문항배점 :</font> <font class="red"><c:out value="${result.ALLOT}"/></font></div>
											
											<c:if test="${courseData.OPENTYPE ne 'A'}">
											<div class="exam-btn-group" style="display:inline-block;">
												<a href="#none"  onclick="fnPopFrm('<c:out value="${result.SEQ}"/>')" class="btn-small-white"><span class="orange">수정</span></a>
												<a href="#none" onclick="fnDel('<c:out value="${result.SEQ}"/>')" class="btn-small-white"><span class="red">삭제</span></a> 
											</div>
											</c:if>
										</div>
									</div>
								</dt>
								
								<input type="hidden" name="qSeq" id="qSeq<c:out value="${stat.index}"/>" value="<c:out value="${result.QSEQ}" />" />
								<!-- 주관식 단답형/서술형-->
									<c:if test="${result.QTYPE == 4 || result.QTYPE == 5}">
									
											<!-- <dd style="color: red;" > -->
											<dd>
												<pre><c:out value="${fn:replace(result.RTEXT, crlf, '<br />')}" escapeXml="false"/></pre>
											</dd>
									</c:if>
								
								<!-- OX , 객관식  -->
									<c:if test="${result.QTYPE == 1  || result.QTYPE == 2 }">
										<!-- 답이 길어질 경우 정렬 문제를 고려하여 텍스트 부분에 blockquote 적용 // 시험 볼때만 해당 -->
										<!-- 정답은 class="txt_true" // 오답은 class="txt_false" , 오답에 정답 표시는 class="txt_true2" -->
										
										<!-- 보기 1번 시작  -->
											<c:if test="${not empty result.A01 || not empty result.A01_FILE}">
												<dd> 
													<blockquote 
														<c:choose>
															<c:when test="${result.RCODE == 1}">	class="txt_true2"	</c:when>
														</c:choose>
													>
														<span style="vertical-align:top;">1)</span> <pre style="display:inline-block;"><c:out value="${result.A01 }" /></pre>
													</blockquote>
													<c:if test="${not empty result.A01_FILE}">
														<br><img src="/classdesk/fileview.do?type=B&qno=<c:out value="${result.QNO}"/>&targetFile=A01_FILE&examno=<c:out value="${REQUEST_DATA.examNo}"/>"  alt="문제이미지" onerror="this.src='/classdesk/images/thumb_noimage.gif'" style="padding-top: 10px; max-width: 99%" />	
													</c:if>
												</dd>
											</c:if>
									
										<!-- 보기 2번 시작  -->
											<c:if test="${not empty result.A02 || not empty result.A02_FILE}">
												<dd>
													<blockquote 
														<c:choose>
															<c:when test="${result.RCODE == 2}">	class="txt_true2"	</c:when>
														</c:choose>
													>
														<span style="vertical-align:top;">2)</span> <pre style="display:inline-block;"><c:out value="${result.A02 }" /></pre>
													</blockquote>
													<c:if test="${not empty result.A02_FILE}">
														<br><img src="/classdesk/fileview.do?type=B&qno=<c:out value="${result.QNO}"/>&targetFile=A02_FILE&examno=<c:out value="${REQUEST_DATA.examNo}"/>"  alt="문제이미지" onerror="this.src='/classdesk/images/thumb_noimage.gif'" style="padding-top: 10px; max-width: 99%" />	
													</c:if>
												</dd>
											</c:if>
											
										<!-- 보기3번 시작  -->
											<c:if test="${not empty result.A03 || not empty result.A03_FILE}">
												<dd> 
													<blockquote 
														<c:choose>
															<c:when test="${result.RCODE == 3}">	class="txt_true2"	</c:when>
														</c:choose>
													>
														<span style="vertical-align:top;">3)</span> <pre style="display:inline-block;"><c:out value="${result.A03 }" /></pre>
													</blockquote>
													<c:if test="${not empty result.A03_FILE}">
														<br><img src="/classdesk/fileview.do?type=B&qno=<c:out value="${result.QNO}"/>&targetFile=A03_FILE&examno=<c:out value="${REQUEST_DATA.examNo}"/>"  alt="문제이미지" onerror="this.src='/classdesk/images/thumb_noimage.gif'" style="padding-top: 10px; max-width: 99%" />	
													</c:if>
												</dd>
											</c:if>
											
										<!-- 보기4번 시작  -->
											<c:if test="${not empty result.A04 || not empty result.A04_FILE}">
												<dd>
													<blockquote 
														<c:choose>
															<c:when test="${result.RCODE == 4}">	class="txt_true2"	</c:when>
														</c:choose>
													>
														<span style="vertical-align:top;">4)</span> <pre style="display:inline-block;"><c:out value="${result.A04 }" /></pre>
													</blockquote>
													<c:if test="${not empty result.A04_FILE}">
														<br><img src="/classdesk/fileview.do?type=B&qno=<c:out value="${result.QNO}"/>&targetFile=A04_FILE&examno=<c:out value="${REQUEST_DATA.examNo}"/>"  alt="문제이미지" onerror="this.src='/classdesk/images/thumb_noimage.gif'" style="padding-top: 10px; max-width: 99%" />	
													</c:if>
												</dd>
											</c:if>	
											
										<!-- 보기5번 시작  -->
											<c:if test="${not empty result.A05 || not empty result.A05_FILE}">
												<dd>
													<blockquote 
														<c:choose>
															<c:when test="${result.RCODE == 5}">	class="txt_true2"	</c:when>
														</c:choose>
													>
														<span style="vertical-align:top;">5)</span> <pre style="display:inline-block;"><c:out value="${result.A05 }" /></pre>
													</blockquote>
													<c:if test="${not empty result.A05_FILE}">
														<br><img src="/classdesk/fileview.do?type=B&qno=<c:out value="${result.QNO}"/>&targetFile=A05_FILE&examno=<c:out value="${REQUEST_DATA.examNo}"/>"  alt="문제이미지" onerror="this.src='/classdesk/images/thumb_noimage.gif'" style="padding-top: 10px; max-width: 99%" />	
													</c:if>
												</dd>
											</c:if> 
									</c:if>
									
									<!--  단답, 서술형 -->
									<c:if test="${result.QTYPE == 4  || result.QTYPE == 5 }">
										<dd><c:out value="${result.ANSWER }" /></dd>
									</c:if>
									
									<!-- 등록 정보 수정 및 삭제 영역 -->
									<dd>
										<!--
										<table class="exam-table">
											<thead>
												<tr>
													<th>등록일자</th>
													<th>사용여부</th>
													<th>문제유형</th>
													<th>문항배점</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><fmt:formatDate value="${result.WDATE}" pattern="yyyy-MM-dd" /></td>
													<td>
														<c:choose>
															<c:when test="${result.USEYN eq 'Y'}">
																<span class="blue_b">Y</span>
															</c:when>
															<c:otherwise>
																<span class="red_b">N</span>
															</c:otherwise>
														</c:choose>
													</td>
													<td>
														<c:choose>
														 	<c:when test="${result.QTYPE == 1}"> OX </c:when>
														 	<c:when test="${result.QTYPE == 2}"> 객관식 </c:when> 
					 									 	<c:when test="${result.QTYPE == 4}"> 단답형</c:when>
														 	<c:when test="${result.QTYPE == 5}"> 서술형</c:when>
															<c:otherwise>-</c:otherwise>
														</c:choose> 
													</td>
													<td>
														<c:out value="${result.ALLOT}"/>
													</td>
												</tr>
											</tbody>
										</table>
										<div class="exam-btn-group" style="margin-top:10px;text-align:right;">
											<a href="#none"  onclick="fnPopFrm('<c:out value="${result.SEQ}"/>')" class="btn-small-white"><span class="orange">수정</span></a>
											<a href="#none" onclick="fnDel('<c:out value="${result.SEQ}"/>')" class="btn-small-white"><span class="red">삭제</span></a> 
										</div>
										  -->
									</dd>
									<!-- 등록 정보 수정 및 삭제 영역 -->
 							</dl>
						</c:forEach> 
					</c:when>
					<c:otherwise>
					 등록된 문제가 없습니다. 문제를 등록해주세요! 
					</c:otherwise>
				</c:choose>
		</div>
		 
	</div>
		 
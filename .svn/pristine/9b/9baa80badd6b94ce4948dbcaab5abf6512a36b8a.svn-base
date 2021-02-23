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

 
<div id = "setAllotTotal" name = "setAllotTotal" style="margin-bottom:10px;padding-right:10px;text-align:right;font-weight:bold;color:#4c4c4c;">
	<c:if test="${courseData.OPENTYPE eq 'A'}">
	사용여부 
                 <label for="searchMode">검색조건</label>
                <select name="addObject" id="addObject" onchange="setListChang('<c:out value="${REQUEST_DATA.setno}"></c:out>', this.value); return false;"> 
                    <option value="A" <c:if test="${REQUEST_DATA.addObject eq 'A' }"> selected</c:if>>전체</option>
                    <option value="Y" <c:if test="${REQUEST_DATA.addObject eq 'Y' }"> selected</c:if>>사용</option>
                    <option value="N" <c:if test="${REQUEST_DATA.addObject eq 'N' }"> selected</c:if>>미사용</option>
                </select>       
	 &nbsp;&nbsp;&nbsp;   
	 </c:if>
	 문항 총 배점 : <font style="color:#b54141;"><c:out value="${totlaAllotData.TOTAL_ALLOT}"/></font>
	 
</div>


<div class="mg-t18 clearfix" style="position:relative;">		
		
	<div class="exam-list"  id="binderList" style="width:100%;">
		<c:choose>
			<c:when test="${not empty subListData}">
					<c:forEach items="${subListData}" var="result" varStatus="stat">
						<dl style="margin-right:0;">
 								<dt>
									<pre><c:out value="${stat.count}"></c:out>. <c:out value="${result.QSUBJECT}"/></pre>
									<c:if test= "${not empty result.QSUBJECT_FILE}">
											<br/><img src="<c:out value="${ctx}"/>/classdesk/fileview.do?type=S&qno=<c:out value="${result.QNO}"/>&targetFile=QSUBJECT_FILE"  alt="문제이미지" onerror="this.src='/classdesk/images/thumb_noimage.gif'" style="max-width: 99%" />							
	 								</c:if>	
	 								
	 								<div class="exam-list-control clearfix" style="margin-top:10px;border-top:1px solid #7cacea;padding-top:10px;">
										<div class="exam-use" style="display:inline-block;*float:left;">
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
												<select id="openUseYn" name="openUseYn"  onchange="javascript:fnChangUseYn('<c:out value="${result.QNO}"/>', 'S', this.value);">
													<option value="Y" <c:if test="${result.USEYN eq 'Y'}">selected="selected" </c:if>>Y</option>
													<option value="N" <c:if test="${result.USEYN eq 'N'}">selected="selected" </c:if>>N</option>
												</select>
											</c:otherwise>
										</c:choose>
										</div>
										<div style="*float:left;display:inline-block;*margin:0 5px;">/</div>
										<div class="exam-score" style="display:inline-block;margin-right:10px;*float:left;"><font style="color:#2c2c2c;">문항배점 :</font> <font class="red"><c:out value="${result.ALLOT}"/></font></div>
										<c:if test="${courseData.OPENTYPE ne 'A'}">
										<div class="exam-btn-group" style="display:inline-block;*float:left;">
											<%-- <a href="#none"  onclick="fnPopFrm('<c:out value="${result.QNO}"/>')" class="btn-small-white"><span class="orange">수정</span></a>
											<a href="#none" onclick="fnDel('<c:out value="${result.QNO}"/>')" class="btn-small-white"><span class="red">삭제</span></a>  --%>
										</div>
										</c:if>
									</div>
								</dt>
								<input type="hidden" name="qSeq" id="qSeq<c:out value="${stat.index}"/>" value="<c:out value="${result.QNO}" />" />
								<!-- 주관식 단답형/서술형-->
									<c:if test="${result.QTYPE == 4 || result.QTYPE == 5}">
											<dd>
												<pre><c:out value="${fn:replace(result.RTEXT, crlf, '<br />')}" escapeXml="false"/></pre>
											</dd>
									</c:if>
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
														<br><img src="<c:out value="${ctx}"/>/classdesk/fileview.do?type=S&qno=<c:out value="${result.QNO}"/>&targetFile=A01_FILE&examno=<c:out value="${listData[0].EXAMNO}"/>"  alt="문제이미지" onerror="this.src='/classdesk/images/thumb_noimage.gif'" style="padding-top: 10px; max-width: 99%" />	
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
														<br><img src="<c:out value="${ctx}"/>/classdesk/fileview.do?type=S&qno=<c:out value="${result.QNO}"/>&targetFile=A02_FILE&examno=<c:out value="${listData[0].EXAMNO}"/>"  alt="문제이미지" onerror="this.src='/classdesk/images/thumb_noimage.gif'" style="padding-top: 10px; max-width: 99%" />	
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
														<br><img src="<c:out value="${ctx}"/>/classdesk/fileview.do?type=S&qno=<c:out value="${result.QNO}"/>&targetFile=A03_FILE&examno=<c:out value="${listData[0].EXAMNO}"/>"  alt="문제이미지" onerror="this.src='/classdesk/images/thumb_noimage.gif'" style="padding-top: 10px; max-width: 99%" />	
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
														<br><img src="<c:out value="${ctx}"/>/classdesk/fileview.do?type=S&qno=<c:out value="${result.QNO}"/>&targetFile=A04_FILE&examno=<c:out value="${listData[0].EXAMNO}"/>"  alt="문제이미지" onerror="this.src='/classdesk/images/thumb_noimage.gif'" style="padding-top: 10px; max-width: 99%" />	
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
														<br><img src="<c:out value="${ctx}"/>/classdesk/fileview.do?type=S&qno=<c:out value="${result.QNO}"/>&targetFile=A05_FILE&examno=<c:out value="${listData[0].EXAMNO}"/>"  alt="문제이미지" onerror="this.src='/classdesk/images/thumb_noimage.gif'" style="padding-top: 10px; max-width: 99%" />	
													</c:if>
												</dd>
											</c:if>  
									
									<!--  단답, 서술형 -->
									<c:if test="${result.QTYPE == 4  || result.QTYPE == 5 }">
										<dd><c:out value="${result.ANSWER }" /></dd>
									</c:if>	
								 
						</dl>
					</c:forEach>
			</c:when>
		</c:choose>
	</div>

</div>
 
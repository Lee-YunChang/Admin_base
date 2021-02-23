<%@ tag pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ attribute name="value" type="java.lang.String" rtexprvalue="true" %>
<%@ attribute name="result" type="java.util.Map" rtexprvalue="true" %>


<!-- e-러닝과정  --> 
<c:choose>
	<c:when test="${value eq 'CAAA00'}">
	<p class="ad_m_tit1">과정소개</p>
	<!-- TOPASRO2  항공예약 -->
		<table class="ad_table_row ad_table_blue">
			<colgroup>
				<col width="120" />
				<col width="" />
			</colgroup>
			<tbody>
				<tr>
					<th>교육대상</th> 
					<td>
					<c:out value="${fn:replace(result.SHORT_DESCRIPTION, crlf, '<br />')}" escapeXml="false"/>
					
					</td>
				</tr>
				<tr>
					<th>수강기간</th>
					<td>
						15일 (마지막 날은 Test가 진행되며, 강의 수강이 불가합니다.)
					</td>
				</tr>
				<tr>
					<th>수강시간</th>
					<td>
						00:00 - 24:00 시간 중 수강자가 원하는 시간대에 시청 가능
					</td>
				</tr>
				<tr>
					<th>학습 내용</th>
					<td>
						항공용어 Decode/ Encode<br />
						예약기록의 작성 및 수정<br />
						예약관련 서비스 요청 사항<br />
						단체예약 및 PNR 핸들링<br />
						예약 코드 및 Queue 등
					</td>
				</tr>
				<tr>
					<th>수료기준</th>
					<td>
						과정 진도 점수(35점)와 Final Test(65점) 점수 합산 70점 이상이 경우<br />
						Silver 70점 이상<br />
						Gold 90점 이상
					</td>
				</tr>
				<tr>
					<th>수강료</th>
					<td>
						50,000원<br />
						- e-Learning 과정은 고용보험환급 과정이 아닙니다.<br />
						- e-Learning 기초 발권 과정과 패키지 수강 시 총 1만원 할인
					</td>
				</tr>
			</tbody>
		</table>
	
	</c:when>
	<c:when test="${value eq 'CAAC02'}">
	<p class="ad_m_tit1">과정소개</p>
	<!-- TOPASRO2 발권 기초 -->
		<table class="ad_table_row ad_table_blue">
			<colgroup>
				<col width="120" />
				<col width="" />
			</colgroup>
			<tbody>
				<tr>
					<th>교육대상</th>
					<td>토파스 예약 업무 가능자로 정규 과정 참여가 어려운 자</td>
				</tr>
				<tr>
					<th>수강기간</th>
					<td>
						15일 (마지막 날은 Test가 진행되며, 강의 수강이 불가합니다.)
					</td>
				</tr>
				<tr>
					<th>수강시간</th>
					<td>
						00:00 - 24:00 시간 중 수강자가 원하는 시간대에 시청 가능
					</td>
				</tr>
				<tr>
					<th>학습 내용</th>
					<td>
						항공운임의 기초<br />
						Fare System<br />
						항공운임의 계산 방법 (Mileage System / Routing System)<br />
						항공운임의 종류<br />
						E-Ticket 발권
					</td>
				</tr>
				<tr>
					<th>수료기준</th>
					<td>
						과정 진도 점수(35점)와 Final Test(65점) 점수 합산 70점 이상이 경우<br />
						Silver 70점 이상<br />
						Gold 90점 이상
					</td>
				</tr>
				<tr>
					<th>수강료</th>
					<td>
						60,000원<br />
						- e-Learning 과정은 고용보험환급 과정이 아닙니다.<br />
						- e-Learning 기초 발권 과정과 패키지 수강 시 총 1만원 할인
					</td>
				</tr>
			</tbody>
		</table>
	</c:when>
	
	<c:otherwise></c:otherwise>
</c:choose>
<%@ tag pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ attribute name="value" type="java.lang.String" rtexprvalue="true" %>
<!-- 여행사과정  --> 
<c:choose>
	<c:when test="${value eq 'CAAA00'}">
	<!-- 항공예약 -->
	<p class="ad_m_tit1">과정소개</p>
		<table class="ad_table_row ad_table_blue">
			<colgroup>
				<col width="120" />
				<col width="" />
			</colgroup>
			<tbody>
				<tr>
					<th>교육대상</th>
					<td>토파스를 처음 접하는 예약 초보자</td>
				</tr>
				<tr>
					<th>교육시간</th>
					<td>
						주간  5일  09:00 ~ 17:00<br />
						야간  9일  18:30 ~ 21:30<br />
						주말(토,일)  2일  09:00 ~ 18:00<br />
						주간  3일  09:00 ~ 17:00
					</td>
				</tr>
				<tr>
					<th>수강료</th>
					<td>
						주간/야간 200,000원<br />
						주말(토,일) 150,000원<br />
						부산주간 150,000원
					</td>
				</tr>
				<tr>
					<th>고용보험환급</th>
					<td>해당 (실제 환급금은 여행사규모와 교육 입과 인원에 따라 상이)</td>
				</tr>
				<tr>
					<th>Test/수료증</th>
					<td>
						총70점 이상 취득 시 수료증 수여<br />
						Silver 70점 이상<br />
						Gold 90점 이상
					</td>
				</tr>
				<tr>
					<th>준비물</th>
					<td>훈련위탁계약서(환급대상자), 필기도구</td>
				</tr>
				<tr>
					<th>기타 제공</th>
					<td>교재, 중식(석식), 수료증</td>
				</tr>
				<tr>
					<th>주요 내용</th>
					<td>
						도시, 공항, 항공사 코드 조회<br />
						스케줄 및 좌석 조회<br />
						PNR 작성 및 수정<br />
						단체 예약, PNR 분리<br />
						예약코드, Queue<br />
						마일리지 카드, APIS 입력 등
					</td>
				</tr>
			</tbody>
		</table>
	
	</c:when>
	<c:when test="${value eq 'CAAC00'}">
	<p class="ad_m_tit1">과정소개</p>
	<!-- 발권실무(운임) -->
		<table class="ad_table_row ad_table_blue">
			<colgroup>
				<col width="120" />
				<col width="" />
			</colgroup>
			<tbody>
				<tr>
					<th>교육대상</th>
					<td>예약 업무 가능자 또는 항공예약이수자</td>
				</tr>
				<tr>
					<th>교육시간</th>
					<td>
						주간  5일  09:00 ~ 17:00<br />
						야간  9일  18:30 ~ 21:30<br />
						주말(토,일)  3일  09:00 ~ 18:00
					</td>
				</tr>
				<tr>
					<th>수강료</th>
					<td>
						200,000원
					</td>
				</tr>
				<tr>
					<th>고용보험환급</th>
					<td>해당 (실제 환급금은 여행사규모와 교육 입과 인원에 따라 상이)</td>
				</tr>
				<tr>
					<th>Test/수료증</th>
					<td>
						총70점 이상 취득 시 수료증 수여<br />
						Silver 70점 이상<br />
						Gold 90점 이상
					</td>
				</tr>
				<tr>
					<th>준비물</th>
					<td>훈련위탁계약서(환급대상자), 필기도구</td>
				</tr>
				<tr>
					<th>기타 제공</th>
					<td>교재, 중식(석식), 수료증</td>
				</tr>
				<tr>
					<th>주요 내용</th>
					<td>
						항공지리 및 항공운임의 기본 규정<br />
						항공운임의 종류 및 규정<br />
						항공운임의 종류 및 규정<br />
						Mileage System/Routing Syatem<br />
						노선별 공시운임 및 판매가<br />
						E-Ticket 개요<br />
						발권 Data 입력<br />
						발권 실습 및 판매보고<br />
						※ 주말 과정인 경우 일부 내용 포함되지 않음
					</td>
				</tr>
			</tbody>
		</table>
	
	</c:when>
	
	<c:when test="${value eq 'CAAC01'}">
	<p class="ad_m_tit1">과정소개</p>
	<!-- (발권(고급))  CAAC01? -->
		<table class="ad_table_row ad_table_blue">
			<colgroup>
				<col width="120" />
				<col width="" />
			</colgroup>
			<tbody>
				<tr>
					<th>교육대상</th>
					<td>예약 발권 실무자</td>
				</tr>
				<tr>
					<th>교육시간</th>
					<td>
						주간  5일  09:00 ~ 17:00<br />
						야간  9일  18:30 ~ 21:30<br />
						주말(토,일)  3일  09:00 ~ 18:00
					</td>
				</tr>
				<tr>
					<th>수강료</th>
					<td>
						200,000원
					</td>
				</tr>
				<tr>
					<th>고용보험환급</th>
					<td>해당 (실제 환급금은 여행사규모와 교육 입과 인원에 따라 상이)</td>
				</tr>
				<tr>
					<th>Test/수료증</th>
					<td>
						총70점 이상 취득 시 수료증 수여<br />
						Silver 70점 이상<br />
						Gold 90점 이상
					</td>
				</tr>
				<tr>
					<th>준비물</th>
					<td>훈련위탁계약서(환급대상자), 필기도구</td>
				</tr>
				<tr>
					<th>기타 제공</th>
					<td>교재, 중식(석식), 수료증</td>
				</tr>
				<tr>
					<th>주요 내용</th>
					<td>
						비항공운송허용구간<br />
						우회여행제한<br />
						Mileage System 보완 규정 (Special HIP & CTM, BHC)<br />
						Mixed Class<br />
						노선별 판매가 산출 및 Share 계산<br />
						할인운임 및 단체 승객 발권<br />
						RTW / Refund<br />
						Reissue<br />
						※ 주말 과정인 경우 일부 내용 포함되지 않음
					</td>
				</tr>
			</tbody>
		</table>
	
	</c:when>
	
	<c:when test="${value eq 'CABB01'}">
	<p class="ad_m_tit1">과정소개</p>
	<!-- BSP -->
		<table class="ad_table_row ad_table_blue">
			<colgroup>
				<col width="120" />
				<col width="" />
			</colgroup>
			<tbody>
				<tr>
					<th>교육대상</th>
					<td>BSP 업무 관련자</td>
				</tr>
				<tr>
					<th>교육시간</th>
					<td>
						주간  1일  09:00 ~ 19:00<br />
						주말  1일  09:00 ~ 19:00
					</td>
				</tr>
				<tr>
					<th>수강료</th>
					<td>
						100,000원
					</td>
				</tr>
				<tr>
					<th>고용보험환급</th>
					<td>해당 (실제 환급금은 여행사규모와 교육 입과 인원에 따라 상이)</td>
				</tr>
				<tr>
					<th>Test/수료증</th>
					<td>
						총70점 이상 취득 시 수료증 수여<br />
						Silver 70점 이상<br />
						Gold 90점 이상
					</td>
				</tr>
				<tr>
					<th>준비물</th>
					<td>훈련위탁계약서(환급대상자), 필기도구</td>
				</tr>
				<tr>
					<th>기타 제공</th>
					<td>교재, 중식(석식), 수료증</td>
				</tr>
				<tr>
					<th>주요 내용</th>
					<td>
						BSP 업무 Flow<br />
						신규대리점의 규정 및 변경 절차<br />
						보증 설정 및 갱신<br />
						BSP 판매 보고 방법, 분실 보고<br />
						입금 및 선입금 (환불, Billing, BSP 인터넷뱅킹)<br />
						재고조사 및 Error Check/Admin Charge<br />
						항공권 신청 및 수령 (Capping, 항공권 수령 시 절차)<br />
						부도, 탈퇴에 따른 여행사의 업무 절차<br />
						관리양식 배포 및 보고주기/작성 방법<br />
						Auto Refund/TASF
					</td>
				</tr>
			</tbody>
		</table>
	
	</c:when>
	<c:when test="${value eq 'CAAG00'}">
	<p class="ad_m_tit1">과정소개</p>
	<!-- Reissue -->
		<table class="ad_table_row ad_table_blue">
			<colgroup>
				<col width="120" />
				<col width="" />
			</colgroup>
			<tbody>
				<tr>
					<th>교육대상</th>
					<td>발권 실무자</td>
				</tr>
				<tr>
					<th>교육시간</th>
					<td>
						주간  1일  09:00 ~ 18:00<br />
						주말  1일  09:00 ~ 18:00
					</td>
				</tr>
				<tr>
					<th>수강료</th>
					<td>
						70,000원
					</td>
				</tr>
				<tr>
					<th>고용보험환급</th>
					<td>해당 (실제 환급금은 여행사규모와 교육 입과 인원에 따라 상이)</td>
				</tr>
				<tr>
					<th>Test/수료증</th>
					<td>
						수료증 제공 (Test 없음)
					</td>
				</tr>
				<tr>
					<th>준비물</th>
					<td>훈련위탁계약서(환급대상자), 필기도구</td>
				</tr>
				<tr>
					<th>기타 제공</th>
					<td>교재, 중식(석식), 수료증</td>
				</tr>
				<tr>
					<th>주요 내용</th>
					<td>
						Reissue의 이해<br />
						사례별 Reissue 처리<br />
						MPD 발행 등
					</td>
				</tr>
			</tbody>
		</table>
	
	</c:when>
	
	
	
	
	<c:when test="${value eq 'CAFA00'}">
	<p class="ad_m_tit1">과정소개</p>
	<!-- 국내선 E-Ticket-->
		<table class="ad_table_row ad_table_blue">
			<colgroup>
				<col width="120" />
				<col width="" />
			</colgroup>
			<tbody>
				<tr>
					<th>교육대상</th>
					<td>국내선 예약/발권 담당자</td>
				</tr>
				<tr>
					<th>교육시간</th>
					<td>
						주간  5일  09:00 ~ 16:00
					</td>
				</tr>
				<tr>
					<th>수강료</th>
					<td>
						100,000원
					</td>
				</tr>
				<tr>
					<th>고용보험환급</th>
					<td>해당 (실제 환급금은 여행사규모와 교육 입과 인원에 따라 상이)</td>
				</tr>
				<tr>
					<th>Test/수료증</th>
					<td>
						총70점 이상 취득 시 수료증 수여<br />
						Silver 70점 이상<br />
						Gold 90점 이상
					</td>
				</tr>
				<tr>
					<th>준비물</th>
					<td>훈련위탁계약서(환급대상자), 필기도구</td>
				</tr>
				<tr>
					<th>기타 제공</th>
					<td>간식, 수료증</td>
				</tr>
				<tr>
					<th>주요 내용</th>
					<td>
						KE 국내선 예약<br />
						E-Ticket 발행<br />
						국내선 환불, Reissue 등
					</td>
				</tr>
			</tbody>
		</table>
	
	</c:when>
	
	
	<c:when test="${value eq 'CAAF00'}">
	<p class="ad_m_tit1">과정소개</p>
	<!-- Hotel/Car-->
		<table class="ad_table_row ad_table_blue">
			<colgroup>
				<col width="120" />
				<col width="" />
			</colgroup>
			<tbody>
				<tr>
					<th>교육대상</th>
					<td>호텔/카 업무 담당자</td>
				</tr>
				<tr>
					<th>교육시간</th>
					<td>
						주간  1일  4시간
					</td>
				</tr>
				<tr>
					<th>수강료</th>
					<td>
						무료
					</td>
				</tr>
				<tr>
					<th>수료증</th>
					<td>
						수료증 및 Test 없음
					</td>
				</tr>
				<tr>
					<th>준비물</th>
					<td>필기도구</td>
				</tr>
				<!-- <tr>
					<th>기타 제공</th>
					<td>간식, 수료증</td>
				</tr> -->
				<tr>
					<th>주요 내용</th>
					<td>
						TOPAS를 통한 호텔/카 예약 업무
					</td>
				</tr>
			</tbody>
		</table>
	
	</c:when>
	
		<c:when test="${value eq 'CAAE00'}">
	<p class="ad_m_tit1">과정소개</p>
	<!-- Value Office-->
		<table class="ad_table_row ad_table_blue">
			<colgroup>
				<col width="120" />
				<col width="" />
			</colgroup>
			<tbody>
				<tr>
					<th>교육대상</th>
					<td>Value Office 사용자</td>
				</tr>
				<tr>
					<th>교육시간</th>
					<td>
						주간  1일  4시간
					</td>
				</tr>
				<tr>
					<th>수강료</th>
					<td>
						무료
					</td>
				</tr>
				<tr>
					<th>수료증</th>
					<td>
						수료증 및 Test 없음
					</td>
				</tr>
				<tr>
					<th>준비물</th>
					<td>필기도구</td>
				</tr>
				<tr>
					<th>주요 내용</th>
					<td>
						Value Office 기능 및 사용법<br />
						고객관리, DSR 관리, 수입 관리 등
					</td>
				</tr>
			</tbody>
		</table>
	
	</c:when>
	
	<c:when test="${value eq 'CAAH00'}">
	<p class="ad_m_tit1">과정소개</p>
	<!-- Cyber Plus SMART-->
		<table class="ad_table_row ad_table_blue">
			<colgroup>
				<col width="120" />
				<col width="" />
			</colgroup>
			<tbody>
				<tr>
					<th>교육대상</th>
					<td>토파스 Cyber Plus 사용자</td>
				</tr>
				<tr>
					<th>교육시간</th>
					<td>
						주간  1일  4시간
					</td>
				</tr>
				<tr>
					<th>수강료</th>
					<td>
						무료
					</td>
				</tr>
				<tr>
					<th>수료증</th>
					<td>
						수료증 및 Test 없음
					</td>
				</tr>
				<tr>
					<th>준비물</th>
					<td>필기도구 준비</td>
				</tr>
				<tr>
					<th>주요 내용</th>
					<td>
						여행사 홈페이지에서의 토파스 인터넷 부킹 엔진인<br />
						Cyber Plus 사용 방법<br />
						스케줄 조회 및 예약/발권 방법, 관리자 기능, Fare Manager 기능
					</td>
				</tr>
			</tbody>
		</table>
	
	</c:when>
	
	
	
	<c:otherwise></c:otherwise>
</c:choose>
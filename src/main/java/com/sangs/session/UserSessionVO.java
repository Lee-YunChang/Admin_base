package com.sangs.session;


import java.io.Serializable;

/*
 	Description : 회원 로그인정보 VO
 	Modification Information
	수정일         	수정자                   수정내용
	-------    	--------    ---------------------------
	2013.03.15   송호현		최초생성  
	2013.08.02   김민규		CLASSDESK 에서 쓰이는 세션 코드 생성
	2013.09.12	 송호현	    통합세션관련 정보 생성
  
 */

public class UserSessionVO implements Serializable {
	
	private static final long serialVersionUID = 1L;

	/************ LMS기본 세션정보 *************/
	// 세션코드
	private String sessionId = "";
	
	// 인증사용자여부
	private String isLogin = "N";
	
	private String userId = "";
	private int userNo = 0;
	private String userName = "";
	
	/** 권한코드 */
	private String gradeCode = "";
	private String gradeName = "";
	private int gradeNum = 0;
	
	//독립사이트
	private int cyberGradeNum = 0;
	
	/** 강사코드 */
	private String tutorCode = "";
	private String tutorName = "";
	
	private String email = "";
	private String mobile = "";
	
	
	/*회원구분코드*/
	private String mberRegGb = "";
	
	/*기업승인여부*/
	private String statusGb = "";
	
	

	/******* CLASSDESK 에서 쓰이는 세션 *******/
	
	/** 세션 과정코드*/
	private int courseNo;
	/** 세션 수강코드*/
	private int cUserNo;
	/** 세션 과정개설코드*/
	private int cSeqNo;
	
	/******* 독립사이트 사용 세션 ************/
	private String siteName = "";
	private int siteNo = 0;
	private String siteDomain = "";
	private String siteBwTitle = "";
	private String siteLogImg = "";
	private String homePage = "";
	private String siteLeftImg = "";
	private String siteMainImg = "";
	private String bizno = "";
	
	/******** 로그인 상태 정보 **************/
	private int loginResult = 0;
	public final static int LOGIN_FAIL_INFO = 1;
	public final static int LOGIN_FAIL_PWD = 2;
	public final static int LOGIN_SUCCESS = 100;
	
	/******** 실시간세션정보 ***************/
	private String lastAccDate = "";
	private String ipAddr = "";
	private String lastAccUrl = "";
	
	

	public String getLastAccUrl() {
		return lastAccUrl;
	}


	public void setLastAccUrl(String lastAccUrl) {
		this.lastAccUrl = lastAccUrl;
	}


	public String getSessionId() {
		return sessionId;
	}


	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}


	public String getIsLogin() {
		return isLogin;
	}


	public void setIsLogin(String isLogin) {
		this.isLogin = isLogin;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getGradeCode() {
		return gradeCode;
	}


	public void setGradeCode(String gradeCode) {
		this.gradeCode = gradeCode;
	}

	public int getGradeNum() {
		return gradeNum;
	}


	public void setGradeNum(int gradeNum) {
		this.gradeNum = gradeNum;
	}


	public String getGradeName() {
		return gradeName;
	}


	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}


	public String getTutorCode() {
		return tutorCode;
	}


	public void setTutorCode(String tutorCode) {
		this.tutorCode = tutorCode;
	}


	public String getTutorName() {
		return tutorName;
	}


	public void setTutorName(String tutorName) {
		this.tutorName = tutorName;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getMobile() {
		
		return mobile;
	}


	public void setMobile(String mobile) {
		this.mobile =  mobile;
	}


	public int getCourseNo() {
		return courseNo;
	}


	public void setCourseNo(int courseNo) {
		this.courseNo = courseNo;
	}


	public int getcUserNo() {
		return cUserNo;
	}


	public void setcUserNo(int cUserNo) {
		this.cUserNo = cUserNo;
	}


	public int getcSeqNo() {
		return cSeqNo;
	}


	public void setcSeqNo(int cSeqNo) {
		this.cSeqNo = cSeqNo;
	}


	public String getSiteName() {
		return siteName;
	}


	public int getCyberGradeNum() {
		return cyberGradeNum;
	}


	public void setCyberGradeNum(int cyberGradeNum) {
		this.cyberGradeNum = cyberGradeNum;
	}


	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}


	public int getSiteNo() {
		return siteNo;
	}


	public void setSiteNo(int siteNo) {
		this.siteNo = siteNo;
	}


	public String getSiteDomain() {
		return siteDomain;
	}


	public void setSiteDomain(String siteDomain) {
		this.siteDomain = siteDomain;
	}


	public String getSiteBwTitle() {
		return siteBwTitle;
	}


	public void setSiteBwTitle(String siteBwTitle) {
		this.siteBwTitle = siteBwTitle;
	}


	public String getSiteLogImg() {
		return siteLogImg;
	}


	public void setSiteLogImg(String siteLogImg) {
		this.siteLogImg = siteLogImg;
	}


	public String getHomePage() {
		return homePage;
	}


	public void setHomePage(String homePage) {
		this.homePage = homePage;
	}


	public String getSiteLeftImg() {
		return siteLeftImg;
	}


	public void setSiteLeftImg(String siteLeftImg) {
		this.siteLeftImg = siteLeftImg;
	}


	public String getSiteMainImg() {
		return siteMainImg;
	}


	public void setSiteMainImg(String siteMainImg) {
		this.siteMainImg = siteMainImg;
	}


	public int getLoginResult() {
		return loginResult;
	}


	public void setLoginResult(int loginResult) {
		this.loginResult = loginResult;
	}


	
	public String getBizno() {
		return bizno;
	}


	public void setBizno(String bizno) {
		this.bizno = bizno;
	}

	public String getLastAccDate() {
		return lastAccDate;
	}


	public void setLastAccDate(String lastAccDate) {
		this.lastAccDate = lastAccDate;
	}


	public String getIpAddr() {
		return ipAddr;
	}


	public void setIpAddr(String ipAddr) {
		this.ipAddr = ipAddr;
	}


	public String getMberRegGb() {
		return mberRegGb;
	}


	public void setMberRegGb(String mberRegGb) {
		this.mberRegGb = mberRegGb;
	}
	
	public String getStatusGb() {
		return statusGb;
	}
	
	public void setStatusGb(String statusGb) {
		this.statusGb = statusGb;
	}
	
	
	


	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("UserSessionVO [sessionId=");
		builder.append(sessionId);
		builder.append(", isLogin=");
		builder.append(isLogin);
		builder.append(", userId=");
		builder.append(userId);
		builder.append(", userNo=");
		builder.append(userNo);
		builder.append(", userName=");
		builder.append(userName);
		builder.append(", gradeCode=");
		builder.append(gradeCode);
		builder.append(", gradeName=");
		builder.append(gradeName);
		builder.append(", gradeNum=");
		builder.append(gradeNum);
		builder.append(", cyberGradeNum=");
		builder.append(cyberGradeNum);
		builder.append(", tutorCode=");
		builder.append(tutorCode);
		builder.append(", tutorName=");
		builder.append(tutorName);
		builder.append(", email=");
		builder.append(email);
		builder.append(", mobile=");
		builder.append(mobile);
		builder.append(", mberRegGb=");
		builder.append(mberRegGb);
		builder.append(", courseNo=");
		builder.append(courseNo);
		builder.append(", cUserNo=");
		builder.append(cUserNo);
		builder.append(", cSeqNo=");
		builder.append(cSeqNo);
		builder.append(", siteName=");
		builder.append(siteName);
		builder.append(", siteNo=");
		builder.append(siteNo);
		builder.append(", siteDomain=");
		builder.append(siteDomain);
		builder.append(", siteBwTitle=");
		builder.append(siteBwTitle);
		builder.append(", siteLogImg=");
		builder.append(siteLogImg);
		builder.append(", homePage=");
		builder.append(homePage);
		builder.append(", siteLeftImg=");
		builder.append(siteLeftImg);
		builder.append(", siteMainImg=");
		builder.append(siteMainImg);
		builder.append(", bizno=");
		builder.append(bizno);
		builder.append(", loginResult=");
		builder.append(loginResult);
		builder.append(", lastAccDate=");
		builder.append(lastAccDate);
		builder.append(", ipAddr=");
		builder.append(ipAddr);
		builder.append(", statusGb=");
		builder.append(statusGb);
		builder.append("]");
		return builder.toString();
	}
	
}

	
	
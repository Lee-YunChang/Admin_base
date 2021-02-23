package com.webapp.common.vo;

import java.util.ArrayList;
import java.util.List;

public class SendMsgVO {

    private String             rcvphns         = "";             // 수신자번호
    private String             message         = "";             // 메시지내용
    private String             callback        = "";             // 발신자번호
    private String             resultCode      = "";             // 발송결과 
    private String             sendTime        = "";             // 예약 발송 시간 
    private String             tplUid          = "";             // 템플릿 코드

    private String             recUsername     = "";
    private String             recUserid       = "";
    private String             status          = "";
    private String             sendType        = "";
    private String             sendUserid      = "";
    private String             isreserve       = "";
    private String             reserveDate     = "";             // 예약일자 YYYYMMDD, 예약 일자 시간 존재 시 무조건 예약발송
    private String             reserveHour     = "00";           // 예약시간 (시) HH
    private String             reserveMinute   = "00";           // 예약시간 (분) MM

    private String             seq             = "";

    private int                tranPr          = 0;              // 메세지 시퀀스
    private int                mmsSeq          = 0;              // LMS/MMS 시퀀스
    private String             tranType        = "";             // 메세지 구분

    private String             succcyn         = "";

    private List               recUserIdList   = new ArrayList();
    private List               recUserNameList = new ArrayList();
    private List               recMobileList   = new ArrayList();

   
	private String isReserve = ""; 
	private String reserveTime = ""; 		// 예약 발송 시간 
	private String recUserMobile = "";		// 수신자번호
	
	private String title = "";		// 발송제목
	private String transType = "";	// 발송구분 4.일반정송 6.장문전송

    public final static String RESULT_SUCCESS  = "SUCCESS";
    public final static String RESULT_FAIL     = "FAIL";

    public String getRcvphns() {
        return rcvphns;
    }

    public void setRcvphns(String rcvphns) {
        this.rcvphns = rcvphns;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getCallback() {
        return callback;
    }

    public void setCallback(String callback) {
        this.callback = callback;
    }

    public String getResultCode() {
        return resultCode;
    }

    public void setResultCode(String resultCode) {
        this.resultCode = resultCode;
    }

    public String getSendTime() {
        return sendTime;
    }

    public void setSendTime(String sendTime) {
        this.sendTime = sendTime;
    }

    public List getRecUserIdList() {
        return recUserIdList;
    }

    public void setRecUserIdList(List recUserIdList) {
        this.recUserIdList = recUserIdList;
    }

    public List getRecUserNameList() {
        return recUserNameList;
    }

    public void setRecUserNameList(List recUserNameList) {
        this.recUserNameList = recUserNameList;
    }

    public List getRecMobileList() {
        return recMobileList;
    }

    public void setRecMobileList(List recMobileList) {
        this.recMobileList = recMobileList;
    }

    public String getRecUsername() {
        return recUsername;
    }

    public void setRecUsername(String recUsername) {
        this.recUsername = recUsername;
    }

    public String getRecUserid() {
        return recUserid;
    }

    public void setRecUserid(String recUserid) {
        this.recUserid = recUserid;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getSendType() {
        return sendType;
    }

    public void setSendType(String sendType) {
        this.sendType = sendType;
    }

    public String getSendUserid() {
        return sendUserid;
    }

    public void setSendUserid(String sendUserid) {
        this.sendUserid = sendUserid;
    }

    public String getIsreserve() {
        return isreserve;
    }

    public void setIsreserve(String isreserve) {
        this.isreserve = isreserve;
    }

    public String getReserveDate() {
        return reserveDate;
    }

    public void setReserveDate(String reserveDate) {
        this.reserveDate = reserveDate;
    }

    public String getReserveHour() {
        return reserveHour;
    }

    public void setReserveHour(String reserveHour) {
        this.reserveHour = reserveHour;
    }

    public String getReserveMinute() {
        return reserveMinute;
    }

    public void setReserveMinute(String reserveMinute) {
        this.reserveMinute = reserveMinute;
    }

    public String getSeq() {
        return seq;
    }

    public void setSeq(String seq) {
        this.seq = seq;
    }

    public static String getRESULT_SUCCESS() {
        return RESULT_SUCCESS;
    }

    public String getTplUid() {
        return tplUid;
    }

    public void setTplUid(String tplUid) {
        this.tplUid = tplUid;
    }

    public int getTranPr() {
        return tranPr;
    }

    public void setTranPr(int tranPr) {
        this.tranPr = tranPr;
    }

    public int getMmsSeq() {
        return mmsSeq;
    }

    public void setMmsSeq(int mmsSeq) {
        this.mmsSeq = mmsSeq;
    }

    public String getTranType() {
        return tranType;
    }

    public void setTranType(String tranType) {
        this.tranType = tranType;
    }

    public String getSucccyn() {
        return succcyn;
    }

    public void setSucccyn(String succcyn) {
        this.succcyn = succcyn;
    }

    
    public String getIsReserve() {
		return isReserve;
	}

	public void setIsReserve(String isReserve) {
		this.isReserve = isReserve;
	}

	public String getReserveTime() {
		return reserveTime;
	}

	public void setReserveTime(String reserveTime) {
		this.reserveTime = reserveTime;
	}

	public String getRecUserMobile() {
		return recUserMobile;
	}

	public void setRecUserMobile(String recUserMobile) {
		this.recUserMobile = recUserMobile;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTransType() {
		return transType;
	}

	public void setTransType(String transType) {
		this.transType = transType;
	}

	@Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append("SendMsgVO [rcvphns=");
        builder.append(rcvphns);
        builder.append(", message=");
        builder.append(message);
        builder.append(", callback=");
        builder.append(callback);
        builder.append(", resultCode=");
        builder.append(resultCode);
        builder.append(", sendTime=");
        builder.append(sendTime);
        builder.append(", tplUid=");
        builder.append(tplUid);
        builder.append(", recUsername=");
        builder.append(recUsername);
        builder.append(", recUserid=");
        builder.append(recUserid);
        builder.append(", status=");
        builder.append(status);
        builder.append(", sendType=");
        builder.append(sendType);
        builder.append(", sendUserid=");
        builder.append(sendUserid);
        builder.append(", isreserve=");
        builder.append(isreserve);
        builder.append(", reserveDate=");
        builder.append(reserveDate);
        builder.append(", reserveHour=");
        builder.append(reserveHour);
        builder.append(", reserveMinute=");
        builder.append(reserveMinute);
        builder.append(", seq=");
        builder.append(seq);
        builder.append(", recUserIdList=");
        builder.append(recUserIdList);
        builder.append(", recUserNameList=");
        builder.append(recUserNameList);
        builder.append(", recMobileList=");
        builder.append(recMobileList);
        builder.append("]");
        return builder.toString();
    }

}

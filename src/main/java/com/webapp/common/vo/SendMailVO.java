package com.webapp.common.vo;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class SendMailVO {

    private String             title           = "";             // 제목
    private String             content         = "";             // 메일 내용
    private String             sender          = "";             // 발신자 메일주소
    private String             sender_alias    = "";             // 발신자 이름
    private String             receiver_alias  = "";             // 수신자 이름
    private String             user_info       = "";             // 수신자 email 정보
    private String             result          = "";             // 수신자 email 정보
    private String             writerUserid    = "";             // 작성자 아이디
    private String             writerUsername  = "";             // 작성자 이름
    private String             writerIp        = "";             // 작성자 아이피
    private String             mailType        = "";             // 메일 타입
    private int                mailSeq         = 0;              // 메일 seq
    private String             summary         = "";
    private String             tplUid          = "";

    private String             recUsername     = "";
    private String             recUserid       = "";
    private String             recEmail        = "";
    private String             succcyn         = "";
    private String             recyn           = "";
    private List               recUserNameList = new ArrayList();
    private List               recUserIdList   = new ArrayList();
    private List               recEmailList    = new ArrayList();
    private List               userInfoList    = new ArrayList();

    public String[]           arrSeq;

    public final static String RESULT_SUCCESS  = "SUCCESS";
    public final static String RESULT_FAIL     = "FAIL";

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public String getSender_alias() {
        return sender_alias;
    }

    public void setSender_alias(String sender_alias) {
        this.sender_alias = sender_alias;
    }

    public String getReceiver_alias() {
        return receiver_alias;
    }

    public void setReceiver_alias(String receiver_alias) {
        this.receiver_alias = receiver_alias;
    }

    public String getUser_info() {
        return user_info;
    }

    public void setUser_info(String user_info) {
        this.user_info = user_info;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getWriterUserid() {
        return writerUserid;
    }

    public void setWriterUserid(String writerUserid) {
        this.writerUserid = writerUserid;
    }

    public String getWriterUsername() {
        return writerUsername;
    }

    public void setWriterUsername(String writerUsername) {
        this.writerUsername = writerUsername;
    }

    public String getWriterIp() {
        return writerIp;
    }

    public void setWriterIp(String writerIp) {
        this.writerIp = writerIp;
    }

    public String getMailType() {
        return mailType;
    }

    public void setMailType(String mailType) {
        this.mailType = mailType;
    }

    public int getMailSeq() {
        return mailSeq;
    }

    public void setMailSeq(int mailSeq) {
        this.mailSeq = mailSeq;
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

    public String getRecEmail() {
        return recEmail;
    }

    public void setRecEmail(String recEmail) {
        this.recEmail = recEmail;
    }

    public String getSucccyn() {
        return succcyn;
    }

    public void setSucccyn(String succcyn) {
        this.succcyn = succcyn;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public List getRecUserNameList() {
        return recUserNameList;
    }

    public void setRecUserNameList(List recUserNameList) {
        this.recUserNameList = recUserNameList;
    }

    public List getRecUserIdList() {
        return recUserIdList;
    }

    public void setRecUserIdList(List recUserIdList) {
        this.recUserIdList = recUserIdList;
    }

    public List getRecEmailList() {
        return recEmailList;
    }

    public void setRecEmailList(List recEmailList) {
        this.recEmailList = recEmailList;
    }

    public List getUserInfoList() {
        return userInfoList;
    }

    public void setUserInfoList(List userInfoList) {
        this.userInfoList = userInfoList;
    }

    public String getRecyn() {
        return recyn;
    }

    public void setRecyn(String recyn) {
        this.recyn = recyn;
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

    public String[] getArrSeq() {
    	String[] ret = null;
    	if(arrSeq != null) {
    		ret = arrSeq;
    	}
        return ret;
    }

    public void setArrSeq(String[] arrSeq) {
        this.arrSeq = arrSeq;
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append("SendMailVO [title=");
        builder.append(title);
        builder.append(", content=");
        builder.append(content);
        builder.append(", sender=");
        builder.append(sender);
        builder.append(", sender_alias=");
        builder.append(sender_alias);
        builder.append(", receiver_alias=");
        builder.append(receiver_alias);
        builder.append(", user_info=");
        builder.append(user_info);
        builder.append(", result=");
        builder.append(result);
        builder.append(", writerUserid=");
        builder.append(writerUserid);
        builder.append(", writerUsername=");
        builder.append(writerUsername);
        builder.append(", writerIp=");
        builder.append(writerIp);
        builder.append(", mailType=");
        builder.append(mailType);
        builder.append(", mailSeq=");
        builder.append(mailSeq);
        builder.append(", summary=");
        builder.append(summary);
        builder.append(", tplUid=");
        builder.append(tplUid);
        builder.append(", recUsername=");
        builder.append(recUsername);
        builder.append(", recUserid=");
        builder.append(recUserid);
        builder.append(", recEmail=");
        builder.append(recEmail);
        builder.append(", succcyn=");
        builder.append(succcyn);
        builder.append(", recyn=");
        builder.append(recyn);
        builder.append(", recUserNameList=");
        builder.append(recUserNameList);
        builder.append(", recUserIdList=");
        builder.append(recUserIdList);
        builder.append(", recEmailList=");
        builder.append(recEmailList);
        builder.append(", userInfoList=");
        builder.append(userInfoList);
        builder.append(", arrSeq=");
        builder.append(Arrays.toString(arrSeq));
        builder.append("]");
        return builder.toString();
    }

}

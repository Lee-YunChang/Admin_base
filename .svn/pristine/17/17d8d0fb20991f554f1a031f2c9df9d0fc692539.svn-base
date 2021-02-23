/*
 * 작성된 날짜: 2006. 8. 26
 *
 * TODO 생성된 파일에 대한 템플리트를 변경하려면 다음으로 이동하십시오.
 * 창 - 환경 설정 - Java - 코드 스타일 - 코드 템플리트
 */
package com.sangs.util;

/**
 * 숫자관련 포맷 
 * @author song ho hyun
 *
 */
public class NumberFormatUtil { 
     
   
    /**
     * double값을 지정한 소수점 자리수만큼만 제어하여 리턴하는 메소드
     * @param d	: 값
     * @param n	: 소수점수
     * @return 
     */ 
    public static double getDecimalValue(double d, int n) {
        String format = "";
        for(int i=0; i<n; i++) {
        	format += "0";
        }
            
        format = "#."+format;
        try{
            java.text.DecimalFormat df = new java.text.DecimalFormat(format);
            return new Double(df.format(d)).doubleValue();
        }catch(Exception ex){
            return 0.0d;
        }
    }  
    
    /**
     * double값을 지정한 소수점 자리수만큼만 제어하여 리턴하는 메소드
     * @param d	: 값
     * @param n	: 소수점수
     * @return 
     */
    public static String getDecimalStrValue(double d, int n) {
        String format = "";
        for(int i=0; i<n; i++) {
        	format += "0";
        }
            
        format = "##0."+format;
        
        try{
            java.text.DecimalFormat df = new java.text.DecimalFormat(format);
            return df.format(d).toString();
        }catch(Exception ex){
        	return "0."+format;
        }
    }


    
    /**
     * double값을 지정한 소수점 자리수와 천단위 , 처리 하여 리턴하는 메소드
     * @param d
     * @param n
     * @return
     */
    public static String getUnitValue(double d, int n) {
        String format = "";
        for(int i=0; i<n; i++) {
        	format += "0";
        }
            
        if (n > 0)
            format = ",###."+format;
        else
            format = ",###";
        
        try{
            java.text.DecimalFormat df = new java.text.DecimalFormat(format);
            return df.format(d).toString();
        }catch(Exception ex){
            return "0."+format;
        }
    }
    
    /**
     * int값을 지정한 소수점 자리수와 천단위 , 처리 하여 리턴하는 메소드
     * @param d
     * @param n
     * @return
     */
    public static String getUnitValue(int d, int n) {
        String format = "";
        for(int i=0; i<n; i++) {
        	format += "0";
        }
        
        if (n > 0)
            format = ",###."+format;
        else
            format = ",###";
        
        try{
            java.text.DecimalFormat df = new java.text.DecimalFormat(format);
            return df.format(d).toString();
        }catch(Exception ex){
            return "0."+format;
        }
    }
    
    /**
     * double값을 지정한 소수점 자리수와 천단위 , 처리 하여 리턴하는 메소드
     * @param d
     * @param n
     * @return
     */
    public static String toString(double d) {
        String format = "";
       
        format = ",###";
        
        try{
            java.text.DecimalFormat df = new java.text.DecimalFormat(format);
            return df.format(d).toString();
        }catch(Exception ex){
            return "0."+format;
        }
    }
    public static String toString(int d) {
        String format = "";
       
        format = ",###";
        
        try{
            java.text.DecimalFormat df = new java.text.DecimalFormat(format);
            return df.format(d).toString();
        }catch(Exception ex){
            return "0."+format;
        }
    }
}

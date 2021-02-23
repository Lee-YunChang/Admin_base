/*
 * 작성된 날짜: 2008. 7. 7
 *
 * TODO 생성된 파일에 대한 템플리트를 변경하려면 다음으로 이동하십시오.
 * 창 - 환경 설정 - Java - 코드 스타일 - 코드 템플리트
 */
package com.sangs.util;

import java.util.Random;

/**
 * 랜덤 관련 유틸리티 
 * @author songh2
 *
 */

public class RandomUtil {
    
    private char[] ranChar = {
            'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 
            'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 
            'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', 
            '4', '5', '6', '7', '8', '9', '-', '_', '='
            , '+', '\\' , '|' , '(' , ')', '&' , '%' , '$'
            , '#', '@', '!', '`', '?', '>', '<', '/'
            , ';' , ',', '.' , ':'
     };
    
    private char[] ranAbc = {
            'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 
            'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 
            'u', 'v', 'w', 'x', 'y', 'z'
     };
    
    private char[] ranInt = {
            '1', '2', '3','4', '5', '6', '7', '8', '9'
     };
    
    private char[] ranSpec = {
            '-', '_', '=', '+', '\\' , '|' , '(' , ')', '%' , '$'
            , '#', '@', '!', '`', '?', '>', '<', '/'
            , ';' , ',', '.' , ':'
     };
    
    
    
     
    
    /**
     * 지정한 문자수 만큼 랜덤하게 문자 추출 
     * @param len
     * @return
     */
    public String getRandomStr(int len){
        String str = "";
        for (int i=0; i<len; i++){
            str += ranChar[getRanIdx()];
        }
        return str; 
    }
    
    /**
     * 지정한 숫자 만큼 랜덤하게 문자 추출 
     * @param len
     * @return
     */
    public String getRandomInt(int len){
        String str = "";
        for (int i=0; i<len; i++){
            str += ranInt[getRanIdxInt()];
        }
        return str;
    }
    
    /**
     * 지정한 알파벳수 만큼 랜덤하게 문자 추출 
     * @param len
     * @return
     */
    public String getRandomAbc(int len){
        String str = "";
        
        for (int i=0; i<len; i++){
            str += ranAbc[getRanIdxAbc()];
        }
        
        return str;
        
    }
    
    /**
     * 지정한 특수문자수 만큼 랜덤하게 문자 추출 
     * @param len
     * @return
     */
    public String getRandomSpec(int len){
        String str = "";
        for (int i=0; i<len; i++){
            str += ranSpec[getRanIdxSpec()];
        }
        return str;
    }
    
    
    /**
     * ranChar 범위에서 랜덤한 인텍스 번호 반환 함수 
     * @param maxLen
     * @return
     */
    private int getRanIdx(){
        int ran = 0;
        Random r= new Random();
        ran = Math.abs(r.nextInt(ranAbc.length));
        return ran;
    }
    
    /**
     * ranAbc 범위에서 랜덤한 인텍스 번호 반환 함수 
     * @param maxLen
     * @return
     */
    private int getRanIdxAbc(){
        int ran = 0;
        Random r= new Random();
        ran = Math.abs(r.nextInt(ranAbc.length));
        return ran;
    }  
    
    /**
     * ranInt 범위에서 랜덤한 인텍스 번호 반환 함수 
     * @param maxLen
     * @return
     */
    private int getRanIdxInt(){
        int ran = 0;
        Random r= new Random();
        ran = Math.abs(r.nextInt(ranInt.length));
        return ran;
    }  
    
    /**
     * ranSpec 범위에서 랜덤한 인텍스 번호 반환 함수 
     * @param maxLen
     * @return
     */
    private int getRanIdxSpec(){
        int ran = 0;
        Random r= new Random();
        ran = Math.abs(r.nextInt(ranSpec.length));
        return ran;
    }  

}

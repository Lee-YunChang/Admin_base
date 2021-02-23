/*
 * 작성된 날짜: 2006. 8. 9
 *
 * TODO 생성된 파일에 대한 템플리트를 변경하려면 다음으로 이동하십시오.
 * 창 - 환경 설정 - Java - 코드 스타일 - 코드 템플리트
 */
package com.sangs.util;

import java.io.IOException;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class StringUtil {

	protected Logger log = LogManager.getLogger(this.getClass());
	
    /**
    * 지정한문자의 앞부분 일부만 출력하는 함수 
    * @param str
    * @param len
    * @param str2
    * @return
    * @throws Exception
    */
    public static String getStrCut(String str, int len, String str2) {

        try {
            if (len > str.length()) return str;
            else return str.substring(0, len - 1) + str2;
        } catch (Exception ex) {
            return ex.toString();
        }
    }

    /**
    * 문자열의 넙값 검사를 한다.
    * <BR>문자열이 null 또는 white space인 경우에는 "참"을 반환한다.
    */
    public static boolean isNull(String str) {
        return (str == null || "null".equals(str) || "".equals(str));
    }

    /**
    * 문자열의 넙값 검사를 한다. 
    * <BR>문자열이 null 또는 white space인 경우에는 "거짓"을 반환한다.
    */
    public static boolean isNotNull(String str) {
        return !(str == null || "".equals(str));
    }

    /**
    * 문자열이 null인 경우에는 whiteSpace를 반환한다.
    */
    public static String nullToEmptyString(String string) {
        return isNull(string) ? "" : string;
    }

    /**
    * 문자열이 null인 경우에는 지정한 문자 반환한다.
    */
    public static String nullToEmptyString(String string, String str) {
        return isNull(string) ? str : string;
    }

    /**
     * 대용량 데이터컴럼을 데이터베이스로 부터 꺼내온다
     * DAOUtil.getClobText(rs.getCharacterStream("content"));
     *   
     * @param r
     * @return
     * @throws IOException
     */
    public static String getClobText(Reader r) {
    	
    	Logger log = LogManager.getLogger();
    	
        Reader rd = null;
        StringBuffer sb = new StringBuffer();
        char[] buf = new char[1024];
        int readcnt;
        try {
            rd = r;

            while ((readcnt = rd.read(buf, 0, 1024)) != -1) {
                sb.append(buf, 0, readcnt);
            }
        } catch (IOException e) {
            return "";
        } catch (Exception e) {
            return "";
        } finally {
            try {
                rd.close();
            } catch (Exception e) {
            }
        }

        return sb.toString();
    }

    /**
    * 목록의 제목이 max보다 클경우 max 크기만큼만 잘라서 반환한다.
    */
    public synchronized static String formatTitle(String s, int max) {
        if (s.length() <= max) return s;

        String tmp = null;
        byte bTmp[] = null;
        String rets = "";

        for (int i = 0, k = 0; i < s.length(); i++) {
            tmp = s.substring(i, i + 1);
            bTmp = tmp.getBytes();
            if (bTmp.length > 1) {
                rets += tmp;
                k += 2;
            } else {
                rets += tmp;
                k++;
            }

            if (max <= k) break;
        }

        return rets + "...";
    }

    /**
    * 문자열을 변환한다.
    */
    public static String replace(String str, String pattern, String replace) {
        int s = 0;
        int e = 0;
        StringBuffer result = new StringBuffer();

        while ((e = str.indexOf(pattern, s)) >= 0) {
            result.append(str.substring(s, e));
            result.append(replace);
            s = e + pattern.length();
        }

        result.append(str.substring(s));
        return result.toString();
    }

    /**
    * 문자열 해당코드로 변환한다..
    */
    private static String encodeText(String str, String encode, String charsetName) {
        String result = null;

        try {
        	
        	//null일경우 truu 반환
        	if(isNull(str)){
        		result = new String(str.getBytes(encode), charsetName); 
        	}
        	
            //result = isNull(str) ? null : new String(str.getBytes(encode), charsetName);
        } catch (UnsupportedEncodingException e) {
        }

        return result;
    }

    /**
    * 문자열을 euc-kr에서 8859_1로 디코딩 한다.
    */
    public static String decode(String str) {
        return encodeText(str, "euc-kr", "8859_1");
    }

    /**
    * Date 객체의 날짜를 pattern의 형태로 반환한다.
    */
    public static String getPatternDate(Date date, String pattern) {
        return new SimpleDateFormat(pattern).format(date);
    }

    /**
    * 문자열을 8859_1에서 euc-kr로 인코딩 한다.
    */
    public static String encode(String str) {
        return encodeText(str, "8859_1", "euc-kr");
    }

    /**
     * 원본문자에서 패턴으로 불리하여 인텍스에 해당하는 값 추출 
     * 사용처 : 전화번호,주민번호, 우편번호등...
     * @param org
     * @param pattern
     * @param idx
     * @return
     */
    public static String getTokenStr(String org, String pattern, int idx) {
        String[] arr = null;
        try {
            if (arr == null) arr = org.split(pattern);
            return arr[idx];
        } catch (Exception ex) {
            return "";
        }
    }

    /**
     * HTML 처리를 해준다
     * @param strContent
     * @return
     */
    public static String getContent(String value) {
    	if (value == null || value.trim().equals("")) {
			return "";
		}
		
		String returnValue = value;

		returnValue = returnValue.replaceAll("&", "&amp;");
		returnValue = returnValue.replaceAll("<", "&lt;");
		returnValue = returnValue.replaceAll(">", "&gt;");
		returnValue = returnValue.replaceAll("\"", "&#34;");
		returnValue = returnValue.replaceAll("\'", "&#39;");
		return returnValue;
    }

    /**
     * HTML 처리를 해준다
     * @param strContent
     * @return
     */
    public static String setContent(String strContent) {
        String htmlstr = strContent;
        //if(strContent!=null){
        //	htmlstr = strContent.replaceAll("\n", "<br>");
        //}	
        String convert = new String(replaceStr(htmlstr, "<", "&lt;"));
        convert = replaceStr(convert, ">", "&gt;");
        convert = replaceStr(convert, "\"", "&quot;");
        convert = replaceStr(convert, "&nbsp;", "&amp;nbsp;");
        return convert;
    }

    /**
     * Preview용 HTML 처리를 해준다
     * @param strContent
     * @return
     */
    public static String getContentPreview(String strContent) {

        String convert = new String(replaceStr(strContent, "&lt;", "<"));
        convert = replaceStr(convert, "&gt;", ">");
        convert = replaceStr(convert, "&quot;", "\"");
        convert = replaceStr(convert, "&amp;nbsp;", "&nbsp;");
        convert = convert.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");

        convert = convert.replaceAll("\n", "<br>");

        return convert;
    }

    /**
     * 
     * @param strContent
     * @return
     */
    public static String getContent2(String strContent) {

        String convert = new String(replaceStr(strContent, "&lt;", "<"));
        convert = replaceStr(convert, "&gt;", ">");
        convert = replaceStr(convert, "&quot;", "\"");
        convert = replaceStr(convert, "&amp;nbsp;", "&nbsp;");
        convert = replaceStr(convert, "&amp;", "&");
        //convert = convert.replaceAll("\r\n", "<br>");

        return convert;
    }

    /**
     * 스트링내의 임의의 문자열을 새로운 문자열로 대치하는 메소드
     *
     * @param source    스트링
     * @param before    바꾸고자하는 문자열
     * @param after     바뀌는 문자열
     * @return 변경된 문자열
     */
    public static String replaceStr(String source, String before, String after) {
        int i = 0;
        int j = 0;
        StringBuffer sb = new StringBuffer();

        while ((j = source.indexOf(before, i)) >= 0) {
            sb.append(source.substring(i, j));
            sb.append(after);
            i = j + before.length();
        }

        sb.append(source.substring(i));
        return sb.toString();
    }

    public static String numberCommaFormat(int price) {
        DecimalFormat df = new DecimalFormat("#,##0");

        return df.format(price);
    }

    /*   public static String stringFirstUpper(String data){
       	String transString = data.substring(0,1);
       	transString = transString.toUpperCase();
       	transString += data.substring(1);
       	
       	return transString;
       }*/
    public static String getContentReplace(String strContent) {
        String htmlstr = strContent;
        String convert = new String(replaceStr(htmlstr, ":",""));
        convert = convert.replace("*","");
        convert = convert.replace("?","");
        return convert;
    } 
}

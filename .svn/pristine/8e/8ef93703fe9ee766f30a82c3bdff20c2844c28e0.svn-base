package com.sangs.util;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.sangs.support.DataMap;
import com.sangs.support.SangsProperties;

public class ParamUtil {

    private static Logger log = LogManager.getLogger(ParamUtil.class);

    public static String getStrBracket(String str) {
        str = StringUtil.replace(str, "<", "&lt;");
        str = StringUtil.replace(str, ">", "&gt;");
        return str.trim();
    }

    public static String getObjParam(Object reqstr, String dstr) {
        if (reqstr == null) return dstr;
        else return reqstr.toString().trim();
    }

    public static String getObjParamEmpty(Object reqstr, String dstr) {
        if (reqstr == null) {
            return dstr;
        } else {
            String rVal = reqstr.toString().trim();
            if ("".equals(rVal)) {
                return dstr;
            } else {
                return rVal;
            }
        }
    }

    public static int getObjParam(Object reqstr, int dstr) {
        if (reqstr == null) return dstr;
        else return Integer.parseInt(reqstr.toString());
    }

    public static String getStrParam(String reqstr, String dstr) {
        if (reqstr == null || reqstr.equals("")) return dstr;
        else return reqstr.trim();
    }

    public static String getStrParam(String reqstr) {
        if (reqstr == null || reqstr.equals("")) return "";
        else return reqstr.trim();
    }

    public static int getIntParam(String reqstr, int dint) {

        try {

            if (reqstr == null || reqstr.equals("")) return dint;
            else {
                reqstr = StringUtil.replace(reqstr, ",", "");
                return Integer.parseInt(reqstr);
            }
        } catch (NumberFormatException e) {
            return dint;
        }
    }

    public static int getIntParam(String reqstr) {

        try {

            if (reqstr == null || reqstr.equals("")) return 0;
            else {
                reqstr = StringUtil.replace(reqstr, ",", "");
                return Integer.parseInt(reqstr);
            }
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    public static float getFloatParam(String reqstr, float dint) {
        try {

            if (reqstr == null || reqstr.equals("")) return dint;
            else {
                reqstr = StringUtil.replace(reqstr, ",", "");
                return new Float(reqstr).floatValue();
            }
        } catch (NumberFormatException e) {
            return dint;
        }
    }

    public static float getFloatParam(String reqstr) {
        try {

            if (reqstr == null || reqstr.equals("")) return 0.0f;
            else {
                reqstr = StringUtil.replace(reqstr, ",", "");
                return new Float(reqstr).floatValue();
            }
        } catch (NumberFormatException e) {
            return 0.0f;
        }
    }

    public static double getDoubleParam(String reqstr) {
        try {

            if (reqstr == null || reqstr.equals("")) return 0.0;
            else {
                reqstr = StringUtil.replace(reqstr, ",", "");
                return new Double(reqstr).doubleValue();
            }

        } catch (NumberFormatException e) {
            return 0.0;
        }
    }

    public static double getDoubleParam(String reqstr, double dint) {
        try {

            if (reqstr == null || reqstr.equals("")) return dint;
            else {
                reqstr = StringUtil.replace(reqstr, ",", "");
                return new Double(reqstr).doubleValue();
            }
        } catch (NumberFormatException e) {
            return dint;
        }
    }

    /**
     *  request 파라메터 스트링변환
     * @param dataMap
     * @return
     */
    public static String getReqParam(HttpServletRequest req) {

        String result = "";
        try {

            @SuppressWarnings("rawtypes")
            Enumeration enums = req.getParameterNames();
            String key = "";
            String value[] = null;

            while (enums.hasMoreElements()) {
                key = (String)enums.nextElement();
                value = req.getParameterValues(key);

                for (int i = 0; i < value.length; i++) {
                    result += key + "=" + value[i] + "&";
                }
            }

        } catch (Exception ex) {
        }
        return result;
    }

    public static void setPagingValue(DataMap data) {
        // 페이징 변수 세팅
        int cPage = Integer.parseInt(getObjParamEmpty(data.get("cPage"), "1"));
        
        int rowCount = 10;
        if(data.getInt("rowCount") > 0){
        	rowCount = data.getInt("rowCount");
        } else{
        	rowCount = Integer.parseInt(SangsProperties.getProperty("Globals.defaultRowCount"));	
        }
         

        if (cPage < 1) cPage = 1;
        data.add("cPage", cPage);
        data.add("startNo", (cPage - 1) * rowCount + 1);
        data.add("endNo", cPage * rowCount);
        data.add("rowCount", rowCount);

    }

}
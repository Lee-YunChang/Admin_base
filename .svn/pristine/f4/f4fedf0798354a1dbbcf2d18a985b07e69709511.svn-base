package com.webapp.common.util;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.ui.ModelMap;

import com.sangs.util.SangsUtil;

public class CommonComboPutData {
	
	/**
	 * 핸드폰 앞자리 번호combo
	 * @param model
	 */
	public static void putMobiles(ModelMap model){
		Map<String,String> rMap = new LinkedHashMap<String, String>();
		
		rMap.put("010", "010");
		rMap.put("011", "011");
		rMap.put("016", "016");
		rMap.put("017", "017");
		rMap.put("018", "018");
		rMap.put("019", "019");
		
		model.addAttribute("mobileCombo", rMap);
	}
	
	/**
	 * 유선전화 앞자리 번호 combo
	 * @param model
	 */
	public static void putTelephones(ModelMap model){
		Map<String,String> rMap = new LinkedHashMap<String, String>();
		
/*		rMap.put("02", "02(서울특별시)");
		rMap.put("031", "031(경기도)");
		rMap.put("032", "032(인천광역시)");
		rMap.put("033", "033(강원도)");
		rMap.put("041", "041(충청남도)");
		rMap.put("042", "042(대전광역시)");
		rMap.put("043", "043(충청북도)");
		rMap.put("044", "044(세종특별자치시[1])");
		rMap.put("051", "051(부산광역시)");
		rMap.put("052", "052(울산광역시)");
		rMap.put("053", "053(대구광역시)");
		rMap.put("054", "054(경상북도)");
		rMap.put("055", "055(경상남도)");
		rMap.put("061", "061(전라남도)");
		rMap.put("062", "062(광주광역시)");
		rMap.put("063", "063(전라북도)");
		rMap.put("064", "064(제주특별자치도)");*/
		
		rMap.put("02", "02");
		rMap.put("031", "031");
		rMap.put("032", "032");
		rMap.put("033", "033");
		rMap.put("041", "041");
		rMap.put("042", "042");
		rMap.put("043", "043");
		rMap.put("044", "044");
		rMap.put("051", "051");
		rMap.put("052", "052");
		rMap.put("053", "053");
		rMap.put("054", "054");
		rMap.put("055", "055");
		rMap.put("061", "061");
		rMap.put("062", "062");
		rMap.put("063", "063");
		rMap.put("064", "064");
		rMap.put("070", "070");
		
		model.addAttribute("telephoneCombo", rMap);
	}

	/**
	 * 2014년부터 -50 년도 콤보 ex)2014 ~ 1964
	 * @param model
	 */
	public static void putYears(ModelMap model) {
		Map<String,String> rMap = new LinkedHashMap<String, String>();
		
		for(int i=0; i<20; i++){
			
			rMap.put(String.valueOf(SangsUtil.getYear()-i), String.valueOf((SangsUtil.getYear()-i)));
		}
		
		model.addAttribute("yearCombo", rMap);
	}

	
	/**
	 * 1월부터 12월 (월)콤보
	 * @param model
	 */
	public static void putMonths(ModelMap model) {
		Map<String,String> rMap = new LinkedHashMap<String, String>();
		
		for(int i=1; i<=12; i++){
			rMap.put(i < 10 ? "0"+i : String.valueOf(i), i < 10 ? "0"+i : String.valueOf(i));
		}
		model.addAttribute("monthCombo", rMap);
	}

	
	/**
	 * 1일 부터 31일까지 day 콤보
	 * @param model
	 */
	public static void putDays(ModelMap model) {
		Map<String,String> rMap = new LinkedHashMap<String, String>();
		
		for(int i=1; i<=31; i++){
			rMap.put(i < 10 ? "0"+i : String.valueOf(i), i < 10 ? "0"+i : String.valueOf(i));
		}
		model.addAttribute("dayCombo", rMap);
		
	}

	/**
	 * email 입력 콤보
	 * @param model
	 */
	public static void putEmails(ModelMap model) {
		Map<String,String> rMap = new LinkedHashMap<String, String>();
		
		rMap.put("", "직접입력");
		rMap.put("nate.com", "nate.com");
		rMap.put("hanmail.net", "hanmail.net");
		rMap.put("naver.com", "naver.com");
		rMap.put("yahoo.co.kr", "yahoo.co.kr");
		rMap.put("paran.com", "paran.com");
		rMap.put("hotmail.com", "hotmail.com");
		rMap.put("gmail.com", "gmail.com");
		rMap.put("dreamwiz.com", "dreamwiz.com");
		
		model.addAttribute("emailCombo", rMap);
		
	}
	
	
	
	

}

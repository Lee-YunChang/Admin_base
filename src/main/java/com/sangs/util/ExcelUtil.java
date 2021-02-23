package com.sangs.util;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFClientAnchor;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFPatriarch;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.CellRangeAddress;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.hssf.util.Region;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 * 
 * <pre> 
 *  서브시스템 : 공통유틸
 *  설명 : 파일 관련된 Util 
 *  최초 작성 : LJY (2017. 03. 25) 
 *  변경 작성 :  
 * </pre>
 */
public class ExcelUtil {

	/**
	 * <pre>
	 * 엑셀 자동 높이 계산
	 * </pre>
	 * @param sContents		내용
	 * @return
	 */
	public static int setHeight(String sContents) {
		int iHeight = 50;
		if (sContents != null) {
			iHeight = sContents.split("\r\n").length * 50;
		}
		return iHeight;
	}
	
	/**
	 * <pre>
	 * 셀 병합 (지정한 만큼 셀을 합쳐줍니다)
	 * </pre>
	 * @param sheet
	 * @param row1		: 시작 row
	 * @param col1		: 시작 cell
	 * @param row2		: 마지막 row
	 * @param col2		: 마지막 cell
	 */
	protected void cellMergedRegion(HSSFSheet sheet, int row1, short col1, int row2, short col2) {
		sheet.addMergedRegion(new Region(row1,col1,row2,col2));
	}
	
	/**
	 * <pre>
	 * 셀 스타일 (선 스타일 고정)
	 * </pre>
	 * @param workbook
	 * @return
	 */
	public static XSSFCellStyle setCellStyle(XSSFWorkbook workbook, int iSize, String sStyle, String sColor, String sBgColor, String sAlign, String sBorderType, String sBorderColor) {
		// 폰트 셋팅
		XSSFFont font = workbook.createFont();
		font.setFontHeightInPoints((short)iSize);
		if (sStyle.equals("bold")) { font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD); }
		if (!sColor.equals("")) { font.setColor(setColor(sColor)); }

		XSSFCellStyle style = workbook.createCellStyle();

		style.setFont(font);
		
		// 배경 색깔 셋팅
		if (!sBgColor.equals("")) {
			style.setFillForegroundColor(setColor(sBgColor));
			style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);		// 셀 채움 Style
		}

		// 정렬 셋팅
		if (sAlign.equals("center")) {
			style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		}
		
		if (!sBorderType.equals("")) {
			style.setBorderLeft(setBorderStyle(sBorderType));		// 좌측 Border Style
			style.setBorderRight(setBorderStyle(sBorderType));	// 우측 Border Style
			style.setBorderTop(setBorderStyle(sBorderType));		// 상단 Border Style
			style.setBorderBottom(setBorderStyle(sBorderType));	// 하단 Border Style
			
			style.setLeftBorderColor(setColor(sBorderColor));		// 좌측 Border Color
			style.setRightBorderColor(setColor(sBorderColor));	// 우측 Border Color
			style.setTopBorderColor(setColor(sBorderColor));		// 상단 Border Color
			style.setBottomBorderColor(setColor(sBorderColor));	// 하단 Border Color
		}

		style.setWrapText(true);
		return style;
	}
	
	/**
	 * <pre>
	 * 셀 스타일 (선 스타일 자유)
	 * </pre>
	 * @param workbook
	 * @param sSize
	 * @param sStyle
	 * @param sColor
	 * @param sBgColor
	 * @param sleftBorderStyle
	 * @param sleftBorderColor
	 * @param sRigntBorderStyle
	 * @param sRigntBorderColor
	 * @param sTopBorderStyle
	 * @param sTopBorderColor
	 * @param sBottomBorderStyle
	 * @param sBottomBorderColor
	 * @return
	 */
	public static XSSFCellStyle setCellStyle(XSSFWorkbook workbook, int sSize, String sStyle, String sColor, String sBgColor, String sAlign
			, String sleftBorderStyle, String sleftBorderColor, String sRigntBorderStyle, String sRigntBorderColor
			, String sTopBorderStyle, String sTopBorderColor, String sBottomBorderStyle, String sBottomBorderColor) {
		// 폰트 셋팅
		XSSFFont font = workbook.createFont();
		font.setFontHeightInPoints((short)sSize);
		if (sStyle.equals("bold")) { font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD); }
		if (!sColor.equals("")) { font.setColor(setColor(sColor)); }

		XSSFCellStyle style = workbook.createCellStyle();
		
		style.setFont(font);

		// 배경 색깔 셋팅
		if (!sBgColor.equals("")) {
			style.setFillForegroundColor(setColor(sBgColor));
			style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);		// 셀 채움 Style
		}
		
		// 정렬 셋팅
		if (sAlign.equals("center")) {
			style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		}
		
		// 좌측 Border
		if (!sleftBorderStyle.equals("")) {
			style.setBorderLeft(setBorderStyle(sleftBorderStyle));
			style.setLeftBorderColor(setColor(sleftBorderColor));
		}
		
		// 우측 Border
		if (!sRigntBorderStyle.equals("")) {
			style.setBorderRight(setBorderStyle(sRigntBorderStyle));
			style.setRightBorderColor(setColor(sRigntBorderColor));
		}
		
		// 상단 Border
		if (!sTopBorderStyle.equals("")) {
			style.setBorderTop(setBorderStyle(sTopBorderStyle));
			style.setTopBorderColor(setColor(sTopBorderColor));
		}
		
		// 하단 Border
		if (!sBottomBorderStyle.equals("")) {
			style.setBorderBottom(setBorderStyle(sBottomBorderStyle));
			style.setBottomBorderColor(setColor(sBottomBorderColor));
		}


		style.setWrapText(true);
		return style;
	}
	
	/**
	 * <pre>
	 * 기본적으로 사용되는 선 스타일
	 * </pre>
	 * @param sStyle
	 * @return
	 */
	protected static short setBorderStyle(String sStyle) {
		if (sStyle.equals("solid")) {		// 실선
			return HSSFCellStyle.BORDER_THIN;
		} else if (sStyle.equals("double")) {		// 2줄선
			return HSSFCellStyle.BORDER_DOUBLE;
		} else if (sStyle.equals("dotted")) {		// 점선
			return HSSFCellStyle.BORDER_DOTTED;
		} else if (sStyle.equals("none")) {		// 줄없음
			return HSSFCellStyle.BORDER_NONE;
		} else if (sStyle.equals("medium")) {		// 줄없음
			return HSSFCellStyle.BORDER_MEDIUM;
		} else {
			return HSSFCellStyle.BORDER_NONE;
		}
	}
	
	/**
	 * <pre>
	 * 컬러 셋팅(사용빈도가 높은것을 따로 선언해둠)
	 * </pre>
	 * @param sColor
	 * @return
	 */
	protected static short setColor(String sColor) {
		
		// 검정	
		if (sColor.equals("black")) {
			return HSSFColor.BLACK.index;

		// 흰색
		} else if (sColor.equals("white")) {
			return HSSFColor.WHITE.index;
			
		// 회색
		} else if (sColor.equals("gray")) {
			return HSSFColor.GREY_50_PERCENT.index;
		} else if (sColor.equals("light_gray")) {
			return HSSFColor.GREY_25_PERCENT.index;
		} else if (sColor.equals("dark_gray")) {
			return HSSFColor.GREY_80_PERCENT.index;
			
		// 레드
		} else if (sColor.equals("red")) {
			return HSSFColor.RED.index;
		} else if (sColor.equals("dark_red")) {
			return HSSFColor.DARK_RED.index;
			
		// 파랑
		} else if (sColor.equals("blue")) {
			return HSSFColor.BLUE.index;
		} else if (sColor.equals("dark_blue")) {
			return HSSFColor.DARK_BLUE.index;
		} else if (sColor.equals("light_blue")) {
			return HSSFColor.LIGHT_BLUE.index;
			
		// 녹색
		} else if (sColor.equals("green")) {
			return HSSFColor.GREEN.index;
		} else if (sColor.equals("dark_green")) {
			return HSSFColor.DARK_GREEN.index;
		} else if (sColor.equals("light_green")) {
			return HSSFColor.LIGHT_GREEN.index;

		// 노랑
		} else if (sColor.equals("yellow")) {
			return HSSFColor.YELLOW.index;
		} else if (sColor.equals("dark_yellow")) {
			return HSSFColor.DARK_YELLOW.index;
		} else if (sColor.equals("light_yellow")) {
			return HSSFColor.LIGHT_YELLOW.index;
		
		// 오렌지
		} else if (sColor.equals("orange")) {
			return HSSFColor.ORANGE.index;
		} else if (sColor.equals("light_orange")) {
			return HSSFColor.LIGHT_ORANGE.index;
			
		} else {
			return HSSFColor.BLACK.index;
		}
		/* 그 외 컬러들
		HSSFColor.AQUA , HSSFColor.AUTOMATIC , HSSFColor.BLUE_GREY , HSSFColor.BRIGHT_GREEN , HSSFColor.BROWN 
		HSSFColor.CORAL , HSSFColor.CORNFLOWER_BLUE , HSSFColor.DARK_TEAL , HSSFColor.GOLD , HSSFColor.GREY_40_PERCENT 
		HSSFColor.INDIGO , HSSFColor.LAVENDER , HSSFColor.LEMON_CHIFFON , HSSFColor.LIGHT_CORNFLOWER_BLUE , HSSFColor.LIGHT_TURQUOISE 
		HSSFColor.LIME , HSSFColor.MAROON , HSSFColor.OLIVE_GREEN , HSSFColor.ORCHID , HSSFColor.PALE_BLUE 
		HSSFColor.PINK , HSSFColor.PLUM , HSSFColor.ROSE , HSSFColor.ROYAL_BLUE , HSSFColor.SEA_GREEN 
		HSSFColor.SKY_BLUE , HSSFColor.TAN , HSSFColor.TEAL , HSSFColor.TURQUOISE , HSSFColor.VIOLET 
		 * */
	}

}
package com.sangs.support;

/**
 * @제목 엑셀리스트 저장
 * @설명 리스트내용을 엑셀로 저장
 * @작성자 naehae
 * @마지막날짜 2011-02-01
 */
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class ExcelDownUtil {

	private Logger log = LogManager.getLogger(this.getClass());
	
    public void excelList(List list, HttpServletRequest req, HttpServletResponse res, int cnt,
            String[] columnList) {

        WritableWorkbook workbook = null;
        WritableSheet sheet = null;
        String newFileName = Long.toString(System.currentTimeMillis());

        // File excelFile = new File( LmsDefine.ADDFILE_ROOT_PATH +  "\\temp\\" + newFileName);
        String eAddFileRootPath = SangsProperties.getProperty("Globals.addFileRootPath");
        String eTemp = "\\temp\\";
        File excelFile = new File( eAddFileRootPath + eTemp + newFileName);

        Label label = null;

        EduMap map = new EduMap();
        
        try {

            workbook = Workbook.createWorkbook(excelFile);
            workbook.createSheet("sheet1", 0);
            sheet = workbook.getSheet(0);

            WritableFont wFont = new WritableFont(WritableFont.ARIAL, 10, WritableFont.BOLD);
            WritableCellFormat cellFormat = new WritableCellFormat(wFont);

            //컬럼명 리스트
            for (int i = 0; i < columnList.length; i++) {
                label = new Label(i, 0, columnList[i], cellFormat);
                sheet.addCell(label);
            }

            for (int i = 0; i < list.size(); i++) {
                map = (EduMap)list.get(i);
                Collection<Integer> cli = map.values(); //값만 다 뽑아 와서
                Iterator it = cli.iterator(); //Iterator로 바꾸고
                for (int j = 0; it.hasNext(); j++) { //돌리고
                    if (j == cnt) {
                        break;
                    }
                    label = new Label(j, i + 1, String.valueOf(it.next()), cellFormat);
                    sheet.addCell(label);
                }
            }

            workbook.write();
            workbook.close();

            excelDown(excelFile, "EXCEL_DATA.xls", req, res);

        } catch (RuntimeException e) {
        	
        } catch (Exception e) {
            
        }

    }

    /**
    *	Preview 	: 엑셀파일 다운로드 , 2010-11-22, nae
    *  	@param		: 
    *	@return		: 
     * @throws IOException 
    */
    public void excelDown(File excelFile, String fileName, HttpServletRequest request,
            HttpServletResponse response) throws IOException {

        String strClient = "";
        String fileType = "";

        BufferedInputStream fin = new BufferedInputStream(new FileInputStream(excelFile));
        BufferedOutputStream outs = new BufferedOutputStream(response.getOutputStream());
        
        try {
            int fileSize = (int)excelFile.length();
            strClient = request.getHeader("User-Agent");

            if (strClient.indexOf("MSIE 5.5") != -1) {
                // java.net.URLEncoder.encode 처리 없으면 파일다운로드시에 오류 
                response.setHeader("Content-Disposition", "filename=" + java.net.URLEncoder.encode(fileName, "EUC-KR") + ";");
                fileType = "doesn/matter";
            } else {
                response.setHeader("Content-Disposition", "attachment;filename=" + java.net.URLEncoder.encode(fileName, "EUC-KR") + ";");
                fileType = "application/octet-stream";
            }

            response.setContentType(fileType);
            response.setContentLength(fileSize);

            byte b[] = new byte[1024];

            int read = 0;
            while ((read = fin.read(b)) != -1) {
                outs.write(b, 0, read);
            }

            excelFile.delete();

        } catch (IOException e) {
        } catch (Exception e) {
        	
        } finally {

            outs.close();
            fin.close();

        }
    }

}
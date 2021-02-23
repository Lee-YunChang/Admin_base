package com.webapp.classdesk.ctrl;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.Sheet;
import jxl.Workbook;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sangs.support.DataMap;
import com.sangs.support.FileUploadUtil;
import com.sangs.support.FrontException;
import com.sangs.support.SangsProperties;
import com.sangs.util.ParamUtil;
import com.webapp.classdesk.service.ClassdeskTutorExamQuizbankService;
import com.webapp.classdesk.service.ClassdeskTutorExamService;

/**
 * Description : 클래스데스트 > 강사모드 > 시험 > 문제은행
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.01   SANGS           최초작성
 *
 */

@Controller
public class ClassdeskQuizbankController {

	private Logger log = LogManager.getLogger(this.getClass());
	
    @Resource(name = "classdeskTutorExamQuizbankService")
    private ClassdeskTutorExamQuizbankService classdeskTutorExamQuizbankService;

    @Resource(name = "classdeskTutorExamService")
    private ClassdeskTutorExamService         classdeskTutorExamService;

    /**
     * 문제은행 목록
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/quizbank/q_list.do")
    public String searchList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

    	
        try {
        	
        	if(rMap.containsKey("qu") && rMap.getString("qu").equals("insert")){
        		request.setAttribute("listData", classdeskTutorExamQuizbankService.getEdExamQuizList(rMap));
        	}else{
        		request.setAttribute("listData", classdeskTutorExamQuizbankService.getLeExamQuizList(rMap));
        	}
            request.setAttribute("subListData", classdeskTutorExamService.getEduExamSectionList(rMap));

        } catch (Exception e) {
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/quizbank/q_list";
    }

    /**
     * 문제은행 등록폼
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/quizbank/q_form.do")
    public String qForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
        	
        	if(rMap.getString("qu").equals("insert")){
        		request.setAttribute("rowData", classdeskTutorExamQuizbankService.getEdExamQuizInfo(rMap));
        	}else if(rMap.getString("qu").equals("update")){
        		request.setAttribute("rowData", classdeskTutorExamQuizbankService.getLeExamQuizInfo(rMap));
        	}

        } catch (Exception e) {
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/quizbank/q_form";
    }

    /**
     * 문제은행 저장
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/quizbank/q_exec.do")
    public String qExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            classdeskTutorExamQuizbankService.qExec(request, rMap, "CU");

        } catch (Exception e) {
            
            rMap.putString("rMsg", "에러가 발행했습니다.");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }

    /**
     * 문제은행 삭제
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/quizbank/q_del_exec.do")
    public String qDelExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            classdeskTutorExamQuizbankService.qExec(request, rMap, "D");

        } catch (Exception e) {
            
            rMap.putString("rMsg", "에러가 발행했습니다.");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }

    /**
     * 문제은행 등록폼
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/quizbank/q_excel_form.do")
    public String qExcelForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/quizbank/q_excel_form";
    }

    /**
     * 엑셀 미리보기
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws Exception 
     * @throws NumberFormatException 
     */
    @RequestMapping(value = "/classdesk/tutor/quizbank/q_excel_preview.do")
    public String qExcelPreview(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        List list = null;

        try {
            // 파일 업로드
            FileUploadUtil uploadUtil = new FileUploadUtil();
            rMap.putAll(uploadUtil.fileUpload(request, SangsProperties.getProperty("Globals.addFileRootPath"), Integer.parseInt(SangsProperties.getProperty("Globals.addFileMaxSize"))));

            DataMap fileBox = (DataMap)rMap.get("UPLOAD_FILE");

            list = new ArrayList();
            String filePath = fileBox.getString("uploadFileFulltPath") + "\\" + fileBox.getString("uploadFileSaveName");

            if ((fileBox.getString("fileUploadOk")).equals("Y")) {

                File f1 = new File(filePath);
                Workbook workbook = Workbook.getWorkbook(f1);

                Sheet sheet = workbook.getSheet(0);

                for (int h = 1; h < sheet.getRows(); h++) {
                    if (!sheet.getCell(1, h).getContents().equals("")) {
                        DataMap map = new DataMap();
                        map.setString("QTYPE", ParamUtil.getStrParam(sheet.getCell(0, h).getContents())); //문제유형
                        map.setString("QSUBJECT", ParamUtil.getStrParam(sheet.getCell(1, h).getContents())); //문제
                        map.setString("A01", ParamUtil.getStrParam(sheet.getCell(2, h).getContents())); //지문01
                        map.setString("A02", ParamUtil.getStrParam(sheet.getCell(3, h).getContents())); //지문02
                        map.setString("A03", ParamUtil.getStrParam(sheet.getCell(4, h).getContents())); //지문03
                        map.setString("A04", ParamUtil.getStrParam(sheet.getCell(5, h).getContents())); //지문04
                        map.setString("A05", ParamUtil.getStrParam(sheet.getCell(6, h).getContents())); //지문05
                        map.setString("RCODE", ParamUtil.getStrParam(sheet.getCell(7, h).getContents())); //정답
                        list.add(map);
                    } else {
                        break;
                    }
                }
            }
        } catch (Exception ex) {
            throw new FrontException(ex);
        }

        request.setAttribute("listData", list);

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/quizbank/q_excel_preview";
    }

    /**
     * 엑셀저장
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/quizbank/q_excel_exec.do")
    public String qExcelExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            classdeskTutorExamQuizbankService.qExcelExec(request, rMap);

            rMap.putString("rMsg", "저장되었습니다.");
            rMap.putString("rScript", "fnReload()");

        } catch (Exception e) {
            
            rMap.putString("rMsg", "에러가 발행했습니다.");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }

}

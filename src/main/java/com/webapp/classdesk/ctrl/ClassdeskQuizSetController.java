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
import com.webapp.classdesk.service.ClassdeskTutorExamQuizsetService;

/**
 * Description : 래스데스트 > 강사모드 > 세트문제 등록
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.01   SANGS           최초작성
 *
 */

@Controller
public class ClassdeskQuizSetController {

	private Logger log = LogManager.getLogger(this.getClass());
	
    @Resource(name = "classdeskTutorExamQuizsetService")
    private ClassdeskTutorExamQuizsetService  classdeskTutorExamQuizsetService;

    @Resource(name = "classdeskTutorExamQuizbankService")
    private ClassdeskTutorExamQuizbankService classdeskTutorExamQuizbankService;

    /**
     * 시험 세트 목록
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/quizset/list.do")
    public String list(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            request.setAttribute("listData", classdeskTutorExamQuizsetService.getLeExamSetList(rMap));

        } catch (Exception e) {
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/quizset/set_list";
    }

    /**
     * 세트문제 등록 실행
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/quizset/exec.do")
    public String exec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            classdeskTutorExamQuizsetService.exec(request, rMap);

            rMap.putString("rMsg", "저장되었습니다.");
            rMap.putString("rScript", "fnList()");

        } catch (Exception e) {
            
            rMap.putString("rMsg", "실패하였습니다.");
            rMap.putString("rScript", "fnList()");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }

    /**
     * 세트문제 퀴즈 문제 리스트
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/quizset/q_list.do")
    public String qList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            request.setAttribute("listData", classdeskTutorExamQuizsetService.getLeExamSetQuizList(rMap));

            rMap.setString("paramUseyn", "Y");
            // 세트방식 시험 세트 리스트 
            request.setAttribute("cateListData", classdeskTutorExamQuizsetService.getLeExamSetList(rMap));

        } catch (Exception e) {
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/quizset/set_q_list";
    }

    /**
     * 세트문제 퀴즈 문제 등록/양식
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/quizset/q_form.do")
    public String qForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            request.setAttribute("rowData", classdeskTutorExamQuizsetService.getLeExamSetQuizInfo(rMap));

        } catch (Exception e) {
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/quizset/set_q_form";
    }

    /**
     * 세트문제 퀴즈 문제 등록 실행
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/quizset/q_exec.do")
    public String qExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            classdeskTutorExamQuizsetService.qExec(request, rMap);

        } catch (Exception e) {
            
            rMap.putString("rMsg", "실패하였습니다.");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }

    /**
     * 시험문제 삭제 실행
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/quizset/q_del_exec.do")
    public String qDelExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            classdeskTutorExamQuizsetService.qDelExec(rMap);

            rMap.putString("rMsg", "삭제되었습니다.");
            rMap.putString("rScript", "fnList()");

        } catch (Exception e) {
            
            rMap.putString("rMsg", "실패하였습니다.");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }

    /**
     * 문제은행 문제 조회
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/quizset/quizbank_search.do")
    public String quizbankSearch(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            request.setAttribute("cateData", classdeskTutorExamQuizsetService.getEdExamSectionList(rMap));
            request.setAttribute("listData", classdeskTutorExamQuizbankService.getEdExamQuizList(rMap));

        } catch (Exception e) {
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/quizset/quizbank_search";
    }

    /**
     * 문제은행 문제 등록 실행
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/quizset/quizbank_exec.do")
    public String quizbankExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            classdeskTutorExamQuizsetService.quizbankExec(request, rMap);

            rMap.putString("rMsg", "저장되었습니다.");
            rMap.putString("rScript", "fnReload()");

        } catch (Exception e) {
            
            rMap.putString("rMsg", "실패하였습니다.");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }

    /**
     * 문제 일괄 등록 폼
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/quizset/q_excel_form.do")
    public String qExcelForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/quizset/set_q_excel_form";
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
    @RequestMapping(value = "/classdesk/tutor/quizset/q_excel_preview.do")
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
                        map.setString("ALLOT", ParamUtil.getStrParam(sheet.getCell(8, h).getContents())); //정답
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

        return "classdesk/quizset/set_q_excel_preview";
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
    @RequestMapping(value = "/classdesk/tutor/quizset/q_excel_exec.do")
    public String qExcelExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            classdeskTutorExamQuizsetService.qExcelExec(request, rMap);

            rMap.putString("rMsg", "저장되었습니다.");
            rMap.putString("rScript", "fnReload()");

        } catch (Exception e) {
            
            rMap.putString("rMsg", "에러가 발행했습니다.");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }
}

package com.webapp.classdesk.ctrl;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import antlr.collections.List;

import com.google.gson.Gson;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;
import com.sangs.support.SangsProperties;
import com.sangs.util.DateUtil;
import com.sangs.util.ParamUtil;
import com.webapp.classdesk.service.ClassdeskTutorExamQuizbinderService;
import com.webapp.classdesk.service.ClassdeskTutorExamQuizsetService;
import com.webapp.classdesk.service.ClassdeskTutorExamService;
import com.webapp.classdesk.service.ClassdeskUserExamService;

/**
 * Description : 클래스데스트 > 강사모드 > 시험
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.01   SANGS           최초작성
 *
 */

@Controller
public class ClassdeskTutorExamController {

	private Logger log = LogManager.getLogger(this.getClass());
	
    @Resource(name = "classdeskTutorExamService")
    private ClassdeskTutorExamService           classdeskTutorExamService;

    @Resource(name = "classdeskUserExamService")
    private ClassdeskUserExamService            classdeskUserExamService;

    @Resource(name = "classdeskTutorExamQuizsetService")
    private ClassdeskTutorExamQuizsetService    classdeskTutorExamQuizsetService;

    @Resource(name = "classdeskTutorExamQuizbinderService")
    private ClassdeskTutorExamQuizbinderService classdeskTutorExamQuizbinderService;

    /**
     * 시험 목록
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/exam/list.do")
    public String list(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
        	rMap.setString("mtCtypeCode", classdeskTutorExamService.selectMtCtypeCode(rMap));
            request.setAttribute("listData", classdeskTutorExamService.getLectExamList(rMap));
            request.setAttribute("rowData", classdeskTutorExamService.getOpenTypeInfo(rMap));

        } catch (Exception e) {
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/tutor/exam_list";
    }

    /**
     * 시험 등록폼
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/exam/form.do")
    public String form(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

    	log.debug("################## rMap : " + rMap);
    	
        try {

            EduMap eMap = classdeskTutorExamService.getLectExamItem(rMap);
            EduMap cMap = classdeskTutorExamService.getOpenTypeInfo(rMap);
            EduMap evalMap = classdeskTutorExamService.getLeExamEvalInfo(rMap); // 시험 점수 정보

            if (eMap != null) {
                //LE_EXAM_SECTION -- 강의실 시험 문제은행 출제정책 데이타가 있는 경우
            	rMap.setString("qu" , "update");
                if ("Y".equals(eMap.getString("RANDOM_YN"))) {
                    request.setAttribute("subListData", classdeskTutorExamService.getLectExamSectionList(rMap));
                    
                } else {
                    if ("S".equals(eMap.getString("PUB_TYPE"))) {
                        if (eMap.getInt("SETNO") > 0) {
                            rMap.setInt("setno", eMap.getInt("SETNO"));
                            rMap.setString("addObject", "Y");
                            request.setAttribute("subListData", classdeskTutorExamQuizsetService.getLeExamSetQuizList(rMap));
                            request.setAttribute("totlaAllotData", classdeskTutorExamQuizsetService.getSetTotalAllotInfo(rMap));
                            
                        }
                    } else if ("B".equals(eMap.getString("PUB_TYPE"))) {

                        String DefultType = "Y";

                        if (!rMap.getString("openType").equals("A")) {
                            DefultType = "A";
                        }

                        rMap.setString("addObject", ParamUtil.getStrParam(rMap.getString("addObject"), DefultType));

                        if (!rMap.getString("openType").equals("A")) {
                            rMap.setString("addObject", "A");
                        }
                        request.setAttribute("subListData", classdeskTutorExamQuizbinderService.getLeExamQuizList(rMap));
                        request.setAttribute("totlaAllotData", classdeskTutorExamQuizbinderService.getSetTotalAllotInfo(rMap));
                        
                    }
                }
            }
            
            rMap.add("defultSdate", DateUtil.getNowDate());
            rMap.add("defultEdate", DateUtil.getMonthAgoDate(1));

            request.setAttribute("courseData", cMap); // 운영상태 (상시, 기간)
            request.setAttribute("rowData", eMap);
            request.setAttribute("evalData", evalMap);

        } catch (Exception e) {
            throw new FrontException(e);
        }
        
        request.setAttribute("REQUEST_DATA", rMap);
        return "classdesk/tutor/exam_form";
    }
    
    /**
	 * 임시저장시 시험출제정책 등록여부 체크
	 * @param res
	 * @param rMap
	 * @throws Exception
	 */
	@RequestMapping(value = "/classdesk/tutor/exam/edExamSectionCheck.do")
	public void edExamSectionCheck(HttpServletResponse res, DataMap rMap) throws Exception {
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		Gson gson = new Gson();
		String json = null;
		
		try {
			
			int checkCnt = classdeskTutorExamService.getEduExamSectionCnt(rMap);
			
			if(checkCnt > 0){
				json = gson.toJson("SUCCESS");
			}else{
				json = gson.toJson("FAIL");
			}

		} catch (Exception e) {
			log.error(e);
			json = gson.toJson("FAIL");
		}

		out.print(json);
		out.flush();
		out.close();
	}
	
	 /**
	 * 사전/사후시험 등록여부 체크
	 * @param res
	 * @param rMap
	 * @throws Exception
	 */
	@RequestMapping(value = "/classdesk/tutor/exam/leExamBeAfterCheck.do")
	public void leExamBeAfterCheck(HttpServletResponse res, DataMap rMap) throws Exception {
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		Gson gson = new Gson();
		String json = null;
		
		try {
			
			rMap.setString("examType", "B");
			int beCheckCnt = classdeskTutorExamService.getLeExamBeAfterCnt(rMap);
			
			rMap.setString("examType", "A");
			int afCheckCnt = classdeskTutorExamService.getLeExamBeAfterCnt(rMap);
			
			rMap.putInt("beCheckCnt", beCheckCnt);
			rMap.putInt("afCheckCnt", afCheckCnt);
			json =  gson.toJson(rMap);

		} catch (Exception e) {
			log.error(e);
		}

		out.print(json);
		out.flush();
		out.close();
	}

    /**
     * 시험 등록 / 수정 실행 
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/exam/exec.do")
    public String exec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
            classdeskTutorExamService.exec(request, rMap, "CU");

        } catch (Exception e) {
            log.error("Exception", e);
            rMap.putString("rMsg", "등록중 에러가 발생하였습니다. 다시 시도해주세요.");
            rMap.putString("rScript", "fnList()");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }

    /**
     * 시험 정보 전체삭제
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/exam/del_exec.do")
    public String delExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            classdeskTutorExamService.delExec(rMap);

            rMap.putString("rMsg", "삭제 되었습니다.");
            rMap.putString("rScript", "fnList()");

        } catch (Exception e) {
            log.error("Exception", e);
            rMap.putString("rMsg", "등록중 에러가 발생하였습니다. 다시 시도해주세요.");
            rMap.putString("rScript", "fnList()");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }

    /**
     * 랜덤 리스트
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/exam/ajaxRandomList.do")
    public String ajaxRandomList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
        	
            //강의실 출제정책 랜덤방식 리스트  
            if ("Y".equals(rMap.getString("RANDOM_YN"))) {
                request.setAttribute("subListData", classdeskTutorExamService.getLectExamSectionList(rMap));
                //교육시험 출제정책 랜덤방식 리스트 
            } else {
                request.setAttribute("subListData", classdeskTutorExamService.getEduExamSectionList(rMap));
            }

            EduMap cMap = classdeskTutorExamService.getOpenTypeInfo(rMap);
            request.setAttribute("courseData", cMap); // 운영상태 (상시, 기간)

        } catch (Exception e) {
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/tutor/inc/exam_random_inc";
    }

    /**
     * 세트 리스트
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/exam/ajaxSetList.do")
    public String ajaxSetList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            rMap.setString("addObject", ParamUtil.getStrParam(rMap.getString("addObject"), "Y"));
            request.setAttribute("subListData", classdeskTutorExamQuizsetService.getLeExamSetQuizList(rMap));
            request.setAttribute("totlaAllotData", classdeskTutorExamQuizsetService.getSetTotalAllotInfo(rMap));

            EduMap cMap = classdeskTutorExamService.getOpenTypeInfo(rMap);
            request.setAttribute("courseData", cMap); // 운영상태 (상시, 기간)

        } catch (Exception e) {
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/tutor/inc/exam_set_inc";
    }

    /**
     * 바인더 리스트
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/exam/ajaxBinderList.do")
    public String ajaxBinderList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            request.setAttribute("subListData", classdeskTutorExamQuizbinderService.getLeExamQuizList(rMap));
            request.setAttribute("totlaAllotData", classdeskTutorExamQuizbinderService.getSetTotalAllotInfo(rMap));

            EduMap cMap = classdeskTutorExamService.getOpenTypeInfo(rMap);
            request.setAttribute("courseData", cMap); // 운영상태 (상시, 기간)

        } catch (Exception e) {
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/tutor/inc/exam_binder_inc";
    }

    /**
     * 시험 제출자 목록
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/exam/user_list.do")
    public String userList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            request.setAttribute("rowData", classdeskTutorExamService.getLectExamItem(rMap));
            request.setAttribute("userListData", classdeskTutorExamService.getUserLectExamSubList(rMap));

        } catch (Exception e) {
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/tutor/exam_user_list";
    }

    /**
     * 시험 제출자 목록
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/exam/eval_form.do")
    public String evalForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

    	log.debug("################## rMap : " + rMap);
    	
        try {
        	
            request.setAttribute("listData", classdeskUserExamService.getUserLectExamRdmAppHistList(rMap));

        } catch (Exception e) {
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/tutor/exam_eval_form";
    }

    /**
     * 시험 평가(채점) 양식 실행
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/exam/eval_exec.do")
    public String evalExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

    	log.debug("################## (/classdesk/tutor/exam/eval_exec.do) rMap : " + rMap);
    	
        try {

            classdeskTutorExamService.evalExec(request, rMap);

            rMap.putString("rMsg", "채점을 완료하였습니다.");
            rMap.putString("rScript", "fnDetail(\\'" + rMap.getInt("examNo") + "\\')");

        } catch (Exception e) {
            log.error("Exception", e);
            rMap.putString("rMsg", "등록중 에러가 발생하였습니다. 다시 시도해주세요.");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }

    /**
     * 시험 수강생 재응시 승인
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/exam/del_user_exec.do")
    public String delUserExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	
    	
    	
        try {

            classdeskTutorExamService.delUserExec(request, rMap);

            rMap.putString("rMsg", "재응시 승인처리 되었습니다.");
            rMap.putString("rScript", "fnDetail(\\'" + rMap.getInt("examNo") + "\\')");

        } catch (Exception e) {
            log.error("Exception", e);
            rMap.putString("rMsg", "에러가 발생하였습니다. 다시 시도해주세요.");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }

    /**
     * 강사제출
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/exam/tutor_submit_exec.do")
    public String tutorSubmitExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            classdeskTutorExamService.tutorSubmitExec(rMap);

            rMap.putString("rMsg", "시험지가 제출되었습니다.");
            rMap.putString("rScript", "fnDetail(\\'" + rMap.getInt("examNo") + "\\')");

        } catch (Exception e) {
            log.error("Exception", e);
            rMap.putString("rMsg", "에러가 발생하였습니다. 다시 시도해주세요.");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }

    /**
     * 시험 최종평가반영
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/exam/eval_final_exec.do")
    public String evalFinalExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            classdeskTutorExamService.evalFinalExec(rMap);

            rMap.putString("rMsg", "평가 반영되었습니다.");
            rMap.putString("rScript", "fnDetail(\\'" + rMap.getInt("examNo") + "\\')");

        } catch (Exception e) {
            log.error("Exception", e);
            rMap.putString("rMsg", "에러가 발생하였습니다. 다시 시도해주세요.");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }

    /**
     * 시험 사용여부 등록
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/exam/use_exec.do")
    public String useExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            classdeskTutorExamService.useExec(request, rMap);

            rMap.putString("rMsg", "저장되었습니다.");
            rMap.putString("rScript", "fnList()");

        } catch (Exception e) {
            log.error("Exception", e);
            rMap.putString("rMsg", "실패하였습니다.");
            rMap.putString("rScript", "fnList()");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }

    /**
     * 문제 사용여부 (상시일 경우만 사용)
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/exam/q_use_exec.do")
    public String qUseExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            String targetTable = ParamUtil.getStrParam(rMap.getString("openPubeType"), "");

            String tname = ""; // 테이블 네임

            // 파라미터 정보로 테이블 네이밍 세팅. 
            if (targetTable.equals("S")) {
                tname = SangsProperties.getProperty("Globals.T_SETQUIZ");
            } else if (targetTable.equals("B")) {
                tname = SangsProperties.getProperty("Globals.T_BINDERQUIZ");
            } else if (targetTable.equals("R")) {
                tname = SangsProperties.getProperty("Globals.T_BANK_QUIZ");
            }
            rMap.setString("tname", tname);

            classdeskTutorExamService.updateQuizUseYn(rMap);

            rMap.putString("rScript", "fnQuizDetail(\\'" + rMap.get("examNo") + "\\')");

        } catch (Exception e) {
            log.error("Exception", e);
            rMap.putString("rMsg", "실패하였습니다.");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }

}

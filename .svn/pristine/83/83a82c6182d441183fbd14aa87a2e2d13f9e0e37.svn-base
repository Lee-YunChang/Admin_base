package com.webapp.classdesk.ctrl;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sangs.session.UserSessionManager;
import com.sangs.session.UserSessionVO;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;
import com.sangs.support.SangsMap;
import com.sangs.support.SangsProperties;
import com.sangs.util.EgovFileUploadUtil;
import com.sangs.util.EgovFormBasedFileVo;
import com.sangs.util.SangsUtil;
import com.webapp.classdesk.service.ClassdeskCommonService;
import com.webapp.classdesk.service.ClassdeskTutorPollService;

/**
 * Description : 클래스데스트 > 강사모드 > 설문
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.01   SANGS           최초작성
 *
 */

@Controller
public class ClassdeskTutorPollController {

    @Resource(name = "classdeskTutorPollService")
    private ClassdeskTutorPollService classdeskTutorPollService;

    @Resource(name = "classdeskCommonService")
    private ClassdeskCommonService    classdeskCommonService;

    /**
     * 설문목록
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/poll/list.do")
    public String list(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
        	//기간검색
            String sdate = rMap.getString("sdate");
            String edate = rMap.getString("edate");
            rMap.setString("sdate", sdate);
            rMap.setString("edate", edate);
        	
//            request.setAttribute("resultList", classdeskTutorPollService.getSurveyList(rMap));

            List<EduMap> resultList = classdeskTutorPollService.getSurveyList(rMap);
            request.setAttribute("resultList", resultList);
            
        	int totalCount = 0;
        	if (resultList != null && resultList.size() > 0) {
        		totalCount = totalCount + resultList.get(0).getInt("TOTALCOUNT");
        	}
        	request.setAttribute("totalCount", totalCount);
            
            
    		request.setAttribute("REQUEST_DATA", rMap);
        } catch (Exception e) {
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/tutor/poll_list";
    }

    /**
     * 설문FORM
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/poll/form.do")
    public String form(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
            //모듈명
        	request.setAttribute("moduleList", classdeskTutorPollService.getModuleList(rMap));
        	//질문 목록
        	request.setAttribute("questionList", classdeskTutorPollService.getQuestionList(rMap));
        	//설문 내용
        	request.setAttribute("resultList", classdeskTutorPollService.getSurveyModuleList(rMap));
        	//설문명 설문기간 설문설명 사용여부
        	request.setAttribute("surveyInfo", classdeskTutorPollService.getSurveyView(rMap));
        	//객관식 || 주관식 
        	rMap.setString("JB", SangsProperties.getProperty("Globals.mtCode_MT_CPOLL_CODE"));
        	request.setAttribute("mtSubCode", classdeskTutorPollService.selectMtCpollCode(rMap));
        	
        	//해당과정 강사 목록
        	request.setAttribute("tutorList", classdeskTutorPollService.getTutorList(rMap));
    		request.setAttribute("REQUEST_DATA", rMap);

        } catch (Exception e) {
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/tutor/poll_form";
    }
    
    /**
     * 엑셀등록 팝업창
     * 
     * @date	: 2016. 9. 6.					
     * @author	: 황두은, hde3314@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 엑셀등록 팝업창
    @RequestMapping(value = "/classdesk/tutor/poll/surveyExcelPopup.do")
    public String surveyExcelPopup(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        try {
        	request.setAttribute("resultList", classdeskTutorPollService.getSurveyList(rMap));
    		request.setAttribute("REQUEST_DATA", rMap);
        } catch (Exception e) {
            throw new Exception(e);
        }
        return "classdesk/tutor/survey_excelPopup";
    }
    /**
     * 엑셀등록 미리보기
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 문제은행  > 문제목록 > 엑셀일괄 문제 등록 미리보기
    @RequestMapping(value = "/classdesk/tutor/poll/surveyExcelPreview.do")
    public String examQexcelPreview(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
    	
        String returnurl = "classdesk/tutor/poll_form";
        try {  
        	String attFilePath = SangsProperties.getProperty("Globals.addFileRootPath");
        	EgovFormBasedFileVo rtnFileVo = excelUploadPrc(request, attFilePath);
        	ArrayList<SangsMap> excelList = SangsUtil.loadExcelList(attFilePath + File.separator + rtnFileVo.getPhysicalName(), 1, 10);
        	List<EduMap> excelList2 = SangsUtil.loadExcelList3(attFilePath + File.separator + rtnFileVo.getPhysicalName(), 1, 10);
            List<EduMap> real = new ArrayList<EduMap>();
            
            for(int i = 1 ; i < excelList2.size(); i++ ) {
            	if(excelList2.get(i).getInt("col0") != excelList2.get(i-1).getInt("col0")){
            		excelList2.get(i).put("moduleyn", "N");
            	} else {
            		excelList2.get(i).put("moduleyn", "Y");
            	}
            	if(excelList2.get(i).getInt("col2") != excelList2.get(i-1).getInt("col2")){
            		excelList2.get(i).put("questionyn", "N");
            	} else {
            		excelList2.get(i).put("questionyn", "Y");
            	}
            }
            
            excelList2.get(0).put("moduleyn", "N");
            excelList2.get(0).put("questionyn", "N");
            
            for(int i = 0 ; i < excelList.size() ; i++) {
                real.add(excelList2.get(i));
            }
    		request.setAttribute("REQUEST_DATA", rMap);
    		request.setAttribute("real", real);
    		
        	//객관식 || 주관식 
        	rMap.setString("JB", SangsProperties.getProperty("Globals.mtCode_MT_CPOLL_CODE"));
        	request.setAttribute("mtSubCode", classdeskTutorPollService.selectMtCpollCode(rMap));
    		
        } catch (Exception e) {
        	//객관식 || 주관식 
        	rMap.setString("JB", SangsProperties.getProperty("Globals.mtCode_MT_CPOLL_CODE"));
        	request.setAttribute("mtSubCode", classdeskTutorPollService.selectMtCpollCode(rMap));
    		request.setAttribute("REQUEST_DATA", rMap);
        	request.setAttribute("msg", "잘못된 파일입니다. 양식에 맞는 파일을 등록하여 주세요.");
        }
        return returnurl;
    }
    /**
     * 엑셀 업로드
     * @param data
     * @return
     * @throws Exception
     */
     private EgovFormBasedFileVo excelUploadPrc(HttpServletRequest req, String attFilePath)  throws Exception {
         try {
             List<EgovFormBasedFileVo> fileList = null;
             EgovFormBasedFileVo fileVo = null;

             if (ServletFileUpload.isMultipartContent(req)) {
                 fileList = EgovFileUploadUtil.uploadFiles(req, attFilePath);
             }
             if(fileList != null && fileList.size() > 0) {
                 fileVo = fileList.get(0);
             }
             return fileVo;
         } catch(Exception e) {
             throw new FrontException();
         }
     }
     
    /**
     * 설문 미리보기
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/poll/surveyPreview.do")
    public String surveyPreview(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
            //모듈명
        	request.setAttribute("moduleList", classdeskTutorPollService.getModuleList(rMap));
        	//질문 목록
        	request.setAttribute("questionList", classdeskTutorPollService.getQuestionList(rMap));
        	//설문 내용
        	request.setAttribute("resultList", classdeskTutorPollService.getSurveyModuleList(rMap));
        	//설문명 설문기간 설문설명 사용여부
        	request.setAttribute("surveyInfo", classdeskTutorPollService.getSurveyView(rMap));
        	//객관식 || 주관식 
        	rMap.setString("JB", SangsProperties.getProperty("Globals.mtCode_MT_CPOLL_CODE"));
        	request.setAttribute("mtSubCode", classdeskTutorPollService.selectMtCpollCode(rMap));
        	
    		request.setAttribute("REQUEST_DATA", rMap);

        } catch (Exception e) {
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/tutor/poll_preview";
    }
    
    /**
     * 설문통계
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/poll/statistics.do")
    public String statistics(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
            //모듈명
        	request.setAttribute("moduleList", classdeskTutorPollService.getModuleList(rMap));
        	//질문 목록
        	request.setAttribute("questionList", classdeskTutorPollService.getQuestionList(rMap));
        	//보기 문항
        	request.setAttribute("resultList", classdeskTutorPollService.getSurveyModuleList(rMap));
        	//설문명 설문기간 설문설명 사용여부
        	request.setAttribute("surveyInfo", classdeskTutorPollService.getSurveyView(rMap));
        	
        	//설문 응시 이력(객관식)
        	request.setAttribute("getPollCnt", classdeskTutorPollService.getPollCnt(rMap));
        	
        	//설문 응시 이력(주관식)
        	request.setAttribute("getPollAnswer", classdeskTutorPollService.getPollAnswer(rMap));
        	 
        	//객관식 || 주관식 
        	rMap.setString("JB", SangsProperties.getProperty("Globals.mtCode_MT_CPOLL_CODE"));
        	request.setAttribute("mtSubCode", classdeskTutorPollService.selectMtCpollCode(rMap));
        	
    		request.setAttribute("REQUEST_DATA", rMap);

        } catch (Exception e) {
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/tutor/poll_statistics";
    }
    
    /**
     * 설문 통계보기 > 주관식답변 팝업
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/poll/poll_answer_pop.do")
    public String poll_answer_pop(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
        	//설문명 설문기간 설문설명 사용여부
        	request.setAttribute("resultList", classdeskTutorPollService.getPollStatEtcList(rMap));

        } catch (Exception e) {
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/tutor/poll_answer_pop";
    }
    
    /**
     * 설문 마스터 일괄저장 - 안쓰는것같음
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/poll/mts_call_exec.do")
    public String mtscallExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            classdeskTutorPollService.mtscallExec(rMap);

            EduMap eMap = classdeskTutorPollService.selectMstPollQuizCnt(rMap);

            if (eMap.getInt("POLL_QUIZ_CNT") > 0) {
                rMap.putString("rMsg", "설문마스터 정보를 일괄 등록했습니다.");

            } else {
                rMap.putString("rMsg", "설문마스터 정보가 없습니다.");
            }

        } catch (Exception e) {
            rMap.putString("rMsg", "등록중 에러가 발생하였습니다. 다시 시도해주세요.");
        }

        rMap.putString("rScript", "window.document.location.reload()");

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }

    /**
     * 설문등록FORM - 안쓰는것같음
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/poll/q_form.do")
    public String qForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            request.setAttribute("rowData", classdeskTutorPollService.getPollItem(rMap));

        } catch (Exception e) {
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/tutor/poll_q_form";
    }

    /**
     * 설문항목 저장 - 안쓰는것같음
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/poll/q_exec.do")
    public String qExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            classdeskTutorPollService.qExec(request, rMap, "CU");

        } catch (Exception e) {
            rMap.putString("rMsg", "에러가 발생하였습니다. 다시 시도해주세요.");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }

    /**
     * 설문항목 삭제 - 안쓰는것같음
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/poll/q_del_exec.do")
    public String qDelExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            classdeskTutorPollService.qExec(request, rMap, "D");

        } catch (Exception e) {
            rMap.putString("rMsg", "에러가 발생하였습니다. 다시 시도해주세요.");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }

    /**
     * 설문 설문개시
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/poll/exec.do")
    public String exec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

    	try {
        	UserSessionVO userVo = UserSessionManager.getUserSessionVO(request);
        	
        	// 특수문자 치환 (insert)
        	rMap.setString("writer", userVo.getUserName()); 
        	
    	   if(rMap.getString("qu").equals("insert") || rMap.getString("qu").equals("update")){
    	   		
    		   	if(rMap.getString("qu").equals("insert")){
    		   		/*글 정보 삽입*/
    		   		int pollcseqno = classdeskTutorPollService.getMaxSurveyNo(rMap);
    		   		rMap.setInt("pollcseqno", pollcseqno);
    		   		classdeskTutorPollService.insertSurveyInfo(rMap);
    		   		
    		   		/*설문 정보 삽입*/
    		   		String[] mtCpollCode = request.getParameterValues("mtCpollCode");
    		   		String[] subject = request.getParameterValues("subject");
    		   		String[] doubleAtyn = request.getParameterValues("doubleAtyn");
    		   		String[] period = request.getParameterValues("period");
    		   		
    		   		String[] cpollTitleValue = request.getParameterValues("cpollTitleValue");
    		   		
    		   		String[] itemSubject = request.getParameterValues("itemSubject");
    		   		String[] itemOrdr = request.getParameterValues("itemOrdr");
    		   		
    		   		String[] countItem = request.getParameterValues("countItem");
    		   		
    		   		String[] ExceldoubleAt = request.getParameterValues("ExceldoubleAt");
		   			String[] ExcelcpollTitleValue = request.getParameterValues("ExcelcpollTitleValue");

	   				String ExcelcountItem = request.getParameter("ExcelcountItem");
	   				int countItemI=0;
    		   		
    		   		ArrayList<Integer> qnos = new ArrayList<Integer>();
    		   		
    		   		//문항 정보 삽입
		   			for(int j=0;j<subject.length;j++) {
		   				//질문 일련번호 생성
    		   			int qno = classdeskTutorPollService.getMaxQuizNo(rMap);
        		   		rMap.setInt("qno", qno);
        		   		
    		   			rMap.setString("mtCpollCode", mtCpollCode[j]);
    		   			if(rMap.getString("excelyn").equals("Y")) { //엑셀등록이라면
    		   				
    		   				if(mtCpollCode[j].equals("JBBA00")) {
    		   					
    		   					if(ExcelcountItem.length() > 0){
    			   					String[] ExcelcountItemArr = ExcelcountItem.split(","); 
    			   					for(int o = 0 ; o < Integer.parseInt(ExcelcountItemArr[countItemI]) ; o ++) {
    			   						qnos.add(rMap.getInt("qno"));
    			   					} 
    			   				}
    		   					countItemI++;
    		   				}
    		   				
    		   				rMap.setString("subject", subject[j]);
    		   				if(ExceldoubleAt[j].equals("")) {
    		   					rMap.setString("doubleAtyn", "N");
    		   				} else {
    		   					rMap.setString("doubleAtyn", ExceldoubleAt[j]);
    		   				}
    		   				rMap.setInt("ordr",j+1);
    		   				rMap.setString("cpollTitle", ExcelcpollTitleValue[j]);
    		   				classdeskTutorPollService.insertQuizInfo(rMap);
    		   				
    		   			} else {
	    		   			//해당하는 질문의 보기 문항 갯수만큼 질문의 일련번호를 qnos에 삽입
    		   				if(!countItem[j].equals("")) {
    		   					rMap.setString("countItem", countItem[j]);
    		   					int aa = Integer.parseInt(rMap.getString("countItem"));
    		   					if(mtCpollCode[j].equals("JBBA00")) {
    		   						for(int o = 0 ; o < aa ; o ++) {
    		   							qnos.add(rMap.getInt("qno"));
    		   						}
    		   					}
    		   				}
    		   				
	    		   			rMap.setString("subject", subject[j]);
	    		   			rMap.setString("doubleAtyn", doubleAtyn[j]);
	    		   			rMap.setInt("ordr",j+1);
	    		   			rMap.setString("cpollTitle", cpollTitleValue[j]);
	    		   			rMap.setString("period", period[j]);
	    		   			classdeskTutorPollService.insertQuizInfo(rMap);
	    		   		}
		   			}
		   			if(rMap.getString("excelyn").equals("Y")) { //엑셀등록이라면
		   				//객관식 보기 삽입
		   				for(int i = 0 ; i < qnos.size() ; i++) {
		   					rMap.setInt("qno", qnos.get(i));
		   					rMap.setString("itemSubject", itemSubject[i]);
		   					rMap.setInt("itemNo", Integer.parseInt(itemOrdr[i]));
		   					rMap.setInt("itemOrdr", Integer.parseInt(itemOrdr[i]));
		   					rMap.setInt("itemVal", Integer.parseInt(itemOrdr[i]));
		   					
		   					classdeskTutorPollService.insertQuizItemInfo(rMap);
		   				}
		   			} else {
			   			//객관식 보기 삽입
			   			for(int i = 0 ; i < qnos.size() ; i++) {
			   				rMap.setInt("qno", qnos.get(i));
			   				rMap.setString("itemSubject", itemSubject[i]);
			   				rMap.setInt("itemNo", Integer.parseInt(itemOrdr[i]));
			   				rMap.setInt("itemOrdr", Integer.parseInt(itemOrdr[i]));
			   				rMap.setInt("itemVal", Integer.parseInt(itemOrdr[i]));
			   				
			   				classdeskTutorPollService.insertQuizItemInfo(rMap);
			   			}
		   			}
    		   	}else if(rMap.getString("qu").equals("update")){
    		   		
    		   		classdeskTutorPollService.deleteSurveyInfo(rMap);
    		   		classdeskTutorPollService.deleteQuizInfo(rMap);
    		   		classdeskTutorPollService.deleteQuizItemInfo(rMap); 

    		   		/*글 정보 삽입*/
    		   		classdeskTutorPollService.insertSurveyInfo(rMap);
    		   		
    		   		rMap.setInt("pollcseqno", classdeskTutorPollService.getMaxSurveyNo(rMap)-1);
    		   		
    		   		/*설문 정보 삽입*/
    		   		String[] mtCpollCode = request.getParameterValues("mtCpollCode");
    		   		String[] subject = request.getParameterValues("subject");
    		   		String[] doubleAtyn = request.getParameterValues("doubleAtyn");
    		   		String[] period = request.getParameterValues("period");
    		   		String[] cpollTitleValue = request.getParameterValues("cpollTitleValue");
    		   		
    		   		String[] itemSubject = request.getParameterValues("itemSubject");
    		   		String[] itemOrdr = request.getParameterValues("itemOrdr");
    		   		
    		   		String[] countItem = request.getParameterValues("countItem");
    		   		
    		   		ArrayList<Integer> qnos = new ArrayList<Integer>();
    		   		
    		   		//문항 정보 삽입
		   			for(int j=0;j<subject.length;j++) {
		   				//질문 일련번호 생성
    		   			int qno = classdeskTutorPollService.getMaxQuizNo(rMap);
        		   		rMap.setInt("qno", qno);
        		   		
    		   			rMap.setString("mtCpollCode", mtCpollCode[j]);
    		   			
    		   			//해당하는 질문의 보기 문항 갯수만큼 질문의 일련번호를 qnos에 삽입
    		   			if(!countItem[j].equals("")) {
		   					rMap.setString("countItem", countItem[j]);
		   					int aa = Integer.parseInt(rMap.getString("countItem"));
		   					if(mtCpollCode[j].equals("JBBA00")) {
		   						for(int o = 0 ; o < aa ; o ++) {
		   							qnos.add(rMap.getInt("qno"));
		   						}
		   					}
		   				}
    		   			
    		   			rMap.setString("subject", subject[j]);
    		   			rMap.setString("doubleAtyn", doubleAtyn[j]);
    		   			rMap.setInt("ordr",j+1);
    		   			rMap.setString("cpollTitle", cpollTitleValue[j]);
    	                rMap.setString("period", period[j]);
    		   			
    		   			classdeskTutorPollService.insertQuizInfo(rMap);
    		   		}
		   			
		   			//객관식 보기 삽입
		   			for(int i = 0 ; i < qnos.size() ; i++) {
		   				rMap.setInt("qno", qnos.get(i));
		   				rMap.setString("itemSubject", itemSubject[i]);
		   				rMap.setInt("itemNo", Integer.parseInt(itemOrdr[i]));
		   				rMap.setInt("itemOrdr", Integer.parseInt(itemOrdr[i]));
		   				rMap.setInt("itemVal", Integer.parseInt(itemOrdr[i]));
		   				
		   				classdeskTutorPollService.insertQuizItemInfo(rMap);
		   			}
    		   		
    		   	}
    	   	}
    		request.setAttribute("REQUEST_DATA", rMap);

        } catch (Exception e) {
            rMap.putString("rMsg", "에러가 발생하였습니다. 다시 시도해주세요.");
        }
        return "classdesk/tutor/poll_exec";
    }
 
    /**
     * 설문지 가져오기 팝업창
     * 
     * @date	: 2016. 9. 6.					
     * @author	: 황두은, hde3314@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 설문지 가져오기 팝업창
    @RequestMapping(value = "/classdesk/tutor/poll/surveyListPopup.do")
    public String surveyListPopup(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {
//        	request.setAttribute("resultList", classdeskTutorPollService.getSurveyList(rMap));
        	rMap.setString("SES_CSEQNO","");
        	List<EduMap> resultList = classdeskTutorPollService.getSurveyList(rMap);
        	request.setAttribute("resultList", resultList);
        	
        	int totalCount = 0;
        	if (resultList != null && resultList.size() > 0) {
        		totalCount = totalCount + resultList.get(0).getInt("TOTALCOUNT");
        	}
        	request.setAttribute("totalCount", totalCount);
        	
    		request.setAttribute("REQUEST_DATA", rMap);
        } catch (Exception e) {
            throw new Exception(e);
        }

        return "classdesk/tutor/poll_listPopup";
    }

    /**
     * 설문통계
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/poll/stats.do")
    public String stats(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            request.setAttribute("listData", classdeskTutorPollService.getPollStatList(rMap));

            // 답변중 주관식 리스트만 추출
            rMap.setString("mtCpollCode", SangsProperties.getProperty("Globals.mtCode_MT_CPOLL_CODE_DES"));
            int pollcSeqNo = (Integer)classdeskTutorPollService.getPollcSeqNoInfo(rMap);
            rMap.setInt("pollcSeqNo", pollcSeqNo);

            request.setAttribute("desListData", classdeskTutorPollService.getPollStatDesList(rMap));

        } catch (Exception e) {
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/tutor/poll_stats";
    }

    /**
     * 설문 엑셀 다운로드
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/poll/poll_excel.do")
    public String pollExcel(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try { 
        	//질문 목록
        	request.setAttribute("questionList", classdeskTutorPollService.getQuestionList(rMap));
        	
            request.setAttribute("listData", classdeskTutorPollService.getPollStatList(rMap));
            
            // 답변중 주관식 리스트만 추출
            rMap.setString("mtCpollCode", SangsProperties.getProperty("Globals.mtCode_MT_CPOLL_CODE_DES"));
            request.setAttribute("listData2", classdeskTutorPollService.getPollStatDesList(rMap));
 
            //설문명 설문기간 설문설명 사용여부
        	request.setAttribute("surveyInfo", classdeskTutorPollService.getSurveyView(rMap));
        	rMap.setString("ISCOURSE", "Y");
        } catch (Exception e) {
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/tutor/poll_excel";
    }
}

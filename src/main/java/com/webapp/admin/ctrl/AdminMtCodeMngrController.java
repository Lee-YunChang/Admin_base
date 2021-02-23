package com.webapp.admin.ctrl;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Stack;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.sangs.support.AdminMenu;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.util.ParamUtil;
import com.webapp.admin.service.AdminCommonService;
import com.webapp.admin.service.AdminMtCodeMngrService;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;

/**
 *
 * Description : 관리시스템 시스템 관련 컨트롤러
 *
 * Modification Information
 * 수정일           수정자                            수정내용
 * -----------  -----------------------------  -------
 * 2016. 3. 29.  이진영, sweetjy09@sangs.co.kr     최초작성
 *
 */
@Controller
public class AdminMtCodeMngrController {

    private Logger log = LogManager.getLogger(this.getClass());

    @Resource(name = "adminCommonService")
    private AdminCommonService    adminCommonService;

    @Resource(name = "adminMtCodeMngrService")
    private AdminMtCodeMngrService    adminMtCodeMngrService;

    /**
     * 시스템관리 > 공통코드 리스트_Tree / 등록, 수정, 삭제
     *
     * 수정일  : 2020. 07. 22.
     * 수정자  : 박진만
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/admin/common/mtCodeSaveAsciiAjax.do")
    public void mtCodeSaveAsciiAjax(@RequestParam Map<String, String> params, HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws Exception {
    	res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		Gson gson = new Gson();
		String json = null;
		
		String msg = null;
		
		try {
			String pmode = params.get("pmode");
			params.put("sesUserId", rMap.getString("SES_USERID"));
			
			if (pmode.equals("INS")) {
				adminMtCodeMngrService.insertMtCdAscInfo(params);
				msg = "등록 되었습니다.";
			} else if (pmode.equals("UPD")) {
				adminMtCodeMngrService.updateMtCdAscInfo(params);
				msg = "수정 되었습니다.";
			} else if (pmode.equals("DEL")) {
				int cnt = adminMtCodeMngrService.mtCdDeleteChkCnt(params);
				
				if(cnt > 0) {
					msg = "하위코드를 먼저 삭제해주시기 바랍니다.";
					rMap.setString("result", "false");
				} else {
					adminMtCodeMngrService.deleteMtCdAscInfo(params);
					msg = "삭제 되었습니다.";
					rMap.setString("result", "true");
				}
			} else {
				msg = "저장내역이 없습니다.";
			}
			
			rMap.setString("msg", msg);
			
			json =  gson.toJson(rMap);

		} catch (Exception e) {
			log.error(e);
		}

		out.print(json);
		out.flush();
		out.close();
    }
    
    /**
     * 시스템관리 > 공통코드 리스트_ASCII
     *
     * 수정일  : 2020. 08. 10.
     * 수정자  : 박진만
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 시스템관리관리 > 공통코드 리스트_ASCII
    @RequestMapping(value = "/admin/sysman/mtcodeListAscii.do")
    public String mtcodeListAscii(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
    	
    	try {
    		// 메뉴정보
    		AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
    		menuInfo.adminMenuExec(request, res, rMap, adminCommonService);
    	} catch (Exception e) {
    		
    		throw new Exception(e);
    	}
    	
    	return "/admin/sysman/mtcode_list_ascii";
    	
    }
    
    /**
     * 시스템관리 > 공통코드 리스트_ASCII
     *
     * 수정일  : 2020. 08. 10.
     * 수정자  : 박진만
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/admin/common/mtCodeDetailAsciiAjax.do")
    public void mtCodeDetailAsciiAjax(@RequestParam Map<String, String> params, HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws Exception {
    	
    	JSONObject obj = new JSONObject(); //메인 depth
    	
    	res.setContentType("text/html; charset=utf-8");
    	PrintWriter out = res.getWriter();
    	
    	try {
    		List<EduMap> eduMap = adminMtCodeMngrService.cmmnCodeAsciiList2(rMap);
    		
    		JSONArray jArray = new JSONArray();
    		
    		for(int i=0; i < eduMap.size(); i++) {
    			JSONObject jObject = new JSONObject();
    			
    			jObject.put("cmmnCodeSn", eduMap.get(i).getString("CMMN_CODE_SN"));                //코드번호
    			jObject.put("cmmnCodeNm", eduMap.get(i).getString("CMMN_CODE_NM"));             //코드명
    			jObject.put("cmmnCodeCn", eduMap.get(i).getString("CMMN_CODE_CN"));             //코드번호
    			jObject.put("cmmnCodeDpNo", eduMap.get(i).getInt("CMMN_CODE_DP_NO"));        //depth 번호
    			jObject.put("sysTy", eduMap.get(i).getString("SYS_TY"));                        //사용형태
    			jObject.put("upperCmmnCodeSn", eduMap.get(i).getString("UPPER_CMMN_CODE_SN"));     //상위 코드번호
    			jObject.put("inqireOrdr", eduMap.get(i).getInt("INQIRE_ORDR"));                 //코드순서
    			jObject.put("useAt", eduMap.get(i).getString("USE_AT"));                        //사용여부
    			jObject.put("registDt", eduMap.get(i).get("REGIST_DT"));                        //등록일시
    			jObject.put("registUserId", eduMap.get(i).getString("REGIST_USER_ID"));         //등록자
    			jObject.put("updtDt", eduMap.get(i).get("UPDT_DT"));                            //수정일시
    			jObject.put("updtUserId", eduMap.get(i).getString("UPDT_USER_ID"));             //수정자
    			jObject.put("cmmnGroupCode", eduMap.get(i).getString("CMMN_GROUP_CODE"));       //그룹코드
    			
    			jArray.put(jObject);
    		}
    		
    		
    		obj.put("detailInfo", jArray);//depth 1 배열
    		
    		System.out.println(obj.toString());
    		
    	} catch (JSONException e) {
    		e.printStackTrace();
    	}
    	
    	out.println(obj);
    	out.flush();
    	out.close();
    }
    
    /**
     * 시스템관리 > 공통코드 ASCII 코드번호 자동생성
     *
     * 수정일  : 2020. 08. 10.
     * 수정자  : 박진만
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/admin/common/mtCodeSnAsciiAjax.do")
    public void mtCodeSnAsciiAjax(@RequestParam Map<String, String> params, HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws Exception {
    	
    	JSONObject obj = new JSONObject(); //메인 depth
    	
    	res.setContentType("text/html; charset=utf-8");
    	PrintWriter out = res.getWriter();
    	
    	try {
    		List<EduMap> eduMap = adminMtCodeMngrService.cmmnCodeAsciiList3(rMap);
    		
    		JSONArray jArray = new JSONArray();
    		
    		for(int i=0; i < eduMap.size(); i++) {
    			JSONObject jObject = new JSONObject();
    			
    			jObject.put("cmmnCodeSn", eduMap.get(i).getString("CMMN_CODE_SN"));                //코드번호
    			
    			jArray.put(jObject);
    		}
    		
    		
    		obj.put("autoCdSn", jArray);//depth 1 배열
    		
    		System.out.println(obj.toString());
    		
    	} catch (JSONException e) {
    		e.printStackTrace();
    	}
    	
    	out.println(obj);
    	out.flush();
    	out.close();
    }
    
    /**
     * 시스템관리 > 광업권관리
     *
     * 수정일  : 2020. 07. 22.
     * 수정자  : 박진만
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 시스템관리관리 > 공통코드 리스트_Tree
    @RequestMapping(value = "/admin/sysman/minrgtManageDt.do")
    public String minrgtManageDt(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
    	
    	try {
    		// 메뉴정보
    		AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
    		menuInfo.adminMenuExec(request, res, rMap, adminCommonService);
    		
    		request.setAttribute("REQUEST_DATA", rMap);
    		
    	} catch (Exception e) {
    		
    		throw new Exception(e);
    	}
    	
    	return "/admin/sysman/minrgt_manage_detail";
    	
    }
    
    /**
     * 시스템관리 > 광업권관리
     *
     * 수정일  : 2020. 07. 22.
     * 수정자  : 박진만
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 시스템관리관리 > 공통코드 리스트_Tree
    @RequestMapping(value = "/admin/sysman/minrgtManage.do")
    public String minrgtManage(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
    	
    	try {
    		// 메뉴정보
    		AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
    		menuInfo.adminMenuExec(request, res, rMap, adminCommonService);
    		
    		request.setAttribute("REQUEST_DATA", rMap);
    		
    	} catch (Exception e) {
    		
    		throw new Exception(e);
    	}
    	
    	return "/admin/sysman/minrgt_manage";
    	
    }
    
    /**
     * 시스템관리 > 공통코드 리스트_Tree
     *
     * 수정일  : 2020. 07. 22.
     * 수정자  : 박진만
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 시스템관리관리 > 공통코드 리스트_Tree
    @RequestMapping(value = "/admin/sysman/mtcodeListTree.do")
    public String mtcodeListTree(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {
            // 메뉴정보
            AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            menuInfo.adminMenuExec(request, res, rMap, adminCommonService);

            List<EduMap> map = adminMtCodeMngrService.cmmnCodeTreeList(rMap);

            request.setAttribute("LIST_DATA",map);
            request.setAttribute("REQUEST_DATA", rMap);

        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "/admin/sysman/mtcode_list_tree";

    }
    
    /**
     * 시스템관리 > 공통코드 리스트_ASCII
     *
     * 수정일  : 2020. 08. 10.
     * 수정자  : 박진만
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/admin/common/mtAsciiCodeAjax.do")  //다중 for문 18분
    public void mtAsciiCodeAjax(@RequestParam Map<String, String> params, HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws Exception {
    	
    	res.setContentType("text/html; charset=utf-8");
    	PrintWriter out = res.getWriter();
    	
    	Gson gson = new Gson();
    	String json = null;
    	
    	try {
    		List<Map> cmmnTreeMapData = adminMtCodeMngrService.cmmnCodeAsciiList(params);
    		
    		json = gson.toJson(cmmnTreeMapData);
    	} catch(JSONException e) {
    		e.printStackTrace();
    	}
    	
    	out.println(json);
    	out.flush();
    	out.close();
    	
    }
    
    /**
     * 시스템관리 > 공통코드 리스트_Tree
     *
     * 수정일  : 2020. 07. 22.
     * 수정자  : 박진만
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/admin/common/mtCodeAjax.do")  //다중 for문 18분
    public void mtCodeAjax(@RequestParam Map<String, String> params, HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws Exception {
    	
    	res.setContentType("text/html; charset=utf-8");
    	PrintWriter out = res.getWriter();
    	
    	Gson gson = new Gson();
    	String json = null;
    	
    	try {
    		int cmmnTreeMapDataCount = adminMtCodeMngrService.cmmnCodeTreeListTotalCnt(params);
    		List<Map> cmmnTreeMapData = adminMtCodeMngrService.cmmnCodeTreeList2(params);

    		json = gson.toJson(cmmnTreeMapData);
    	} catch(JSONException e) {
    		e.printStackTrace();
    	}
    	
    	out.println(json);
    	out.flush();
    	out.close();
    	
    }
    
    /**
     * 시스템관리 > 공통코드 리스트_Tree
     *
     * 수정일  : 2020. 07. 22.
     * 수정자  : 박진만
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/admin/common/mtCodeDetailAjax.do")
    public void mtCodeDetailAjax(@RequestParam Map<String, String> params, HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws Exception {

    	JSONObject obj = new JSONObject(); //메인 depth

    	res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
    	
        try {
    		List<EduMap> eduMap = adminMtCodeMngrService.cmmnCodeTreeList(rMap);
    		
    		JSONArray jArray = new JSONArray();
    		
    		for(int i=0; i < eduMap.size(); i++) {
    			JSONObject jObject = new JSONObject();
    			
    			jObject.put("cmmnCodeSn", eduMap.get(i).getString("CMMN_CODE_SN"));                //코드번호
    			jObject.put("cmmnCodeNm", eduMap.get(i).getString("CMMN_CODE_NM"));             //코드명
    			jObject.put("cmmnCodeCn", eduMap.get(i).getString("CMMN_CODE_CN"));             //코드번호
    			jObject.put("cmmnCodeDpNo", eduMap.get(i).getInt("CMMN_CODE_DP_NO"));        //depth 번호
    			jObject.put("sysTy", eduMap.get(i).getString("SYS_TY"));                        //사용형태
    			jObject.put("upperCmmnCodeSn", eduMap.get(i).getString("UPPER_CMMN_CODE_SN"));     //상위 코드번호
    			jObject.put("inqireOrdr", eduMap.get(i).getInt("INQIRE_ORDR"));                 //코드순서
    			jObject.put("useAt", eduMap.get(i).getString("USE_AT"));                        //사용여부
    			jObject.put("registDt", eduMap.get(i).get("REGIST_DT"));                        //등록일시
    			jObject.put("registUserId", eduMap.get(i).getString("REGIST_USER_ID"));         //등록자
    			jObject.put("updtDt", eduMap.get(i).get("UPDT_DT"));                            //수정일시
    			jObject.put("updtUserId", eduMap.get(i).getString("UPDT_USER_ID"));             //수정자
    			jObject.put("cmmnGroupCode", eduMap.get(i).getString("CMMN_GROUP_CODE"));       //그룹코드
    			
    			jArray.put(jObject);
    		}
    		
    		
    		obj.put("detailInfo", jArray);//depth 1 배열

    		System.out.println(obj.toString());

        } catch (JSONException e) {
        	e.printStackTrace();
        }
		
		out.println(obj);
        out.flush();
        out.close();
	}
    
    /**
     * 시스템관리 > 공통코드 리스트_Tree
     *
     * 수정일  : 2020. 07. 22.
     * 수정자  : 박진만
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/admin/common/mtDoubleChkAjax.do")
    public void mtDoubleChkAjax(@RequestParam Map<String, String> params, HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws Exception {
    	res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		Gson gson = new Gson();
		String json = null;
		
		try {
			//사전시험 존재유무 체크
			int doubleChk = adminMtCodeMngrService.cmmnCodeDoubleChk(rMap);
			
			if(doubleChk > 0){
				rMap.setString("result", "false");
			} else {
				rMap.setString("result", "true");
			}
			
			json =  gson.toJson(rMap);

		} catch (Exception e) {
			log.error(e);
		}

		out.print(json);
		out.flush();
		out.close();
    }
    
    /**
     * 시스템관리 > 공통코드 리스트_Tree / 등록, 수정, 삭제
     *
     * 수정일  : 2020. 07. 22.
     * 수정자  : 박진만
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/admin/common/mtCodeSaveAjax.do")
    public void mtCodeSaveAjax(@RequestParam Map<String, String> params, HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws Exception {
    	res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		Gson gson = new Gson();
		String json = null;
		
		String msg = null;
		
		try {
			String pmode = params.get("pmode");
			params.put("sesUserId", rMap.getString("SES_USERID"));
			
			if (pmode.equals("INS")) {
				adminMtCodeMngrService.insertMtCdInfo(params);
				msg = "등록 되었습니다.";
			} else if (pmode.equals("UPD")) {
				adminMtCodeMngrService.updateMtCdInfo(params);
				msg = "수정 되었습니다.";
			} else if (pmode.equals("DEL")) {
				int cnt = adminMtCodeMngrService.mtCdDeleteChkCnt(params);
				
				if(cnt > 0) {
					msg = "하위코드를 먼저 삭제해주시기 바랍니다.";
					rMap.setString("result", "false");
				} else {
					adminMtCodeMngrService.deleteMtCdInfo(params);
					msg = "삭제 되었습니다.";
					rMap.setString("result", "true");
				}
			} else {
				msg = "저장내역이 없습니다.";
			}
			
			rMap.setString("msg", msg);
			
			json =  gson.toJson(rMap);

		} catch (Exception e) {
			log.error(e);
		}

		out.print(json);
		out.flush();
		out.close();
    }
    
	/*@RequestMapping(value = "/admin/common/mtCodeCudExec.do", method = RequestMethod.POST)
	public String mtCodeCudExec(@RequestParam Map<String, String> params, HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws Exception {
		String msg = null;
		try {

			String pmode = params.get("pmode");

			params.put("sesUserId", rMap.getString("SES_USERID"));

			if (pmode.equals("INS")) {
				adminMtCodeMngrService.insertMtCdInfo(params);
				msg = "등록 되었습니다.";
			} else if (pmode.equals("UPD")) {
				adminMtCodeMngrService.updateMtCdInfo(params);
				msg = "수정 되었습니다.";
			} else if (pmode.equals("DEL")) {
				adminMtCodeMngrService.deleteMtCdInfo(params);
				msg = "삭제 되었습니다.";
			} else {
				msg = "저장내역이 없습니다.";
			}

		} catch (Exception e) {
			throw new Exception(e);
		}

		return "forward:/admin/sysman/mtcodeListTree.do";

	}*/

	/**
     * 시스템관리 > 공통코드 리스트
     *
     * 수정일  : 2016. 5. 16.
     * 수정자  : 김학규
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 시스템관리관리 > 공통코드 리스트
    @RequestMapping(value = "/admin/sysman/mtcodeList.do")
    public String mtcodeList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
    	
    	try {
    		
    		// 메뉴정보
    		AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
    		menuInfo.adminMenuExec(request, res, rMap, adminCommonService);
    		
    		rMap.setString("useYn", ParamUtil.getStrParam(rMap.getString("useYn"), "Y"));
    		
    		int totalCnt = adminMtCodeMngrService.getMtcodeListCount(rMap);
    		
    		List<EduMap> map = adminMtCodeMngrService.getMtcodeList(rMap);
    		
    		request.setAttribute("LIST_DATA",map);
    		request.setAttribute("totalCnt",totalCnt);
    		
    		request.setAttribute("REQUEST_DATA", rMap);
    		
    	} catch (Exception e) {
    		
    		throw new Exception(e);
    	}
    	
    	return "/admin/sysman/mtcode_list";
    	
    }
    
    
    /**
     * 시스템관리 > 공통코드 등록/수정
     *
     * 수정일  : 2016. 5. 16.
     * 수정자  : 김학규
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 시스템관리관리 > 공통코드 등록/수정
    @RequestMapping(value = "/admin/sysman/mtcodeForm.do")
    public String mtcodeForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        // 메뉴정보
        AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
        menuInfo.adminMenuExec(request, res, rMap, adminCommonService);
        
        // 대분류 데이터
        if(rMap.getString("mtCode") != null && rMap.getString("qu") != null && !rMap.getString("pageMode").equals("reg") ) {
        	
        	request.setAttribute("VIEW_DATA", adminMtCodeMngrService.getMtcodInfo(rMap));
        }

        // 소분류 데이터
        if(!rMap.getString("mode").equals("mt") && rMap.getString("qu").equals("update")) {
        	request.setAttribute("SUB_VIEW_DATA", adminMtCodeMngrService.getMtcodeSubInfo(rMap));
        }
        
        // 등록구분이 없다면 대분류로 default 설정
        rMap.set("mode", ParamUtil.getStrParam(rMap.getString("mode"), "mt"));
        
        // 등록유형이 없다면 insert default 설정
        rMap.set("qu", ParamUtil.getStrParam(rMap.getString("qu"), "insert"));

        
        request.setAttribute("REQUEST_DATA", rMap);
        
        return "/admin/sysman/mtcode_form";

    }

    /**
     * 시스템관리 > 공통코드 등록/수정
     *
     * 수정일  : 2016. 5. 16.
     * 수정자  : 김학규
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 시스템관리관리 > 공통코드 등록/수정 실행
    @RequestMapping(value = "/admin/sysman/mtcodeFormExec.do")
    public String mtcodeFormExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {

            // 메뉴정보
            AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            menuInfo.adminMenuExec(request, res, rMap, adminCommonService);

            // 액션값
            String qu = rMap.getString("qu");

            // 모드명 대분류 : mt 소분류 mtsub
            String mode = rMap.getString("mode");

            //리턴 페이지 설정을 위한 세팅

            // alert 메세지
            String msg="";
            String nextSubcmd="list"; // 실행후 이동 화면 정의
            String mtCode=ParamUtil.getStrParam(rMap.getString("mtCode"), "");
            String mtSubCode=ParamUtil.getStrParam(rMap.getString("mtSubCode"), "");

            // 분류, 코드명 대문자로 치환
            mtCode = mtCode.toUpperCase();
            mtSubCode = mtSubCode.toUpperCase();

            rMap.setString("mtCode" , mtCode);
            rMap.setString("mtSubCode" , mtSubCode);
            // 대분류 등록/수정
            if(mode.equals("mt")){
                //등록
                if(qu.equals("insert")){
                    adminMtCodeMngrService.insertMtcodeInfo(rMap);
                    qu="";
                    msg="등록하였습니다.";
                // 수정
                }else if(qu.equals("update")){
                    adminMtCodeMngrService.updateMtcodeInfo(rMap);
                    qu="update";
                    msg="수정하였습니다.";
                }
            }
            // 소분류 등록/수정
            else {
                //등록
                if(qu.equals("insert")){
                    adminMtCodeMngrService.insertMtcodeSubInfo(rMap);
                    //등록후 소분류 목록으로 이동
                    qu="";
                    msg="등록하였습니다.";
                    //등록후 소분류 목록으로 이동
                }
                // 수정
                else if(qu.equals("update")){
                    adminMtCodeMngrService.updateMtcodeSubInfo(rMap);
                    qu="update";
                    msg="수정하였습니다.";

                }

            }
            request.setAttribute("msg", msg);
            request.setAttribute("returnUrl", "/admin/sysman/mtcodeSubList.do");

            request.setAttribute("mtCode", mtCode);
            request.setAttribute("mtSubCode", mtSubCode);
            request.setAttribute("qu", qu);
            request.setAttribute("mode", mode);

            
            System.out.println("mtCode===> " + mtCode);
            
            
        } catch (Exception e) {
            

            request.setAttribute("msg", "등록에 실패 하였습니다.");
            request.setAttribute("returnUrl", "/admin/sysman/mtcodeSubList.do");


            throw new Exception(e);
        }

        
        
     
        
        return "/admin/sysman/mtcode_exec";

    }

    /**
     * 시스템관리 > 공통코드 상세 리스트
     *
     * 수정일  : 2016. 5. 16.
     * 수정자  : 김학규
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 시스템관리관리 > 공통코드 상세 리스트
    @RequestMapping(value = "/admin/sysman/mtcodeSubList.do")
    public String mtcodeSubList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {

            // 메뉴정보
            AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            menuInfo.adminMenuExec(request, res, rMap, adminCommonService);

            request.setAttribute("LIST_DATA", adminMtCodeMngrService.getMtcodeSubList(rMap));
            request.setAttribute("VIEW_DATA", adminMtCodeMngrService.getMtcodInfo(rMap));

        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "/admin/sysman/mtcode_sub_list";

    }


    /**
     * 시스템관리 > 공통코드 소분류 삭제
     *
     * 수정일  : 2016. 5. 31.
     * 수정자  : 김학규
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 시스템관리관리 > 공통코드 상세 리스트
    @RequestMapping(value = "/admin/sysman/deleteMtcodeSubInfo.do")
    public String mtcodeDelete(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
     // 모드명 대분류 : mt 소분류 mtsub
        String mode = rMap.getString("mode");
        String msg="";
        String mtCode=ParamUtil.getStrParam(rMap.getString("mtCode"), "");

        if(!"mt".equals(mode)){
            try{
                adminMtCodeMngrService.deleteMtcodeSubInfo(rMap);
                msg="삭제되었습니다.";
            }catch(Exception e){
                msg="삭제중 에러가 발생하였습니다. 다시 시도해주세요";
            }
        }

        request.setAttribute("returnUrl", "/admin/sysman/mtcodeList.do");

        request.setAttribute("msg", msg);
        request.setAttribute("mtCode", mtCode);
        request.setAttribute("mode", mode);

        return "/admin/sysman/mtcode_exec";
    }

}

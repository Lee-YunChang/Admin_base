package com.webapp.admin.ctrl;

import java.io.File;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import com.sangs.session.UserSessionManager;
import com.sangs.session.UserSessionVO;
import com.sangs.support.AdminMenu;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;
import com.sangs.support.SangsMap;
import com.sangs.support.SangsProperties;
import com.sangs.util.DownloadServlet;
import com.sangs.util.EgovFileUploadUtil;
import com.sangs.util.EgovFormBasedFileVo;
import com.sangs.util.SangsUtil;
import com.sangs.util.StringUtil;
import com.webapp.admin.service.AdminBoardService;
import com.webapp.admin.service.AdminCommonService;

/**
 * 관리자 사이트관리(게시판) 관련 컨트롤러
 * Description : 
 *
 * Modification Information
 * 수정일			 수정자							수정내용
 * -----------	-----------------------------  -------
 * 2016. 4. 15.	 이진영, sweetjy09@sangs.co.kr 	최초작성
 *
 */
@Controller
public class AdminBoardController {
	
private Logger log = LogManager.getLogger(this.getClass());

    @Resource(name = "adminCommonService") 
    private AdminCommonService    adminCommonService;
    
    @Resource(name = "adminBoardService")
    private AdminBoardService    adminBoardService;
    
    // 게시판 공통 카테고리
    public void bbsCategoryList(HttpServletRequest request, DataMap rMap) throws Exception {
    	String bcateno = rMap.getString("bcateno");
    	String bbsBcateSiteFaq = SangsProperties.getProperty("Globals.bbsBcateSiteFaq");
    	String bbsBcateSiteData = SangsProperties.getProperty("Globals.bbsBcateSiteData");
    	String bbsBcateSiteNews = SangsProperties.getProperty("Globals.bbsBcateSiteNews");
    	String bbsBcateSiteEduDicary = SangsProperties.getProperty("Globals.bbsBcateSiteEduDicary");
    	String bbsBcateSiteFnncDicary = SangsProperties.getProperty("Globals.bbsBcateSiteFnncDicary");
    	
    	// 관할부서
    	String mtCode = "";
        // 자주묻는질문 분류
        if(bcateno.equals(bbsBcateSiteFaq)) {
            mtCode = SangsProperties.getProperty("Globals.mtCode_MT_CATE_CODE");
            rMap.setString("mtCode", mtCode);
            request.setAttribute("categoryData2", adminCommonService.getMtSubCodeList(rMap));
        }
       
        EduMap titleMap = new EduMap();
    	List typeList = adminBoardService.getBoardCategoryList(rMap);
    	if(typeList.size() > 0){
    		titleMap = (EduMap)typeList.get(0);
    	}
    	request.setAttribute("titleMap", titleMap);
    	
    	request.setAttribute("bbsBcateSiteData", bbsBcateSiteData);
    	request.setAttribute("bbsBcateSiteNews", bbsBcateSiteNews);
    	request.setAttribute("bbsBcateSiteEduDicary", bbsBcateSiteEduDicary);
    	request.setAttribute("bbsBcateSiteFnncDicary", bbsBcateSiteFnncDicary);
    }
    
    /**
     * 게시판 리스트
     * 
     * @date	: 2016. 4. 15.						
     * @author	: 이진영, sweetjy09@sangs.co.kr	
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 게시판 리스트
    @RequestMapping(value = "/admin/site/bbsList.do")
    public String bbsList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {
        
        	// 메뉴정보
        	AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
        	menuInfo.adminMenuExec(request, res, rMap, adminCommonService);
        	
        	// 게시판카테고리
        	bbsCategoryList(request, rMap);
        	
        	List<EduMap> resultList = adminBoardService.getBoardList(rMap);
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

        return "admin/site/bbs_list";
    }
    
    /**
     * 게시글 상세보기
     * 
     * @date	: 2016. 4. 15.						
     * @author	: 이진영, sweetjy09@sangs.co.kr	
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 게시글 상세보기
    @RequestMapping(value = "/admin/site/bbsView.do")
    public String bbsView(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {
        
        	// 메뉴정보
        	AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
        	menuInfo.adminMenuExec(request, res, rMap, adminCommonService);
        	
        	adminBoardService.updateBoardViewCnt(rMap);
        		
        	// 게시판카테고리
        	bbsCategoryList(request, rMap);
        	
        	//게시판 상세
        	request.setAttribute("map", adminBoardService.getBoardView(rMap));
        	request.setAttribute("fileList", adminBoardService.getFileList(rMap));
        	//request.setAttribute("cmap", adminBoardService.getBoardCategoryInfo(rMap));
        	
    		request.setAttribute("REQUEST_DATA", rMap);
    		
        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/site/bbs_view";
    }
    
    /**
     * 게시글 등록/수정 폼
     * 
     * @date	: 2016. 4. 15.					
     * @author	: 이진영, sweetjy09@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 게시글 등록/수정 폼
    @RequestMapping(value = "/admin/site/bbsForm.do")
    public String bbsForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {
        
        	// 메뉴정보
        	AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
        	menuInfo.adminMenuExec(request, res, rMap, adminCommonService);
        	
        	//게시판 상세
        	request.setAttribute("map", adminBoardService.getBoardView(rMap));
        	
        	// 게시판카테고리
        	bbsCategoryList(request, rMap);
        	
        	
        	request.setAttribute("fileList", adminBoardService.getFileList(rMap));
        	request.setAttribute("cmap", adminBoardService.getBoardCategoryInfo(rMap));
        	
    		request.setAttribute("REQUEST_DATA", rMap);
    		
        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/site/bbs_form";
    }
    
    /**
     * 게시글 등록/수정/삭제 실행
     * 
     * @date	: 2016. 4. 15.					
     * @author	: 이진영, sweetjy09@sangs.co.kr 
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 게시글 등록/수정/삭제 실행
    @RequestMapping(value = "/admin/site/bbsExec.do", method = RequestMethod.POST)
    public String bbsExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {
        	
        	// 메뉴정보
        	AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
        	menuInfo.adminMenuExec(request, res, rMap, adminCommonService);
        	
        	UserSessionVO userVo = UserSessionManager.getUserSessionVO(request);
        	
        	// 특수문자 치환 (insert)
        	rMap.setString("title", StringUtil.setContent(rMap.getString("title")));
        	rMap.setString("writer", userVo.getUserName()); 
        	rMap.setInt("userNo", userVo.getUserNo());
        	        	
    	   	String qu = rMap.getString("qu");
    	   		//삭제부분
    		   	if(qu.equals("delete")){
    		   		//게시글 삭제
    		   		adminBoardService.deleteBoardInfo(rMap);
    		   		adminBoardService.deleteFileInfo(rMap); 
    		   		
    		   	} else if (qu.equals("insert") || qu.equals("update") || qu.equals("reply")){
    		   		
    			   	if(qu.equals("insert") || qu.equals("reply")){
    			    	
    			   		int bbsNo = adminBoardService.getMaxBoardNo(rMap);
    			   		
    				   	rMap.setInt("bbsNo", bbsNo);
    				   	rMap.setString("writer", userVo.getUserName());
    				   	
    				    adminBoardService.insertBoardInfo(request, rMap);
    				    adminBoardService.updateFileBbsno(request,rMap);
    				   	
    				  //수정부분 
    			   	} else if(qu.equals("update")) {
    			   		 
    			   	 	adminBoardService.updateBoardInfo(request, rMap);
	    			   	adminBoardService.updateFileBbsno(request,rMap);
	   				    
    			   	}
    		}
    		request.setAttribute("REQUEST_DATA", rMap);
    		
        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/site/bbs_exec";
    }

	/**
	 * 자료실 파일 삭제
	 * @param res
	 * @param rMap
	 * @throws Exception
	 */
	@RequestMapping(value = "/admin/site/deleteEdBbsFileAjax.do")
	public void deleteEdBbsFileAjax(HttpServletResponse res, DataMap rMap) throws Exception {
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		Gson gson = new Gson();
		String json = null;
		
		try {
			adminBoardService.deleteFileInfo(rMap);
			json = gson.toJson("SUCCESS");

		} catch (Exception e) {
			json = gson.toJson("FAIL");
		}

		out.print(json);
		out.flush();
		out.close();
	}
	
	/**
	 * 자료실 파일 삭제
	 * @param res
	 * @param rMap
	 * @throws Exception
	 */
	@RequestMapping(value = "/admin/tutor/deleteEdBbsFileAjax.do")
	public void deleteEdTutorBbsFileAjax(HttpServletResponse res, DataMap rMap) throws Exception {
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		Gson gson = new Gson();
		String json = null;
		
		try {
			adminBoardService.deleteEdDataFile(rMap);
			json = gson.toJson("SUCCESS");

		} catch (Exception e) {
			json = gson.toJson("FAIL");
		}

		out.print(json);
		out.flush();
		out.close();
	}
	
    /**
     * 자료실 게시판 리스트(콘텐츠)
     * 
     * @date	: 2016. 4. 15.						
     * @author	: 이진영, sweetjy09@sangs.co.kr	
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 자료실 게시판 리스트(콘텐츠)
    @RequestMapping(value = "/admin/site/bbsContentsList.do")
    public String bbsContentsList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {
        	// 메뉴정보
        	AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
        	menuInfo.adminMenuExec(request, res, rMap, adminCommonService);
       
        	// 게시판카테고리
        	bbsCategoryList(request, rMap);
      
        	List<EduMap> resultList = adminBoardService.getContentsList(rMap);
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

        return "admin/site/bbs_contents_list";
    }
    
    /**
     * 게시글 상세보기
     * 
     * @date	: 2016. 4. 15.						
     * @author	: 이진영, sweetjy09@sangs.co.kr	
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 게시글 상세보기
    @RequestMapping(value = "/admin/site/bbsContentsView.do")
    public String bbsContentsView(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {
        
        	// 메뉴정보
        	AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
        	menuInfo.adminMenuExec(request, res, rMap, adminCommonService);
        	
        	adminBoardService.updateBoardViewCnt(rMap);
        		
        	// 게시판카테고리
        	bbsCategoryList(request, rMap);
        	
        	//게시판 상세
        	request.setAttribute("map", adminBoardService.getBoardView(rMap));
        	request.setAttribute("fileList", adminBoardService.getFileList(rMap));
        	//request.setAttribute("cmap", adminBoardService.getBoardCategoryInfo(rMap));
        	
    		request.setAttribute("REQUEST_DATA", rMap);
    		
        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/site/bbs_contents_view";
    }
    
    /**
     * 자료실 게시판(교육자료) 등록/수정 폼
     * 
     * @date	: 2016. 4. 15.					
     * @author	: 이진영, sweetjy09@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 자료실 게시판(교육자료) 등록/수정 폼
    @RequestMapping(value = "/admin/site/bbsContentsForm.do")
    public String bbsContentsForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {
        
        	// 메뉴정보
        	AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
        	menuInfo.adminMenuExec(request, res, rMap, adminCommonService);
        	
        	//게시판 상세
        	request.setAttribute("map", adminBoardService.getBoardView(rMap));
        	
        	// 게시판카테고리
        	bbsCategoryList(request, rMap);
        	adminBoardService.updateBoardViewCnt(rMap);
        	
        	request.setAttribute("fileList", adminBoardService.getFileList(rMap));
        	request.setAttribute("cmap", adminBoardService.getBoardCategoryInfo(rMap));
        	
    		request.setAttribute("REQUEST_DATA", rMap);
    		
        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/site/bbs_contents_form";
    }
    
    /**
     * 자료실 게시판(음성낭독,번역문,교육컨텐츠) 등록/수정 폼
     * 
     * @date	: 2016. 4. 15.					
     * @author	: 이진영, sweetjy09@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 자료실 게시판(음성낭독,번역문,교육컨텐츠) 등록/수정 폼
    @RequestMapping(value = "/admin/site/bbsContentsForm2.do")
    public String bbsContentsForm2(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {
        
        	// 메뉴정보
        	AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
        	menuInfo.adminMenuExec(request, res, rMap, adminCommonService);
        	
        	//게시판 상세
        	request.setAttribute("map", adminBoardService.getBoardView(rMap));
        	
        	// 게시판카테고리
        	bbsCategoryList(request, rMap);
        	adminBoardService.updateBoardViewCnt(rMap);
        	
        	String bbsNegative = SangsProperties.getProperty("Globals.bbsBcateSiteNegative");
        	String bbsAdv = SangsProperties.getProperty("Globals.bbsBcateSiteAdv");
        	String bbsYtn = SangsProperties.getProperty("Globals.bbsBcateYtnCampaign");
        	String bbsResult = SangsProperties.getProperty("Globals.bbsBcateResultMovie");
        	String bbsOpenEdu = SangsProperties.getProperty("Globals.bbsBcateOpenEdu"); 
        	
        	EduMap map = adminBoardService.getBoardView(rMap);
        	List<EduMap> fileList = adminBoardService.getDataFileList(rMap);
        	if(rMap.getString("qu").equals("update")) {
        		if(map.getInt("BCATENO") == Integer.parseInt(bbsNegative) || map.getInt("BCATENO") == Integer.parseInt(bbsAdv) || map.getInt("BCATENO") == Integer.parseInt(bbsYtn) || map.getInt("BCATENO") == Integer.parseInt(bbsResult)|| map.getInt("BCATENO") == Integer.parseInt(bbsOpenEdu)){//음성낭독, 교육컨텐츠일 때 파일 첨부가 안되어있다면
        			if(fileList.size() == 1) {
        				if(fileList.get(0).get("FGUBUN").equals("VIDEO")){//비디오가 안되어있다면
        					rMap.setString("nullImg", "Y");
        				} else if(fileList.get(0).get("FGUBUN").equals("IMG")){//이미지가 안되어있다면
        					rMap.setString("nullVideo", "Y");
        				}
        			}
        		}
        	}
        	
        	request.setAttribute("fileList", adminBoardService.getDataFileList(rMap));
        	request.setAttribute("cmap", adminBoardService.getBoardCategoryInfo(rMap));
        	
    		request.setAttribute("REQUEST_DATA", rMap);
    		
        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/site/bbs_contents_form2";
    }
    
    /**
     * 지식터 파일다운로드
     * @param url
     * @param msg
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/admin/site/filedown.do")
    public String eduFiledown(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException {

        DownloadServlet filedown = new DownloadServlet();
        boolean result;

        try {
            //rMap.setString("filename", "../6BAE7B3F1CBB415FBE6A15D65DB18BE7.xls");
            rMap.setString("filename", SangsUtil.replaceAll(rMap.getString("filename"), "../", ""));
            //상위경로 진입 방지

            if(rMap.containsKey("sampleDown")){
                req.setAttribute("REQUEST_DATA", rMap);
                return "/common/file_down";
            }

            rMap.setString("fileId", req.getParameter("fileId"));
            rMap.setString("bbsNo", req.getParameter("bbsNo"));
            rMap.setString("fileSeq", req.getParameter("fileSeq"));
            
            String bbsData = SangsProperties.getProperty("Globals.bbsBcateSiteData");
        	String bbsNegative = SangsProperties.getProperty("Globals.bbsBcateSiteNegative");
        	String bbsTranslation = SangsProperties.getProperty("Globals.bbsBcateSiteTranslation");
        	String bbsAdv = SangsProperties.getProperty("Globals.bbsBcateSiteAdv");
        	String bbsYtn = SangsProperties.getProperty("Globals.bbsBcateYtnCampaign");
        	String bbsResult = SangsProperties.getProperty("Globals.bbsBcateResultMovie");
        	String bbsOpenEdu = SangsProperties.getProperty("Globals.bbsBcateOpenEdu");
    			
			if(bbsNegative.equals(rMap.getString("bcateno")) || bbsTranslation.equals(rMap.getString("bcateno")) || bbsAdv.equals(rMap.getString("bcateno"))|| bbsResult.equals(rMap.getString("bcateno"))|| bbsYtn.equals(rMap.getString("bcateno"))|| bbsOpenEdu.equals(rMap.getString("bcateno"))) { //자료실 이라면
				result = filedown.downLoadFile(req, res, adminBoardService.getFileInfo2(rMap));
			} else { // 공지사항,교육안내,자주묻는질문, 자료실 > 교육자료라면
				result = filedown.downLoadFile(req, res, adminBoardService.getFileInfo(rMap));
			}

            if (result) {
                return null;
            } else {
                return "/common/cmmn_error";
            }

        } catch (Exception e) {
        	return "common/cmmn_error";
        }
    }
    
    /**
     * 자료실 게시판(콘텐츠) 등록/수정/삭제 실행 - 안쓰는것같음
     * 
     * @date	: 2016. 4. 15.					
     * @author	: 이진영, sweetjy09@sangs.co.kr 
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 자료실 게시판(콘텐츠) 등록/수정/삭제 실행
    @RequestMapping(value = "/admin/site/bbsContentsExec.do", method = RequestMethod.POST)
    public String bbsContentsExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

    	try {
	    	// 메뉴정보
	    	AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
	    	menuInfo.adminMenuExec(request, res, rMap, adminCommonService);
	    	
	    	UserSessionVO userVo = UserSessionManager.getUserSessionVO(request);
	    	
	    	// 특수문자 치환 (insert)
	    	rMap.setString("title", StringUtil.setContent(rMap.getString("title")));
	    	rMap.setString("writer", userVo.getUserName()); 
	    	rMap.setInt("userNo", userVo.getUserNo());
	    	        	
		   	String qu = rMap.getString("qu");
		   		//삭제부분
			   	if(qu.equals("delete")){
			   		//게시글 삭제
			   		adminBoardService.deleteBoardInfo(rMap);
			   		adminBoardService.deleteFileInfo(rMap); 
			   		
			   	} else if (qu.equals("insert") || qu.equals("update") || qu.equals("reply")){
			   		
				   	if(qu.equals("insert") || qu.equals("reply")){
				    	
				   		int bbsNo = adminBoardService.getMaxBoardNo(rMap);
				   		
					   	rMap.setInt("bbsNo", bbsNo);
					   	rMap.setString("writer", userVo.getUserName());
					   	
					    adminBoardService.insertBoardInfo(request, rMap);
					    adminBoardService.updateFileBbsno(request,rMap);
					   	
					  //수정부분 
				   	} else if(qu.equals("update")) {
				   		 
				   	 	adminBoardService.updateBoardInfo(request, rMap);
	    			   	adminBoardService.updateFileBbsno(request,rMap);
	   				    
				   	}
			}
			request.setAttribute("REQUEST_DATA", rMap);
			
	    } catch (Exception e) {
	        
	        throw new Exception(e);
	    }


        return "admin/site/bbs_contents_exec";
    }
    /**
     * 팝업관리 리스트
     * 
     * @date	: 2016. 4. 15.					
     * @author	: 이진영, sweetjy09@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 팝업관리 리스트
    @RequestMapping(value = "/admin/site/popupList.do")
    public String popupList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {
        
        	// 메뉴정보
        	AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
        	menuInfo.adminMenuExec(request, res, rMap, adminCommonService);

        	request.setAttribute("resultList", adminBoardService.getPopupList(rMap));
    		request.setAttribute("REQUEST_DATA", rMap);
    		
        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/site/popup_list";
    }
    
    /**
     * 팝업 상세보기
     * 
     * @date	: 2016. 4. 15.					
     * @author	: 이진영, sweetjy09@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 팝업 상세보기
    @RequestMapping(value = "/admin/site/popupView.do")
    public String popupView(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {
        
        	// 메뉴정보
        	AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
        	menuInfo.adminMenuExec(request, res, rMap, adminCommonService);

        	request.setAttribute("popupInfo", adminBoardService.getPopupView(rMap));
    		request.setAttribute("REQUEST_DATA", rMap);
    		
        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/site/popup_view";
    }
    
    /**
     * 팝업 등록 폼
     * 
     * @date	: 2016. 4. 15.					
     * @author	: 이진영, sweetjy09@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 팝업 등록 폼
    @RequestMapping(value = "/admin/site/popupForm.do")
    public String popupForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {
        
        	// 메뉴정보
        	AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
        	menuInfo.adminMenuExec(request, res, rMap, adminCommonService);

        	request.setAttribute("popupInfo", adminBoardService.getPopupView(rMap));
    		request.setAttribute("REQUEST_DATA", rMap);
    		
        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/site/popup_form";
    }
    
    /**
     * 팝업 등록/수정
     * 
     * @date	: 2016. 4. 15.					
     * @author	: 이진영, sweetjy09@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 팝업 등록/수정
    @RequestMapping(value = "/admin/site/popupExec.do")
    public String popupExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {
        
        	// 메뉴정보
        	AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
        	menuInfo.adminMenuExec(request, res, rMap, adminCommonService);

        	rMap.setString("pop_title", StringUtil.setContent(rMap.getString("popTitle")));

    	   	if(rMap.getString("qu").equals("delete")){
    	   		adminBoardService.deletePopupInfo(rMap);
    	   		
    	   	}else if(rMap.getString("qu").equals("insert") || rMap.getString("qu").equals("update")){

    	   		
    		   	if(rMap.getString("qu").equals("insert")){
    		   		adminBoardService.insertPopupInfo(rMap);
    			   	
    		   	}else if(rMap.getString("qu").equals("update")){
    		   		adminBoardService.updatePopupInfo(rMap);
    		   	}
    	   	}
    		request.setAttribute("REQUEST_DATA", rMap);
    		
        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/site/popup_exec";
    }
    
    
    /**
     * 상시설문관리
     * 
     * @date	: 2016. 8. 30					
     * @author	: 황두은, hde3314@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 상시설문관리 리스트
    @RequestMapping(value = "/admin/site/surveyList.do")
    public String surveyList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {
        
        	// 메뉴정보
        	AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
        	menuInfo.adminMenuExec(request, res, rMap, adminCommonService);

        	request.setAttribute("resultList", adminBoardService.getSurveyList(rMap));
    		request.setAttribute("REQUEST_DATA", rMap);
    		
        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/site/survey_list";
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
    @RequestMapping(value = "/admin/site/surveyExcelPopup.do")
    public String surveyExcelPopup(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {
        	// 메뉴정보
        	AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
        	menuInfo.adminMenuExec(request, res, rMap, adminCommonService);

        	request.setAttribute("resultList", adminBoardService.getSurveyList(rMap));
    		request.setAttribute("REQUEST_DATA", rMap);
    		
        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/site/survey_excelPopup";
    }
    
    /**
     * 엑셀다운(문제은행양식,설문양식)
     * @param url
     * @param msg
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/admin/site/excelFiledown.do")
    public String surveyExcelFiledown(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException {

        DownloadServlet filedown = new DownloadServlet();
        boolean result;

        try {
            result = filedown.downLoadFile(req, res, rMap);

            if (result) {
                return null;
            } else {
                return "/common/cmmn_error";
            }

        } catch (Exception e) {
        	return "common/cmmn_error";
        }
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
     * 배너관리
     * 
     * @date	: 2016. 9. 8			
     * @author	: 황두은, hde3314@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 배너관리 리스트
    @RequestMapping(value = "/admin/site/bannerList.do")
    public String bannerList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {
        
        	// 메뉴정보
        	AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
        	menuInfo.adminMenuExec(request, res, rMap, adminCommonService);
	   		
        	request.setAttribute("resultList", adminBoardService.getBannerList(rMap));
    		request.setAttribute("REQUEST_DATA", rMap);
    		
        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/site/banner_list";
    }
    
    /**
     * 배너 등록 폼
     * 
     * @date	: 2016. 9. 8					
     * @author	: 황두은, hde3314@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
     // TODO: 배너 등록 폼
    @RequestMapping(value = "/admin/site/bannerForm.do")
    public String bannerForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
    	   try {

    		// 메뉴정보
           	AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
           	menuInfo.adminMenuExec(request, res, rMap, adminCommonService);

           	rMap.setString("useAtCnt", "Y");
           	request.setAttribute("resultList", adminBoardService.getBannerList(rMap));
           	
           	
           	List<EduMap> resultList = adminBoardService.getBannerList(rMap);
    		
    		request.setAttribute("resultList", resultList);
    		int useAtCnt = 0;
    		if (resultList != null && resultList.size() > 0) {
    			useAtCnt = resultList.get(0).getInt("USEATCNT");
    		}
    		request.setAttribute("useAtCnt", useAtCnt);

           	request.setAttribute("bannerInfo", adminBoardService.getBannerView(rMap));
       		request.setAttribute("REQUEST_DATA", rMap);   
       		
           } catch (Exception e) {
               
               throw new Exception(e);
           }

           return "admin/site/banner_form";
       }
    
    /**
     * 배너 등록/수정
     * 
     * @date	: 2016. 9. 8					
     * @author	: 황두은, hde3314@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 배너 등록/수정
    @RequestMapping(value = "/admin/site/bannerExec.do")
    public String bannerExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {
        	// 메뉴정보
        	AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
        	menuInfo.adminMenuExec(request, res, rMap, adminCommonService);
        	
        	UserSessionVO userVo = UserSessionManager.getUserSessionVO(request);
        	rMap.setInt("registNo", userVo.getUserNo()); 
        	
    	   	if(rMap.getString("qu").equals("delete")){
    	   		adminBoardService.deleteBannerInfo(rMap);
    	   		
    	   	}else if(rMap.getString("qu").equals("insert") || rMap.getString("qu").equals("update")){
    	   		
    		   	if(rMap.getString("qu").equals("insert")){
    		   		
    		   		int bannerno = adminBoardService.getMaxBannerNo(rMap);
				   	rMap.setInt("bannerno", bannerno);
    		   		adminBoardService.insertBannerInfo(request,rMap);
    			
    		   	}else if(rMap.getString("qu").equals("update")){
    		   		adminBoardService.updateBannerInfo(request, rMap);
    		   	}
    	   	}
    		request.setAttribute("REQUEST_DATA", rMap);
    		
        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/site/banner_exec";
    }
    
    
    	/**
         * 지난설문관리 리스트
         * 
         * @date	: 2016. 12. 7					
         * @author	: 구동림, rnehdfla12@sangs.co.kr
         *
         * @param request
         * @param res
         * @param rMap
         * @return
         * @throws Exception
         */
        // TODO: 지난설문관리 리스트
        @RequestMapping(value = "/admin/site/lastSurveyList.do")
        public String lastSurveyList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

            try {
            	// 메뉴정보
            	AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            	menuInfo.adminMenuExec(request, res, rMap, adminCommonService);
            	
            	String bcateno = SangsProperties.getProperty("Globals.bbsBcateLastSurvey");
            	rMap.setString("bcateno" , bcateno);
            	
            	List<EduMap> resultList = adminBoardService.getBoardList(rMap);
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

            return "admin/site/last_survey_list";
        }
        
        /**
         * 지난설문관리 등록폼
         * 
         * @date	: 2016. 12. 7					
         * @author	: 구동림, rnehdfla12@sangs.co.kr
         *
         * @param request
         * @param res
         * @param rMap
         * @return
         * @throws Exception
         */
        // TODO: 지난설문관리 등록폼
        @RequestMapping(value = "/admin/site/lastSurveyForm.do")
        public String lastSurveyForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

            try {
            	// 메뉴정보
            	AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            	menuInfo.adminMenuExec(request, res, rMap, adminCommonService);
            	
            	//게시판 상세
            	request.setAttribute("map", adminBoardService.getBoardView(rMap));
            	
            	// 게시판카테고리
            	bbsCategoryList(request, rMap);
            	
            	request.setAttribute("fileList", adminBoardService.getFileList(rMap));
            	
        		request.setAttribute("REQUEST_DATA", rMap);
        		
            } catch (Exception e) {
                
                throw new Exception(e);
            }

            return "admin/site/last_survey_form";
        }
        
        /**
         * 지난설문관리 등록/수정/삭제 실행
         * 
         * @date	: 2016. 4. 15.					
         * @author	: 이진영, sweetjy09@sangs.co.kr 
         *
         * @param request
         * @param res
         * @param rMap
         * @return
         * @throws Exception
         */
        // TODO: 지난설문관리 등록/수정/삭제 실행
        @RequestMapping(value = "/admin/site/lastSurveyExec.do", method = RequestMethod.POST)
        public String lastSurveyExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

            try {
            	
            	// 메뉴정보
            	AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            	menuInfo.adminMenuExec(request, res, rMap, adminCommonService);
            	
            	UserSessionVO userVo = UserSessionManager.getUserSessionVO(request);
            	
            	String qu = rMap.getString("qu");
            	
            	if(!qu.equals("") && qu.equals("insert")){
            		int bbsNo = adminBoardService.getMaxBoardNo(rMap);
            		
            		rMap.setInt("bbsNo", bbsNo);
				   	rMap.setString("writer", userVo.getUserName());
				   	
				   	adminBoardService.insertBoardInfo(request, rMap);
				   	
				   	adminBoardService.updateFileBbsno(request,rMap);
				   	
            		request.setAttribute("msg", "등록되었습니다.");
            	}else if(!qu.equals("") && qu.equals("update")){
            		//게시글 수정
            		adminBoardService.updateBoardInfo(request, rMap);
			   	 	
 				    adminBoardService.updateFileBbsno(request,rMap);
            		request.setAttribute("msg", "수정되었습니다.");
            	}else if(!qu.equals("") && qu.equals("delete")){
            		
            		//게시글 삭제
            		adminBoardService.deleteBoardInfo(rMap);
            		
            		adminBoardService.deleteFileInfo(rMap); 
            		
            		request.setAttribute("msg", "삭제되었습니다.");
            	}
            	
        		request.setAttribute("REQUEST_DATA", rMap);
        		
            } catch (Exception e) {
                
                throw new Exception(e);
            }

            return "admin/site/last_servey_exec";
        }

        /**
         * 지난설문관리글 상세보기
         * 
         * @date	: 2016. 4. 15.						
         * @author	: 이진영, sweetjy09@sangs.co.kr	
         *
         * @param request
         * @param res
         * @param rMap
         * @return
         * @throws Exception
         */
        // TODO: 지난설문관리글 상세보기
        @RequestMapping(value = "/admin/site/lastSurveyView.do")
        public String lastSurveyView(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

            try {
            
            	// 메뉴정보
            	AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
            	menuInfo.adminMenuExec(request, res, rMap, adminCommonService);
            	
            	adminBoardService.updateBoardViewCnt(rMap);
            		
            	// 게시판카테고리
            	bbsCategoryList(request, rMap);
            	
            	//게시판 상세
            	request.setAttribute("map", adminBoardService.getBoardView(rMap));
            	request.setAttribute("fileList", adminBoardService.getFileList(rMap));
            	
        		request.setAttribute("REQUEST_DATA", rMap);
        		
            } catch (Exception e) {
                
                throw new Exception(e);
            }

            return "admin/site/last_survey_view";
        }
        
       
        
        /**
         * 회원 가입 아이디 중복체크 (ajax)
         * @param request
         * @param rMap
         * @throws Exception
         */
        @RequestMapping(value = "/admin/site/tutorCommentExe.do")
        public void ajaxMovePageList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
            res.setContentType("text/html; charset=utf-8");
            PrintWriter out = res.getWriter();
            Gson gson = new Gson();
            String json = null;

            try {
            	
            	if(rMap.get("pmode").equals("SUB")){ //등록
            		adminBoardService.tutorBoardReplySubmit(rMap);
        		} else if(rMap.get("pmode").equals("DEL")){//삭제
        			adminBoardService.tutorBoardReplyDelete(rMap);
        		} else if(rMap.get("pmode").equals("RESUB")){//답글등록
        			adminBoardService.tutorBoardCmtReplySubmit(rMap);
        		}

                List<Map<String, Object>> checkStat = adminBoardService.getTutorBoardAjaxList(rMap);

                json = gson.toJson(checkStat);
            } catch (Exception ex) {
                json = gson.toJson("FAIL");
            }

            out.print(json);
            out.flush();
            out.close();

        }
}

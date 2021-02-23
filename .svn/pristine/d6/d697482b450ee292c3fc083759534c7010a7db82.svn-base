package com.webapp.admin.ctrl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sangs.support.AdminMenu;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;
import com.sangs.support.SangsMap;
import com.sangs.support.SangsProperties;
import com.sangs.util.DateUtil;
import com.sangs.util.ParamUtil;
import com.sangs.util.SangsUtil;
import com.webapp.admin.service.AdminBoardService;
import com.webapp.admin.service.AdminCommonService;
import com.webapp.admin.service.AdminStatsService;
import com.webapp.common.util.CommonComboPutData;

/**
 * 
 * Description : 관리자 과정진행관리 관련 컨트롤러 
 *
 * Modification Information
 * 수정일			 수정자							수정내용
 * -----------	-----------------------------  -------
 * 2016. 5. 11.	 이진영, sweetjy09@sangs.co.kr 	최초작성
 *
 */
@Controller
public class AdminStatsController {
	
private Logger log = LogManager.getLogger(this.getClass());

	@Resource(name = "adminCommonService")
    private AdminCommonService    adminCommonService;
    
    @Resource(name = "adminStatsService")
    private AdminStatsService    adminStatsService;
    
    @Resource(name = "adminBoardService")
    private AdminBoardService    adminBoardService;
    /**
     * 통계관리 > 교육실적통계
     * 
     * 수정일	: 2016. 5. 26.						
     * 수정자	: 이진영, sweetjy09@sangs.co.kr	
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 통계관리 > 교육실적통계
    @RequestMapping(value = "/admin/stats/eduStats01.do")
    public String eduStats01(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {
        
        	// 메뉴정보
        	AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
        	menuInfo.adminMenuExec(request, res, rMap, adminCommonService);

        	String sdate = rMap.getString("sdate");
			String edate = rMap.getString("edate");
			if(("").equals(sdate)){
			    sdate = DateUtil.getMonthAgoDate(-1);
			}
			if(("").equals(edate)){
			    edate = DateUtil.getNowDate();
			}
			rMap.setString("sdate", sdate);
			rMap.setString("edate", edate);
        	
			rMap.setString("nowDate", DateUtil.getNowDate("yyyy"));
			if(SangsUtil.isEmpty(rMap.getString("searchDate"))){
         		rMap.setString("searchDate", DateUtil.getNowDate("yyyy"));
         	}
			
			//request.setAttribute("resultList", adminStatsService.getTotalCourseStats(rMap));
			
			request.setAttribute("resultCateList1", adminStatsService.getTotalCourseCateStats1(rMap));
			request.setAttribute("resultCateList2", adminStatsService.getTotalCourseCateStats2(rMap));
    		request.setAttribute("REQUEST_DATA", rMap);
    		
    		
        } catch (Exception e) {
            
            throw new Exception(e);
        }
        
        if(rMap.getString("listType").equals("EXCEL")){
        	return "admin/stats/edu_stats01_excel";
        } else {
        	return "admin/stats/edu_stats01";
        	
        }
    }
    
    /**
     * 통계관리 > 사이버교육운영
     * 
     * 수정일	: 2016. 5. 30.						
     * 수정자	: 이진영, sweetjy09@sangs.co.kr	
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 통계관리 > 사이버교육운영
    @RequestMapping(value = "/admin/stats/eduStats02.do")
    public String eduStats02(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {
        	// 메뉴정보
        	AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
        	menuInfo.adminMenuExec(request, res, rMap, adminCommonService);
        	
        	//기본데이터세팅 현재년도
            rMap.setString("startYear", ParamUtil.getStrParam(rMap.getString("startYear"), String.valueOf( DateUtil.getYear())) );
            rMap.setString("endYear", ParamUtil.getStrParam(rMap.getString("endYear"), String.valueOf( DateUtil.getYear())) );

            String month = String.valueOf(DateUtil.getMonth());
            if(month.length() == 1) {
                month = "0" + month;
            }
            rMap.setString("startMonth", ParamUtil.getStrParam(rMap.getString("startMonth"), month));
            rMap.setString("endMonth", ParamUtil.getStrParam(rMap.getString("endMonth"), month));
            // db검색조건 설정
            String startDate =
                    rMap.getString("startYear") +"-"+ rMap.getString("startMonth") +"-"+ "01" +" 00:00:00";

            String endDate =
                    rMap.getString("endYear") +"-"+ rMap.getString("endMonth") +"-"+
                    DateUtil.getEndOfMonth( Integer.parseInt(rMap.getString("endYear")), Integer.parseInt(rMap.getString("endMonth")))
                    +" 23:59:59";
            
            rMap.setString("startDate", startDate);
            rMap.setString("endDate", endDate);
            
            request.setAttribute("selectYYYY", adminStatsService.getInsertPayYear(rMap));
            
            rMap.setString("mtCtypeCode",  SangsProperties.getProperty("Globals.mtCode_MT_CTYPE_CODE_ONLINE"));
            request.setAttribute("courseList", adminStatsService.getCmmnCourseList(rMap));
            request.setAttribute("resultList", adminStatsService.getOnlineList(rMap));

    		request.setAttribute("REQUEST_DATA", rMap);
    		
        } catch (Exception e) {
            
            throw new Exception(e);
        }
        if("EXCEL".equals(rMap.getString("listType")))
        	return "admin/stats/edu_stats02_excel";
        else
        	return "admin/stats/edu_stats02";
    }
    
    /**
     * 통계관리 > 사이버교육운영 > 상세
     * 
     * 수정일	: 2016. 5. 30.						
     * 수정자	: 이진영, sweetjy09@sangs.co.kr	
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 통계관리 > 사이버교육운영 > 상세
    @RequestMapping(value = "/admin/stats/eduStats02detail.do")
    public String eduStats02detail(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {
        	// 공통코드 분류코드
    		String mtCode = "";
    		
    		//과정구분 목록
    		mtCode = SangsProperties.getProperty("Globals.mtCode_MT_CTYPE_CODE");
    		rMap.setString("mtCode", mtCode ); 
    		request.setAttribute("categoryData", adminCommonService.getMtNormalCtypeList(rMap));
          	
          	if(rMap.getString("courseNo").equals("")||rMap.getString("courseNo").equals(null)){
          		rMap.setString("courseNo", "0");
          	}
          	
          //기본데이터세팅 현재년도
            rMap.setString("startYear", ParamUtil.getStrParam(rMap.getString("startYear"), String.valueOf( DateUtil.getYear())) );
            rMap.setString("endYear", ParamUtil.getStrParam(rMap.getString("endYear"), String.valueOf( DateUtil.getYear())) );

            String month = String.valueOf(DateUtil.getMonth());
            if(month.length() == 1) {
                month = "0" + month;
            }
            rMap.setString("startMonth", ParamUtil.getStrParam(rMap.getString("startMonth"), month));
            rMap.setString("endMonth", ParamUtil.getStrParam(rMap.getString("endMonth"), month));

            // db검색조건 설정
            String startDate =
                    rMap.getString("startYear") +"-"+ rMap.getString("startMonth") +"-"+ "01" +" 00:00:00";

            String endDate =
                    rMap.getString("endYear") +"-"+ rMap.getString("endMonth") +"-"+
                    DateUtil.getEndOfMonth( Integer.parseInt(rMap.getString("endYear")), Integer.parseInt(rMap.getString("endMonth")))
                    +" 23:59:59";
            
            rMap.setString("startDate", startDate);
            rMap.setString("endDate", endDate);
            if("EXCEL".equals(rMap.getString("listType"))){rMap.setString("noPage", "Y");}
    		List<EduMap> resultList = adminStatsService.getOnlineDetailList(rMap);
    		int totalCount = 0;
    		request.setAttribute("resultList", resultList);
    		if (resultList != null && resultList.size() > 0) {
    			totalCount = resultList.get(0).getInt("TOTALCOUNT");
    		}
    		request.setAttribute("totalCount", totalCount);
        
        	// 메뉴정보
        	AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
        	menuInfo.adminMenuExec(request, res, rMap, adminCommonService);
        	
            request.setAttribute("selectYYYY", adminStatsService.getInsertPayYear(rMap));
            
            rMap.setString("mtCtypeCode",  SangsProperties.getProperty("Globals.mtCode_MT_CTYPE_CODE_ONLINE"));
            request.setAttribute("courseList", adminStatsService.getCmmnCourseList(rMap));

    		request.setAttribute("REQUEST_DATA", rMap);
    		
        } catch (Exception e) {
            
            throw new Exception(e);
        }
        if("EXCEL".equals(rMap.getString("listType")))
        	return "admin/stats/edu_stats02_detail_excel";
        else
        	return "admin/stats/edu_stats02_detail";
    }
    
    
    /**
     * 통계관리 > 접속통계
     * 
     * 수정일	: 2016. 5. 30.						
     * 수정자	: 이진영, sweetjy09@sangs.co.kr	
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 통계관리 > 접속통계
    @RequestMapping(value = "/admin/stats/accessStats.do")
    public String accessStats(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {
        	
        	// 메뉴정보
        	AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
        	menuInfo.adminMenuExec(request, res, rMap, adminCommonService);

        	int year = ParamUtil.getIntParam(rMap.getString("year"), 0);
    		int month = ParamUtil.getIntParam(rMap.getString("month"), DateUtil.getMonth());
    		rMap.setString("sysGb", ParamUtil.getStrParam(rMap.getString("sysGb"), SangsProperties.getProperty("Globals.MBR_TRANS_SYS_GB_ACADEMY")));
        	
    		rMap.setString("accessUrl", SangsProperties.getProperty("Globals.frontMainUri")); // 메인페이지 기준

    		// 데이터가 있는 년도 목록
    		List yearList = adminStatsService.getAccessLogYearForCombo(rMap);
    		List monthList = null;
    		List dayList = null;
    		
    		// year 검색이 안들어온경우
    		if (year == 0) {
    			if (yearList != null && yearList.size() > 0)
    				year = ((EduMap) yearList.get(0)).getInt("ACCES_YEAR");
    		}

	    	GregorianCalendar cld = new GregorianCalendar ( year, month- 1, 1 );
	    	
    		rMap.add("year", String.valueOf(year));
    		rMap.add("month", String.valueOf(month));
    		rMap.add("accessYear", String.valueOf(year));

    		if (yearList != null && yearList.size() != 0) {
    			int prevYear = 0;
    			if (yearList.size() == 1)
    				prevYear = 0;
    			else
    				prevYear = year - 1;

    			rMap.add("prevAccessYear", String.valueOf(prevYear));
    			rMap.add("accessYear", String.valueOf(year));

    			// 월별 데이터 조회
    			monthList = adminStatsService.getAccessLogMonth(rMap);

    			rMap.add("endOfMonth", DateUtil.getEndOfMonth(year, month));
    			rMap.add("accessMonth", String.valueOf(month));

    			Date today = new Date();  
		        Calendar calendar = Calendar.getInstance();  
		        calendar.setTime(today); 
		        calendar.set(Calendar.YEAR, year); 
		        calendar.set(Calendar.MONTH, month);  
		        calendar.set(Calendar.DAY_OF_MONTH, 1);  
		        calendar.add(Calendar.DATE, -1);  
		        Date lastDayOfMonth = calendar.getTime();  
		        SimpleDateFormat dateFormat = new SimpleDateFormat("dd");
		        String lastday=dateFormat.format(lastDayOfMonth);
    			rMap.setString("lastDay", lastday);
    			// 일별 데이터 조회
    			dayList = adminStatsService.getAccessLogDay(rMap);
    		}

    		request.setAttribute("accesslogYearForCombo", yearList); // 연도목록
    		request.setAttribute("accesslogMonthList", monthList); // 월간통계
    		request.setAttribute("accesslogDayList", dayList); // 일별통계

    		request.setAttribute("REQUEST_DATA", rMap);
    		
        } catch (Exception e) {
            
            throw new Exception(e);
        }
        
        if("EXCEL_MONTH".equals(rMap.getString("listType")))
        	return "admin/stats/log_access_month_excel";
        else if("EXCEL_DAY".equals(rMap.getString("listType")))
        	return "admin/stats/log_access_day_excel";
        else
        	return "admin/stats/log_access";
    }
    
    
    /**
     * 통계관리 > 상시설문통계 목록
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 통계관리 > 상시설문통계 목록
    @RequestMapping(value = "/admin/stats/surveyStats.do")
    public String surveyStats(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {
        
        	// 메뉴정보
        	AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
        	menuInfo.adminMenuExec(request, res, rMap, adminCommonService);

        	request.setAttribute("resultList", adminBoardService.getSurveyList(rMap));
    		request.setAttribute("REQUEST_DATA", rMap);
    		
        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/stats/survey_list";
    }
    
   
    /**
     * 통계관리 > 업체가입통계
     * 
     * 수정일	: 2016. 5. 31.						
     * 수정자	: 이진영, sweetjy09@sangs.co.kr	
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 통계관리 > 업체가입통계
    @RequestMapping(value = "/admin/stats/eduStats03.do")
    public String eduStats03(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {
        
        	AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
        	menuInfo.adminMenuExec(request, res, rMap, adminCommonService);
        	
			String sdate = rMap.getString("sdate");
			String edate = rMap.getString("edate");
			if(("").equals(sdate)){
			    sdate = DateUtil.getMonthAgoDate(-1);
			}
			if(("").equals(edate)){
			    edate = DateUtil.getNowDate();
			}
			rMap.setString("sdate", sdate);
			rMap.setString("edate", edate);
			
			rMap.setString("mtCtypeCode",  SangsProperties.getProperty("Globals.mtCode_MT_CTYPE_CODE_ONLINE"));
            request.setAttribute("courseList", adminStatsService.getCmmnCourseList(rMap));
            request.setAttribute("resultList", adminStatsService.getOfflineList(rMap));
    		request.setAttribute("REQUEST_DATA", rMap);
        } catch (Exception e) {
            
            throw new Exception(e);
        }
        
        if("EXCEL".equals(rMap.getString("listType")))
        	return "admin/stats/edu_stats03_excel";
        else
        	return "admin/stats/edu_stats03";
    }

    /**
     * 통계관리 > 지역별 회원가입통계
     * 
     * 수정일	: 2016. 5. 31.						
     * 수정자	: 이진영, sweetjy09@sangs.co.kr	
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 통계관리 > 지역별 회원가입통계
    @RequestMapping(value = "/admin/stats/eduStats04.do")
    public String eduStats04(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {
        
        	// 메뉴정보
        	AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
        	menuInfo.adminMenuExec(request, res, rMap, adminCommonService);

        	String sdate = rMap.getString("sdate");
			String edate = rMap.getString("edate");
			if(("").equals(sdate)){
			    sdate = DateUtil.getMonthAgoDate(-1);
			}
			if(("").equals(edate)){
			    edate = DateUtil.getNowDate();
			}
			rMap.setString("sdate", sdate);
			rMap.setString("edate", edate);
        	
			
			request.setAttribute("resultList", adminStatsService.getCourseUserStats(rMap));
			
    		request.setAttribute("REQUEST_DATA", rMap);
    		
        } catch (Exception e) {
            
            throw new Exception(e);
        }
        if("EXCEL".equals(rMap.getString("listType")))
        	return "admin/stats/edu_stats04_excel";
        else
        	return "admin/stats/edu_stats04";
    }
    
    	
	/**
     * 통계관리 > 사업장별 수료통계 리스트
     * 
     * 수정일	: 2016. 5. 31.						
     * 수정자	: 이진영, sweetjy09@sangs.co.kr	
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 통계관리 > 사업장별 수료통계 리스트
    @RequestMapping(value = "/admin/stats/compStats.do")
    public String compStats(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {
        
        	// 메뉴정보
        	AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
        	menuInfo.adminMenuExec(request, res, rMap, adminCommonService);
        	
        	//기본데이터세팅 현재년도
        	rMap.setString("searchYear", ParamUtil.getStrParam(rMap.getString("searchYear"), String.valueOf( DateUtil.getYear())) );


            //현재년도 로부터 4년 전까지 출력
            List yearList= SangsUtil.getYearList((DateUtil.getYear()-4));

            request.setAttribute("yearList", yearList);
            List list = adminStatsService.selectCompStats(rMap);

            request.setAttribute("resultList", list);        	
    		request.setAttribute("REQUEST_DATA", rMap);
    		
        } catch (Exception e) {
            
            throw new Exception(e);
        }
        
        return "admin/stats/comp_stats_list";
    }
    
    /**
     * 통계관리 > 사업장별 수료통계 상세보기
     * 
     * 수정일	: 2016. 5. 31.						
     * 수정자	: 이진영, sweetjy09@sangs.co.kr	
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 통계관리 > 사업장별 수료통계 상세보기
    @RequestMapping(value = "/admin/stats/compStatsForm.do")
    public String compStatsForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {
        
        	// 메뉴정보
        	AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
        	menuInfo.adminMenuExec(request, res, rMap, adminCommonService);
        	
        	if(rMap.getString("searchYear").equals("0") ){
        		rMap.setString("searchYear", "");
            }else{
                //기본데이터세팅 현재년도
            	rMap.setString("searchYear", ParamUtil.getStrParam(rMap.getString("searchYear"), String.valueOf( DateUtil.getYear())) );
            }

            //현재년도 로부터 4년 전까지 출력
            List yearList= SangsUtil.getYearList((DateUtil.getYear()-4));
            for(int i=0; i<yearList.size();i++){
                SangsMap map = (SangsMap) yearList.get(i);
                rMap.putString("searchYear"+String.valueOf(i+1), map.getString("code"));
            }
            request.setAttribute("yearList", yearList);

            request.setAttribute("result", adminStatsService.selectCompStatsInfo(rMap));

            request.setAttribute("compJibResultList", adminStatsService.selectCompJibCourseList(rMap));


    		request.setAttribute("REQUEST_DATA", rMap);
    		
        } catch (Exception e) {
            
            throw new Exception(e);
        }
        
        return "admin/stats/comp_stats_form";
    }
    
    /**
     * 방문교육 통계
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/admin/stats/lecture_stats.do")
    public String lectureStats(HttpServletRequest request, HttpServletResponse res, DataMap rMap, ModelMap model) throws Exception {

         	// 메뉴정보
         	AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
         	menuInfo.adminMenuExec(request, res, rMap, adminCommonService);

         	if(SangsUtil.isEmpty(rMap.getString("sdate"))){
         		rMap.setString("sdate", DateUtil.getNowDate("2018-01-01"));
         	}
        	if(SangsUtil.isEmpty(rMap.getString("edate"))){
         		rMap.setString("edate", DateUtil.getNowDate());
         	}
         	
         	if(SangsUtil.isEmpty(rMap.getString("searchDate"))){
         		rMap.setString("searchDate", DateUtil.getNowDate("yyyy"));
         	}
         	
         	if(SangsUtil.isEmpty(rMap.getString("searchType"))){
         		rMap.setString("searchType", "TG");
         	}
         	
         	
         	CommonComboPutData.putYears(model);
         	
         	if("TC".equals(rMap.getString("searchType"))){
         		request.setAttribute("resultList", adminStatsService.getLectureTeacherStats(rMap));
         		
         	}else if("TU".equals(rMap.getString("searchType"))){
         		request.setAttribute("totalCount", adminStatsService.getLectureTutorStatsCnt(rMap));
         		request.setAttribute("resultList", adminStatsService.getLectureTutorStats(rMap));
         	}else if("TM".equals(rMap.getString("searchType"))){
         		request.setAttribute("totalCount", adminStatsService.getLectureTutorMonthStatsCnt(rMap));
         		request.setAttribute("resultList", adminStatsService.getLectureTutorMonthStats(rMap));
         	}else{
         		request.setAttribute("resultList", adminStatsService.getLectureUserStats(rMap));
         	}
         	
     		request.setAttribute("REQUEST_DATA", rMap);
     		
       
         if("EXCEL".equals(rMap.getString("listType")))
         	return "admin/stats/edu_stats04_excel";
         else
         	return "admin/stats/lecture_stats";
    }
    
    
    
    /**
     * 통계관리 > 상시설문통계 목록
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 통계관리 > 온라인교육통계 목록
    @RequestMapping(value = "/admin/stats/eduOnline_stats.do")
    public String eduOnlineStats(HttpServletRequest request, HttpServletResponse res, DataMap rMap, ModelMap model) throws Exception {
        try {
        
        	// 메뉴정보
        	AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
        	menuInfo.adminMenuExec(request, res, rMap, adminCommonService);

        	
        	CommonComboPutData.putYears(model);
        	
        	//request.setAttribute("resultList", adminBoardService.getSurveyList(rMap));
        	if(SangsUtil.isEmpty(rMap.getString("sdate"))){
         		rMap.setString("sdate", DateUtil.getNowDate("2018-01-01"));
         	}
        	if(SangsUtil.isEmpty(rMap.getString("edate"))){
         		rMap.setString("edate", DateUtil.getNowDate());
         	}
        	if(SangsUtil.isEmpty(rMap.getString("searchDate"))){
         		rMap.setString("searchDate", DateUtil.getNowDate("yyyy"));
         	}
        	if("person".equals(rMap.getString("searchMode"))){
        		request.setAttribute("totalCount", adminBoardService.getOnlinePersonStatsListCnt(rMap));
        		request.setAttribute("resultList", adminBoardService.getOnlinePersonStatsList(rMap));
        	} else {
        		request.setAttribute("totalCount", adminBoardService.getOnlineStatsListCnt(rMap));
        		request.setAttribute("resultList", adminBoardService.getOnlineStatsList(rMap));
        	}
    		request.setAttribute("REQUEST_DATA", rMap);
    		
        } catch (Exception e) {
            throw new Exception(e);
        }
        
        if("EXCEL".equals(rMap.getString("listType")))
         	return "admin/stats/eduOline_stats_excel";
         else
         	return "admin/stats/eduOnline_stats";
    }
    
    /**
     * 통계관리 > 온라인통계 
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 통계관리 > 온라인교육통계
    @RequestMapping(value = "/admin/stats/eduOnline_stats_detail.do")
    public String eduOnlineStatsDetail(HttpServletRequest request, HttpServletResponse res, DataMap rMap, ModelMap model) throws Exception {
        try {
        
        	// 메뉴정보
        	AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
        	menuInfo.adminMenuExec(request, res, rMap, adminCommonService);

        	CommonComboPutData.putYears(model);
        	
        	request.setAttribute("result", adminBoardService.getOnlineStatsDetail(rMap));
    		request.setAttribute("REQUEST_DATA", rMap);
    		
        } catch (Exception e) {
            
            throw new Exception(e);
        }

        return "admin/stats/eduOnline_detail_stats";
    }
    
    /**
     * 통계관리 > 교육실적통계
     * 
     * 수정일	: 2016. 5. 26.						
     * 수정자	: 이진영, sweetjy09@sangs.co.kr	
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 통계관리 > 교육실적통계
    @RequestMapping(value = "/admin/stats/compEduStats.do")
    public String compEduStats(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {
        
        	// 메뉴정보
        	AdminMenu menuInfo = new AdminMenu(request, res, rMap, adminCommonService);
        	menuInfo.adminMenuExec(request, res, rMap, adminCommonService);
        	String sdate = rMap.getString("sdate");
			String edate = rMap.getString("edate");
			if(("").equals(sdate)){
			    sdate = DateUtil.getMonthAgoDate(-1);
			}
			if(("").equals(edate)){
			    edate = DateUtil.getNowDate();
			}
			rMap.setString("sdate", sdate);
			rMap.setString("edate", edate);
        	
			rMap.setString("nowDate", DateUtil.getNowDate("yyyy"));
			if(SangsUtil.isEmpty(rMap.getString("searchDate"))){
         		rMap.setString("searchDate", DateUtil.getNowDate("yyyy"));
         	}
			
			request.setAttribute("resultList", adminStatsService.getTotalCompCourseStats(rMap));
			request.setAttribute("resultCompCnt1", adminStatsService.getLonCompCnt1(rMap));
			request.setAttribute("resultCompCnt2", adminStatsService.getLonCompCnt2(rMap));
			
			request.setAttribute("resultCateList1", adminStatsService.getTotalCourseCateStats1(rMap));
			request.setAttribute("resultCateList2", adminStatsService.getTotalCourseCateStats2(rMap));
			
    		request.setAttribute("REQUEST_DATA", rMap);
    		
    		
        } catch (Exception e) {
            
            throw new Exception(e);
        }
        
        if(rMap.getString("listType").equals("EXCEL")){
        	return "admin/stats/comp_edu_stats_excel";
        } else {
        	return "admin/stats/comp_edu_stats";
        	
        }
    }
    
}
    
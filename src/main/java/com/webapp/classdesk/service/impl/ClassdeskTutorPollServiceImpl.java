package com.webapp.classdesk.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.util.ParamUtil;
import com.webapp.classdesk.mapper.ClassdeskTutorPollMapper;
import com.webapp.classdesk.service.ClassdeskTutorPollService;

/**
 * Description : Classdesk TutorPoll Service Impl
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
@Service("classdeskTutorPollService")
public class ClassdeskTutorPollServiceImpl implements ClassdeskTutorPollService {

    @Resource(name = "classdeskTutorPollMapper")
    private ClassdeskTutorPollMapper classdeskTutorPollMapper;

    /**
     * getPollMainList
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getPollMainList(DataMap data) throws Exception {
        return classdeskTutorPollMapper.getPollMainList(data);
    }
    /**
     * 설문 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getSurveyList(DataMap data) throws Exception {
    	data.setInt("rowCount", 20);
        ParamUtil.setPagingValue(data);
        return classdeskTutorPollMapper.getSurveyList(data);
    }
    
    /**
     * 설문 상세보기
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getModuleList(DataMap data) throws Exception {
        return classdeskTutorPollMapper.getModuleList(data);
    }
    /**
     * 설문 상세보기
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getQuestionList(DataMap data) throws Exception {
        return classdeskTutorPollMapper.getQuestionList(data);
    }
    /**
     * 설문 상세보기
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getSurveyModuleList(DataMap data) throws Exception {
        return classdeskTutorPollMapper.getSurveyModuleList(data);
    }
    
    /**
     * 설문 상세보기
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getSurveyView(DataMap data) throws Exception {
        return classdeskTutorPollMapper.getSurveyView(data);
    }
    
    /**
     * 주관식 객관식 코드 출력
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> selectMtCpollCode(DataMap data) throws Exception {
        return classdeskTutorPollMapper.selectMtCpollCode(data);
    }
    
    /**
     * 설문 목록
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getPollList(DataMap data) throws Exception {
        return classdeskTutorPollMapper.getPollList(data);
    }

    /**
     * 설문 MAX NO
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getMaxPollcSeqNo(DataMap data) throws Exception {
        return classdeskTutorPollMapper.getMaxPollcSeqNo(data);
    }

    /**
     * 설문 메인 저장
     * 
     * @param data
     * @throws Exception
     */
    public void insertPoll(DataMap data) throws Exception {
        classdeskTutorPollMapper.insertPoll(data);
    }

    /**
     * 설문 임시저장 / 설문개시
     * 
     * @param data
     * @throws Exception
     */
    public void updatePoll(DataMap data) throws Exception {
        classdeskTutorPollMapper.updatePoll(data);
    }

    /**
     * selectMstPollCnt
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap selectMstPollCnt(DataMap data) throws Exception {
        return classdeskTutorPollMapper.selectMstPollCnt(data);
    }

    /**
     * selectMstPollQuizCnt
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap selectMstPollQuizCnt(DataMap data) throws Exception {
        return classdeskTutorPollMapper.selectMstPollQuizCnt(data);
    }

    /**
     * 설문 문항 일괄 저장
     * 
     * @param data
     * @throws Exception
     */
    public void insertMstPollQuiz(DataMap data) throws Exception {
        classdeskTutorPollMapper.insertMstPollQuiz(data);
    }

    /**
     * getPollItem
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getPollItem(DataMap data) throws Exception {
        return classdeskTutorPollMapper.getPollItem(data);
    }

    /**
     * 설문 문항 저장
     * 
     * @param data
     * @throws Exception
     */
    public void insertPollQuiz(DataMap data) throws Exception {
        classdeskTutorPollMapper.insertPollQuiz(data);
    }

    /**
     * 설문 문항 수정
     * 
     * @param data
     * @throws Exception
     */
    public void updatePollQuiz(DataMap data) throws Exception {
        classdeskTutorPollMapper.updatePollQuiz(data);
    }

    /**
     * 설문 문항 삭제
     * 
     * @param data
     * @throws Exception
     */
    public void deletePollQuiz(DataMap data) throws Exception {
        classdeskTutorPollMapper.deletePollQuiz(data);
    }

    /**
     * 설문통계
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getPollStatList(DataMap data) throws Exception {
        return classdeskTutorPollMapper.getPollStatList(data);
    }

    /**
     * 설문 주관식 내용 
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getPollStatEtcList(DataMap data) throws Exception {
        return classdeskTutorPollMapper.getPollStatEtcList(data);
    }

    /**
     * getPollcSeqNoInfo
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public int getPollcSeqNoInfo(DataMap data) throws Exception {
        return classdeskTutorPollMapper.getPollcSeqNoInfo(data);
    }

    /**
     * 주관식답변(설문전체)
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getPollStatDesList(DataMap data) throws Exception {
        return classdeskTutorPollMapper.getPollStatDesList(data);
    }

    /**
     * 설문 마스터 일괄저장
     * 
     * @param data
     * @throws Exception
     */
    public void mtscallExec(DataMap data) throws Exception {
        //설문 maxno
        EduMap map = getMaxPollcSeqNo(data);

        data.putInt("pollcSeqNo", map.getInt("SEQPOLLCSEQNO"));

        //설문 메인등록
        insertPoll(data);
        //설문문항 일괄등록
        insertMstPollQuiz(data);
    }

    /**
     * 설문 문항 등록 / 수정 / 삭제 실행 
     * 
     * @param request
     * @param data
     * @param saveFlg
     * @throws Exception
     */
    public void qExec(HttpServletRequest request, DataMap data, String saveFlg) throws Exception {
        if ("D".equals(saveFlg)) {
            deletePollQuiz(data);
            data.putString("rMsg", "삭제되었습니다.");
        } else {
            if (data.containsKey("qNo") && ParamUtil.getIntParam(data.getString("qNo"), 0) > 0) {
                updatePollQuiz(data);
                data.putString("rMsg", "수정되었습니다.");
            } else {
                EduMap eMap = selectMstPollCnt(data);

                if (eMap == null) {
                    EduMap map = getMaxPollcSeqNo(data);

                    data.putInt("pollcSeqNo", map.getInt("SEQPOLLCSEQNO"));

                    //설문 메인등록
                    insertPoll(data);

                    insertPollQuiz(data);
                } else {
                    data.putInt("pollcSeqNo", eMap.getInt("POLLCSEQNO"));
                    insertPollQuiz(data);
                }

                data.putString("rMsg", "저장되었습니다.");
            }
        }

        if ("D".equals(saveFlg)) {
            data.putString("rScript", "try {fnForm();} catch(err) {self.close();  opener.window.document.location.reload();}");
        } else {
            data.putString("rScript", "self.close();  opener.window.document.location.reload();");
        }
    }
    
    /**
     * 설문 게시글 최대번호
     *
     * @param data
     * @throws Exception
     */
    public int getMaxSurveyNo(DataMap data) throws Exception {
    	return classdeskTutorPollMapper.getMaxSurveyNo(data);
    }
    
    
    /**
     * 설문 등록
     *
     * @param data
     * @throws Exception
     */
    public void insertSurveyInfo(DataMap data) throws Exception {
    	classdeskTutorPollMapper.insertSurveyInfo(data);
    }
    
    /**
     * 설문 질문 최대번호
     *
     * @param data
     * @throws Exception
     */
    public int getMaxQuizNo(DataMap data) throws Exception {
    	return classdeskTutorPollMapper.getMaxQuizNo(data);
    }
    
    /**
     * 설문 등록
     *
     * @param data
     * @throws Exception
     */
    public void insertQuizInfo(DataMap data) throws Exception {
    	classdeskTutorPollMapper.insertQuizInfo(data);
    }
    
    /**
     * 설문 등록
     *
     * @param data
     * @throws Exception
     */
    public void insertQuizItemInfo(DataMap data) throws Exception {
    	classdeskTutorPollMapper.insertQuizItemInfo(data);
    }
    
    /**
     * 게시글 삭제(설문 수정)
     *
     * @param data
     * @throws Exception
     */
    public void deleteSurveyInfo(DataMap data) throws Exception {
    	classdeskTutorPollMapper.deleteSurveyInfo(data);
    }
    /**
     * 게시글 삭제(설문 수정)
     *
     * @param data
     * @throws Exception
     */
    public void deleteQuizInfo(DataMap data) throws Exception {
    	classdeskTutorPollMapper.deleteQuizInfo(data);
    }
    
    /**
     * 게시글 삭제(설문 수정)
     *
     * @param data
     * @throws Exception
     */
    public void deleteQuizItemInfo(DataMap data) throws Exception {
    	classdeskTutorPollMapper.deleteQuizItemInfo(data);
    }

    /**
     * 설문 응시 이력(객관식)
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getPollCnt(DataMap data) throws Exception {
        return classdeskTutorPollMapper.getPollCnt(data);
    }
    
    /**
     * 설문 응시 이력(주관식)
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getPollAnswer(DataMap data) throws Exception {
    	data.setInt("rowCount", 20);
        ParamUtil.setPagingValue(data);
        return classdeskTutorPollMapper.getPollAnswer(data);
    }
    
    /**
     * 해당과정 강사목록
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getTutorList(DataMap data) throws Exception {
        return classdeskTutorPollMapper.getTutorList(data);
    }
    
    /**
     * 객관식 항목 별 평점
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getPollAvg(DataMap data) throws Exception {
        return classdeskTutorPollMapper.getPollAvg(data);
    }
    
    /**
     * 객관식 강사 별 평점
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getPollTutorAvg(DataMap data) throws Exception {
        return classdeskTutorPollMapper.getPollTutorAvg(data);
    }
	@Override
	public List<EduMap> getPollChoiceStatsList(DataMap data) throws Exception {
		return classdeskTutorPollMapper.getPollChoiceStatsList(data);
	}
	@Override
	public List<EduMap> getPollDesStatsList(DataMap data) throws Exception {
		return classdeskTutorPollMapper.getPollDesStatsList(data);
	}
}

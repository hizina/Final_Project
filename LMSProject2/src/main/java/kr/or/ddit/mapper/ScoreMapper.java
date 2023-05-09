package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.score.vo.ScoreVO;

public interface ScoreMapper {
	public void insert(ScoreVO score) throws Exception;
	//교수용
	public List<ScoreVO> list(Map<String,String> map) throws Exception;

	//학생용 리스트
	public List<ScoreVO> stuList(String stuId) throws Exception;
	//관리자용
	public List<ScoreVO> list() throws Exception;

	public void delete(Map<String,String> map) throws Exception;

	public void update(ScoreVO score) throws Exception;

	public List<ScoreVO> read(String stuNo) throws Exception;
	//셀렉트박스용
	public List<ScoreVO> selectList(String proId) throws Exception;
	//학생용 전선 전필 교선 교필 별 학점평균임...
	public List<ScoreVO> averageList(String stuId) throws Exception;
	//학기 연도 선택셀렉트박스용
	public List<ScoreVO> selectboxYearSeme() throws Exception;
	
	//전필
	public List<ScoreVO> stuListJP(String stuId) throws Exception;
	//전선
	public List<ScoreVO> stuListJS(String stuId) throws Exception;
	//교필
	public List<ScoreVO> stuListGP(String stuId) throws Exception;
	//교선
	public List<ScoreVO> stuListGS(String stuId) throws Exception;
	//OVE_SCORE 자동 보정
	public int autoOveScore() throws Exception;
	//교수가 확정눌러주면 강의 평가 디폴트값 업데이트
	public int updateLectureEval(Map<String, Object> resultMap) throws Exception;
	
	public int updateYesNo(Map<String, Object> resultMap) throws Exception;
	
	public void updateCouTake(Map<String, Object> resultMap);
}

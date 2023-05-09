package kr.or.ddit.score.vo;

import java.util.List;

import lombok.Data;

@Data
public class ScoreVO {
	private String acaMajor;	// 전공명
	private int lecOpenYear; //개설연도
	private int lecOpenSemester; //개설학기
	private String lecCode;     //강의코드
	private int acaGrade;	//학년
	private int acaSemester;    //학기
	private String stuNameKo;   //한국어 이름
	private String stuId;     //학번
	private String subName;     //교과목명
	private int subCredit;          //이수학점
	private String subSort;    //교과목구분 : 전공/교양
	private String subType;    //이수형태 : 필수/선택
	private int atdScore;      //출석
	private int mdtScore;       //중간
	private int fnlScore;       //기말
	private String srStatus;      //성적확정 상태
	private double asgScore;        //과제
	private int oveScore;        //총합
	private String deptName;       // 학과명
	private String leStatus; // 강의평가여부
	private String proNameKo; //담당교수이름 급하게 추가
	
	private int rank;     //가상의 등수
	private double grade;  //가상의 등급
	private double gradeAverage;  //가상의 등급 평균
	private int sumCredit; //총 이수학점
	private List<ScoreVO> list;
	
	public void totalScore() {
        this.oveScore = (int) (this.atdScore + this.mdtScore + this.asgScore + this.fnlScore);
    }
}
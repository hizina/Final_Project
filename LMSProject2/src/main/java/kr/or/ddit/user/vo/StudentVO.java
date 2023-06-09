package kr.or.ddit.user.vo;

import javax.websocket.Session;

import kr.or.ddit.academic.vo.AcademicVO;
import kr.or.ddit.common.vo.ExcelColumn;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StudentVO {

	public StudentVO(String stuNameKo, Session session) {
		super();
		this.stuNameKo = stuNameKo;
		this.session = session;
	}
	public StudentVO() {
	    super();
	}

	// A
	@ExcelColumn(headerName = "아이디")
	private String stuId;
	// E
	@ExcelColumn(headerName = "한글성명")	
	private String stuNameKo;
	// F
	@ExcelColumn(headerName = "영문성명")
	private String stuNameEn;
	// G
	@ExcelColumn(headerName = "주민번호앞")
	private String stuReg1;
	// H
	@ExcelColumn(headerName = "주민번호뒷")
	private String stuReg2;
	// I
	@ExcelColumn(headerName = "이메일")
	private String stuEmail;
	// J
	@ExcelColumn(headerName = "전화")
	private String stuPhone;
	// K
	@ExcelColumn(headerName = "국가")
	private String stuNation;
	// L
	@ExcelColumn(headerName = "성별")
	private String stuGender;
	// M
	@ExcelColumn(headerName = "우편번호")
	private String stuPostcode;
	// N
	@ExcelColumn(headerName = "주소1")
	private String stuAddr1;
	// O
	@ExcelColumn(headerName = "주소2")
	private String stuAddr2;
	// P
	@ExcelColumn(headerName = "은행")
	private String stuBank;
	// Q
	@ExcelColumn(headerName = "계좌")
	private String stuAccount;
	
	private Session session;
	
	private int profileNo;
	private String collName;
	private String collCode;
	
	private AcademicVO academicVO;
	private String acaMajor;
	private String acaGrade;
	private String lecCode;
	private int hwNo;
	private String hwTitle;
	private String hwContent;
	private String submFileName;
	private String submFilePath;
	private String submDate;
	private String submScore;
	
	
	
	
	
}

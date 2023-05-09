package kr.or.ddit.scholarship.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.mustachejava.reflect.DepthGuard;

import kr.or.ddit.common.ServiceResult;
import kr.or.ddit.common.vo.CurrentInfoVO;
import kr.or.ddit.common.vo.DepartmentVO;
import kr.or.ddit.scholarship.service.IScholarshipService;
import kr.or.ddit.scholarship.vo.ScholarshipInfoVO;
import kr.or.ddit.scholarship.vo.ScholarshipListVO;
import kr.or.ddit.tuition.vo.TuitionVO;
import kr.or.ddit.user.vo.UserVO;
import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.GetProxy;

@Slf4j
@Controller
@RequestMapping("/scholarship")
public class ScholarshipController {

	@Autowired
	private IScholarshipService scholarService;

	@GetMapping("/benefitList")
	public String scholarshipList(HttpServletRequest req, Model model, ScholarshipListVO sv) {

		HttpSession session = req.getSession(false);

		if (session != null && session.getAttribute("userInfo") != null) {
			UserVO userVO = (UserVO) session.getAttribute("userInfo");

			String userId = userVO.getUserId();

			sv.setStuId(userId);
			List<ScholarshipListVO> scholarList = scholarService.scholarList(sv);

			model.addAttribute("scholarList", scholarList);

			return "scholarship/benefitList";
		} else {
			return "redirect:/login";
		}

	}
	
	// 장학금 수혜내역
	@ResponseBody
	@RequestMapping(value = "/benefitList", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public List<ScholarshipListVO> scholarshipBenefitList(ScholarshipListVO sv, HttpSession session, Model model) {

		log.info("체크>>" + sv);

		UserVO userVO = (UserVO) session.getAttribute("userInfo");

		String userId = userVO.getUserId();

		sv.setStuId(userId);
		List<ScholarshipListVO> scholarList = scholarService.scholarList(sv);

		return scholarList;
	}

	// 학생 장학금 신청조회/ 장학금 신청할 수 있는 곳
	@GetMapping("/application")
	public String scholarshipApplication(HttpServletRequest req, ScholarshipListVO sv, ScholarshipInfoVO si,
			Model model) { // 장학금 신청

		HttpSession session = req.getSession(false);

		if (session != null && session.getAttribute("userInfo") != null) {
			UserVO userVO = (UserVO) session.getAttribute("userInfo");
			String userId = userVO.getUserId();
//		String deptCode = userVO.getStudentVO().getAcademicVO().getDeptCode();

			sv.setStuId(userId);

			List<ScholarshipListVO> scholarList = scholarService.scholarListApp(sv);
			List<ScholarshipInfoVO> scholarInfoList = scholarService.infoList(si);
			CurrentInfoVO currentInfo = scholarService.getCurrentInfo();
			
			model.addAttribute("currentInfo", currentInfo);
			model.addAttribute("userVO", userVO);
			model.addAttribute("scholarList", scholarList);
			model.addAttribute("scholarInfoList", scholarInfoList);

			return "scholarship/application";

		} else {
			return "redirect:/login";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/application", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public List<ScholarshipInfoVO> scholarshipList(ScholarshipInfoVO si) {

		log.info("체크 >> " + si);

		List<ScholarshipInfoVO> scholarInfoList = scholarService.scholarInfoList(si);

		return scholarInfoList;
	}

	// 신청내역 검색해서 보기
	@ResponseBody
	@RequestMapping(value = "/application/appList", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public List<ScholarshipInfoVO> scholarshipList(ScholarshipListVO sv, HttpSession session) {

		log.info("체크 >> " + sv);
		UserVO userVO = (UserVO) session.getAttribute("userInfo");

		String userId = userVO.getUserId();

		sv.setStuId(userId);

		List<ScholarshipInfoVO> appList = scholarService.appList(sv);

		return appList;
	}

	@ResponseBody
	@PostMapping(value = "/application/insert", produces = "application/json;charset=utf-8")
	public ServiceResult scholarApplication(HttpSession session, ScholarshipListVO sv, ScholarshipInfoVO si) {
		log.info("체크 (장학금 신청)>> " + sv);

		UserVO userVO = (UserVO) session.getAttribute("userInfo");

		String userId = userVO.getUserId();

		sv.setStuId(userId);

		ServiceResult result = null;

		result = scholarService.insertScholar(sv);

		return result;
	}

	@RequestMapping(value = "/scholarDetail", method = RequestMethod.GET)
	public String scholarDetail(HttpServletRequest req, int slNo, String siCode, Model model, ScholarshipListVO sv,
			ScholarshipInfoVO si) {

		HttpSession session = req.getSession(false);

		if (session != null && session.getAttribute("userInfo") != null) {
			ScholarshipListVO scholar = scholarService.scholarDetail(slNo);
			model.addAttribute("sv", sv);
			model.addAttribute("si", si);
			model.addAttribute("scholar", scholar);

			return "scholarship/scholarDetail";
		} else {
			return "redirect:/login";
		}
	}

	@GetMapping("/infoList")
	public String employeeInfoInsert(HttpServletRequest req, Model model, ScholarshipInfoVO si) {

		HttpSession session = req.getSession(false);

		if (session != null && session.getAttribute("userInfo") != null) {
			List<ScholarshipInfoVO> scholarInfoList = scholarService.infoList(si);
			model.addAttribute("scholarInfoList", scholarInfoList);

			return "scholarship/infoList";
		} else {
			return "redirect:/login";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/infoList2", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public List<ScholarshipInfoVO> infoList(ScholarshipInfoVO si, Model model) {

		log.info("체크 >> " + si);

		List<ScholarshipInfoVO> scholarInfoList = scholarService.infoList2(si);

		return scholarInfoList;
	}

	@RequestMapping(value = "/scholarInsert", method = RequestMethod.POST)
	public String insertScholarInfo(HttpServletRequest req, ScholarshipInfoVO si, Model model) {

		HttpSession session = req.getSession(false);

		if (session != null && session.getAttribute("userInfo") != null) {
			scholarService.insertScholarInfo(si);

			return "redirect:/scholarship/infoList";

		} else {
			return "redirect:/login";
		}
	}

	@RequestMapping(value = "/scholarDelete", method = RequestMethod.POST)
	public String deleteScholarInfo(HttpServletRequest req, String siCode, Model model) {

		HttpSession session = req.getSession(false);

		if (session != null && session.getAttribute("userInfo") != null) {
			log.info("삭제>>");

			scholarService.deleteScholarInfo(siCode);

			return "redirect:/scholarship/infoList";
		} else {
			return "redirect:/login";
		}
	}

	// 관리자 장학금 내역 조회
	@GetMapping("/applicationList")
	public String selectAcceptList(HttpServletRequest req, ScholarshipListVO sv, Model model) {

		HttpSession session = req.getSession(false);

		if (session != null && session.getAttribute("userInfo") != null) {
			log.info("체크 리스트55 >> " + sv);

			// 관리자 : 승인 내역 조회
			List<ScholarshipListVO> selectAcceptList = scholarService.selectAcceptList(sv);

			// 관리자 : 반려 내역 조회
			List<ScholarshipListVO> rejectList = scholarService.rejectList(sv);

			// 관리자 : 대기 내역 조회
			List<ScholarshipListVO> waitList = scholarService.waitList(sv);

			model.addAttribute("acceptList", selectAcceptList);
			model.addAttribute("rejectList", rejectList);
			model.addAttribute("waitList", waitList);

			return "scholarship/applicationList";
		} else {
			return "redirect:/login";
		}
	}

	@PostMapping("/updateStatus")
	public String updateStatus(HttpServletRequest req, Model model, ScholarshipListVO sv) {

		HttpSession session = req.getSession(false);

		if (session != null && session.getAttribute("userInfo") != null) {
			log.debug("여기까지 오니?: " + sv);

			scholarService.updateStatus(sv);
			log.debug("승인 해줘" + sv);

			return "redirect:/scholarship/applicationList";
		} else {
			return "redirect:/login";
		}
	}

}
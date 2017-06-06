package org.eon.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.eon.domain.UserVO;
import org.eon.dto.LoginDTO;
import org.eon.persistence.UserDAO;
import org.eon.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

@Controller
public class UserController {

	@Inject
	private UserService service;
	
	
	@RequestMapping(value = "/user/login", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto) throws Exception {
		
		System.out.println("/user/login 진입");
	}

	@RequestMapping(value = "/user/loginPost", method = RequestMethod.POST)
	public void loginPOST(LoginDTO dto, HttpSession session, Model model) throws Exception {

		System.out.println("/user/loginPost 진입");
		
		UserVO vo = service.login(dto);

		if (vo == null) {
			return;
		}

		model.addAttribute("userVO", vo);

		if (dto.isUseCookie()) {

			int amount = 60 * 60 * 24 * 7;

			Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));

			service.keepLogin(vo.getUid(), session.getId(), sessionLimit);

		}

	}

	@RequestMapping(value = "/user/userList", method = RequestMethod.GET)
	public String userList(Model model) throws Exception {

		List<UserVO> list = service.userList();

		model.addAttribute("list", list);

		return "/user/userList";

	}

	@RequestMapping(value = "/user/registerUser", method = RequestMethod.GET)
	public void registerUserGET(UserVO vo, Model model) throws Exception {

		// logger.info("registerUser get ................");
	}

	@RequestMapping(value = "/user/registerUser", method = RequestMethod.POST)
	public String registerUserPOST(@ModelAttribute UserVO vo, RedirectAttributes rttr) throws Exception {

		// logger.info("registerUser post ................");
		// logger.info(vo.toString());

		service.insertUser(vo);

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect: ../";

	}

	@RequestMapping(value = "/user/loginCheck", method = RequestMethod.GET)
	public ModelAndView loginCheck(@ModelAttribute UserVO vo, HttpSession session) throws Exception {

		boolean result = service.loginCheck(vo, session);

		ModelAndView mav = new ModelAndView();

		if (result == true) {

			mav.setViewName("home");
			mav.addObject("msg", "SUCCESS");

		} else {

			mav.setViewName("/user/login");
			mav.addObject("msg", "FAILURE");
		}

		return mav;
	}

	@RequestMapping(value = "/user/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session) throws Exception {

		service.logout(session);

		ModelAndView mav = new ModelAndView();

		mav.setViewName("home");
		mav.addObject("msg", "logout");

		return mav;
	}

	@RequestMapping(value = "/user/idDupCheck", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> idDupCheck(@RequestBody String uid) throws Exception {

		System.out.println("Controller 진입" + "--" + uid);

		Map<String, String> resultMap = new HashMap<String, String>();

		int resultCnt = service.idDupCheck(uid);
		System.out.println("반환값" + "--" + resultCnt);

		String result = "";

		String resultMsg = "";

		if (resultCnt == 0) {

			System.out.println("success");

			result = "SUCCESS";
			resultMsg = "사용 가능한 아이디입니다.";

		} else {

			System.out.println("failure");

			result = "FAILURE";
			resultMsg = "이미 사용중인 아이디입니다.";

		}

		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);

		return resultMap;
	}

	/*
	 * 로그아웃(다른 형식)
	 * 
	 * @RequestMapping(value = "/logout", method = RequestMethod.GET) public
	 * String logout(HttpServletRequest request, HttpServletResponse response,
	 * HttpSession session) throws Exception {
	 * 
	 * logger.info("logout.................................1");
	 * 
	 * Object obj = session.getAttribute("login");
	 * 
	 * if (obj != null) { UserVO vo = (UserVO) obj;
	 * logger.info("logout.................................2");
	 * session.removeAttribute("login"); session.invalidate();
	 * 
	 * logger.info("logout.................................3"); Cookie
	 * loginCookie = WebUtils.getCookie(request, "loginCookie");
	 * 
	 * if (loginCookie != null) {
	 * logger.info("logout.................................4");
	 * loginCookie.setPath("/"); loginCookie.setMaxAge(0);
	 * response.addCookie(loginCookie); service.keepLogin(vo.getUid(),
	 * session.getId(), new Date()); } }
	 * 
	 * return "user/logout"; }
	 */

}

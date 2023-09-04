package com.grgr.controller;

import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.grgr.dto.MyBoardWriteDTO;
import com.grgr.dto.MyCommentDTO;
import com.grgr.dto.UserVO;
import com.grgr.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/mypage")
public class UserProfileController {

	private final UserService userService;
	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	/* 회원 조회(마이페이지) */
	@GetMapping("/userProfile")
	public String userProfilePageGet(HttpSession session, Model model) {
	    logger.info("회원 마이페이지 진입");
	    
	    Integer uno = (Integer) session.getAttribute("loginUno"); 
	    model.addAttribute("user", userService.userProfile(uno));
	    return "mypage/userProfile";
	}
	
	/* 회원 정보 수정 페이지 이동 */
	@GetMapping("/updateUserProfile")
	public void updateUserProfileGet(HttpSession session, Model model) {
		logger.info("회원 정보 수정 페이지 진입");
		 Integer uno = (Integer) session.getAttribute("loginUno"); 
		model.addAttribute("user", userService.userProfile(uno));
	}

	/* 회원 정보 수정 */
	@PostMapping("/updateUserProfile")
	public String updateUserProfilePost(UserVO user, HttpSession session, RedirectAttributes rttr) {

		String rawPw = "";
		String encodePw = "";

		rawPw = user.getUserPw(); // 비밀번호 데이터 얻음
		encodePw = pwEncoder.encode(rawPw); // 비밀번호 인코딩
		user.setUserPw(encodePw); // 인코딩된 비밀번호를 user 객체에 다시 저장

		userService.updateUserProfile(user);
		session.setAttribute("user", userService.userProfile(user.getUno()));
		rttr.addFlashAttribute("result", "update success");

		return "redirect:/mypage/userProfile?uno=" + user.getUno();
	}

	@PostMapping("/deleteUserProfile")
	public String deleteUserProfilePost(int uno, HttpSession session, RedirectAttributes rttr) {
		userService.deleteUserProfile(uno);

		// 세션 무효화를 통한 로그아웃 처리
		session.invalidate();
		rttr.addFlashAttribute("result", "delete success");

		return "redirect:/main";

	}

	/* 내가 쓴 댓글 조회페이지 이동 */
	@GetMapping("/myCommentList")
	public void myCommentListGet(@RequestParam int uno, @RequestParam(defaultValue = "1") int pageNum, Model model)
			{
		Map<String, Object> map = userService.getCommentList(uno, pageNum);
		model.addAttribute("pager", map.get("pager"));
		model.addAttribute("commentList", map.get("commentList"));

	}

	/* 내가 쓴 게시글 조회 페이지 이동 */
	@GetMapping("/myBoardWriteList")
	public void myBoardWriteListGet(@RequestParam int uno, @RequestParam(defaultValue = "1") int pageNum, Model model)
			{
		Map<String, Object> map = userService.getBoardWriteList(uno, pageNum);
		model.addAttribute("pager", map.get("pager"));
		model.addAttribute("boardWriteList", map.get("boardWriteList"));

	}

}
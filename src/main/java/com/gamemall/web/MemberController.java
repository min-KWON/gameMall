package com.gamemall.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gamemall.domain.MemberVO;
import com.gamemall.dto.LoginDTO;
import com.gamemall.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Setter(onMethod_ = {@Autowired})
	private MemberService memberService;
	
	//스프링시큐리티 암호화 클래스 객체 주입. spring-security.xml의 bcryptPasswordEncoder bean객체 주입
	@Setter(onMethod_ = {@Autowired})
	private PasswordEncoder passwordEncoder;
	
	
	// 아이디 중복체크
	@ResponseBody
	@GetMapping("/idCheck")
	public ResponseEntity<String> idCheck(String mbsp_id) {
		
		log.info("아이디: " + mbsp_id);
		
		ResponseEntity<String> entity = null;
		
		//idcheck 작업
		String isUse = "";
		if(memberService.idCheck(mbsp_id) != null) {
			isUse = "no";
		}else {
			isUse = "yes";
		}
		
		entity = new ResponseEntity<String>(isUse, HttpStatus.OK);
		
		return entity;
	}
	
	@GetMapping("/join")
	public void join() {
		log.info("회원가입 폼");
	}
	
	@PostMapping("/join")
	public String join(MemberVO vo) {
		
		log.info("회원정보: " + vo);
		
		// 평문 텍스트인 비밀번호를 스프링시큐리티 암호화클래스를 이용하여, 암호화시킴.
		vo.setMbsp_password(passwordEncoder.encode(vo.getMbsp_password()));
		
		log.info("회원정보: " + vo); 
		
		memberService.join(vo);
		
		return "redirect:/member/login";
	}
	
	@GetMapping("/login")
	public void login() {
		log.info("로그인 폼");
	}
	
	@PostMapping("/login")
	public String login(LoginDTO dto, HttpSession session, RedirectAttributes rttr) {
		
		log.info("로그인 정보: " + dto);
		
		MemberVO vo = memberService.login(dto.getMbsp_id());
		
		String url = "";
		String msg = "";
		
		if(vo != null) {
			if(passwordEncoder.matches(dto.getMbsp_password(), vo.getMbsp_password())) {
				session.setAttribute("loginStatus", vo); // 로그인한 사용자의 회원정보가 세션형태로 저장
				
				//로그인 시간 업데이트
				memberService.now_visit(dto.getMbsp_id());
				
				url = "/";
			}else {
				//  비번이 틀린경우
				url = "/member/login";
				msg = "failPW";
			}
		}else {
			// 아이디가 틀린경우
			url = "/member/login";
			msg = "failID";
		}
		
		rttr.addFlashAttribute("msg", msg); // jsp에서 msg 이름을 사용가능
		
		//로그인 검사.
		
		return "redirect:" + url;
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate(); // 사용자 세션관련정보가 모두 소멸.
		
		return "redirect:/";
	}
	
	@GetMapping(value = {"/modify", "/mypage"})
	public void modify(Model model, HttpSession session) {
		
		//세션객체로부터 사용자아이디 확보.
		String mbsp_id = ((MemberVO) session.getAttribute("loginStatus")).getMbsp_id();
		
		model.addAttribute("memberVO", memberService.login(mbsp_id));
		
	}
	
	@PostMapping("/modify")
	public String modify(MemberVO vo, HttpSession session, RedirectAttributes rttr) {
		
		String url = "";
		String msg = "";
		
		String mbsp_id = ((MemberVO) session.getAttribute("loginStatus")).getMbsp_id();
				
		// 암호화된 비밀번호를 db에서 읽어옴.
		String db_mbsp_password = ((MemberVO) memberService.login(mbsp_id)).getMbsp_password();
		
		if(passwordEncoder.matches(vo.getMbsp_password(), db_mbsp_password)) {
			// 회원정보수정작업
			memberService.modify(vo);
			
			msg = "modify";
			url = "/";
		}else {
			msg = "failPW";
			url = "/member/modify";
		}
			
		rttr.addFlashAttribute("msg", msg);
		
		return "redirect:" + url;
	}
	
	@ResponseBody
	@PostMapping("/pwchange")
	public ResponseEntity<String> pwchange(String old_mbsp_password, String new_mbsp_password, HttpSession session) {
		
		ResponseEntity<String> entity = null;
		String body = "";
		
		//기존 비번확인및 신규비번 변경작업
		log.info("기존비번: " + old_mbsp_password); // 1234
		log.info("신규비번: " + new_mbsp_password); // 4321
		
		MemberVO vo = (MemberVO) session.getAttribute("loginStatus");
		
		// 세션에 존재하고 있는 암호화된 비밀번호.  비번 1234 의 암호화
		//String db_mbsp_password = vo.getMbsp_password();
		
		String mbsp_id = vo.getMbsp_id();
		// 암호화된 비밀번호를 db에서 읽어옴.
		String db_mbsp_password = ((MemberVO) memberService.login(mbsp_id)).getMbsp_password();
			
		if(passwordEncoder.matches(old_mbsp_password, db_mbsp_password)) {
			
			//신규비밀번호를 암호화처리.  pwchange()메서드
			String enc_mbsp_password = passwordEncoder.encode(new_mbsp_password);
			memberService.pwchange(mbsp_id, enc_mbsp_password);
			
			body = "success";
		}else {
			
			body = "failPW";
		}
		
		entity = new ResponseEntity<String>(body, HttpStatus.OK);
		
		return entity;
	}
	
	@ResponseBody
	@PostMapping("/delete")
	public ResponseEntity<String> delete(String mbsp_password, HttpSession session) {
		ResponseEntity<String> entity = null;
		String body = "";
		
		String mbsp_id = ((MemberVO) session.getAttribute("loginStatus")).getMbsp_id();

		// 암호화된 비밀번호를 db에서 읽어옴.
		String db_mbsp_password = ((MemberVO) memberService.login(mbsp_id)).getMbsp_password();
			
		if(passwordEncoder.matches(mbsp_password, db_mbsp_password)) {
			// 회원탈퇴작업
			memberService.delete(mbsp_id);
			session.invalidate();
			
			body = "success";
		}else {
			
			body = "failPW";
		}
		
		entity = new ResponseEntity<String>(body, HttpStatus.OK);
		
		
		return entity;
	}
}

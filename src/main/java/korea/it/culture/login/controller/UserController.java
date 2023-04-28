package korea.it.culture.login.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import korea.it.culture.login.dao.UserDAO;
import korea.it.culture.login.vo.UserVO;

@Controller
public class UserController {
	@Autowired // 자동주입 : spring으로부터 자동생성 가능한 객체를 new없이 알아서 생성해준다
	HttpServletRequest request;

	@Autowired
	ServletContext app;
	
	@Autowired
	UserDAO user_dao;

	@Autowired
	public UserController(UserDAO user_dao) {
		this.user_dao = user_dao;
	}

	// 로그인메인 화면
	@RequestMapping("/login_main.do")
	public String loginmain() {
		return "/WEB-INF/views/user/login.jsp";
	}

	// 로그인
	@ResponseBody
	@RequestMapping("/login.do")
	public String login(HttpSession session) {
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");

		UserVO vo = user_dao.login(user_id);

		String param = "clear";

		if (vo == null) {
			// 아이디가 존재하지 않는 경우
			param = "no_user_id";
			return param;
		}
		
		//탈퇴회원 아이디 체크
		if(vo != null && vo.getUser_role_id() == 1) {
			param ="joined_out";
			return param;
		}


		// 비밀번호 일치 여부 확인
		if (!vo.getUser_pw().equals(user_pw)) {
			param = "no_user_pwd";
			return param;
		}
		
		if(vo != null && vo.getUser_pw().equals(user_pw)) {
			session = request.getSession();
			session.setAttribute("login", vo);
		}
		
		
		return param;
	}

	/*
	 * //로그인 성공 후 메인화면
	 * 
	 * @RequestMapping("/main.do") public String login_main () { return "main.do"; }
	 */

	// 회원가입 화면
	@RequestMapping("/join.do")
	public String join() {
		return "/WEB-INF/views/user/join.jsp";
	}

	// 회원등록
	@ResponseBody
	@RequestMapping("/joinin.do")
	public String joinin(UserVO vo) {
		
		String user_birth = request.getParameter("user_birth");
		vo.setUser_birth(user_birth);

		String user_gender = request.getParameter("user_gender");
		vo.setUser_gender(user_gender);

		user_dao.insert(vo);
		
		String result = "yes";
		
		if( vo != null ) {
	    	result = "yes";//아이디 중복
	    }
		
		return result;
	}
	
	//id중복체크
	@ResponseBody
	@RequestMapping(value="/idChk", method = RequestMethod.POST)
	public String idCheck(String user_id) throws Exception {
		
	    UserVO vo = user_dao.idCheck(user_id);
	    
	    String result = "no_id";
	    
	    if( vo != null ) {
	    	result = "yes_id";//아이디 중복
	    }
	    
	    return result;
	}
	
	//로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session = request.getSession();
		session.invalidate();

		return "redirect:culture.do";
	}
	
	

}

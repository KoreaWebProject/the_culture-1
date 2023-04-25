package koreait.culture.login.controller;


import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import koreait.culture.login.dao.UserDAO;
import koreait.culture.login.vo.UserVO;

/*import dao.UserDAO;
import vo.UserVO;*/


@Controller
public class UserController {
	@Autowired // 자동주입 : spring으로부터 자동생성 가능한 객체를 new없이 알아서 생성해준다
	HttpServletRequest request;

	@Autowired
	ServletContext app;
	UserDAO user_dao;

	
	public void setUser_dao(UserDAO user_dao) {
		
		this.user_dao = user_dao;
		System.out.println("dao");
	}

	//로그인메인 화면
	@RequestMapping(value = {"/", "/login_main.do"})
	public String loginmain() {
		return "/WEB-INF/views/user/login.jsp";
	}
	
	//로그인
	@ResponseBody
	@RequestMapping("/login.do")
	public String login() {
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		System.out.println(user_id+"/"+user_pw);
		
		UserVO vo = user_dao.selectOne(user_id);
		
		String param = "clear";
		
		if(vo==null) {
			//아이디가 존재하지 않는 경우
			param="no_user_id";
			return param;
		}
		
		//비밀번호 일치 여부 확인
		if(!vo.getUser_pw().equals(user_pw)) {
			param="no_user_pwd";
			return param;
		}
		
		return param;
	}
	
	/*
	 * //로그인 성공 후 메인화면
	 * 
	 * @RequestMapping("/main.do") public String login_main () { return "main.do"; }
	 */
	
	//회원가입 화면
	@RequestMapping("/join.do")
	public String join() {
		return "/WEB-INF/views/user/join.jsp";
	}
	
	
  //회원등록
  @ResponseBody
  @RequestMapping("/joinin.do") 
  public String joinin(UserVO vo) {
  
	  String user_birth = request.getParameter("user_birth");
	  vo.setUser_birth(user_birth);
	  System.out.println(user_birth);
	  
	  String user_gender = request.getParameter("user_gender");
	  vo.setUser_gender(user_gender);
	  System.out.println(vo.getUser_id()+"id");
	  System.out.println(vo.getUser_pw()+"pw");
	  System.out.println(vo.getUser_name()+"nm,");
	  System.out.println(vo.getUser_birth()+"bir");
	  System.out.println(vo.getUser_gender()+"gen");
	  System.out.println(vo.getUser_mail()+",ail");
	  System.out.println(vo.getUser_addr1()+"add");
	  System.out.println(vo.getUser_addr2()+"add2");
	  System.out.println(vo.getUser_zip_code()+"zip");
	  System.out.println(vo.getUser_role_id()+"id rol");
	  user_dao.insert(vo); 
	  return "redirect:login_main.do"; 
  }
  
  
 
	
}

package korea.it.culture.myPage.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import korea.it.culture.login.dao.UserDAO;
import korea.it.culture.login.vo.UserVO;
import korea.it.culture.myPage.util.MyCommon;

@Controller
public class MyPageController {
	@Autowired // 자동주입 : spring으로부터 자동생성 가능한 객체를 new없이 알아서 생성해준다
	HttpServletRequest request;
	@Autowired
	ServletContext app;
	
	UserDAO user_dao;
	@Autowired
	public MyPageController(UserDAO user_dao) {
		this.user_dao = user_dao;
	}
	
	//마이페이지 첫 화면으로 이동(회원정보 수정 창)
	@RequestMapping("/mypage.do")
	public String moveMyPage() {
		return MyCommon.MyPage.VIEW_PATH + "myPage.jsp";
	}

	//회원정보 수정을 위한 비밀번호 일치 여부 확인
	@ResponseBody
	@RequestMapping("/checkInfo.do")
	public String selectInfo(Model model) {
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");

		UserVO vo = user_dao.selectOne(user_id);

		String param = "clear";

		// 비밀번호 일치 여부 확인
		if (!vo.getUser_pw().equals(user_pw)) {
			param = "no_user_pwd";
			return param;
		}

		return param;
	}

	//비밀번호 확인 후 회원정보 수정 jsp로 이동
	@RequestMapping("/editInfo.do")
	public String moveEditPage() {
		return MyCommon.MyPage.VIEW_PATH + "editInfo.jsp";
	}

	//회원정보 수정
	@ResponseBody
	@RequestMapping("/updateInfo.do")
	public String updateInfo(HttpSession session, UserVO vo) {
		
		int res = user_dao.updateUser(vo);
		String result = "fail";
		
		if(res != 0) {
			//바뀐 정보로 세션 변경
			session = request.getSession();
			session.setAttribute("login", vo);
			result = "success";
		}
		return result;
	}
}

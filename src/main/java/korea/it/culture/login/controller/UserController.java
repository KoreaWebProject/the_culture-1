package korea.it.culture.login.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.github.scribejava.core.model.OAuth2AccessToken;
import korea.it.culture.login.dao.NaverLoginBO;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import korea.it.culture.login.dao.UserDAO;
import korea.it.culture.login.vo.UserVO;

import java.io.IOException;

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

	//naverLogin 로직 준비
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO){
		this.naverLoginBO = naverLoginBO;
	}



	// 로그인메인 화면
	// 메인 화면을 부르면서 네이버 아이디 인증 URL준비
	@RequestMapping(value = "/login_main.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String loginMain(Model model, HttpSession session) {

		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("naverlogin메서드의 네이버:" + naverAuthUrl);

		//네이버로그인 인증 URL을 생성한 후 model에 담기
		model.addAttribute("url", naverAuthUrl);

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

	//가입 페이지에서 history -1을 하면 네이버 세션 정보가 그대로 저장되어있어 일반
	// 회원가입버튼을 눌렀을 때에도 정보를 가지고 들어옴 그래서 세션초기화 후 리다이렉트

	@RequestMapping("/cancel.do")
	public String cancel(HttpSession session) {
		session = request.getSession();
		session.invalidate();
		return "redirect:login_main.do";
	}



	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code,
												 @RequestParam String state, HttpSession session) throws Exception {

		System.out.println("여기는 callback메서드의 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);

		//1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken);  //String형식의 json데이터
		System.out.println(apiResult);
		/** apiResult json 구조
		 {"resultcode":"00",
		 "message":"success",
		 "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com",
		 "name":"\uc2e0\ubc94\ud638"}}
		 **/

		//2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;

		//3. 데이터 파싱
		//Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject)jsonObj.get("response");
		//response의 nickname값 파싱
		String email = (String)response_obj.get("email");

		System.out.println("파싱한 이메일은" + email);
		//4.파싱 닉네임 세션으로 저장
		session.setAttribute("result",response_obj); //세션 생성
		model.addAttribute("result", response_obj);


		//3-1 	데이터 중 이메일을 기존 유저 데이터베이스에서 정보가 있는지 확인.
		// if 있으면 바로 로그인. else  없으면  가져온 정보들을 바탕으로 가입화면 join.do로 이동
		UserVO vo = user_dao.emailCheck(email);
		if (vo == null) {
			//만약 매치결과 null이면(정보가없다면) -> 회원가입(세션에 정보를 담아 감
			System.out.println("네이버 로그인 시도! 가입해야함! ദ്ദി(⩌ᴗ⩌ )");
			return "redirect:/join.do";
		}else{
			//매치결과 vo가 null이 아니면(가입되어있다는 뜻.
			// 해당 이메일에 맞는 id, pw로 로그인진행해주기	(처리하고 네이버정보가 담긴 세션 삭제 하기
			System.out.println("네이버 로그인 시도! 가입되어있음!ദ്ദിㆆ_ㆆ)");

			session = request.getSession();
			session.removeAttribute("result");//세션에 네이버 정보가 들어있기 때문에 삭제 후 필요한 vo만 넣기
			session.setAttribute("login", vo);
			return "redirect:culture.do";
		}

	}



}

package korea.it.culture.login.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.github.scribejava.core.model.OAuth2AccessToken;
import korea.it.culture.login.dao.SocialLoginService;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import korea.it.culture.login.dao.UserDAO;
import korea.it.culture.login.vo.UserVO;

import java.util.Map;

@Controller
public class UserController {
	@Autowired // 자동주입 : spring으로부터 자동생성 가능한 객체를 new없이 알아서 생성해준다
	HttpServletRequest request;

	@Autowired
	ServletContext app;

	@Autowired
	UserDAO user_dao;

	//naverLogin 로직 준비
	private SocialLoginService socialLoginService;

	@Autowired
	public UserController(UserDAO user_dao, SocialLoginService socialLoginService) {
		this.user_dao = user_dao;
		this.socialLoginService = socialLoginService;
	}
	private String apiResult = null;

	// 로그인메인 화면
	// 메인 화면을 부르면서 네이버 아이디 인증 URL준비
	@RequestMapping(value = "/login_main.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String loginMain(Model model, HttpSession session) {

		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = socialLoginService.getAuthorizationUrl(session);

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
		if (vo != null && vo.getUser_role_id() == 1) {
			param = "joined_out";
			return param;
		}

		// 비밀번호 일치 여부 확인
		if (!vo.getUser_pw().equals(user_pw)) {
			param = "no_user_pwd";
			return param;
		}

		if (vo != null && vo.getUser_pw().equals(user_pw)) {
			session = request.getSession();
			session.setAttribute("login", vo);
		}

		return param;
	}

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

		if (vo != null) {
			result = "yes";//아이디 중복
		}

		return result;
	}
	//id중복체크
	@ResponseBody
	@RequestMapping(value = "/idChk", method = RequestMethod.POST)
	public String idCheck(String user_id) throws Exception {

		UserVO vo = user_dao.idCheck(user_id);

		String result = "no_id";

		if (vo != null) {
			result = "yes_id";//아이디 중복
		}

		return result;
	}

	//로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session = request.getSession();
		session.invalidate();
		//request.getHeader("Referer")로 현재페이지 이전 URL주소 를 가져온다
		if (request.getHeader("Referer") != null) {
			//만약 어디 들렸다가 로그아웃하면 계속해서 볼 수 있게 돌려놔준다
			return "redirect:" + request.getHeader("Referer");
		} else {
			//아니라면 그냥 메인화면으로 리다이렉트해준다
			return "redirect:culture.do";
		}

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
	@RequestMapping(value = "/callback.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String callback(Model model, @RequestParam String code,
												 @RequestParam String state, HttpSession session) throws Exception {

		System.out.println("여기는 callback메서드의 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = socialLoginService.getAccessToken(session, code, state);

		//1. 로그인 사용자 정보를 읽어온다.
		apiResult = socialLoginService.getUserProfile(oauthToken);  //String형식의 json데이터
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
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		//response의 nickname값 파싱
		String email = (String) response_obj.get("email");

		System.out.println("파싱한 이메일은" + email);
		//4.파싱 닉네임 세션으로 저장
		session.setAttribute("result", response_obj); //세션 생성
		model.addAttribute("result", response_obj);


		//3-1 	데이터 중 이메일을 기존 유저 데이터베이스에서 정보가 있는지 확인.
		// if 있으면 바로 로그인. else  없으면  가져온 정보들을 바탕으로 가입화면 join.do로 이동
		UserVO vo = user_dao.emailCheck(email);
		if (vo == null) {
			//만약 매치결과 null이면(정보가없다면) -> 회원가입(세션에 정보를 담아 감
			System.out.println("네이버 로그인 시도! 가입해야함! ദ്ദി(⩌ᴗ⩌ )");
			return "redirect:/join.do";
		} else {
			//매치결과 vo가 null이 아니면(가입되어있다는 뜻.
			// 해당 이메일에 맞는 id, pw로 로그인진행해주기	(처리하고 네이버정보가 담긴 세션 삭제 하기
			System.out.println("네이버 로그인 시도! 가입되어있음!ദ്ദിㆆ_ㆆ)");

			session = request.getSession();
			session.removeAttribute("result");//세션에 네이버 정보가 들어있기 때문에 삭제 후 필요한 vo만 넣기
			session.setAttribute("login", vo);
			return "redirect:culture.do";
		}

	}
	
	@RequestMapping("/kakaologin.do")
	public String test2(String code){
		System.out.println("이리와");
		return "redirect:login/oauth_kakao";
	}
	
	//카카오로그인
	@RequestMapping(value = "/logintest.do")
	public @ResponseBody String getKakaoAuthUrl(
			HttpServletRequest request) throws Exception {
		String reqUrl = 
				"https://kauth.kakao.com/oauth/authorize"
				+ "?client_id=602c023b6ce1daeba7c38f4497a12be6"
				+ "&redirect_uri=http://localhost:9090/culture/kakaologin.do"
				+ "&response_type=code";
		
		return reqUrl;
	}
	
	// 카카오 연동정보조회
		@RequestMapping(value = "/login/oauth_kakao")
		public String oauthKakao(
				@RequestParam(value = "code", required = false) String code
				, Model model) throws Exception {

			System.out.println("#########" + code);
	        String access_Token = getAccessToken(code);
	        System.out.println("액세스 토큰 : " + access_Token);
	        System.out.println("###access_Token#### : " + access_Token);
	        
	        
	        HashMap<String, Object> userInfo = getUserInfo(access_Token);
	        System.out.println("###access_Token#### : " + access_Token);
	        System.out.println("###userInfo#### : " + userInfo.get("email"));
	        System.out.println("###nickname#### : " + userInfo.get("nickname"));
	       
	        JSONObject kakaoInfo =  new JSONObject(userInfo);
	        model.addAttribute("kakaoInfo", kakaoInfo);
	        
	        return "/WEB-INF/views/user/aaa.jsp"; //본인 원하는 경로 설정
		}
		
		//토큰발급
		public String getAccessToken (String authorize_code) {
	        String access_Token = "";
	        String refresh_Token = "";
	        String reqURL = "https://kauth.kakao.com/oauth/token";

	        try {
	            URL url = new URL(reqURL);

	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

	            //  URL연결은 입출력에 사용 될 수 있고, POST 혹은 PUT 요청을 하려면 setDoOutput을 true로 설정해야함.
	            conn.setRequestMethod("POST");
	            conn.setDoOutput(true);

	            //	POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
	            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	            StringBuilder sb = new StringBuilder();
	            sb.append("grant_type=authorization_code");
	            sb.append("&client_id=602c023b6ce1daeba7c38f4497a12be6");  //본인이 발급받은 key
	            sb.append("&redirect_uri=http://localhost:9090/culture/kakaologin.do");     // 본인이 설정해 놓은 경로
	            sb.append("&code=" + authorize_code);
	            bw.write(sb.toString());
	            bw.flush();

	            //    결과 코드가 200이라면 성공
	            int responseCode = conn.getResponseCode();
	            System.out.println("responseCode : " + responseCode);

	            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	            String line = "";
	            String result = "";

	            while ((line = br.readLine()) != null) {
	                result += line;
	            }
	            System.out.println("response body : " + result);

	            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
	            JsonParser parser = new JsonParser();
	            JsonElement element = parser.parse(result);

	            access_Token = element.getAsJsonObject().get("access_token").getAsString();
	            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

	            System.out.println("access_token : " + access_Token);
	            System.out.println("refresh_token : " + refresh_Token);

	            br.close();
	            bw.close();
	            System.out.println("success");
	        } catch (IOException e) {
	            // TODO Auto-generated catch block
	            System.out.println("error : ");
	            e.printStackTrace();
	           
	        }

	        return access_Token;
	    }
		
		//유저정보조회
	    public HashMap<String, Object> getUserInfo (String access_Token) {

	        //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
	        HashMap<String, Object> userInfo = new HashMap<String, Object>();
	        String reqURL = "https://kapi.kakao.com/v2/user/me";
	        try {
	            URL url = new URL(reqURL);
	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	            conn.setRequestMethod("GET");
	            conn.setRequestProperty("Content-type", 
	            		"application/x-www-form-urlencoded;charset=utf-8");
	            

	            //    요청에 필요한 Header에 포함될 내용
	            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

	            int responseCode = conn.getResponseCode();
	            System.out.println("responseCode : " + responseCode);

	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

	            String line = "";
	            String result = "";

	            while ((line = br.readLine()) != null) {
	                result += line;
	            }
	            System.out.println("response body : " + result);

	            JsonParser parser = new JsonParser();
	            JsonElement element = parser.parse(result);

	            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

	            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	            String email = kakao_account.getAsJsonObject().get("email").getAsString();
	            
	            userInfo.put("accessToken", access_Token);
	            userInfo.put("nickname", nickname);
	            userInfo.put("email", email);

	        } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }

	        return userInfo;
	    }

	/**
	 * 1.카카오 로그인 서비스 요청
	 * 2.인가코드 받기
	 * 3.사용자 인증 동의
	 * 
	 * @param code
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/kakao-callback.do")
	public String kakao(@RequestParam String code, Model model, HttpSession session) throws Exception {
		//?code = xxx로 오는 인가코드를 파라미터로 받는다
		//인가코드를  이용해  유저 정보에 접근할 수 있는 토큰요청!
		String access_token = socialLoginService.getToken(code);
		
		//내놔
		Map<String, Object> userInfo = socialLoginService.getUserInfo(access_token);

		//3-1 	데이터 중 이메일을 기존 유저 데이터베이스에서 정보가 있는지 확인.
		// if 있으면 바로 로그인. else  없으면  가져온 정보들을 바탕으로 가입화면 join.do로 이동
		String email = (String) userInfo.get("email");
		UserVO vo = user_dao.emailCheck(email);
		if (vo == null) {
			//4.파싱 닉네임 세션으로 저장
			session.setAttribute("result", userInfo); //세션 생성
			model.addAttribute("result", userInfo);
			//만약 매치결과 null이면(정보가없다면) -> 회원가입(세션에 정보를 담아 감
			return "redirect:/join.do";
		} else {
			//매치결과 vo가 null이 아니면(가입되어있다는 뜻.
			// 해당 이메일에 맞는 id, pw로 로그인진행해주기	(처리하고 네이버정보가 담긴 세션 삭제 하기
			session = request.getSession();
			session.removeAttribute("result");//세션에 카카오 정보가 들어있기 때문에 삭제 후 필요한 vo만 넣기
			session.setAttribute("login", vo);
			return "redirect:culture.do";
		}
	}
}

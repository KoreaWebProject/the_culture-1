package korea.it.culture.login.dao;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;

@Service
public class SocialLoginService {
  /* 인증 요청문을 구성하는 파라미터 */
  //client_id: 애플리케이션 등록 후 발급받은 클라이언트 아이디
  //response_type: 인증 과정에 대한 구분값. code로 값이 고정돼 있습니다.
  //redirect_uri: 네이버 로그인 인증의 결과를 전달받을 콜백 URL(URL 인코딩). 애플리케이션을 등록할 때 Callback URL에 설정한 정보입니다.
  //state: 애플리케이션이 생성한 상태 토큰
  private final static String CLIENT_ID = "a3fTo2_iGK1WV9fHtRVc";
  private final static String CLIENT_SECRET = "qHUo1UY2Gm";
  private final static String REDIRECT_URI = "http://localhost:9090/callback.do";
  private final static String SESSION_STATE = "oauth_state";
  /* 프로필 조회 API URL */
  private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";

  /* 네이버 아이디로 인증  URL 생성  Method */
  public String getAuthorizationUrl(HttpSession session) {

    /* 세션 유효성 검증을 위하여 난수를 생성 */
    String state = generateRandomString();
    /* 생성한 난수 값을 session에 저장 */
    setSession(session,state);

    /* Scribe에서 제공하는 인증 URL 생성 기능을 이용하여 네아로 인증 URL 생성 */
    OAuth20Service oauthService = new ServiceBuilder()
            .apiKey(CLIENT_ID)
            .apiSecret(CLIENT_SECRET)
            .callback(REDIRECT_URI)
            .state(state) //앞서 생성한 난수값을 인증 URL생성시 사용함
            .build(NaverLoginApi.instance());

    return oauthService.getAuthorizationUrl();
  }

  /* 네이버아이디로 Callback 처리 및  AccessToken 획득 Method */
  public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException {

    /* Callback으로 전달받은 세선검증용 난수값과 세션에 저장되어있는 값이 일치하는지 확인 */
    String sessionState = getSession(session);
    if(StringUtils.pathEquals(sessionState, state)){

      OAuth20Service oauthService = new ServiceBuilder()
              .apiKey(CLIENT_ID)
              .apiSecret(CLIENT_SECRET)
              .callback(REDIRECT_URI)
              .state(state)
              .build(NaverLoginApi.instance());

      /* Scribe에서 제공하는 AccessToken 획득 기능으로 네아로 Access Token을 획득 */
      OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
      return accessToken;
    }
    return null;
  }

  /* 세션 유효성 검증을 위한 난수 생성기 */
  private String generateRandomString() {
    return UUID.randomUUID().toString();
  }

  /* http session에 데이터 저장 */
  private void setSession(HttpSession session, String state){
    session.setAttribute(SESSION_STATE, state);
  }

  /* http session에서 데이터 가져오기 */
  private String getSession(HttpSession session){
    return (String) session.getAttribute(SESSION_STATE);
  }
  /* Access Token을 이용하여 네이버 사용자 프로필 API를 호출 */
  public String getUserProfile(OAuth2AccessToken oauthToken) throws IOException{

    OAuth20Service oauthService =new ServiceBuilder()
            .apiKey(CLIENT_ID)
            .apiSecret(CLIENT_SECRET)
            .callback(REDIRECT_URI).build(NaverLoginApi.instance());

    OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
    oauthService.signRequest(oauthToken, request);
    Response response = request.send();
    return response.getBody();
  }


  /**
   * 토큰요청 그리고 발급
   * @param code
   * @return
   * @throws Exception
   */
  //code = 인가코드
  public String getToken(String code) throws Exception {
    // 인가코드로 토큰받기
    String host = "https://kauth.kakao.com/oauth/token";
    URL url = new URL(host);
    System.out.println("‹^› ‹(•_•)› ‹^›  url " + url);
    HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
    String token = "";
    try {
      urlConnection.setRequestMethod("POST");
      urlConnection.setDoOutput(true); // 데이터 기록 알려주기

      BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(urlConnection.getOutputStream()));
      StringBuilder sb = new StringBuilder();
      sb.append("grant_type=authorization_code");
      sb.append("&client_id=a2fec8e26b856f784cee55f1fb98be1b");
      sb.append("&redirect_uri=http://localhost:9090/kakao-callback.do");
      sb.append("&code=" + code);
      System.out.println("append 한 sb  :  " + sb);

      bw.write(sb.toString());
      bw.flush();

      int responseCode = urlConnection.getResponseCode();
      System.out.println("(๑•̀༚•́)ฅ 2.결과 200 이면 정상! responseCode = " + responseCode);

      BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
      String line = "";
      String result = "";
      while ((line = br.readLine()) != null) {
        result += line;
      }
      System.out.println("result = " + result);

      // json parsing
      JSONParser parser = new JSONParser();
      JSONObject elem = (JSONObject) parser.parse(result);

      String access_token = elem.get("access_token").toString();
      String refresh_token = elem.get("refresh_token").toString();
      System.out.println("(๑•̀༚•́)ฅ 리프래쉬 토큰 refresh_token = " + refresh_token);
      System.out.println("(๑•̀༚•́)ฅ 액세스 토큰  access_token = " + access_token);

      token = access_token;
      System.out.println("token = " + token);


      br.close();
      bw.close();
    } catch (IOException e) {
      e.printStackTrace();
    } catch (ParseException e) {
      e.printStackTrace();
    }


    return token;
  }


  /**
   * 유저정보에 접근할 수 있는 엑세스 토큰을 가지고 유저데이터 가져오기
   * @param access_token
   * @return
   * @throws Exception
   */
  public Map<String, Object> getUserInfo(String access_token) throws Exception {
    String host = "https://kapi.kakao.com/v2/user/me";
    Map<String, Object> result = new HashMap<>();
    try {
      URL url = new URL(host);

      HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
      urlConnection.setRequestProperty("Authorization", "Bearer " + access_token);
      urlConnection.setRequestMethod("GET");

      int responseCode = urlConnection.getResponseCode();
      System.out.println("(๑•̀༚•́)ฅ getUserInfo()메서드의 responseCode = " + responseCode);


      BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
      String line = "";
      String res = "";
      while((line=br.readLine())!=null)
      {
        res+=line;
      }

      System.out.println("정보들을 가져오는 (๑•̀༚•́)ฅ res = " + res);


      JSONParser parser = new JSONParser();
      JSONObject obj = (JSONObject) parser.parse(res);
      System.out.println("obj : " + obj);
      JSONObject kakao_account = (JSONObject) obj.get("kakao_account");
      System.out.println("kakao_account : " + kakao_account);
      JSONObject properties = (JSONObject) obj.get("properties");
      System.out.println("properties : " + properties);


//      String id = obj.get("id").toString();
//      System.out.println("왜안나와왜안나와왜안나와왜안나와왜안나와왜안나와왜안나와왜안나와왜안나와왜안나와왜안나와id : " + id);

      String nickname = (String) properties.get("nickname");
      String email = (String)kakao_account.get("email");
      //네이버 기준 join.jsp창에서 ex(12-23)식으로 오던 날짜를 잘라서 사용하기 때문에 형식에 맞게 '-'를 넣어준다
      String  birth = (String)kakao_account.get("birthday");
      StringBuffer buf = new StringBuffer(birth);
      buf.insert(2, '-');
      String birthday = String.valueOf(buf);

      //성별도 마찬가지로 네이버에선 M, F로 구분한다 바꿔야겠지?
      String gender = (String)kakao_account.get("gender");
      if (Objects.equals(gender, "male")) {
        gender = "M";
      } else if (Objects.equals(gender, "female")) {
        gender = "F";
      }

      System.out.println("내가이겼어( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)" +
              "내가이겼어( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)내가이겼어( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)" +
              "내가이겼어( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)내가이겼어( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)" +
              "내가이겼어( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)내가이겼어( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)" +
              "내가이겼어( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)내가이겼어( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)" +
              "내가이겼어( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)내가이겼어( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)( ՞ټ՞)" +
              nickname +  " " + email +  " " + birthday +  " " + gender +  " ");

      result.put("name", nickname);
      result.put("email", email);
      result.put("birthday", birthday);
      result.put("gender", gender);

      br.close();


    } catch (IOException | ParseException e) {
      e.printStackTrace();
    }

    return result;
  }





}

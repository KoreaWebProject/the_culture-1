package korea.it.culture.myPage.controller;

import java.util.HashMap;
import java.util.List;

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
import korea.it.culture.myPage.util.Paging;
import korea.it.culture.qna.dao.QnaDAO;
import korea.it.culture.qna.dao.QnaReDAO;
import korea.it.culture.qna.util.Common;
import korea.it.culture.qna.vo.QnaReVO;
import korea.it.culture.qna.vo.QnaVO;

@Controller
public class MyPageController {
	@Autowired // 자동주입 : spring으로부터 자동생성 가능한 객체를 new없이 알아서 생성해준다
	HttpServletRequest request;
	@Autowired
	ServletContext app;

	UserDAO user_dao;
	QnaDAO qna_dao;
	QnaReDAO qna_re_dao;

	@Autowired
	public MyPageController(UserDAO user_dao, QnaDAO qna_dao, QnaReDAO qna_re_dao) {
		this.user_dao = user_dao;
		this.qna_dao = qna_dao;
		this.qna_re_dao = qna_re_dao;
	}

	// 마이페이지 첫 화면으로 이동(회원정보 수정 창)
	@RequestMapping("/mypage.do")
	public String moveMyPage() {
		return MyCommon.MyPage.VIEW_PATH + "myPage.jsp";
	}

	// 회원정보 수정을 위한 비밀번호 일치 여부 확인
	@ResponseBody
	@RequestMapping("/checkInfo.do")
	public String selectInfo(Model model) {
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");

		UserVO vo = user_dao.login(user_id);

		String param = "clear";

		// 비밀번호 일치 여부 확인
		if (!vo.getUser_pw().equals(user_pw)) {
			param = "no_user_pwd";
			return param;
		}

		return param;
	}

	// 비밀번호 확인 후 회원정보 수정 jsp로 이동
	@RequestMapping("/editInfo.do")
	public String moveEditPage() {
		return MyCommon.MyPage.VIEW_PATH + "editInfo.jsp";
	}

	// 회원정보 수정
	@ResponseBody
	@RequestMapping("/updateInfo.do")
	public String updateInfo(HttpSession session, UserVO vo) {

		int res = user_dao.updateUser(vo);
		String result = "fail";

		if (res != 0) {
			// 바뀐 정보로 세션 변경
			session = request.getSession();
			session.setAttribute("login", vo);
			result = "success";
		}
		return result;
	}

	// 회원 탈퇴 확인 페이지로 이동
	@RequestMapping("/delInfo.do")
	public String delPage() {
		return MyCommon.MyPage.VIEW_PATH + "delPage.jsp";
	}

	// 회원 탈퇴 확인 페이지로 이동
	@ResponseBody
	@RequestMapping("/userDel.do")
	public String delUser(HttpSession session, String user_id) {
		int res = user_dao.delUser(user_id);

		String result = "fail";
		if (res != 0) {
			// 탈퇴 성공으로 인한 세션 삭제로 로그아웃
			session = request.getSession();
			session.invalidate();
			result = "success";
		}

		return result;
	}

	// 나의 문의내역 화면으로 이동
	@RequestMapping("/myQna.do")
	public String moveMyQna(Model model) {
		int nowPage = 1; // 1로 첫페이지 번호를 가정
		
		String user_id = request.getParameter("user_id");
		String page = request.getParameter("page");// 기본자료형은 null값을 판단하지 못함
		
		if (page != null && !page.isEmpty()) {// 올바른 값을 받았다면
			nowPage = Integer.parseInt(page);
		}

		// 한페이지에 표시될 게시물의 시작과 끝 번호를 계산
		int start = (nowPage - 1) * Common.Board.BLOCKLIST + 1;
		int end = nowPage * Common.Board.BLOCKLIST;

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("user_id", user_id);

		// 검색관련 내용
		String search = request.getParameter("search");// 카테고리
		String search_text = request.getParameter("search_text");// 검색어

		// 검색어가 입력되어 있는 경우
		if (search != null && !search.equalsIgnoreCase("all")) {
			switch (search) {
			case "name_subject_content":
				map.put("name", search_text);
				map.put("subject", search_text);
				map.put("content", search_text);
				break;
			case "name":
				map.put("name", search_text);
				break;
			case "subject":
				map.put("subject", search_text);
				break;
			case "content":
				map.put("content", search_text);
				break;

			default:
				break;
			}// switch
		}

		List<QnaVO> list = qna_dao.selectMyList(map);
		
		// 페이지 메뉴 생성
		int row_id = qna_dao.getRowID(user_id);

		String search_param = String.format("search=%s&search_text=%s", search, search_text);

		// 하단 페이지 메뉴 생성
		String pageMenu = Paging.getPaging("myQna.do?user_id="+user_id, nowPage, // 현재페이지
				row_id, // 전체 게시글 수
				search_param, Common.Board.BLOCKLIST, // 한 페이지에 보여줄 게시글 수
				Common.Board.BLOCKPAGE); // 페이지 메뉴의 수

		//바인딩
		model.addAttribute("pageMenu", pageMenu);
		model.addAttribute("list", list);
		
		return MyCommon.MyPage.VIEW_PATH + "myQna.jsp";
	}

	// 내가 남긴 문의글 자세히 보기
	@RequestMapping("/myQnaView.do")
	public String qna_view(Model model) {
		int qna_id = Integer.parseInt(request.getParameter("qna_id"));
		// 선택한 게시글의 내용들 가져오기
		QnaVO vo = qna_dao.selectOne(qna_id);
		// 선택한 게시글에 달려있는 댓글(관리자의 글)을 가져오기
		List<QnaReVO> list = qna_re_dao.selectList(qna_id);

		model.addAttribute("vo", vo);// 바인딩
		model.addAttribute("list", list);// 바인딩
		// 세션에서 현재 사용자 id를 가져와서 바인딩 해줌

		return MyCommon.MyPage.VIEW_PATH + "myQnaDetail.jsp";
	}

	// 나의 후기 jsp로 이동
	@RequestMapping("/myReview.do")
	public String moveMyReviewPage(Model model) {
		String user_id = request.getParameter("user_id");
		
		int nowPage = 1; // 1로 첫페이지 번호를 가정
		String page = request.getParameter("page");// 기본자료형은 null값을 판단하지 못함
		if (page != null && !page.isEmpty()) {// 올바른 값을 받았다면
			nowPage = Integer.parseInt(page);
		}

		// 한페이지에 표시될 게시물의 시작과 끝 번호를 계산
		int start = (nowPage - 1) * Common.Board.BLOCKLIST + 1;
		int end = nowPage * Common.Board.BLOCKLIST;

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("user_id", user_id);

		List<QnaVO> list = qna_dao.selectMyList(map);

		// 페이지 메뉴 생성
		int row_id = qna_dao.getRowID(user_id);

		// 하단 페이지 메뉴 생성
		String pageMenu = Paging.getPaging("myQna.do", nowPage, // 현재페이지
				row_id, // 전체 게시글 수
				"", Common.Board.BLOCKLIST, // 한 페이지에 보여줄 게시글 수
				Common.Board.BLOCKPAGE); // 페이지 메뉴의 수

		// pageMenu를 바인딩
		model.addAttribute("pageMenu", pageMenu);

		model.addAttribute("list", list);
		
		return MyCommon.MyPage.VIEW_PATH + "myReview.jsp";
	}

}

package korea.it.culture.qna.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import korea.it.culture.login.dao.UserDAO;
import korea.it.culture.qna.dao.QnaDAO;
import korea.it.culture.qna.dao.QnaReDAO;
import korea.it.culture.qna.util.Common;
import korea.it.culture.qna.util.MyCommon;
import korea.it.culture.qna.util.Paging;
import korea.it.culture.qna.vo.QnaReVO;
import korea.it.culture.qna.vo.QnaVO;

@Controller
public class QnaController {
	@Autowired // 자동주입 : 스프링으로부터 자동생성 가능한 객체를 new없이 알아서 생성해준다
	HttpServletRequest request; // 서블릿 컨택스트로 감 / ip구할 때 사용

	@Autowired
	ServletContext app; // 절대 경로 찾기 위해서 만들어 둠

	QnaDAO qna_dao;
	QnaReDAO qna_re_dao;
	UserDAO user_dao;

	@Autowired
	public QnaController(QnaDAO qna_dao, QnaReDAO qna_re_dao, UserDAO user_dao) {
		this.qna_dao = qna_dao;
		this.qna_re_dao = qna_re_dao;
		this.user_dao = user_dao;
	}

	// Qna 전체 등록 목록 조회
	@RequestMapping("/qna_main.do")
	public String QnaList(Model model) {
		/* System.out.println("확인2"); */

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

		List<QnaVO> list = qna_dao.selectList(map);

		// 페이지 메뉴 생성
		int row_total = qna_dao.getRowTotal(map);

		String search_param = String.format("search=%s&search_text=%s", search, search_text);

		// 하단 페이지 메뉴 생성
		String pageMenu = Paging.getPaging("qna_main.do", nowPage, // 현재페이지
				row_total, // 전체 게시글 수
				search_param, Common.Board.BLOCKLIST, // 한 페이지에 보여줄 게시글 수
				Common.Board.BLOCKPAGE); // 페이지 메뉴의 수

		// pageMenu를 바인딩
		model.addAttribute("pageMenu", pageMenu);

		model.addAttribute("list", list);
		return MyCommon.Qna.VIEW_PATH + "qna_main.jsp";
	}

	// 새 글 추가 화면전환 용
	@RequestMapping("/qna_reg.do")
	public String insert_form() {
		return MyCommon.Qna.VIEW_PATH + "qna_reg.jsp";
	}

	// Qna 등록
	@RequestMapping("/qna_insert.do")
	public String qna_insert(QnaVO vo) {
		System.out.println("공개타입"+vo.getQna_contents());
		qna_dao.insertContent(vo);
		return "redirect:qna_main.do";
	}

	// 문의글 자세히 보기
	@RequestMapping("/qna_view.do")
	public String qna_view(Model model) {
		System.out.println(request.getParameter("qna_id"));
		int qna_id = Integer.parseInt(request.getParameter("qna_id"));
		String page = request.getParameter("page");
		String search = request.getParameter("search");
		String search_text = request.getParameter("search_text");
		// 선택한 게시글의 내용들 가져오기
		QnaVO vo = qna_dao.selectOne(qna_id);
		// 선택한 게시글에 달려있는 댓글(관리자의 글)을 가져오기
		List<QnaReVO> list = qna_re_dao.selectList(qna_id);

		model.addAttribute("vo", vo);// 바인딩
		model.addAttribute("list", list);// 바인딩
		model.addAttribute("page", page);
		model.addAttribute("search", search);
		model.addAttribute("search_text", search_text);
		// 세션에서 현재 사용자 id를 가져와서 바인딩 해줌

		return MyCommon.Qna.VIEW_PATH + "qna_detail.jsp";
	}
	
	// 문의글 자세히 보기
	@RequestMapping("/qna_update.do")
	public String qna_update(Model model , QnaVO qna) {
		int qna_id = Integer.parseInt(request.getParameter("qna_id"));
		// 선택한 게시글의 내용들 가져오기
		QnaVO vo = qna_dao.selectOne(qna_id);
		// 선택한 게시글에 달려있는 댓글(관리자의 글)을 가져오기
		List<QnaReVO> list = qna_re_dao.selectList(qna_id);

		model.addAttribute("vo", vo);// 바인딩
		model.addAttribute("list", list);// 바인딩
		// 세션에서 현재 사용자 id를 가져와서 바인딩 해줌

		return MyCommon.Qna.VIEW_PATH + "qna_update.jsp";
	}
	
	@RequestMapping("/modify.do")
	public String modify(Model model, QnaVO qna) {
		System.out.println(qna.getQna_id());
		String page = request.getParameter("page");
		String search = request.getParameter("search");
		String search_text = request.getParameter("search_text");
		qna_dao.modify(qna);
		return "redirect:qna_main.do?page="+page+"&search="+search+"&search_text="+search_text;
	}
	
	// 문의답글 추가 화면전환 용
	@RequestMapping("/qna_reple_reg.do")
	public String reple_insert_form(Model model) {
		int qna_id = Integer.parseInt(request.getParameter("qna_id"));
		String page = request.getParameter("page");
		String search = request.getParameter("search");
		String search_text = request.getParameter("search_text");
		QnaReVO reVo = new QnaReVO();
		reVo.setQna_id(qna_id);
		QnaVO vo = qna_dao.selectOne(qna_id);
		
		model.addAttribute("page", page);
		model.addAttribute("search", search);
		model.addAttribute("search_text", search_text);
		model.addAttribute("reVo", reVo);
		model.addAttribute("qna",vo);
		return MyCommon.Qna.VIEW_PATH + "qna_reple_reg.jsp";
	}

	// QnaReple 달기
	@RequestMapping("/qna_reple.do")
	public String qna_reple_insert(Model model, QnaReVO vo) {
		int qna_id = Integer.parseInt(request.getParameter("qna_id"));
		String page = request.getParameter("page");
		String search = request.getParameter("search");
		String search_text = request.getParameter("search_text");
		vo.setQna_id(qna_id);
		qna_re_dao.insert(vo);

		return "redirect:qna_view.do?qna_id="+qna_id+"&page="+page+"&search="+search+"&search_text="+search_text;
	}
	// Qna 삭제를 위한 업데이트
	@RequestMapping("/qna_del.do")
	public String qna_del() {
		System.out.println(request.getParameter("qna_id"));
		int qna_id = Integer.parseInt(request.getParameter("qna_id"));
		String page = request.getParameter("page");
		String search = request.getParameter("search");
		String search_text = request.getParameter("search_text");
		qna_dao.update(qna_id);
		qna_re_dao.delete(qna_id);

		return "redirect:qna_main.do?page="+page+"&search="+search+"&search_text="+search_text;
	}

	// QnaReple 삭제를 위한 업데이트
	@RequestMapping("/qna_reple_del.do")
	public String qna_reple_del(Model model) {
		int qna_re_ref = Integer.parseInt(request.getParameter("qna_re_ref"));
		int qna_id = Integer.parseInt(request.getParameter("qna_id"));
		String page = request.getParameter("page");
		String search = request.getParameter("search");
		String search_text = request.getParameter("search_text");
		qna_re_dao.update(qna_re_ref);

		return "redirect:qna_view.do?qna_id="+qna_id+"&page="+page+"&search="+search+"&search_text="+search_text;
	}

	//qna 완료처리 
	@RequestMapping("/qna_clear.do")
	public String qna_clear() {
		int qna_id = Integer.parseInt(request.getParameter("qna_id"));
		String page = request.getParameter("page");
		String search = request.getParameter("search");
		String search_text = request.getParameter("search_text");
		qna_dao.update_clear(qna_id);

		return "redirect:qna_main.do?page="+page+"&search="+search+"&search_text="+search_text;
	}
}

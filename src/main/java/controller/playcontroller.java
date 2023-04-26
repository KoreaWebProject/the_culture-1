package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.LocInfoDAO;
import dao.PlayDAO;
import dao.PlayInfoDAO;
import dao.RepleDAO;
import dao.TodayDAO;
import dao.UserInfoDAO;
import util.Common;
import util.Paging;
import util.Pagingupdate;
import vo.LocInfoVO;
import vo.PlayInfoVO;
import vo.PlayVO;
import vo.TodayVO;
import vo.UserInfoVO;

@Controller
public class playcontroller {

	PlayDAO playdao;
	PlayInfoDAO playinfodao;
	RepleDAO repledao;
	UserInfoDAO userinfodao;
	TodayDAO todaydao;
	LocInfoDAO locinfodao;

	@Autowired // 자동주입 : spring으로부터 자동생성 가능한 객체를 new없이 알아서 생성해 준다
	HttpServletRequest request;

	@Autowired
	public playcontroller(PlayDAO playdao, PlayInfoDAO playinfodao, UserInfoDAO userinfodao, TodayDAO todaydao,
			RepleDAO repledao, LocInfoDAO locinfodao) {
		this.playdao = playdao;
		this.playinfodao = playinfodao;
		this.userinfodao = userinfodao;
		this.todaydao = todaydao;
		this.repledao = repledao;
		this.locinfodao = locinfodao;

	}

	@RequestMapping(value = { "/", "/culture.do" })
	public String selectList(Model model) {
		List<PlayVO> list = playdao.selectList();
		List<TodayVO> tlist = todaydao.selectList();

		model.addAttribute("today", tlist);
		model.addAttribute("rank", list);
		return "/WEB-INF/views/culturemain.jsp";
	}

	@RequestMapping("/login_form.do")
	public String login_form() {
		System.out.println("여기는옴");
		return "/WEB-INF/views/login.jsp";
	}

	@RequestMapping("/login.do")
	public String login(HttpSession session) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		UserInfoVO vo = userinfodao.selectOne(id);
		if (vo == null) {
			return "redirect:login_form.do";
		} else {

			session = request.getSession();
			session.setAttribute("login", vo);

			return "redirect:culture.do";
		}
	}

	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session = request.getSession();
		session.invalidate();

		return "redirect:culture.do";
	}

	@RequestMapping("/info.do")
	public String info(Model model) {
		String genrenm = request.getParameter("genrenm");

		int nowPage = 1;
		String page = request.getParameter("page");
		if (page != null && !page.isEmpty()) {
			nowPage = Integer.parseInt(page);
		}
		// 한 페이지에 표시될 게시물의 시작과 끝 번호를 계산
		// 1페이지 : 1~5까지의 게시글
		// 2페이지 : 6~10 까지의 게시글
		int start = (nowPage - 1) * Common.Board.BLOCKLIST + 1;
		int end = nowPage * Common.Board.BLOCKLIST;

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("genrenm", genrenm);
		
		String search = request.getParameter("search"); // 카테고리
		String search_text = request.getParameter("search_text");

		// 검색어가 입력되어 있는 경우
		if (search != null) {

			switch (search) {
			case "prfnm":
				map.put("prfnm", search_text);
				break;
			case "locnm":
				map.put("locnm", search_text);
				break;
			case "fromto":
				map.put("fromto", search_text);
				break;
			}// if

		} // switch

		int row_total = playdao.getRowTotal(map);
		System.out.println(row_total);
		String search_param = String.format("search=%s&search_text=%s", search, search_text);


		// 하단 페이지 메뉴 생성
		String pageMenu = Paging.getPaging("info.do", nowPage, // 현재 페이지
				row_total, // 전체 게시글 수
				genrenm,search_param, Common.Board.BLOCKLIST, // 한 페이지에 보여주는 게시글 수
				Common.Board.BLOCKPAGE); // 페이지 메뉴의 수

		List<PlayVO> list = playdao.selectgenre(map);

		model.addAttribute("pageMenu", pageMenu);
		model.addAttribute("select", list);
		model.addAttribute("genrenm", genrenm);
		return "/WEB-INF/views/playgeList.jsp";
	}

	@RequestMapping("/update.do")
	public String update(Model model) {

		String play_id = request.getParameter("play_id");

		int nowPage = 1;
		String page = request.getParameter("page");
		if (page != null && !page.isEmpty()) {
			nowPage = Integer.parseInt(page);
		}
		// 한 페이지에 표시될 게시물의 시작과 끝 번호를 계산
		// 1페이지 : 1~5까지의 게시글
		// 2페이지 : 6~10 까지의 게시글
		int start = (nowPage - 1) * Common.Board.BLOCKLIST + 1;
		int end = nowPage * Common.Board.BLOCKLIST;

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		String search = request.getParameter("search"); // 카테고리
		String search_text = request.getParameter("search_text");

		// 검색어가 입력되어 있는 경우
		if (search != null) {

			switch (search) {
			case "prfnm_locnm_fromto":
				map.put("prfnm", search_text);
				map.put("locnm", search_text);
				map.put("fromto", search_text);
				break;
			case "prfnm":
				map.put("prfnm", search_text);
				break;
			case "locnm":
				map.put("locnm", search_text);
				break;
			case "fromto":
				map.put("fromto", search_text);
				break;
			case "genrenm":
				map.put("genrenm", search_text);
			}// if

		} // switch

		int row_total = playdao.getRowallTotal(map);
		String search_param = String.format("search=%s&search_text=%s", search, search_text);

		// 하단 페이지 메뉴 생성
		String pageMenu = Pagingupdate.getPaging("update.do", nowPage, // 현재 페이지
				row_total, play_id, search_param, // 전체 게시글 수
				Common.Board.BLOCKLIST, // 한 페이지에 보여주는 게시글 수
				Common.Board.BLOCKPAGE); // 페이지 메뉴의 수

		List<PlayVO> list = playdao.selectallList(map);

		model.addAttribute("play_id", play_id);
		model.addAttribute("pageMenu", pageMenu);
		model.addAttribute("allselect", list);

		return "/WEB-INF/views/update.jsp";
	}

	@RequestMapping("/updatelist.do")
	public String updatelist(Model model) {
		String select_id = request.getParameter("select_id");
		String play_id = request.getParameter("play_id");
		HashMap<String, String> id = new HashMap<String, String>();
		id.put("select_id", select_id);
		id.put("play_id", play_id);

		playdao.updatelist(id);

		return "redirect:culture.do";

	}

	@RequestMapping("/moreinfo.do")
	public String moreinfo(Model model) {
		String play_id = request.getParameter("play_id");
	
		PlayVO playvo = playdao.selectone(play_id);
		PlayInfoVO infovo = playinfodao.moreinfo(play_id);
		
		
		
		String loc_id = infovo.getLoc_id();
		
		LocInfoVO locinfovo = locinfodao.locinfo(loc_id);
		
		model.addAttribute("loc",locinfovo);
		model.addAttribute("play", playvo);
		model.addAttribute("info", infovo);

		return "/WEB-INF/views/moreinfo.jsp";
	}

}

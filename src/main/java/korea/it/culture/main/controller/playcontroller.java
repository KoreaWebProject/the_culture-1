package korea.it.culture.main.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import korea.it.culture.main.dao.PlayDAO;
import korea.it.culture.main.dao.TodayDAO;
import korea.it.culture.reple.dao.RepleDAO;
import korea.it.culture.main.util.Common;
import korea.it.culture.main.util.Paging;
import korea.it.culture.main.util.Pagingupdate;
import korea.it.culture.main.vo.PlayVO;
import korea.it.culture.main.vo.TodayVO;


@Controller
public class playcontroller {

	PlayDAO playdao;
	RepleDAO repledao;
	TodayDAO todaydao;

	@Autowired // 자동주입 : spring으로부터 자동생성 가능한 객체를 new없이 알아서 생성해 준다
	HttpServletRequest request;

	@Autowired
	public playcontroller(PlayDAO playdao, TodayDAO todaydao,
			RepleDAO repledao) {
		this.playdao = playdao;
		this.todaydao = todaydao;
		this.repledao = repledao;

	}

	@RequestMapping(value = { "/", "/culture.do" })
	public String selectList(Model model) {
		List<PlayVO> list = playdao.selectList();
		List<TodayVO> tlist = todaydao.selectList();

		model.addAttribute("today", tlist);
		model.addAttribute("rank", list);
		return "/WEB-INF/views/main/culturemain.jsp";
	}


	@RequestMapping("/geinfo.do")
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
		String pageMenu = Paging.getPaging("geinfo.do", nowPage, // 현재 페이지
				row_total, // 전체 게시글 수
				genrenm,search_param, Common.Board.BLOCKLIST, // 한 페이지에 보여주는 게시글 수
				Common.Board.BLOCKPAGE); // 페이지 메뉴의 수

		List<PlayVO> list = playdao.selectgenre(map);

		model.addAttribute("pageMenu", pageMenu);
		model.addAttribute("select", list);
		model.addAttribute("genrenm", genrenm);
		model.addAttribute("total",row_total);
		return "/WEB-INF/views/main/playgeList.jsp";
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
		model.addAttribute("total",row_total);

		return "/WEB-INF/views/main/update.jsp";
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


}

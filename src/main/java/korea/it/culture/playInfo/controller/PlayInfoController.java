package korea.it.culture.playInfo.controller;

import korea.it.culture.login.vo.UserVO;
import korea.it.culture.main.dao.PlayDAO;
import korea.it.culture.main.vo.PlayVO;
import korea.it.culture.playInfo.dao.PlayInfoService;
import korea.it.culture.playInfo.util.MyCommon;
import korea.it.culture.playInfo.vo.LocInfoVO;
import korea.it.culture.playInfo.vo.PlayInfoVO;
import korea.it.culture.main.vo.RepleVO;
import korea.it.culture.playInfo.vo.User_goodVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Handles requests for the application home page.
 */
@Controller
public class PlayInfoController {

	@Autowired // 자동주입 : spring으로부터 자동생성 가능한 객체를 new없이 알아서 생성해준다
	HttpServletRequest request;
	private PlayInfoService infoService;
	private PlayDAO playDAO;

	@Autowired
	public PlayInfoController(PlayInfoService infoService, PlayDAO playDAO) {
		this.infoService = infoService;
		this.playDAO = playDAO;
	}

	/**
	 * playId를 list에서 받아와 map에 저장 후 쿼리문 실행 결과값 vo를 model에 add 후 playInfo 로 전송
	 * 
	 * @param model
	 * @param play_id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/info.do", method = RequestMethod.GET)
	public String viewInfo(Model model, @RequestParam("play_id") String play_id) throws Exception {

		HttpSession session = request.getSession();

		// 조건 값을 저장할 parameter용 map
		Map<String, Object> paramMap = new HashMap<>();

		PlayVO playVO = playDAO.selectone(play_id);

		// 조건값 삽입
		// 게시글 데이터 가져오기 (vo에 service안에있는 detail메서드에 파라미터 맵을 보내서 .)
		// 작품의 상세정보 담아오기
		paramMap.put("play_id", play_id);
		PlayInfoVO playInfoVO = infoService.getPlayInfo(paramMap);

		// 작품의 시설 상세정보 담아오기
		paramMap.put("loc_id", playInfoVO.getLoc_id());
		LocInfoVO locInfoVO = infoService.getLocInfo(paramMap);
		System.out.println(locInfoVO.getLoc_url());
		// http:// 프로토콜이 포함되어있지 않으면 포함시킨 후 보내기
		if (!locInfoVO.getLoc_url().contains("://")) {
			locInfoVO.setLoc_url("http://" + locInfoVO.getLoc_url());
		}

		List<RepleVO> reple_list = infoService.getReple(play_id);

		List<User_goodVO> good_list = infoService.getGood(play_id);

		if (session.getAttribute("login") != null) {
			UserVO vo = (UserVO) session.getAttribute("login");
			System.out.println(vo.getUser_id());
			for (int i = 0; i < reple_list.size(); i++) {
				for (User_goodVO good : good_list) {
					if (reple_list.get(i).getReple_id() == good.getReple_id()
							&& vo.getUser_id().equals(good.getUser_id())) {
						reple_list.get(i).setGood_check(1);
						break;
					}
				}
			}
		}

		model.addAttribute("reple_list", reple_list);
		model.addAttribute("good_list", good_list);
		model.addAttribute("play_id", play_id);
		model.addAttribute("play", playVO);
		model.addAttribute("playInfo", playInfoVO);
		model.addAttribute("locInfo", locInfoVO);
		return MyCommon.playInfo.VIEW_PATH + "playInfo.jsp";
	}

	/**
	 * 공연장 정보를 가져오기 위함
	 * 
	 * @param model
	 * @param loc_id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/loc.do", method = RequestMethod.GET)
	public String locInfo(Model model, @RequestParam("loc_id") String loc_id) throws Exception {
		// 조건 값을 저장할 parameter용 map
		Map<String, Object> paramMap = new HashMap<>();
		// 조건값 삽입
		paramMap.put("loc_id", loc_id);
		// 게시글 데이터 가져오기 (vo에 service안에있는 detail메서드에 파라미터 맵을 보내서 .)
		LocInfoVO vo = infoService.getLocInfo(paramMap);

		model.addAttribute("loc", vo);
		return MyCommon.playInfo.VIEW_PATH + "locInfo.jsp";
	}

	/**
	 * 후기
	 * 
	 * @param model
	 * @param play_id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/reple.do")
	public String Reple(Model model, @RequestParam("play_id") String play_id) throws Exception {
		// 게시글 데이터 가져오기 (vo에 service안에있는 detail메서드에 파라미터 맵을 보내서 .)

		List<RepleVO> reple_list = infoService.getReple(play_id);

		model.addAttribute("reple_list", reple_list);
		model.addAttribute("play_id", play_id);
		return MyCommon.playInfo.VIEW_PATH + "reple.jsp";
	}

	@RequestMapping(value = "/favorite.do")
	public String favorite(PlayVO playVO, UserVO userVO) {

		System.out.println("저왔어유");
		System.out.println(playVO.getPlay_id());
		System.out.println(userVO.getUser_id());

		return "redirect:" + request.getHeader("Referer");
	}

	@RequestMapping(value = "/review.do")
	@ResponseBody
	public String review(RepleVO vo) throws Exception {

		System.out.println(vo.getReple_rating());
		int res = infoService.insertReple(vo);
		String result = "";
		if (res == 1) {
			result = "success";
		} else {
			result = "no";
		}

		return result;
	}

	@RequestMapping(value = "/replewrite.do")
	public String replewrite(Model model, @RequestParam("play_id") String play_id) throws Exception {

		model.addAttribute("play_id", play_id);
		return MyCommon.playInfo.VIEW_PATH + "replewrite.jsp";
	}

	@RequestMapping(value = "/repledel.do")
	public String replewrite(Model model, @RequestParam("reple_id") int reple_id) throws Exception {

		int res = infoService.repledel(reple_id);
		return "redirect:" + request.getHeader("Referer");
	}

	@RequestMapping("/replegood.do")
	@ResponseBody
	public Map<String, Object> replegood(User_goodVO goodvo) throws Exception {
		Map<String, Object> result = new HashMap<>();
		int num = 0;
		if (goodvo.getGood_check() == 0) {
			infoService.goodplus(goodvo);
			infoService.goodpluscount(goodvo.getReple_id());
			result.put("result", "plus");
		}

		else if (goodvo.getGood_check() == 1) {
			infoService.gooddelete(goodvo);
			infoService.goodmicount(goodvo.getReple_id());
			
			result.put("result", "minus");

		}
		num = infoService.goodcount(goodvo.getReple_id());
		result.put("goodnum", num);
		result.put("reple_id", goodvo.getReple_id());
		return result;
	}

}
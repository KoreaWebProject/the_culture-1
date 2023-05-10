package korea.it.culture.playInfo.controller;

import korea.it.culture.playInfo.dao.PlayInfoService;
import korea.it.culture.playInfo.util.MyCommon;
import korea.it.culture.playInfo.vo.PlayInfoVO;
import korea.it.culture.reple.vo.RepleVO;
import korea.it.culture.playInfo.vo.LocInfoVO;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Handles requests for the application home page.
 */
@Controller
public class PlayInfoController {

	private PlayInfoService infoService;

	@Autowired
	HttpServletRequest request;

	@Autowired
	public PlayInfoController(PlayInfoService infoService) {
		this.infoService = infoService;
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
		// 조건 값을 저장할 parameter용 map
		Map<String, Object> paramMap = new HashMap<>();
		// 조건값 삽입
		paramMap.put("play_id", play_id);
		// 게시글 데이터 가져오기 (vo에 service안에있는 detail메서드에 파라미터 맵을 보내서 .)
		PlayInfoVO vo = infoService.getPlayInfo(paramMap);

		model.addAttribute("info", vo);
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

	@RequestMapping(value = "/review.do")
	public String review(RepleVO vo) throws Exception {

		//System.out.println(vo);
		infoService.insertReple(vo);

		return "redirect:reple.do?play_id=" + vo.getPlay_id();
	}

}

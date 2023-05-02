package korea.it.culture.playInfo.controller;

import korea.it.culture.main.vo.PlayVO;
import korea.it.culture.playInfo.dao.PlayInfoService;
import korea.it.culture.playInfo.util.MyCommon;
import korea.it.culture.playInfo.vo.PlayInfoVO;

import korea.it.culture.playInfo.vo.LocInfoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {


  private PlayInfoService infoService;

  @Autowired
  public HomeController(PlayInfoService infoService) {
    this.infoService = infoService;
  }


  /**
   * 초기페이지  Model 객체에 담아 jsp단에서 list로 사용
   *
   * @param model
   * @return
   * @throws Exception
   * todo 상수햄 병합 시 삭제예정
   */
 

  /**
   * playId를 list에서 받아와 map에 저장 후 쿼리문 실행
   * 결과값 vo를 model에 add 후 playInfo 로 전송
   * @param model
   * @param play_id
   * @return
   * @throws Exception
   */
  @RequestMapping(value = "/info.do", method = RequestMethod.GET)
  public String viewInfo(Model model, @RequestParam("play_id") String play_id) throws Exception{
    System.out.println("con의 ViewInfo 실행");
    //조건 값을 저장할 parameter용 map
    Map<String, Object> paramMap = new HashMap<>();
    //조건값 삽입
    paramMap.put("play_id", play_id);
    //게시글 데이터 가져오기  (vo에 service안에있는 detail메서드에 파라미터 맵을 보내서 .)
    PlayInfoVO vo = infoService.getPlayInfo(paramMap);

    model.addAttribute("info", vo);
    return MyCommon.playInfo.VIEW_PATH + "playInfo.jsp";
  }


  /**
   * 공연장 정보를 가져오기 위함
   * @param model
   * @param loc_id
   * @return
   * @throws Exception
   */
  @RequestMapping(value = "/loc.do", method = RequestMethod.GET)
  public String locInfo(Model model, @RequestParam("loc_id") String loc_id) throws Exception{
    System.out.println("con의 locInfo 실행");
    //조건 값을 저장할 parameter용 map
    Map<String, Object> paramMap = new HashMap<>();
    //조건값 삽입
    paramMap.put("loc_id", loc_id);
    //게시글 데이터 가져오기  (vo에 service안에있는 detail메서드에 파라미터 맵을 보내서 .)
    LocInfoVO vo = infoService.getLocInfo(paramMap);

    model.addAttribute("loc", vo);
    return MyCommon.playInfo.VIEW_PATH + "locInfo.jsp";
  }


}

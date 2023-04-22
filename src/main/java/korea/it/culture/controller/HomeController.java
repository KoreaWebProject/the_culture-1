package korea.it.culture.controller;

import java.text.DateFormat;
import java.util.*;

import korea.it.culture.service.PlayInfoService;
import korea.it.culture.vo.PlayVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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


	@RequestMapping(value = "/", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getBoardList() throws Exception {
		System.out.println("c11111111111111111");
		List<PlayVO> list = infoService.getList();
		System.out.println("cc2222222222222222222222222222222");
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("dataList", list);
		return resultMap;
	}
	
}

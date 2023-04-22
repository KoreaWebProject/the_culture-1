package korea.it.culture.service;

import korea.it.culture.dao.PlayInfoMapper;
import korea.it.culture.vo.PlayVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PlayInfoService {

  private PlayInfoMapper infoMapper;

  @Autowired
  public void setBoardMapper(PlayInfoMapper infoMapper) {
    this.infoMapper = infoMapper;

  }

    public List<PlayVO> getList() throws Exception {
      System.out.println("sssssssssssssssssssss");
      return infoMapper.getList();
    }
}

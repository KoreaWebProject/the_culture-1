package korea.it.culture.service;

import korea.it.culture.dao.PlayInfoMapper;
import korea.it.culture.vo.PlayInfoVO;
import korea.it.culture.vo.PlayVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class PlayInfoService {

  private PlayInfoMapper infoMapper;

  @Autowired
  public void setBoardMapper(PlayInfoMapper infoMapper) {
    this.infoMapper = infoMapper;
    System.out.println("service Autowired 실행완료");


  }

  /**
   * 임시 공연목록 리스트 출력
   * todo 삭제 예정
   * @return
   * @throws Exception
   */
    public List<PlayVO> getList() throws Exception {
      System.out.println("service에 getList 메서드 진입");
      return infoMapper.getList();
    }

    public PlayInfoVO getPlayInfo(Map<String, Object> paramMap) throws Exception{
      System.out.println("service에 getPlayInfo 메서드 진입");
      return infoMapper.getPlayInfo(paramMap);
    }
}

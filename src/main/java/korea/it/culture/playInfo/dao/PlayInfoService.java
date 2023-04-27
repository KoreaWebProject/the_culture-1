package korea.it.culture.playInfo.dao;

import korea.it.culture.playInfo.vo.PlayInfoVO;
import korea.it.culture.main.vo.PlayVO;
import korea.it.culture.playInfo.vo.LocInfoVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class PlayInfoService {

  private SqlSession sqlSession;

  @Autowired
  public  PlayInfoService(SqlSession sqlSession) {
    this.sqlSession = sqlSession;
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
      List<PlayVO> list = sqlSession.selectList("pInfo.getList");
      return list;
    }

  /**
   * 공연에 대한 상세정보 출력
   * @param paramMap
   * @return
   * @throws Exception
   */
  public PlayInfoVO getPlayInfo(Map<String, Object> paramMap) throws Exception{
    System.out.println("service에 getPlayInfo 메서드 진입");
    PlayInfoVO vo = sqlSession.selectOne("pInfo.getPlayInfo", paramMap);
    return vo;
  }

  /**
   *  공연시설에 대한 상세정보 출력
   * @param paramMap
   * @return
   * @throws Exception
   */
  public LocInfoVO getLocInfo(Map<String, Object> paramMap) throws Exception{
    System.out.println("service에 getLocInfo 메서드 진입");
    LocInfoVO vo = sqlSession.selectOne("pInfo.getLocInfo", paramMap);
    return vo;
  }

}

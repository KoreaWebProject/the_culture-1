package korea.it.culture.playInfo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import korea.it.culture.playInfo.vo.LocInfoVO;
import korea.it.culture.playInfo.vo.PlayInfoVO;
import korea.it.culture.playInfo.vo.RepleVO;

@Repository
public class PlayInfoService {

  private SqlSession sqlSession;

  @Autowired
  public  PlayInfoService(SqlSession sqlSession) {
    this.sqlSession = sqlSession;
    System.out.println("service Autowired 실행완료");
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
  
  
  /**
   *  공연후기 출력
   * @param paramMap
   * @return
   * @throws Exception
   */
  public List<RepleVO> getReple(String play_id) throws Exception{
	System.out.println("service에 getRepleVO 메서드 진입");
	List<RepleVO> list = sqlSession.selectList("r.getReple", play_id);
    return list;
  }
  
  public int insertReple(RepleVO vo) {
	  
	  int res = sqlSession.insert("r.insertReple", vo);
	  System.out.println(res);
	  
	  return res;
  }
  

}
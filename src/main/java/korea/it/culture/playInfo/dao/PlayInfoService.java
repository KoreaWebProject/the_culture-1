package korea.it.culture.playInfo.dao;


import java.util.List;
import java.util.Map;


import korea.it.culture.playInfo.vo.FavoriteVO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import korea.it.culture.playInfo.vo.LocInfoVO;
import korea.it.culture.playInfo.vo.PlayInfoVO;
import korea.it.culture.main.vo.RepleVO;
import korea.it.culture.myPage.vo.MyrepleVO;
import korea.it.culture.playInfo.vo.User_goodVO;

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
  
  public List<MyrepleVO> getmyReple(String user_id) {
		System.out.println("service에 getRepleVO 메서드 진입");
		List<MyrepleVO> list = sqlSession.selectList("r.getmyReple", user_id);
	    return list;
	  }
  
  public int insertReple(RepleVO vo) {
	  
	  int res = sqlSession.insert("r.insertReple", vo);
	  System.out.println(res);
	  
	  return res;
  }
  
  public int repledel(int reple_id) {
	  int res = sqlSession.update("r.repledel", reple_id);
	  return res;
  }
  
  public int goodplus(User_goodVO goodvo) {
	  int res = sqlSession.insert("r.goodplus", goodvo);
	  return res;
  }
  public int goodpluscount(int reple_id) {
	  int res = sqlSession.update("r.goodpluscount", reple_id);
	  return res;
  }
  public int gooddelete(User_goodVO goodvo) {
	  int res = sqlSession.delete("r.gooddelete", goodvo);
	  return res;
  }
  public int goodmicount(int reple_id) {
	  int res = sqlSession.update("r.goodmicount", reple_id);
	  return res;
  }
  
  public int goodcount(int reple_id) {
	  int res = sqlSession.selectOne("r.goodcount", reple_id);
	  return res;
  }

  public List<User_goodVO> getGood(String play_id) {
		List<User_goodVO> list = sqlSession.selectList("r.getGood", play_id);
	    return list;
	  }
  
  public List<User_goodVO> getmyGood(String user_id) {
		List<User_goodVO> list = sqlSession.selectList("r.getmyGood", user_id);
	    return list;
	  }


  /**
   * 작품 즐겨찾기
   * @param vo
   * @return
   * @throws Exception
   */
  public int favorite(FavoriteVO vo) throws Exception {
    System.out.println("service에 favorite메서드 진입");

    int res = sqlSession.insert("pInfo.favorite", vo);
    System.out.println("res?" + res);
    return res;
  }


  public FavoriteVO getFavorite(Map<String, Object> paramMap) throws Exception{
    System.out.println("service에 getFavorite메서드 진입");
    FavoriteVO vo = sqlSession.selectOne("pInfo.getFavorite", paramMap);
    return vo;


  }
  public int deleteFavorite(FavoriteVO vo) throws Exception {
    System.out.println("service에 deleteFavorite메서드 진입");

    int res = sqlSession.delete("pInfo.deleteFavorite", vo);
    System.out.println("res?" + res);
    return res;
  }
  
  
  public  List<FavoriteVO> getFavoriteList(String user_id){
	    System.out.println("service에 getFavorite메서드 진입");
	    List<FavoriteVO> list = sqlSession.selectList("pInfo.getFavoriteList", user_id);
	    return list;


	  }

}
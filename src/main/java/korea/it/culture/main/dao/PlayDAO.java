package korea.it.culture.main.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import korea.it.culture.main.vo.PlayVO;



@Repository
public class PlayDAO {
	
	SqlSession sqlSession;
	
	@Autowired
	public PlayDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		System.out.println(this.sqlSession);
	}
	
	public List<PlayVO> selectallList(HashMap<String, Object> map) {
		List<PlayVO> list = sqlSession.selectList("p.all_list",map);
		return list;
	}
	
	public List<PlayVO> selectList() {
		List<PlayVO> list = sqlSession.selectList("p.rank_list");
		return list;
	}
	
	public List<PlayVO> selectgenre( HashMap<String, Object> map ) {
		List<PlayVO> list = sqlSession.selectList("p.genre_list",map);
		return list;
	}
	
	public PlayVO selectone( String play_id ) {
		PlayVO vo = sqlSession.selectOne("p.one_list",play_id);
		return vo;
	}
	
	public int getRowTotal(HashMap<String, Object> map) {
		int res = sqlSession.selectOne("p.play_count",map);
		return res;
	}
	
	public int getRowallTotal(HashMap<String, Object> map) {
		int res = sqlSession.selectOne("p.play_allcount",map);
		return res;
	}
	
	public int updatelist(HashMap<String, String> id) {
		int res = sqlSession.update("p.update_list",id);
		return res;
	}
	
}

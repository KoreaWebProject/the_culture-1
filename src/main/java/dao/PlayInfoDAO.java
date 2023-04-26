package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.PlayInfoVO;
import vo.PlayVO;

@Repository
public class PlayInfoDAO {
	
	SqlSession sqlSession;
	
	@Autowired
	public PlayInfoDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		System.out.println(this.sqlSession);
	}
	
	public PlayInfoVO moreinfo(String play_id) {
		PlayInfoVO vo = sqlSession.selectOne("pi.more_info",play_id);
		return vo;
	}
	
	
	
}

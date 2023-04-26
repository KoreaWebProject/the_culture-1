package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.PlayVO;
import vo.TodayVO;

@Repository
public class TodayDAO {
	
	SqlSession sqlSession;
	
	@Autowired
	public TodayDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		System.out.println(this.sqlSession);
	}
	
	public List<TodayVO> selectList() {
		List<TodayVO> list = sqlSession.selectList("t.today_list");
		return list;
	}
	
	
	
}

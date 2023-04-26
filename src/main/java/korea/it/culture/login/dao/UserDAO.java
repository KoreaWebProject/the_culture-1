package korea.it.culture.login.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import korea.it.culture.login.vo.UserVO;

@Repository
public class UserDAO {
	SqlSession sqlSession;
	
	@Autowired
	public UserDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//회원추가 
	public int insert(UserVO vo) { 
		int res = sqlSession.insert("u.user_insert", vo); 
		return res; 
	}
	
	//로그인
	public UserVO selectOne(String user_id) {
		UserVO vo = sqlSession.selectOne("u.user_login", user_id);
		return vo;
	}
	

}

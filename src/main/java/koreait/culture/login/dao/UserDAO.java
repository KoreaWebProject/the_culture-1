package koreait.culture.login.dao;

import org.apache.ibatis.session.SqlSession;

import koreait.culture.login.vo.UserVO;

public class UserDAO {
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	//회원추가 
	public int insert(UserVO vo) { 
		int res = sqlSession.insert("u.user_insert", vo); 
		return res; 
	}
	
	//로그인
	public UserVO selectOne(String user_id) {
		System.out.println("hi:"+user_id);
		UserVO vo = sqlSession.selectOne("u.user_login", user_id);
		return vo;
	}
	

}

package korea.it.culture.login.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import korea.it.culture.login.vo.UserVO;

@Repository("user_dao")
public class UserDAO {
	@Autowired
	SqlSession sqlSession;

	@Autowired
	public UserDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 회원추가
	public int insert(UserVO vo) {
		int res = sqlSession.insert("u.user_insert", vo);
		return res;
	}

	
	// id 통한 회원확인하기
	public UserVO idCheck(String user_id) throws Exception {
		
		UserVO vo = null;
		try {
			vo = sqlSession.selectOne("u.idCheck", user_id);
		} catch (Exception e) {
			throw new Exception("중복아이디", e);
		}
		
		return vo;
	}
	
	

	// 로그인
	public UserVO login(String user_id) {
		UserVO vo = sqlSession.selectOne("u.user_login", user_id);
		return vo;
		
	}


	// 이메일 정보를 통한 회원확인하기
	public UserVO emailCheck(String email) throws Exception {

		UserVO vo = sqlSession.selectOne("u.emailCheck", email);

		return vo;
	}
	
	

}

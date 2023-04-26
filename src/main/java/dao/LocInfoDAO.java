package dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.UserInfoVO;
import vo.LocInfoVO;
import vo.PlayVO;

@Repository
public class LocInfoDAO {
	
	SqlSession sqlSession;
	
	@Autowired
	public LocInfoDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		System.out.println(this.sqlSession);
	}
	
	public LocInfoVO locinfo(String loc_id) {
		LocInfoVO vo = sqlSession.selectOne("l.loc_info",loc_id);
		return vo;
	}
	
}

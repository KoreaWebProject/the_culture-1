package korea.it.culture.playInfo.dao;

import korea.it.culture.playInfo.vo.PlayInfoVO;
import korea.it.culture.reple.vo.RepleVO;
import korea.it.culture.playInfo.vo.LocInfoVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public class PlayInfoService {

	private SqlSession sqlSession;

	@Autowired
	public PlayInfoService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	/**
	 * 공연에 대한 상세정보 출력
	 * 
	 * @param paramMap
	 * @return
	 * @throws Exception
	 */
	public PlayInfoVO getPlayInfo(Map<String, Object> paramMap) throws Exception {
		PlayInfoVO vo = sqlSession.selectOne("pInfo.getPlayInfo", paramMap);
		return vo;
	}

	/**
	 * 공연시설에 대한 상세정보 출력
	 * 
	 * @param paramMap
	 * @return
	 * @throws Exception
	 */
	public LocInfoVO getLocInfo(Map<String, Object> paramMap) throws Exception {
		LocInfoVO vo = sqlSession.selectOne("pInfo.getLocInfo", paramMap);
		return vo;
	}

	public RepleVO getReple(String play_id) {
		RepleVO vo = sqlSession.selectOne("r.getReple", play_id);
		return vo;
	}

}
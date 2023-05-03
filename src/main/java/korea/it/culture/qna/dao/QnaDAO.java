package korea.it.culture.qna.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import korea.it.culture.qna.vo.QnaVO;

@Repository
public class QnaDAO {

	SqlSession sqlSession;

	@Autowired
	public QnaDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 전체 게시글 수 알아내기
	public int getRowTotal(HashMap<String, Object> map) {
		int res = sqlSession.selectOne("q.qna_count", map);
		return res;
	}

	// QNA 목록 출력
	public List<QnaVO> selectList(HashMap<String, Object> map) {
		// System.out.println("QNADAO SELECTLIST");
		List<QnaVO> list = sqlSession.selectList("q.qna_list", map);
		return list;
	}
	// QNA 등록
	public int insertContent(QnaVO vo) {
		// System.out.println("Qna insert");
		int res = sqlSession.insert("q.qna_insert", vo);
		return res;
	}

	// 선택한 QNA 내용 출력
	public QnaVO selectOne(int qna_id) {
		QnaVO detail = sqlSession.selectOne("q.qna_detail", qna_id);
		return detail;
	}
	
	public int modify( QnaVO vo ) {
		int res = sqlSession.update("q.qna_modify", vo);
		return res;
	}

	// qna 삭제
	public int update(int qna_id) {
		int res = sqlSession.update("q.qna_del_up", qna_id);
		// System.out.println(res);
		// System.out.println(qna_id);
		return res;
	}

	// qna 완료
	public int update_clear(int qna_id) {
		int res = sqlSession.update("q.qna_update_clear", qna_id);
		return res;
	}
	
	// myQNA 목록 출력
	public List<QnaVO> selectMyList(HashMap<String, Object> map) {
		List<QnaVO> list = sqlSession.selectList("q.qna_u_list", map);
		return list;
	}
	
	// 동일 아이디의 게시글 수 알아내기
	public int getRowID(String user_id) {
		int res = sqlSession.selectOne("q.qna_u_count", user_id);
		return res;
	}
}


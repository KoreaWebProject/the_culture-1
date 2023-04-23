package korea.it.culture.dao;

import korea.it.culture.vo.PlayInfoVO;
import korea.it.culture.vo.PlayVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface PlayInfoMapper {


  /**
   * 임시 공연 목록 보이기
   * todo 삭제예정
   * @return
   * @throws Exception
   */
  List<PlayVO> getList() throws Exception;

  PlayInfoVO getPlayInfo(Map<String, Object> paramMap) throws Exception;

}

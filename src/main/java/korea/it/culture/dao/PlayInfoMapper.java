package korea.it.culture.dao;

import korea.it.culture.vo.LocInfoVO;
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


  /**
   * 공연에 대한 상세정보 출력
   * @param paramMap
   * @return
   * @throws Exception
   */
  PlayInfoVO getPlayInfo(Map<String, Object> paramMap) throws Exception;


  /**
   * 공연시설에 대한 상세정보 출력
   * @param paramMap
   * @return
   * @throws Exception
   */
  LocInfoVO getLocInfo(Map<String, Object> paramMap) throws Exception;


}

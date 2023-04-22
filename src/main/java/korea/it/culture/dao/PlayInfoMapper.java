package korea.it.culture.dao;

import korea.it.culture.vo.PlayVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PlayInfoMapper {

  List<PlayVO> getList() throws Exception;
}

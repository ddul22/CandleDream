package test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.candle.common.DataSource;
import com.candle.mapper.CandleMapper;
import com.candle.vo.ItemVO;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SqlSession sqlSession = DataSource.getInstance().openSession();
		CandleMapper mapper = sqlSession.getMapper(CandleMapper.class);
		List<ItemVO> product = mapper.selectAll();
		System.out.println(product.isEmpty());
		for(ItemVO vo: product) {
			System.out.println(vo);
		}
	}

}

package com.candle.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.candle.common.Control;
import com.candle.common.DataSource;
import com.candle.mapper.JisuMapper;
import com.candle.vo.QnaVO;
import com.candle.vo.SearchVO;

public class QnaControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		SqlSession sqlSession = DataSource.getInstance().openSession();
		JisuMapper mapper = sqlSession.getMapper(JisuMapper.class);
		List<QnaVO> list = mapper.qnaList();
		
		req.setAttribute("list", list);
		req.getRequestDispatcher("candle/qna.tiles").forward(req, resp); // 다음화면에 값
	}

}

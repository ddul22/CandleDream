package com.candle.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.candle.common.Control;
import com.candle.common.DataSource;
import com.candle.mapper.JisuMapper;
import com.candle.vo.QnaVO;

public class QnaReplyControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SqlSession sqlSession=DataSource.getInstance().openSession();
		JisuMapper mapper = sqlSession.getMapper(JisuMapper.class);
		
		String QnaVO = req.getParameter("qnaContent");
		QnaVO qnareply = mapper.qnaInfo(Integer.parseInt(QnaVO));
		
		
		
	}

}

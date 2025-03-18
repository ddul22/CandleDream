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

public class QnaControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String qno = req.getParameter("qno");
		
		SqlSession sqlSession = DataSource.getInstance().openSession();
		JisuMapper mapper = sqlSession.getMapper(JisuMapper.class);
		
		QnaVO qna = mapper.getQna(Integer.parseInt(qno)); 
		
		req.setAttribute("qno", qno);
		req.getRequestDispatcher("candle/qna.tiles").forward(req, resp);
	}

}

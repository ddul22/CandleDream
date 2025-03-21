package com.candle.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.candle.common.Control;
import com.candle.common.DataSource;
import com.candle.mapper.JisuMapper;
import com.candle.vo.QnaVO;

public class QnaAddControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		
		String title = req.getParameter("qnaTitle");
		String content = req.getParameter("qnaContent");
		String userNo = req.getParameter("userNo");

		Map<String, Object> addQna = new HashMap<String, Object>();
		addQna.put("qnaTitle", title);
		addQna.put("qnaContent", content);
		addQna.put("userNo", userNo);

		SqlSession sqlSession = DataSource.getInstance().openSession(true);
		JisuMapper mapper = sqlSession.getMapper(JisuMapper.class);

		int result = mapper.insertQna(addQna);

		if (result > 0) {
			resp.sendRedirect("qna.do");

		} else {
			resp.sendRedirect("qnaAddForm.do");
		}
	}

}

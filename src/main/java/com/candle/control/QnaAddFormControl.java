package com.candle.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.candle.common.Control;
import com.candle.common.DataSource;
import com.candle.mapper.JisuMapper;

public class QnaAddFormControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("candle/qnaAddForm.tiles").forward(req, resp); 
		

		
		
		
	}

}

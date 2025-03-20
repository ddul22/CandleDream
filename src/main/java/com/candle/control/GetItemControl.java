package com.candle.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.candle.common.Control;
import com.candle.common.DataSource;
import com.candle.mapper.SikMapper;
import com.candle.vo.ItemVO;
import com.google.gson.Gson;

public class GetItemControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		resp.setContentType("application/json;charset=utf-8");

		String itemNo = req.getParameter("itemNo");

		SqlSession sqlSession = DataSource.getInstance().openSession(true);
		SikMapper mapper = sqlSession.getMapper(SikMapper.class);
		ItemVO item = mapper.getItem(Integer.parseInt(itemNo));

		Gson gson = new Gson();
		resp.getWriter().print(gson.toJson(item));
	}

}

package com.candle.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.candle.common.Control;
import com.candle.common.DataSource;
import com.candle.mapper.SikMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class UpdateOrderStatusControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String orderNo = req.getParameter("orderNo");

		SqlSession sqlSession = DataSource.getInstance().openSession(true);
		SikMapper mapper = sqlSession.getMapper(SikMapper.class);
		int result = mapper.updateOrderStatus(Integer.parseInt(orderNo));

		Map<String, String> resultMap = new HashMap<>();
		if (result > 0) {
			resultMap.put("retCode", "OK");
		} else {
			resultMap.put("retCode", "NG");
		}
		
		Gson gson = new GsonBuilder().create();
		resp.getWriter().print(gson.toJson(resultMap));
	}

}

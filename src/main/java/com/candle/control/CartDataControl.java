package com.candle.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.candle.common.Control;
import com.candle.common.DataSource;
import com.candle.mapper.EunMapper;
import com.candle.vo.ItemVO;
import com.candle.vo.OrderVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class CartDataControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("application/json;charset=utf-8");

		String userNo = req.getParameter("userNo");

		SqlSession sqlSession = DataSource.getInstance().openSession();
		EunMapper mapper = sqlSession.getMapper(EunMapper.class);

		OrderVO order = mapper.order(Integer.parseInt(userNo));
		List<ItemVO> list = new ArrayList<>();
		if (order != null) {
			list = mapper.item(order.getOrderNo());
		}

		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String json = gson.toJson(list);
		System.out.println(json);
		resp.getWriter().print(json);
	}

}

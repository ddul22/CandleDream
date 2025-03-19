package com.candle.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.candle.common.Control;
import com.candle.common.DataSource;
import com.candle.mapper.SikMapper;
import com.candle.vo.ItemVO;
import com.candle.vo.OrderVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class GetOrderInfoControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("application/json;charset=utf8");
		
		String userNo = req.getParameter("userNo");

		SqlSession sqlSession = DataSource.getInstance().openSession(true);
		SikMapper mapper = sqlSession.getMapper(SikMapper.class);
		
		List<OrderVO> orderList = mapper.getOrderList(Integer.parseInt(userNo));
		
		for (OrderVO order : orderList) {
			List<ItemVO> itemList = mapper.getOrderItemList(order.getOrderNo());
			order.setItemList(itemList);
		}

		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		
		resp.getWriter().print(gson.toJson(orderList));
	}

}

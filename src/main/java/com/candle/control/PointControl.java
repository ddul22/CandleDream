package com.candle.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.candle.common.Control;
import com.candle.common.DataSource;
import com.candle.mapper.EunMapper;
import com.candle.vo.ItemVO;
import com.candle.vo.OrderVO;
import com.candle.vo.UserVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class PointControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		resp.setContentType("application/json;charset=utf-8");
		String userNo = req.getParameter("userNo");
		
		SqlSession sqlSession = DataSource.getInstance().openSession();
		EunMapper mapper = sqlSession.getMapper(EunMapper.class);
		
		OrderVO order = mapper.order(Integer.parseInt(userNo));
		List<ItemVO> list = mapper.item(order.getOrderNo());
		
		int totalPrice = 0;
		for (ItemVO item : list) {
			totalPrice += item.getOrderItemCount() * item.getOrderItemPrice();
		}
		
		Map<String, Object> res = new HashMap<String, Object>();
		
		//update : user_point > user_point - totalPrice
		int r = mapper.point(totalPrice , Integer.parseInt(userNo));
		//update : order_status 0 > 2
		if(r>0) {
			r = mapper.status(order.getOrderNo());
			if (r>0) {
				res.put("retCode", "OK");
			} else {
				res.put("retCode", "NG");
			}
		} else {
			res.put("retCode", "NG");
		}
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(res);

		resp.getWriter().print(json);
	}

}

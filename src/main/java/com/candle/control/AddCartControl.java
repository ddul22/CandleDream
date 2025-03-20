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
import com.candle.mapper.EohMapper;
import com.candle.vo.AddCartItemVO;
import com.candle.vo.AddCartVO;
import com.google.gson.Gson;

public class AddCartControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int userNo = Integer.parseInt(req.getParameter("userNo"));
		int itemNo = Integer.parseInt(req.getParameter("itemNo"));
		int orderItemCount = Integer.parseInt(req.getParameter("orderItemCount"));
		int orderItemPrice = Integer.parseInt(req.getParameter("orderItemPrice"));

		SqlSession sqlSession = DataSource.getInstance().openSession();
		EohMapper mapper = sqlSession.getMapper(EohMapper.class);

		Map<String, Object> map = new HashMap<>();
		Gson gson = new Gson();

		// orderNo check
		int orderNo = mapper.orderNo(userNo); // orderNo의 정보가 있는지 없는지 확인.
		System.out.println("orderNo : " + orderNo);
		// 0 이면
		if (orderNo == 0) { // 주문이 없으면.
			AddCartVO addCart = new AddCartVO(); // orderNo != 0 이면, 새로운 주문을 추가.
			addCart.setUserNo(userNo);

			orderNo = mapper.orderInfo(addCart);

			if (orderNo == 0) {
				sqlSession.rollback(true);
				map.put("retCode", "NG");
				resp.getWriter().print(gson.toJson(map));
				return;
			}
		}

		AddCartItemVO addCartItem = new AddCartItemVO();
		addCartItem.setOrderNo(orderNo);
		addCartItem.setItemNo(itemNo);
		addCartItem.setOrderItemCount(orderItemCount);
		addCartItem.setOrderItemPrice(orderItemPrice);

		// orderNo, itemNo 중복 체크 candle_order_item
		// xml => merge into 사용.
		int checkOrder = mapper.checkOrder(addCartItem);

		if (checkOrder == 1) {
			sqlSession.commit(true);
			map.put("retCode", "OK");
			map.put("retVal", addCartItem);
		} else {
			sqlSession.rollback(true);
			map.put("retCode", "NG");
		}

		resp.getWriter().print(gson.toJson(map));

	}

}

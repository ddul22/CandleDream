package com.candle.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.candle.common.Control;
import com.candle.common.DataSource;
import com.candle.mapper.EohMapper;
import com.candle.vo.AddCartVO;

public class AddCartControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		int itemNo = Integer.parseInt(req.getParameter("itemNo"));
		int userNo = Integer.parseInt(req.getParameter("userNo"));
		
		SqlSession sqlSession = DataSource.getInstance().openSession();
		EohMapper mapper = sqlSession.getMapper(EohMapper.class);
		
		//orderNo check
		int orderNo = mapper.orderNo(userNo); // orderNo의 정보가 있는지 없는지 확인.
		// 0 이면
		if (orderNo == 0) {
		AddCartVO addCart = new AddCartVO();
		addCart.setOrderNo(orderNo);
		addCart.setUserNo(userNo);
		addCart.setItemNo(itemNo);
		
		
		int result = mapper.orderInfo(addCart);
		} 
		
		// 있으면 candle_order_item 에 insert
		
		
//		req.setAttribute("product", product);
		req.getRequestDispatcher("product/addCartInfo.tiles").forward(req, resp);
		
		// 주문정보 candle_order insert
		
		// 주문상품정보 candle_order_item insert
	}

}

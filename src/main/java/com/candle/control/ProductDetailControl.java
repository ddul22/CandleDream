package com.candle.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.candle.common.Control;
import com.candle.common.DataSource;
import com.candle.mapper.EohMapper;
import com.candle.vo.ItemVO;

public class ProductDetailControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String itemNo = req.getParameter("itemNo");

		SqlSession sqlSession = DataSource.getInstance().openSession();
		EohMapper mapper = sqlSession.getMapper(EohMapper.class);
		ItemVO product = mapper.itemInfo(itemNo);
		req.setAttribute("product", product);
		
		req.getRequestDispatcher("candle/productDetail.tiles").forward(req, resp);
		// candle/productDetail.tiles => productDetail.jsp를 만들어야함.
	}

}

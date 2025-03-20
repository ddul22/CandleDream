package com.candle.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.candle.common.Control;
import com.candle.common.DataSource;
import com.candle.mapper.EunMapper;

public class RemoveDataControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		resp.setContentType("application/json;charset=utf-8");
		
		String orderNo = req.getParameter("orderNo");
		String itemNo = req.getParameter("itemNo");
		
		SqlSession sqlSession = DataSource.getInstance().openSession();
		EunMapper mapper = sqlSession.getMapper(EunMapper.class);
		
		if (mapper.deleteData(Integer.parseInt(orderNo), Integer.parseInt(itemNo)) == 1) {
			sqlSession.commit();
			resp.getWriter().print("{\"retCode\": \"OK\"}");
		} else {
			resp.getWriter().print("{\"retCode\": \"NG\"}");
		}
	}

}

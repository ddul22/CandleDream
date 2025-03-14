package com.candle.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.candle.common.Control;
import com.candle.common.DataSource;
import com.candle.vo.SearchVO;

public class ProductControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String page = req.getParameter("page");
		page = page == null ? "1" : page;
		String sc = req.getParameter("searchCondition");
		String kw = req.getParameter("keyword");
		sc = sc == null ? "" : sc;
		kw = kw == null ? "" : kw;
		
		SearchVO search = new SearchVO(Integer.parseInt(page), sc, kw, 0);
		SqlSession sqlsession = DataSource.getInstance().openSession();
				
		
	}

}

package com.candle.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.candle.common.Control;
import com.candle.vo.SearchVO;

public class SearchControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String page = req.getParameter("page");
		page = page == null ? "1" : page; // null이면 page=1로 설정.
		String sc = req.getParameter("searchCondition");
		String kw = req.getParameter("keyword");
		sc = sc == null ? "" : sc; // null값처리.
		kw = kw == null ? "" : kw; // null값처리.
		
		SearchVO search = new SearchVO(Integer.parseInt(page), sc, kw, 0);
		
		
		
		req.setAttribute("searchCondition", sc);
		req.setAttribute("keyword", kw);
		
		req.getRequestDispatcher("board/boardList.tiles").forward(req, resp);
	}

}

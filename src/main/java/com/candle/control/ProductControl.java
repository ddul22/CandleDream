package com.candle.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.candle.common.Control;
import com.candle.common.DataSource;
import com.candle.mapper.CandleMapper;
import com.candle.vo.ItemVO;
import com.candle.vo.PageVO;

public class ProductControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String page = req.getParameter("page");
		page = page == null ? "1" : page;
		PageVO pa = new PageVO(Integer.parseInt(page));
//		String sc = req.getParameter("searchCondition");
//		String kw = req.getParameter("keyword");
//		sc = sc == null ? "" : sc;
//		kw = kw == null ? "" : kw;
		
//		SearchVO search = new SearchVO(Integer.parseInt(page), sc, kw, 0);

		
		SqlSession sqlSession = DataSource.getInstance().openSession();
		CandleMapper mapper = sqlSession.getMapper(CandleMapper.class);
		List<ItemVO> product = mapper.selectAll();
		req.setAttribute("product", product);
		req.getRequestDispatcher("candle/itemInfo.tiles").forward(req, resp);
//		List<ItemVO> list = mapper.selectAll();
		
		
		// 페이징.
		int totalCnt = mapper.getTotalCount(pa);
		
		PageVO paging = new PageVO(Integer.parseInt(page), totalCnt);
		req.setAttribute("paging", paging);
//		req.setAttribute("keyword", kw);
		
//		req.getRequestDispatcher("candle/.tiles").forward(req, resp);
		
//		ItemVO item = mapper.selectOne(1);
//		Gson gson = new GsonBuilder().setPrettyPrinting().create();
//		String json = gson.toJson(list);
//		resp.getWriter().print(json);
	}

}

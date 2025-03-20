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
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class AdminPageItemListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		resp.setContentType("application/json;charset=utf-8");
		
		SqlSession sqlSession = DataSource.getInstance().openSession(true);
		SikMapper mapper = sqlSession.getMapper(SikMapper.class);
		List<ItemVO> list = mapper.selectItemActive();
		
		list.forEach((item) -> {
			System.out.println(item.getItemImage());
		});
		
		Gson gson = new GsonBuilder().create();
		resp.getWriter().print(gson.toJson(list));

	}

}

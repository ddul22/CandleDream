package com.candle.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.candle.common.Control;
import com.candle.common.DataSource;
import com.candle.mapper.ItemMapper;
import com.candle.vo.ItemVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class MainDataControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		SqlSessionFactory factory = DataSource.getInstance();
		SqlSession session = factory.openSession(true);
		ItemMapper mapper = session.getMapper(ItemMapper.class);
		
		List<ItemVO> list = mapper.selectNewItem();
		
		Gson gson = new GsonBuilder().create();		
		resp.getWriter().print(gson.toJson(list));
	}

}

package com.candle.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.candle.common.Control;
import com.candle.common.DataSource;
import com.candle.mapper.SikMapper;
import com.candle.vo.UserVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class GetUserInfoControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		resp.setContentType("application/json;charset=utf-8");
		
		String userNo = req.getParameter("userNo");
		
		SqlSession sqlSession=DataSource.getInstance().openSession();
		SikMapper mapper = sqlSession.getMapper(SikMapper.class);
		UserVO user = mapper.selectUser(Integer.parseInt(userNo));
		
		Gson gson = new GsonBuilder().create();
		resp.getWriter().print(gson.toJson(user));
	}

}

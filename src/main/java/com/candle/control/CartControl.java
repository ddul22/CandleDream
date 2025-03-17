package com.candle.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.candle.common.Control;
import com.candle.common.DataSource;
import com.candle.mapper.ItemMapper;
import com.candle.mapper.UserMapper;
import com.candle.vo.ItemVO;
import com.candle.vo.OrderVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;



public class CartControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		req.getRequestDispatcher("candle/cart.tiles").forward(req, resp);

	}

}

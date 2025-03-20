package com.candle.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.candle.common.Control;

public class UpdateItemControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		req.setAttribute("itemNo", req.getParameter("itemNo"));
		req.getRequestDispatcher("mypage/updateItem.tiles").forward(req, resp);
	}

}

package com.candle.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.candle.common.Control;
import com.candle.common.DataSource;
import com.candle.mapper.JisuMapper;

public class AddUserControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String id = req.getParameter("userId");
		String pwd = req.getParameter("userPwd");
		String name = req.getParameter("userName");
		String tel = req.getParameter("userTel");
		String email = req.getParameter("userEmail");
		String address = req.getParameter("userAddress");
		
		SqlSession sqlSession = DataSource.getInstance().openSession(true);
		JisuMapper mapper = sqlSession.getMapper(JisuMapper.class);

		int result = mapper.checkUserId(id);

		if (result > 0) {
			req.setAttribute("msg", "사용할 수 없는 아이디입니다");
			req.getRequestDispatcher("candle/signup.tiles").forward(req, resp);
		} else {
			Map<String, Object> userInfo = new HashMap<String, Object>();
			userInfo.put("userId", id);
			userInfo.put("userPwd", pwd);
			userInfo.put("userName", name);
			userInfo.put("userTel", tel);
			userInfo.put("userEmail", email);
			userInfo.put("userAddress", address);
			
			result = mapper.insertUser(userInfo);
			if (result > 0) {
				resp.sendRedirect("loginForm.do");
			} else {
				resp.sendRedirect("addUserForm.do");
			}
		}
	}
}

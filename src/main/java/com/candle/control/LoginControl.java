package com.candle.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.candle.common.Control;
import com.candle.common.DataSource;
import com.candle.mapper.JisuMapper;
import com.candle.vo.UserVO;

public class LoginControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		
		SqlSession sqlSession=DataSource.getInstance().openSession();
		JisuMapper mapper = sqlSession.getMapper(JisuMapper.class);
		
		UserVO user = mapper.login(id, pwd);
		System.out.println("id->"+id+"pwd->"+pwd);
		
		if(user != null) {
			HttpSession session = req.getSession();
			session.setAttribute("userNo",user.getUserNo());
			session.setAttribute("userType",user.getUserType());
			session.setAttribute("userId",user.getUserId());
			req.setAttribute("msg", "1");
			System.out.println("로그인잘됨");
		}else {
			req.setAttribute("msg", "2");
			System.out.println("로그인안됨");
		}
		req.getRequestDispatcher("candle/login.tiles").forward(req, resp);	
		
	}

}

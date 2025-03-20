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
import com.candle.mapper.EunMapper;
import com.candle.vo.ContactVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class ContactDataControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json;charset=utf-8");

		String contactName = req.getParameter("cname");
		String contactEmail = req.getParameter("cemail");
		String contactContent = req.getParameter("cmsg");

		SqlSession sqlSession = DataSource.getInstance().openSession();
		EunMapper mapper = sqlSession.getMapper(EunMapper.class);

		ContactVO contact = new ContactVO();
		contact.setContactName(contactName);
		contact.setContactEmail(contactEmail);
		contact.setContactContent(contactContent);

		int r = mapper.contact(contact);

		if (r > 0) {
			sqlSession.commit(true);
			req.setAttribute("msg", "1");
		} else {
			req.setAttribute("msg", "2");
		}

		sqlSession.close();
		req.getRequestDispatcher("candle/contact.tiles").forward(req, resp);

	}

}

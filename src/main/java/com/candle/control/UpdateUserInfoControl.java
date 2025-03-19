package com.candle.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.candle.common.Control;
import com.candle.common.DataSource;
import com.candle.mapper.SikMapper;
import com.candle.vo.UserVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class UpdateUserInfoControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String userNo = req.getParameter("userNo");
		String userTel = req.getParameter("userTel");
		String userAddress = req.getParameter("userAddress");
		String userEmail = req.getParameter("userEmail");

		UserVO user = new UserVO();
		user.setUserNo(Integer.parseInt(userNo));
		user.setUserTel(userTel);
		user.setUserAddress(userAddress);
		user.setUserEmail(userEmail);

		SqlSessionFactory factory = DataSource.getInstance();
		SqlSession session = factory.openSession(true);
		SikMapper mapper = session.getMapper(SikMapper.class);

		int result = mapper.updateUser(user);

		Map<String, String> resultMap = new HashMap<>();
		if (result > 0) {
			resultMap.put("retCode", "OK");
		} else {
			resultMap.put("retCode", "NG");
		}

		Gson gson = new GsonBuilder().create();
		resp.getWriter().print(gson.toJson(resultMap));
	}

}

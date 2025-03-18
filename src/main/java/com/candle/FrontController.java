package com.candle;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.candle.common.Control;
import com.candle.control.AddUserControl;
import com.candle.control.CartControl;
import com.candle.control.CartDataControl;
import com.candle.control.LoginControl;
import com.candle.control.LoginFormControl;
import com.candle.control.LogoutControl;
import com.candle.control.MainControl;
import com.candle.control.MainDataControl;
import com.candle.control.PaymentControl;
import com.candle.control.ProductControl;
import com.candle.control.ProductDetailControl;
import com.candle.control.QnaControl;
import com.candle.control.addUserFormControl;

public class FrontController extends HttpServlet {
	Map<String, Control> map;

	public FrontController() {
		map = new HashMap<>();
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		// 김민식
		map.put("/main.do", new MainControl());
		map.put("/mainData.do", new MainDataControl());

		// 김어진
		map.put("/product.do", new ProductControl()); // 전체상품목록.
		map.put("/productDetail.do", new ProductDetailControl()); // 상품상세조회.

		// 정은총
		map.put("/cart.do", new CartControl());
		map.put("/cartData.do", new CartDataControl());
		map.put("/payment.do", new PaymentControl());

		// 김지수
		map.put("/login.do", new LoginControl());
		map.put("/loginForm.do", new LoginFormControl());
		map.put("/logout.do", new LogoutControl());
		map.put("/addUserForm.do", new addUserFormControl());
		map.put("/addUser.do", new AddUserControl());
		map.put("/qna.do", new QnaControl());
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) //
			throws ServletException, IOException {
		String uri = req.getRequestURI();
		String context = req.getContextPath();
		String path = uri.substring(context.length());

		Control sub = map.get(path);
		sub.exec(req, resp);
	}
}
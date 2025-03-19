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
import com.candle.control.AddCartControl;
import com.candle.control.AddPointControl;
import com.candle.control.GetOrderInfoControl;
import com.candle.control.GetUserInfoControl;
import com.candle.control.AddUserControl;
import com.candle.control.CartControl;
import com.candle.control.CartDataControl;
import com.candle.control.ContactControl;
import com.candle.control.ContactDataControl;
import com.candle.control.LoginControl;
import com.candle.control.LoginFormControl;
import com.candle.control.LogoutControl;
import com.candle.control.MainControl;
import com.candle.control.MainDataControl;
import com.candle.control.MyPageInfoControl;
import com.candle.control.MyPageOrderControl;
import com.candle.control.MyPagePointControl;
import com.candle.control.PaymentControl;
import com.candle.control.PaymentDataControl;
import com.candle.control.PointControl;
import com.candle.control.ProductControl;
import com.candle.control.ProductDetailControl;
import com.candle.control.QnaAddFormControl;
import com.candle.control.QnaControl;
import com.candle.control.UpdateUserInfoControl;
import com.candle.control.SearchControl;
import com.candle.control.AddUserFormControl;
import com.candle.control.AdminPageItemControl;
import com.candle.control.AdminPageOrderControl;

public class FrontController extends HttpServlet {
	Map<String, Control> map;

	public FrontController() {
		map = new HashMap<>();
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		// 김민식
		// 메인페이지
		map.put("/main.do", new MainControl());
		// 메인페이지 ajax
		map.put("/mainData.do", new MainDataControl());
		// 사용자페이지
		map.put("/myPagePoint.do", new MyPagePointControl());
		map.put("/myPageInfo.do", new MyPageInfoControl());
		map.put("/myPageOrder.do", new MyPageOrderControl());
		// 사용자페이지 ajax
		map.put("/getUserInfo.do", new GetUserInfoControl());
		map.put("/addPoint.do", new AddPointControl());
		map.put("/updateUserInfo.do", new UpdateUserInfoControl());
		map.put("/getOrderInfo.do", new GetOrderInfoControl());
		// 관리자페이지
		map.put("/adminPageItem.do", new AdminPageItemControl());
		map.put("/adminPageOrder.do", new AdminPageOrderControl());

		// 김어진
		map.put("/product.do", new ProductControl()); // 전체상품목록.
		map.put("/productDetail.do", new ProductDetailControl()); // 상품상세조회.
		map.put("/addCart.do", new AddCartControl()); // 장바구니 상품담기.
		map.put("/search.do", new SearchControl()); // 전체상품목록 검색.
		
		// 정은총
		map.put("/cart.do", new CartControl());
		map.put("/cartData.do", new CartDataControl());
		map.put("/payment.do", new PaymentControl());
		map.put("/paymentData.do", new PaymentDataControl());
		map.put("/point.do", new PointControl());
		map.put("/contact.do", new ContactControl());
		map.put("/contactData.do", new ContactDataControl());
		
		// 김지수
		map.put("/login.do", new LoginControl()); // 로그인처리
		map.put("/loginForm.do", new LoginFormControl()); // 로그인화면
		map.put("/logout.do", new LogoutControl()); // 로그아웃
		map.put("/addUserForm.do", new AddUserFormControl()); // 회원가입화면
		map.put("/addUser.do", new AddUserControl()); // 회원가입처리
		map.put("/qna.do", new QnaControl()); // qna목록조회
		map.put("/qnaAddForm.do", new QnaAddFormControl()); //qna등록화면
		
		
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
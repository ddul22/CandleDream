package com.candle.control;

import java.io.IOException;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.candle.common.Control;
import com.candle.common.DataSource;
import com.candle.mapper.SikMapper;
import com.candle.vo.ItemVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UpdateItemDataControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		req.setCharacterEncoding("utf-8");

		String saveDir = req.getServletContext().getRealPath("images");

		System.out.println(saveDir);
		MultipartRequest mr = new MultipartRequest(req, saveDir, 1024 * 1024 * 5, "utf-8",
				new DefaultFileRenamePolicy());

		ItemVO item = new ItemVO();

		item.setItemNo(Integer.parseInt(mr.getParameter("itemNo")));
		item.setItemName(mr.getParameter("itemName"));
		item.setTypeNo(Integer.parseInt(mr.getParameter("typeNo")));
		item.setItemPrice(Integer.parseInt(mr.getParameter("itemPrice")));
		item.setItemInfo(mr.getParameter("itemInfo"));
		item.setItemImagePath(mr.getFilesystemName("itemImage"));
		if (mr.getFile("itemImage") == null) {
			item.setItemImage(null);
		} else {
			item.setItemImage(Files.readAllBytes(mr.getFile("itemImage").toPath()));
		}

		SqlSession sqlSession = DataSource.getInstance().openSession(true);
		SikMapper mapper = sqlSession.getMapper(SikMapper.class);
		int result = mapper.updateItem(item);

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

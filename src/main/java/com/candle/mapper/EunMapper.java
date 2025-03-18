package com.candle.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.candle.vo.ItemVO;
import com.candle.vo.OrderVO;
import com.candle.vo.UserVO;

public interface EunMapper {
	// 정은총
	public OrderVO order(int userNo);
	public List<ItemVO> item(int orderNo);
	public UserVO user(int userNo);
	public int point(@Param("totalPrice") int totalPrice, @Param("userNo") int userNo);
	public int status(int orderNo);
}
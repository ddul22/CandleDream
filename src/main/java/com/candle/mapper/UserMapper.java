package com.candle.mapper;

import java.util.List;

import com.candle.vo.ItemVO;
import com.candle.vo.OrderVO;

public interface UserMapper {
	// 김민식
	
	// 김어진
	
	// 정은총
	public OrderVO order(int userNo);
	public List<ItemVO> item(int orderNo);
	// 김지수we
}
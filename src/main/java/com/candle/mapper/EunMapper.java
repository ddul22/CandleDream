package com.candle.mapper;

import java.util.List;

import com.candle.vo.ItemVO;
import com.candle.vo.OrderVO;

public interface EunMapper {
	// 정은총
	public OrderVO order(int userNo);
	public List<ItemVO> item(int orderNo);
}
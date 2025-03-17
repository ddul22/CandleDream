package com.candle.mapper;

import java.util.List;

import com.candle.vo.ItemVO;

public interface ProductMapper {
	public List<ItemVO> itemList();
	public ItemVO ItemInfo(String item_No);
}

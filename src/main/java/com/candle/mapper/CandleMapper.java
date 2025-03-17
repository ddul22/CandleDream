package com.candle.mapper;

import java.util.List;

import com.candle.vo.ItemVO;
import com.candle.vo.PageVO;

public interface CandleMapper {
	public List<ItemVO> selectAll();
	public ItemVO itemInfo(String itemNo);
	public int getTotalCount(PageVO search);
}

package com.candle.mapper;

import java.util.List;

import com.candle.vo.AddCartItemVO;
import com.candle.vo.AddCartVO;
import com.candle.vo.ItemVO;
import com.candle.vo.PageVO;
import com.candle.vo.SearchVO;

public interface EohMapper {
	public List<ItemVO> selectAll(SearchVO search);
	public ItemVO itemInfo(String itemNo); // ItemVO에 정의된 정보를 itemInfo에 담음
	public int getTotalCount(SearchVO serachVO);
	public int orderInfo(AddCartVO addCart);
	public Integer orderNo(int userNo);
	public int orderItemInfo(AddCartItemVO addCartItem);
	public int checkOrder(AddCartItemVO checkOrder);
}

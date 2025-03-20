package com.candle.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.candle.vo.ItemVO;
import com.candle.vo.OrderVO;
import com.candle.vo.UserVO;

public interface SikMapper {
	// 김민식
	public List<ItemVO> selectNewItem();

	public UserVO selectUser(int userNo);

	public int updateUserPoint(@Param("userNo") int userNo, @Param("point") int point);
	
	public int updateUser(UserVO user);
	
	public List<OrderVO> getOrderList(int userNo);
	
	public List<ItemVO> getOrderItemList(int orderNo);

	public List<ItemVO> selectItemActive();
	
	public int insertItem(ItemVO item);
	
	public List<OrderVO> selectOrderListAll();
	
	public int updateItem(ItemVO item);
	
	public ItemVO getItem(int itemNo);
	
	public int updateOrderStatus(int orderNo);
}
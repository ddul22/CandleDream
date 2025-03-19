package com.candle.vo;

import lombok.Data;

@Data
public class AddCartItemVO {
	public int orderItemNo;
	public int orderNo;
	public int itemNo;
	public int orderItemCount;
	public int orderItemPrice;
}

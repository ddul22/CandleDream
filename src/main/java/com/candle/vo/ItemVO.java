package com.candle.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ItemVO {

	private int itemNo;
	private int typeNo;
	private String itemName;
	private byte[] itemImage;
	private int itemPrice;
	private int itemPriceSale;
	private int itemSale;
	private int itemStatus;
	
	private int orderItemNo;
	private int orderNo;
	private int orderItemCount;
	private int orderItemPrice;
}

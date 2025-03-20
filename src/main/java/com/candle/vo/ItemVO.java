package com.candle.vo;

import lombok.Data;

@Data
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
	private String itemImagePath;
	private String itemInfo;
	private int userNo;
	private int orderStatus;
	private String typeName;
}

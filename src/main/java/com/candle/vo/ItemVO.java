package com.candle.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

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
}

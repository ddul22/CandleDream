package com.candle.vo;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class OrderVO {
	private int orderNo;
	private int userNo;
	private Date orderDate;
	private int orderStatus;
	private int orderPrice;
	private List<ItemVO> itemList;
	private String userId;
}

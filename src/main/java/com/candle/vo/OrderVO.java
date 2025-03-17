package com.candle.vo;

import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {
	private int orderNo;
	private int userNo;
	private Date orderDate;
	private int orderStatus;
}

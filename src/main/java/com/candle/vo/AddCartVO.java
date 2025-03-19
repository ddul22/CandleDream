package com.candle.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class AddCartVO {
	private int orderNo;
	private int userNo;
	private Date orderDate;
	private int orderStatus;
}

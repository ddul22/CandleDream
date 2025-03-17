package com.candle.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderVO {

	private int orderNo;
	private int userNo;
	private Date date;
	private int orderStatus;
	private int price;
}

package com.candle.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ContactVO {
	private int contactNo;
	private String contactContent;
	private String contactEmail;
	private String contactName;
	private Date contactDate;
}

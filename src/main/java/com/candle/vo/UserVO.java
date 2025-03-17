package com.candle.vo;

import lombok.Data;

@Data
public class UserVO {
	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String userTel;
	private String userEmail;
	private String userAddress;
	private int userPoint;
	private int userType;
}

package com.candle.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserVO {
	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String userTel;
	private String userEmail;
	private String userAdd;
	private int point;
	private int userType;
}

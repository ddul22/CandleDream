package com.candle.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.candle.vo.UserVO;

public interface JisuMapper {
	// 메소드명: UserList
	public List<UserVO> selectAll();
	
	//아이디 비번 결과 있는지 select all from candle 있으면 결과 반환
	public List <UserVO> userList(@Param("userId") String userId,@Param("userPwd") String userPwd);
	public  UserVO login (@Param("userId") String userId,@Param("userPwd") String userPwd);
}

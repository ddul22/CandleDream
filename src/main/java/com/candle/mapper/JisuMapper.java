package com.candle.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.candle.vo.QnaVO;
import com.candle.vo.UserVO;

public interface JisuMapper {
	// 메소드명: UserList
	public List<UserVO> selectAll();
	
	//로그인: 아이디 비번 결과 있는지 있으면 결과 반환
	public List <UserVO> userList(@Param("userId") String userId,@Param("userPwd") String userPwd);
	public  UserVO login (@Param("userId") String userId,@Param("userPwd") String userPwd);
	
	//회원가입
	public int insertUser (Map<String, Object> userInfo);
	
	//qna 게시판
	public List <QnaVO> qnaList();
	
	public int insertQna (QnaVO qnavo);
	
	
}

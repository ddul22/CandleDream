package com.candle.vo;

import java.util.Date;

import lombok.Data;

@Data
public class QnaVO {
	private int qnaNo;
	private int userNo;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaDate;
	private String qnaReply;
	private Date qnaReplyDate;
	private int qnaReplyUserNO;
	
}

package com.candle.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class SearchVO {
	private int page;
	private String searchCondition;
	private String keyword;
	private int itemNo;
	
}



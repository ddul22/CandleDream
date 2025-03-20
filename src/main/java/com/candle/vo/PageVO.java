package com.candle.vo;

import lombok.Data;

@Data
public class PageVO {
	private int startPage;
	private int endPage;
	private int currentPage;
	private boolean prev, next;

	public PageVO (int page) {
		this.currentPage = page;
	}
	public PageVO(int page, int totalCnt) {
		currentPage = page;
		endPage = (int) Math.ceil(currentPage / 10.0) * 10; // 10
		startPage = endPage - 9; // 계산상의 start, end

		int realEnd = (int) Math.ceil(totalCnt / 4.5); // 실제 마지막 페이지.
		endPage = endPage > realEnd ? realEnd : endPage;

		prev = startPage == 1 ? false : true;
		next = endPage == realEnd ? false : true;
	}
}
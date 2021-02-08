package com.dto;

public class Pager {
	// 페이지당 게시물 수
	public static final int PAGE_SCALE = 2;
	// 화면당 페이지 수
	public static final int BLOCK_SCALE = 5;
	private int curPage; // 현재페이지
	private int prevPage; // 이전 페이지
	private int nextPage; // 다음 페이지
	private int totalPage; // 전체 페이지 갯수
	private int totalBlock; // 전체 페이지 블록 갯수
	private int curBlock; // 현재 페이지 블록
	private int prevBlock; // 이전 페이지 블록
	private int nextBlock; // 다음 페이지 블록
	
	// where rn between #{start} and #{end}
	private int pageBegin; // #{start}
	private int pageEnd; // #{end}
	// [이전] blockBegin 2 3 4 blockEnd [다음]
	private int blockBegin; // 현재 페이지 블록의 시작 번호
	private int blockEnd; // 현재 페이지 블록의 끝 번호
	
	// 생성자
	// Pager(레코드 갯수, 현재 페이지 번호)
	public Pager(int count, int curPage) {
		curBlock = 1; // 현재 페이지 블록 번호
		this.curPage = curPage; // 현재 페이지 설정
		setTotalPage(count); // 전체 페이지 갯수 계산
		// between #{start} and #{end}에 입력될 값 계산
		setPageRage();
		setTotalBlock(); // 전체 페이지 블록 갯수 계산
		// 페이지 블록의 시작, 끝 번호 계산
		setBlockRange();
	}

	@Override
	public String toString() {
		return "Pager [curPage=" + curPage + ", prevPage=" + prevPage + ", nextPage=" + nextPage + ", totalPage="
				+ totalPage + ", totalBlock=" + totalBlock + ", curBlock=" + curBlock + ", prevBlock=" + prevBlock
				+ ", nextBlock=" + nextBlock + ", pageBegin=" + pageBegin + ", pageEnd=" + pageEnd + ", blockBegin="
				+ blockBegin + ", blockEnd=" + blockEnd + "]";
	}

	// 화면에 보여지는 페이징 셋팅
	public void setBlockRange() {
		// 현재 페이지가 몇 번째 페이지 블록에 속하는지 계산
		curBlock = (int)Math.ceil((curPage - 1)/BLOCK_SCALE)+1;
		// 현재 페이지 블록의 시작, 끝 번호 계산
		blockBegin = (curBlock - 1)*BLOCK_SCALE + 1;
		blockEnd = blockBegin + BLOCK_SCALE - 1;
		// 마지막 페이지 번호가 범위를 초과하지 않도록 처리
		if(blockEnd > totalPage) blockEnd = totalPage;
		// [이전]을 눌렀을 때 이동할 페이지 번호
		//prevPage = (curBlock == 1)?1:(curBlock - 1)*BLOCK_SCALE;
		// [다음]을 눌렀을 때 이동할 페이지 번호
//		nextPage = curBlock > totalBlock ? 
//				(curBlock*BLOCK_SCALE) : (curBlock-1)*BLOCK_SCALE;
		// [이전]을 눌렀을 때 이동할 페이지 번호
		prevPage = (curBlock-1)*BLOCK_SCALE;
		// [다음]을 눌렀을 때 이동할 페이지 번호
		nextPage = curBlock*BLOCK_SCALE+1;
		// 마지막 페이지가 범위를 초과하지 않도록 처리
		if(nextPage >= totalPage) nextPage = totalPage;
	}
	// 페이지 범위(시작과 끝)
	public void setPageRage() {
		// 시작번호 = (현재페이지 - 1) * 페이지당 게시물수 + 1
		pageBegin = (curPage - 1)*PAGE_SCALE + 1;
		// 끝번호 = 시작번호 + 페이지당 게시물수 - 1
		pageEnd = pageBegin + PAGE_SCALE - 1;
	}
	
	// 페이지 블록의 갯수 계산(총 100페이지라면 10개 블록)
	public void setTotalBlock() {
		totalBlock = (int)Math.ceil(totalPage / BLOCK_SCALE);
	}
	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int count) {
		//  전체 페이지 갯수 계산
		// Math.ceil(실수) 올림 처리 
		totalPage = (int)Math.ceil(count*1.0 / PAGE_SCALE);
	}

	public int getTotalBlock() { 
		return totalBlock;
	}

	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}

	public int getCurBlock() {
		return curBlock;
	}

	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}

	public int getPrevBlock() {
		return prevBlock;
	}

	public void setPrevBlock(int prevBlock) {
		this.prevBlock = prevBlock;
	}

	public int getNextBlock() {
		return nextBlock;
	}

	public void setNextBlock(int nextBlock) {
		this.nextBlock = nextBlock;
	}

	public int getPageBegin() {
		return pageBegin;
	}

	public void setPageBegin(int pageBegin) {
		this.pageBegin = pageBegin;
	}

	public int getPageEnd() {
		return pageEnd;
	}

	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}

	public int getBlockBegin() {
		return blockBegin;
	}

	public void setBlockBegin(int blockBegin) {
		this.blockBegin = blockBegin;
	}

	public int getBlockEnd() {
		return blockEnd;
	}

	public void setBlockEnd(int blockEnd) {
		this.blockEnd = blockEnd;
	}

	public static int getPageScale() {
		return PAGE_SCALE;
	}

	public static int getBlockScale() {
		return BLOCK_SCALE;
	}
	
	
}

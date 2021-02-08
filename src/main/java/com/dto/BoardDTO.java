package com.dto;

import java.util.Arrays;

import org.apache.ibatis.type.Alias;

@Alias("boardDTO")
public class BoardDTO {
	private int no; // 게시물 번호
	private String title; // 제목
	private String contents; // 본문
	private String creater; // 작성자 아이디
	private String create_date; // 날짜
	private String modifier; // 작성자 아이디
	private String modify_date; // 날짜
	private int hits; // 조회수
	
	// 화면 표시 여부
	private String name; // 멤버의 이름출력
	private int cnt; // 댓글 갯수
	private String show; // 화면 표시 여부
	private String[] files; // 첨부파일 배열
	
	public BoardDTO() {}

	public BoardDTO(int no, String title, String contents, String creater, String create_date, String modifier,
			String modify_date, int hits, String name, int cnt, String show, String[] files) {
		super();
		this.no = no;
		this.title = title;
		this.contents = contents;
		this.creater = creater;
		this.create_date = create_date;
		this.modifier = modifier;
		this.modify_date = modify_date;
		this.hits = hits;
		this.name = name;
		this.cnt = cnt;
		this.show = show;
		this.files = files;
	}

	@Override
	public String toString() {
		return "BoardDTO [no=" + no + ", title=" + title + ", contents=" + contents + ", creater=" + creater
				+ ", create_date=" + create_date + ", modifier=" + modifier + ", modify_date=" + modify_date + ", hits="
				+ hits + ", name=" + name + ", cnt=" + cnt + ", show=" + show + ", files=" + Arrays.toString(files)
				+ "]";
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getCreater() {
		return creater;
	}

	public void setCreater(String creater) {
		this.creater = creater;
	}

	public String getCreate_date() {
		return create_date;
	}

	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}

	public String getModifier() {
		return modifier;
	}

	public void setModifier(String modifier) {
		this.modifier = modifier;
	}

	public String getModify_date() {
		return modify_date;
	}

	public void setModify_date(String modify_date) {
		this.modify_date = modify_date;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getShow() {
		return show;
	}

	public void setShow(String show) {
		this.show = show;
	}

	public String[] getFiles() {
		return files;
	}

	public void setFiles(String[] files) {
		this.files = files;
	}

}

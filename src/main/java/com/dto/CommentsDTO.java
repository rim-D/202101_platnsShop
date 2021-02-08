package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("commentsDTO")
public class CommentsDTO {
	private int c_no; // 댓글 번호
	private int no; // 게시판 번호
	private String c_content; // 댓글내용
	private String creater; // 댓글 작성자 아이디
	private String create_date; // 댓글 작성날짜
	private String modify_date; // 댓글 수정날짜
	private String modifier; // 댓글 수정자 아이디
	private String nickname; // 댓글 작성자 닉네임
	
	private String name; // 화면 표시 여부

	@Override
	public String toString() {
		return "CommentsDTO [c_no=" + c_no + ", no=" + no + ", c_content=" + c_content + ", creater=" + creater
				+ ", create_date=" + create_date + ", modify_date=" + modify_date + ", modifier=" + modifier
				+ ", nickname=" + nickname + ", name=" + name + "]";
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getC_content() {
		return c_content;
	}

	public void setC_content(String c_content) {
		this.c_content = c_content;
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

	public String getModify_date() {
		return modify_date;
	}

	public void setModify_date(String modify_date) {
		this.modify_date = modify_date;
	}

	public String getModifier() {
		return modifier;
	}

	public void setModifier(String modifier) {
		this.modifier = modifier;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
	

}

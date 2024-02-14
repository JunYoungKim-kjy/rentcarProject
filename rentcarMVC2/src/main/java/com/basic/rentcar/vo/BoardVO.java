package com.basic.rentcar.vo;

public class BoardVO {
	int no; //게시글 번호
	String writer;//작성자
	String subject;//제목
	String contents;//내용
	String regData;//작성일
	
	public BoardVO(int no, String writer, String subject, String contents, String regData) {
		super();
		this.no = no;
		this.writer = writer;
		this.subject = subject;
		this.contents = contents;
		this.regData = regData;
	}
	public int getNo() {
		return no;
	}
	public String getSubject() {
		return subject;
	}
	public String getContents() {
		return contents;
	}
	public String getWriter() {
		return writer;
	}
	public String getRegData() {
		return regData;
	}
}

package com.bit.project.model.entity;

import java.sql.Timestamp;

public class ReplyVo {

	private int reply_no;
	private int board_no;
	private String client_nick1;
	private String reply_content;
	private  Timestamp reply_date;
	
	
	public ReplyVo() {
	}


	public int getReply_no() {
		return reply_no;
	}


	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}


	public int getBoard_no() {
		return board_no;
	}


	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}


	public String getClient_nick1() {
		return client_nick1;
	}


	public void setClient_nick1(String client_nick1) {
		this.client_nick1 = client_nick1;
	}


	public String getReply_content() {
		return reply_content;
	}


	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}


	public Timestamp getReply_date() {
		return reply_date;
	}


	public void setReply_date(Timestamp reply_date) {
		this.reply_date = reply_date;
	}


	@Override
	public String toString() {
		return "ReplyVo [reply_no=" + reply_no + ", board_no=" + board_no + ", client_nick1=" + client_nick1
				+ ", reply_content=" + reply_content + ", reply_date=" + reply_date + "]";
	}


	public ReplyVo(int reply_no, int board_no, String client_nick1, String reply_content, Timestamp reply_date) {
		super();
		this.reply_no = reply_no;
		this.board_no = board_no;
		this.client_nick1 = client_nick1;
		this.reply_content = reply_content;
		this.reply_date = reply_date;
	}


	
}

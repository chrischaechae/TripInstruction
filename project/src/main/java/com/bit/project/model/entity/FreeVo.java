package com.bit.project.model.entity;

import java.sql.Timestamp;

public class FreeVo {

	private int board_no;
	private int board_id;
	private String free_sub;
	private int free_count;
	private String free_content;
	private String client_nick1;
	private Timestamp free_date;
	private String free_img;
	private String free_thumb;
	
	
	public FreeVo() {
	}


	public int getBoard_no() {
		return board_no;
	}


	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}


	public int getBoard_id() {
		return board_id;
	}


	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}


	public String getFree_sub() {
		return free_sub;
	}


	public void setFree_sub(String free_sub) {
		this.free_sub = free_sub;
	}


	public int getFree_count() {
		return free_count;
	}


	public void setFree_count(int free_count) {
		this.free_count = free_count;
	}


	public String getFree_content() {
		return free_content;
	}


	public void setFree_content(String free_content) {
		this.free_content = free_content;
	}


	public String getClient_nick1() {
		return client_nick1;
	}


	public void setClient_nick1(String client_nick1) {
		this.client_nick1 = client_nick1;
	}


	public Timestamp getFree_date() {
		return free_date;
	}


	public void setFree_date(Timestamp free_date) {
		this.free_date = free_date;
	}


	public String getFree_img() {
		return free_img;
	}


	public void setFree_img(String free_img) {
		this.free_img = free_img;
	}


	public String getFree_thumb() {
		return free_thumb;
	}


	public void setFree_thumb(String free_thumb) {
		this.free_thumb = free_thumb;
	}


	@Override
	public String toString() {
		return "FreeVo [board_no=" + board_no + ", board_id=" + board_id + ", free_sub=" + free_sub + ", free_count="
				+ free_count + ", free_content=" + free_content + ", client_nick1=" + client_nick1 + ", free_date="
				+ free_date + ", free_img=" + free_img + ", free_thumb=" + free_thumb + "]";
	}


	public FreeVo(int board_no, int board_id, String free_sub, int free_count, String free_content, String client_nick1,
			Timestamp free_date, String free_img, String free_thumb) {
		super();
		this.board_no = board_no;
		this.board_id = board_id;
		this.free_sub = free_sub;
		this.free_count = free_count;
		this.free_content = free_content;
		this.client_nick1 = client_nick1;
		this.free_date = free_date;
		this.free_img = free_img;
		this.free_thumb = free_thumb;
	}


	
}

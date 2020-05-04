package com.bit.project.model.entity;

import java.sql.Timestamp;

public class PartnerVo {

	private int board_no;
	private int board_id;
	private String partner_sub;
	private int partner_count;
	private String partner_content;
	private String client_nick1;
	private Timestamp partner_date;
	private String partner_img;
	private String partner_thumb;
	
	
	public PartnerVo() {
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


	public String getPartner_sub() {
		return partner_sub;
	}


	public void setPartner_sub(String partner_sub) {
		this.partner_sub = partner_sub;
	}


	public int getPartner_count() {
		return partner_count;
	}


	public void setPartner_count(int partner_count) {
		this.partner_count = partner_count;
	}


	public String getPartner_content() {
		return partner_content;
	}


	public void setPartner_content(String partner_content) {
		this.partner_content = partner_content;
	}


	public String getClient_nick1() {
		return client_nick1;
	}


	public void setClient_nick1(String client_nick1) {
		this.client_nick1 = client_nick1;
	}


	public Timestamp getPartner_date() {
		return partner_date;
	}


	public void setPartner_date(Timestamp partner_date) {
		this.partner_date = partner_date;
	}


	public String getPartner_img() {
		return partner_img;
	}


	public void setPartner_img(String partner_img) {
		this.partner_img = partner_img;
	}


	public String getPartner_thumb() {
		return partner_thumb;
	}


	public void setPartner_thumb(String partner_thumb) {
		this.partner_thumb = partner_thumb;
	}


	@Override
	public String toString() {
		return "PartnerVo [board_no=" + board_no + ", board_id=" + board_id + ", partner_sub=" + partner_sub
				+ ", partner_count=" + partner_count + ", partner_content=" + partner_content + ", client_nick1="
				+ client_nick1 + ", partner_date=" + partner_date + ", partner_img=" + partner_img + ", partner_thumb="
				+ partner_thumb + "]";
	}


	public PartnerVo(int board_no, int board_id, String partner_sub, int partner_count, String partner_content,
			String client_nick1, Timestamp partner_date, String partner_img, String partner_thumb) {
		super();
		this.board_no = board_no;
		this.board_id = board_id;
		this.partner_sub = partner_sub;
		this.partner_count = partner_count;
		this.partner_content = partner_content;
		this.client_nick1 = client_nick1;
		this.partner_date = partner_date;
		this.partner_img = partner_img;
		this.partner_thumb = partner_thumb;
	}


}

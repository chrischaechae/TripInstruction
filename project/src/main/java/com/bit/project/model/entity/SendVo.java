package com.bit.project.model.entity;

import java.sql.Timestamp;

public class SendVo {

	private int send_no;
	private String client_nick1;
	private String client_nick2;
	private String send_content;
	private Timestamp send_date;
	
	
	
	public SendVo() {
	}



	public int getSend_no() {
		return send_no;
	}
	public void setSend_no(int send_no) {
		this.send_no = send_no;
	}
	public String getClient_nick1() {
		return client_nick1;
	}
	public void setClient_nick1(String client_nick1) {
		this.client_nick1 = client_nick1;
	}
	public String getClient_nick2() {
		return client_nick2;
	}
	public void setClient_nick2(String client_nick2) {
		this.client_nick2 = client_nick2;
	}
	public String getSend_content() {
		return send_content;
	}
	public void setSend_content(String send_content) {
		this.send_content = send_content;
	}
	public Timestamp getSend_date() {
		return send_date;
	}
	public void setSend_date(Timestamp send_date) {
		this.send_date = send_date;
	}



	@Override
	public String toString() {
		return "sendVo [send_no=" + send_no + ", client_nick1=" + client_nick1 + ", client_nick2=" + client_nick2
				+ ", send_content=" + send_content + ", send_date=" + send_date + "]";
	}



	public SendVo(int send_no, String client_nick1, String client_nick2, String send_content, Timestamp send_date) {
		super();
		this.send_no = send_no;
		this.client_nick1 = client_nick1;
		this.client_nick2 = client_nick2;
		this.send_content = send_content;
		this.send_date = send_date;
	}
	
	
}

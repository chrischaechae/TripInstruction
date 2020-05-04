package com.bit.project.model.entity;

import java.sql.Timestamp;

public class ReceiveVo {

	private int receive_no;
	private String client_nick1;
	private String client_nick2;
	private String receive_content;
	private Timestamp receive_date;
	private int receive_status;
	
	private int startNum;
	private int endNum;
	


	public ReceiveVo() {
	}


	public int getReceive_no() {
		return receive_no;
	}
	public void setReceive_no(int receive_no) {
		this.receive_no = receive_no;
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
	public String getReceive_content() {
		return receive_content;
	}
	public void setReceive_content(String receive_content) {
		this.receive_content = receive_content;
	}
	public Timestamp getReceive_date() {
		return receive_date;
	}
	public void setReceive_date(Timestamp receive_date) {
		this.receive_date = receive_date;
	}
	public int getReceive_status() {
		return receive_status;
	}
	public void setReceive_status(int receive_status) {
		this.receive_status = receive_status;
	}
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getEndNum() {
		return endNum;
	}
	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}


	@Override
	public String toString() {
		return "ReceiveVo [receive_no=" + receive_no + ", client_nick1=" + client_nick1 + ", client_nick2="
				+ client_nick2 + ", receive_content=" + receive_content + ", receive_date=" + receive_date
				+ ", receive_status=" + receive_status + ", startNum=" + startNum + ", endNum=" + endNum + "]";
	}


	public ReceiveVo(int receive_no, String client_nick1, String client_nick2, String receive_content,
			Timestamp receive_date, int receive_status, int startNum, int endNum) {
		super();
		this.receive_no = receive_no;
		this.client_nick1 = client_nick1;
		this.client_nick2 = client_nick2;
		this.receive_content = receive_content;
		this.receive_date = receive_date;
		this.receive_status = receive_status;
		this.startNum = startNum;
		this.endNum = endNum;
	}


	
}

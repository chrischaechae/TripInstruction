package com.bit.project.model.entity;

import java.sql.Date;

public class ClientVo {

	
	private int client_no;
	private String client_nick1;
	private String client_nick2;
	private String client_name;
	private String client_phone;
	private String client_sex;
	private String client_birth;
	private String client_id;
	private String client_pw;
	private String client_email;
	private Date client_joindate;
	private int client_level;
	private int client_point;
	
	public ClientVo() {
	}

	public int getClient_no() {
		return client_no;
	}

	public void setClient_no(int client_no) {
		this.client_no = client_no;
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

	public String getClient_name() {
		return client_name;
	}

	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}

	public String getClient_phone() {
		return client_phone;
	}

	public void setClient_phone(String client_phone) {
		this.client_phone = client_phone;
	}

	public String getClient_sex() {
		return client_sex;
	}

	public void setClient_sex(String client_sex) {
		this.client_sex = client_sex;
	}

	public String getClient_birth() {
		return client_birth;
	}

	public void setClient_birth(String client_birth) {
		this.client_birth = client_birth;
	}

	public String getClient_id() {
		return client_id;
	}

	public void setClient_id(String client_id) {
		this.client_id = client_id;
	}

	public String getClient_pw() {
		return client_pw;
	}

	public void setClient_pw(String client_pw) {
		this.client_pw = client_pw;
	}

	public String getClient_email() {
		return client_email;
	}

	public void setClient_email(String client_email) {
		this.client_email = client_email;
	}

	public Date getClient_joindate() {
		return client_joindate;
	}

	public void setClient_joindate(Date client_joindate) {
		this.client_joindate = client_joindate;
	}

	public int getClient_level() {
		return client_level;
	}

	public void setClient_level(int client_level) {
		this.client_level = client_level;
	}

	public int getClient_point() {
		return client_point;
	}

	public void setClient_point(int client_point) {
		this.client_point = client_point;
	}

	public ClientVo(int client_no, String client_nick1, String client_nick2, String client_name, String client_phone,
			String client_sex, String client_birth, String client_id, String client_pw, String client_email,
			Date client_joindate, int client_level, int client_point) {
		super();
		this.client_no = client_no;
		this.client_nick1 = client_nick1;
		this.client_nick2 = client_nick2;
		this.client_name = client_name;
		this.client_phone = client_phone;
		this.client_sex = client_sex;
		this.client_birth = client_birth;
		this.client_id = client_id;
		this.client_pw = client_pw;
		this.client_email = client_email;
		this.client_joindate = client_joindate;
		this.client_level = client_level;
		this.client_point = client_point;
	}

	@Override
	public String toString() {
		return "ClientVo [client_no=" + client_no + ", client_nick1=" + client_nick1 + ", client_nick2=" + client_nick2
				+ ", client_name=" + client_name + ", client_phone=" + client_phone + ", client_sex=" + client_sex
				+ ", client_birth=" + client_birth + ", client_id=" + client_id + ", client_pw=" + client_pw
				+ ", client_email=" + client_email + ", client_level=" + client_level + ", client_point=" + client_point
				+ "]";
	}
	
	
}

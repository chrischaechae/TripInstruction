package com.bit.project.model.entity;

import java.sql.Date;

public class NoticeVo {

	private int notice_no;
	private int notice_count;
	private Date notice_date;
	private String notice_sub;
	private String notice_content;
	private String notice_img;
	private String notice_thumb;
	
	
	public NoticeVo() {
	}
	public int getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}
	public int getNotice_count() {
		return notice_count;
	}
	public void setNotice_count(int notice_count) {
		this.notice_count = notice_count;
	}
	public Date getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}
	public String getNotice_sub() {
		return notice_sub;
	}
	public void setNotice_sub(String notice_sub) {
		this.notice_sub = notice_sub;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_img() {
		return notice_img;
	}
	public void setNotice_img(String notice_img) {
		this.notice_img = notice_img;
	}
	public String getNotice_thumb() {
		return notice_thumb;
	}
	public void setNotice_thumb(String notice_thumb) {
		this.notice_thumb = notice_thumb;
	}
	
	
	
	@Override
	public String toString() {
		return "NoticeVo [notice_no=" + notice_no + ", notice_count=" + notice_count + ", notice_date=" + notice_date
				+ ", notice_sub=" + notice_sub + ", notice_content=" + notice_content + ", notice_img=" + notice_img
				+ ", notice_thumb=" + notice_thumb + "]";
	}
	
	
	
	public NoticeVo(int notice_no, int notice_count, Date notice_date, String notice_sub, String notice_content,
			String notice_img, String notice_thumb) {
		super();
		this.notice_no = notice_no;
		this.notice_count = notice_count;
		this.notice_date = notice_date;
		this.notice_sub = notice_sub;
		this.notice_content = notice_content;
		this.notice_img = notice_img;
		this.notice_thumb = notice_thumb;
	}
	
	
}

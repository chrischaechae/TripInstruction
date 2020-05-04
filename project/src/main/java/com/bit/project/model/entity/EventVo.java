package com.bit.project.model.entity;

import java.sql.Date;

public class EventVo {

	private int board_no;
	private String event_sub;
	private int event_count;
	private String event_content;
	private Date event_date;
	private String event_img;
	private String event_thumb;
	
	
	public EventVo() {
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getEvent_sub() {
		return event_sub;
	}
	public void setEvent_sub(String event_sub) {
		this.event_sub = event_sub;
	}
	public int getEvent_count() {
		return event_count;
	}
	public void setEvent_count(int event_count) {
		this.event_count = event_count;
	}
	public String getEvent_content() {
		return event_content;
	}
	public void setEvent_content(String event_content) {
		this.event_content = event_content;
	}
	public Date getEvent_date() {
		return event_date;
	}
	public void setEvent_date(Date event_date) {
		this.event_date = event_date;
	}
	public String getEvent_img() {
		return event_img;
	}
	public void setEvent_img(String event_img) {
		this.event_img = event_img;
	}
	public String getEvent_thumb() {
		return event_thumb;
	}
	public void setEvent_thumb(String event_thumb) {
		this.event_thumb = event_thumb;
	}


	@Override
	public String toString() {
		return "EventVo [board_no=" + board_no + ", event_sub=" + event_sub + ", event_count=" + event_count
				+ ", event_content=" + event_content + ", event_date=" + event_date
				+ ", event_img=" + event_img + ", event_thumb=" + event_thumb + "]";
	}


	public EventVo(int board_no, String event_sub, int event_count, String event_content, String client_nick1,
			Date event_date, String event_img, String event_thumb) {
		super();
		this.board_no = board_no;
		this.event_sub = event_sub;
		this.event_count = event_count;
		this.event_content = event_content;
		this.event_date = event_date;
		this.event_img = event_img;
		this.event_thumb = event_thumb;
	}

	
}

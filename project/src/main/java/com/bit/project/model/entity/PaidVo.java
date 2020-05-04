package com.bit.project.model.entity;

import java.sql.Date;

public class PaidVo {
	
	private int paid_no;
	private int tour_no;
	private String client_name;
	private String paid_name;
	private String paid_phone;
	private int paid_birth;
	private int paid_count;
	private String paid_kakaoid;
	private String tour_date;
	private Date book_date;
	private int paid_total;
	private Date paid_date;
	private String paid_state;
	private String paid_confirm;
	
	private TourVo TourVo;
	
	public PaidVo() {
		// TODO Auto-generated constructor stub
	}

	public int getPaid_no() {
		return paid_no;
	}

	public void setPaid_no(int paid_no) {
		this.paid_no = paid_no;
	}

	public int getTour_no() {
		return tour_no;
	}

	public void setTour_no(int tour_no) {
		this.tour_no = tour_no;
	}

	public String getClient_name() {
		return client_name;
	}

	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}

	public String getPaid_name() {
		return paid_name;
	}

	public void setPaid_name(String paid_name) {
		this.paid_name = paid_name;
	}

	public String getPaid_phone() {
		return paid_phone;
	}

	public void setPaid_phone(String paid_phone) {
		this.paid_phone = paid_phone;
	}

	public int getPaid_birth() {
		return paid_birth;
	}

	public void setPaid_birth(int paid_birth) {
		this.paid_birth = paid_birth;
	}

	public int getPaid_count() {
		return paid_count;
	}

	public void setPaid_count(int paid_count) {
		this.paid_count = paid_count;
	}

	public String getPaid_kakaoid() {
		return paid_kakaoid;
	}

	public void setPaid_kakaoid(String paid_kakaoid) {
		this.paid_kakaoid = paid_kakaoid;
	}

	public String getTour_date() {
		return tour_date;
	}

	public void setTour_date(String tour_date) {
		this.tour_date = tour_date;
	}

	public Date getBook_date() {
		return book_date;
	}

	public void setBook_date(Date book_date) {
		this.book_date = book_date;
	}

	public int getPaid_total() {
		return paid_total;
	}

	public void setPaid_total(int paid_total) {
		this.paid_total = paid_total;
	}

	public Date getPaid_date() {
		return paid_date;
	}

	public void setPaid_date(Date paid_date) {
		this.paid_date = paid_date;
	}

	public String getPaid_state() {
		return paid_state;
	}

	public void setPaid_state(String paid_state) {
		this.paid_state = paid_state;
	}

	public String getPaid_confirm() {
		return paid_confirm;
	}

	public void setPaid_confirm(String paid_confirm) {
		this.paid_confirm = paid_confirm;
	}

	public TourVo getTourVo() {
		return TourVo;
	}

	public void setTourVo(TourVo tourVo) {
		TourVo = tourVo;
	}

	@Override
	public String toString() {
		return "PaidVo [paid_no=" + paid_no + ", tour_no=" + tour_no + ", client_name=" + client_name + ", paid_name="
				+ paid_name + ", paid_phone=" + paid_phone + ", paid_birth=" + paid_birth + ", paid_count=" + paid_count
				+ ", paid_kakaoid=" + paid_kakaoid + ", tour_date=" + tour_date + ", book_date=" + book_date
				+ ", paid_total=" + paid_total + ", paid_date=" + paid_date + ", paid_state=" + paid_state
				+ ", paid_confirm=" + paid_confirm + ", TourVo=" + TourVo + "]";
	}

	public PaidVo(int paid_no, int tour_no, String client_name, String paid_name, String paid_phone, int paid_birth,
			int paid_count, String paid_kakaoid, String tour_date, Date book_date, int paid_total, Date paid_date,
			String paid_state, String paid_confirm, com.bit.project.model.entity.TourVo tourVo) {
		super();
		this.paid_no = paid_no;
		this.tour_no = tour_no;
		this.client_name = client_name;
		this.paid_name = paid_name;
		this.paid_phone = paid_phone;
		this.paid_birth = paid_birth;
		this.paid_count = paid_count;
		this.paid_kakaoid = paid_kakaoid;
		this.tour_date = tour_date;
		this.book_date = book_date;
		this.paid_total = paid_total;
		this.paid_date = paid_date;
		this.paid_state = paid_state;
		this.paid_confirm = paid_confirm;
		TourVo = tourVo;
	}

	

	
}

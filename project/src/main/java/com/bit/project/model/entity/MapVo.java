package com.bit.project.model.entity;

public class MapVo {
	
	private int latlng_no;
	private String country;
	private String city;
	private String tour_name;
	private String spot;
	private String latlng;
	
	private TourVo TourVo;// 상세지도 조인
	
	public MapVo() {
		// TODO Auto-generated constructor stub
	}

	public int getLatlng_no() {
		return latlng_no;
	}

	public void setLatlng_no(int latlng_no) {
		this.latlng_no = latlng_no;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getTour_name() {
		return tour_name;
	}

	public void setTour_name(String tour_name) {
		this.tour_name = tour_name;
	}

	public String getSpot() {
		return spot;
	}

	public void setSpot(String spot) {
		this.spot = spot;
	}

	public String getLatlng() {
		return latlng;
	}

	public void setLatlng(String latlng) {
		this.latlng = latlng;
	}

	public TourVo getTourVo() {
		return TourVo;
	}

	public void setTourVo(TourVo tourVo) {
		TourVo = tourVo;
	}

	@Override
	public String toString() {
		return "MapVo [latlng_no=" + latlng_no + ", country=" + country + ", city=" + city + ", tour_name=" + tour_name
				+ ", spot=" + spot + ", latlng=" + latlng + ", TourVo=" + TourVo + "]";
	}

	public MapVo(int latlng_no, String country, String city, String tour_name, String spot, String latlng,
			com.bit.project.model.entity.TourVo tourVo) {
		super();
		this.latlng_no = latlng_no;
		this.country = country;
		this.city = city;
		this.tour_name = tour_name;
		this.spot = spot;
		this.latlng = latlng;
		TourVo = tourVo;
	}

	
	

	
	
}

package com.bit.project.model.entity;

public class TourVo {
	
	private int tour_no;
	private String land;
	private String country;
	private String city;
	private String theme;
	private String vehicle;
	private String name;
	private int cost;
	private String mainimg;
	private String comments;
	private String course;
	private String latlng;
	private String firstimg;
	private String secondimg;
	private String thirdimg;
	
	private GuideVo GuideVo;// °¡ÀÌµå Á¶ÀÎÀ§ÇØ 
	
	
	public TourVo() {
		// TODO Auto-generated constructor stub
	}


	public int getTour_no() {
		return tour_no;
	}


	public void setTour_no(int tour_no) {
		this.tour_no = tour_no;
	}


	public String getLand() {
		return land;
	}


	public void setLand(String land) {
		this.land = land;
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


	public String getTheme() {
		return theme;
	}


	public void setTheme(String theme) {
		this.theme = theme;
	}


	public String getVehicle() {
		return vehicle;
	}


	public void setVehicle(String vehicle) {
		this.vehicle = vehicle;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public int getCost() {
		return cost;
	}


	public void setCost(int cost) {
		this.cost = cost;
	}


	public String getMainimg() {
		return mainimg;
	}


	public void setMainimg(String mainimg) {
		this.mainimg = mainimg;
	}


	public String getComments() {
		return comments;
	}


	public void setComments(String comments) {
		this.comments = comments;
	}


	public String getCourse() {
		return course;
	}


	public void setCourse(String course) {
		this.course = course;
	}


	public String getLatlng() {
		return latlng;
	}


	public void setLatlng(String latlng) {
		this.latlng = latlng;
	}


	public String getFirstimg() {
		return firstimg;
	}


	public void setFirstimg(String firstimg) {
		this.firstimg = firstimg;
	}


	public String getSecondimg() {
		return secondimg;
	}


	public void setSecondimg(String secondimg) {
		this.secondimg = secondimg;
	}


	public String getThirdimg() {
		return thirdimg;
	}


	public void setThirdimg(String thirdimg) {
		this.thirdimg = thirdimg;
	}


	public GuideVo getGuideVo() {
		return GuideVo;
	}


	public void setGuideVo(GuideVo guideVo) {
		GuideVo = guideVo;
	}


	@Override
	public String toString() {
		return "TourVo [tour_no=" + tour_no + ", land=" + land + ", country=" + country + ", city=" + city + ", theme="
				+ theme + ", vehicle=" + vehicle + ", name=" + name + ", cost=" + cost + ", mainimg=" + mainimg
				+ ", comments=" + comments + ", course=" + course + ", latlng=" + latlng + ", firstimg=" + firstimg
				+ ", secondimg=" + secondimg + ", thirdimg=" + thirdimg + ", GuideVo=" + GuideVo + "]";
	}


	public TourVo(int tour_no, String land, String country, String city, String theme, String vehicle, String name,
			int cost, String mainimg, String comments, String course, String latlng, String firstimg, String secondimg,
			String thirdimg, com.bit.project.model.entity.GuideVo guideVo) {
		super();
		this.tour_no = tour_no;
		this.land = land;
		this.country = country;
		this.city = city;
		this.theme = theme;
		this.vehicle = vehicle;
		this.name = name;
		this.cost = cost;
		this.mainimg = mainimg;
		this.comments = comments;
		this.course = course;
		this.latlng = latlng;
		this.firstimg = firstimg;
		this.secondimg = secondimg;
		this.thirdimg = thirdimg;
		GuideVo = guideVo;
	}


	


}
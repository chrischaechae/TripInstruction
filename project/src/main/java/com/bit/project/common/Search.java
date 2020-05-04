package com.bit.project.common;

import org.springframework.stereotype.Repository;

@Repository
public class Search extends Pagination{
	
	private String searchType;
	private String keyword;
	private String client_nick1;
	private String client_nick2;
	private String client_name;
	
	
	public Search() {
	}


	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
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
	
	

	@Override
	public String toString() {
		return "Search [searchType=" + searchType + ", keyword=" + keyword + ", client_nick1=" + client_nick1
				+ ", client_nick2=" + client_nick2 + ", client_name=" + client_name + "]";
	}


	public Search(String searchType, String keyword, String client_nick2, String client_nick1, String client_name) {
		super();
		this.searchType = searchType;
		this.keyword = keyword;
		this.client_nick1 = client_nick1;
		this.client_nick2 = client_nick2;
		this.client_name = client_name;
	}


	
}

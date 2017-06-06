package org.eon.domain;

public class SearchCriteria extends Criteria {
	
	public String searchType;
	public String keyword;
	
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
	
	public String toString() {
		return super.toString() + "SearchCriteria" + "[searchType=" + searchType + ", keyWord="
				+ keyword + "]";
	}
	
	
	
	
}

package yogi.group;

import java.util.Date;

public class GroupSearchModel {
	private String searchWord;	
	private String searchCategory; 
	private String searchAddr;	
	private String searchPay;	
	private String searchMStart; 
	private String searchMEnd;	
	
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public String getSearchCategory() {
		return searchCategory;
	}
	public void setSearchCategory(String searchCategory) {
		this.searchCategory = searchCategory;
	}
	public String getSearchAddr() {
		return searchAddr;
	}
	public void setSearchAddr(String searchAddr) {
		this.searchAddr = searchAddr;
	}
	public String getSearchPay() {
		return searchPay;
	}
	public void setSearchPay(String searchPay) {
		this.searchPay = searchPay;
	}
	public String getSearchMStart() {
		return searchMStart;
	}
	public void setSearchMStart(String searchMStart) {
		this.searchMStart = searchMStart;
	}
	public String getSearchMEnd() {
		return searchMEnd;
	}
	public void setSearchMEnd(String searchMEnd) {
		this.searchMEnd = searchMEnd;
	}

}

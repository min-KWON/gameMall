package com.gamemall.dto;

import org.springframework.web.util.UriComponentsBuilder;

// 검색 기능 및 페이징 정보를 가지고 있는 클래스

public class Criteria {
	
	// 아래 필드는 클라이언트에서 사용하는 필드라고 생각하면 됨.
	private int pageNum;		//  사용자가 선택한 페이지 번호     1 	2  	3	4	5 
	private int amount;			// 페이지마다 출력할 게시물 개수	예) 5개, 10개, 15개 등등
	
	// 검색 기능 사용할 필드. 	목록에서 검색기능을 사용하지 않을 경우 type, keyword필드는 null이 됨.
	private String type;
	private String keyword;
	
	
	//  Criteria(int pageNum, int amount)  pageNum => 1로 수동으로 설정 한거임.
	public Criteria() {
		this(1, 10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	// mapper xml에서 참조
	// 검색 기능 사용 한 경우 type: TWC
	public String[] getTypeArr() {
		return type == null? new String[] {} : type.split("");  // "T", "W," "C" 
		// xml에서 foreach가 동작 될 때 getTypeArr() 동작된다. 
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", type=" + type + ", keyword=" + keyword + "]";
	}
	
	
	// 컨트롤러에서 criteria를 파라미터 사용 시 RedirectAttributes파라미터를 사용 안해도 되기 때문이다.
	// 직접 호출하는 용도
	public String getListLink() {	
			// UriComponentsBuilder : Uri를 생성하는 기능을 제공
			UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
			.queryParam("pageNum", this.pageNum)
			.queryParam("amount", this.getAmount())
			.queryParam("type", this.getType())
			.queryParam("keyword", this.getKeyword());
			
			return builder.toUriString(); 
			
	}	
	
}

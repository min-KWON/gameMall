package com.gamemall.dto;

// 페이징 기능 구현 목적으로 사용하는 클래스
// jsp에서 페이징 기능 출력 목적  [prev] 1		 2		3		4		5 	[next]

public class PageDTO {
		
		/*
		  
		 페이지 마다 데이터 출력 건수 10개 
		 
		 
		  첫번째 블럭
		  1		2		3		4		5		[다음]
		  
		  두번째 블럭
		  [이전]		6		7		8		9		10 	[다음]
		 */
	
		private int startPage;		// 시작 페이지 번호
		private int endPage;		// 끝 페이지 번호
		
		// [이전], [다음] 표시 여부를 위해 true, false 조건 예시로 위에 예제들처럼 데이터 수가 50개 이상이면 true, 아니면 false
		private boolean prev, next;
		
		// 게시판 테이블의 총 데이터 개수
		private int total;
		
		
		// Criteria클래스를 필드 수준으로 사용. 페이징 정보(pageNum, amount)와 검색 필드(type, keyword)를 DTO클래스에서 사용
		// 1번 2번 클릭할때마다 클라이언트에게 전달한다.
		private Criteria cri;
		
		// 생성자의 매개변수를 제공 할 것이다.
		// total : 데이터 총 개수, pageNum : 페이지번호, amount: 출력 건수 가 이 안에 생성자에 들어옴.
		public PageDTO(int total, Criteria cri) {
			
			this.cri = cri;
			this.total = total;
			
			int pageSize = 10;		// 블럭당 출력 할 페이지 개수. 	1	2	3	4	5	6	7	8	9	10 
			// endPage필드값을 구하기위한 용도
			int endPageInfo = pageSize - 1;
			
			// endpage값을 구해 페이지 출력하더라도 블럭의 5개 페이지 수는 유지 할 수 있다.
			// pageNum = 1  	=> 	this.endPage = (int) Math.ceil(1 / (double) 10) * 10;
			// pageNum = 10  	=> 	this.endPage = (int) Math.ceil(10 / (double) 10) * 10;
			this.endPage = (int) Math.ceil(cri.getPageNum() / (double) pageSize) * pageSize;
			this.startPage = this.endPage - endPageInfo;
			
			// 게시판 테이블의 실제 데이터 개수에 따른 마지막 페이지 수를 구해야 한다.
			int realEnd = (int) Math.ceil((total * 1.0) / cri.getAmount());		// 실수를 정수로 변환하여 값의 나머지를 반올림하여 
			
			// 실제 페이지 수 <= (논리) 마지막 페이지 수
			if(realEnd <= this.endPage) {
				this.endPage = realEnd;		// 테이블 데이터 개수에 따른 실제 페이지 수 처리
			}
			
			this.prev = this.startPage > 1;	// [다음] 블럭에 표시 할 데이터가 존재한다는 의미.
			this.next = this.endPage < realEnd;  // 실제 페이지수가 더크면 다음 블럭에 표시할 데이터가 존재하는 의미이므로
		}

		public int getStartPage() {
			return startPage;
		}

		public void setStartPage(int startPage) {
			this.startPage = startPage;
		}

		public int getEndPage() {
			return endPage;
		}

		public void setEndPage(int endPage) {
			this.endPage = endPage;
		}

		public boolean isPrev() {
			return prev;
		}

		public void setPrev(boolean prev) {
			this.prev = prev;
		}

		public boolean isNext() {
			return next;
		}

		public void setNext(boolean next) {
			this.next = next;
		}

		public int getTotal() {
			return total;
		}

		public void setTotal(int total) {
			this.total = total;
		}

		public Criteria getCri() {
			return cri;
		}

		public void setCri(Criteria cri) {
			this.cri = cri;
		}

		@Override
		public String toString() {
			return "PageDTO [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
					+ ", total=" + total + ", cri=" + cri + "]";
		}
		
}

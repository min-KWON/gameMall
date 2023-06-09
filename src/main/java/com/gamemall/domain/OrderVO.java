package com.gamemall.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderVO {

	// ord_code, mbsp_id, ord_name, ord_addr_post, ord_addr_basic, ord_addr_detail, ord_tel, ord_price, ord_regdate
	private Long ord_code;
	private String mbsp_id;
	private String ord_name;
	private String ord_addr_post;
	private String ord_addr_basic;
	private String ord_addr_detail;
	private String ord_tel;
	private int ord_price;
	private Date ord_regdate;
	
}

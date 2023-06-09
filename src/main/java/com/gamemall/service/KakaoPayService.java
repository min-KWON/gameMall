package com.gamemall.service;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.gamemall.kakaopay.ApproveResponse;
import com.gamemall.kakaopay.ReadyResponse;



@Service
public class KakaoPayService {

	
	/*
	 URL 요청 작업을 하기위한 클래스
	 - HttpURLConnection 클래스  : Http통신지원
	 - RestTemplate 클래스 : JSON데이타 -> 객체변환기능 (스프링에서 지원됨. 권장)
	 
	 1)결제준비요청
	 - 기본주소
	 POST /v1/payment/ready HTTP/1.1
	 Host: kapi.kakao.com
	 - 헤더
	 Authorization: KakaoAK ${APP_ADMIN_KEY}
	 Content-type: application/x-www-form-urlencoded;charset=utf-8
	 
	 - 요청파라미터(전송데이터) : Kakao API참조.
	 */
	
	
	
	// 1)결제준비요청.  https://kapi.kakao.com/v1/payment/ready
	public ReadyResponse payReady(String cid, Long partner_order_id, String partner_user_id, String item_name, 
			int quantity, int total_amount, int tax_free_amount, String approval_url, String cancel_url, String fail_url ) {
		
		String url = "https://kapi.kakao.com/v1/payment/ready";
		
		
		//요청에 사용될 파라미터 작업
		// 하나의 키에 여러개의 값을 저장가능.(스프링 지원). 참고>Map 컬렉션 : 하나의 키에 하나의 값만 저장.(키중복안됨)
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		parameters.add("cid", cid);
		parameters.add("partner_order_id", String.valueOf(partner_order_id));
		parameters.add("partner_user_id", partner_user_id);
		parameters.add("item_name", item_name);
		parameters.add("quantity", String.valueOf(quantity));
		parameters.add("total_amount", String.valueOf(total_amount));
		parameters.add("tax_free_amount", "0");
		parameters.add("approval_url", approval_url);
		parameters.add("cancel_url", cancel_url);
		parameters.add("fail_url", fail_url);
		
		// HttpEntity 클래스? 헤더와 몸체를 하나로 관리하는 기능제공. HttpHeader, HttpBody 를 포함.
		//헤더작업
		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<MultiValueMap<String,String>>(parameters, getHeaders());
		
		//외부API통신(카카오페이 서버 API)
		RestTemplate template = new RestTemplate();
		ReadyResponse readyResponse = template.postForObject(url, requestEntity, ReadyResponse.class);
		
		return readyResponse;
	}
	
	/*
	  POST /v1/payment/approve HTTP/1.1
	  Host: kapi.kakao.com
	  Authorization: KakaoAK ${APP_ADMIN_KEY}
	  Content-type: application/x-www-form-urlencoded;charset=utf-8
	 */
	
	// 2)결제승인요청.  https://kapi.kakao.com/v1/payment/approve
	public ApproveResponse payApprove(String cid, String tid, long partner_order_id, String partner_user_id, String pg_token) {
		
		String url = "https://kapi.kakao.com/v1/payment/approve";
		
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		parameters.add("cid", cid);		
		parameters.add("tid", tid);
		parameters.add("partner_order_id", String.valueOf(partner_order_id));
		parameters.add("partner_user_id", partner_user_id);
		parameters.add("pg_token", pg_token);
		
		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<MultiValueMap<String,String>>(parameters, getHeaders());
		
		//외부API통신(카카오페이 서버 API)
		RestTemplate template = new RestTemplate();
		ApproveResponse approveResponse = template.postForObject(url, requestEntity, ApproveResponse.class);
		
		return approveResponse;
	}
	
	// 공통헤더정보.
	private HttpHeaders getHeaders() {
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "KakaoAK 5d3ed4699e287a3fce30939e96491628");
		headers.set("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		return headers;
	}
	

}

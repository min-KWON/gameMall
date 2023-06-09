package com.gamemall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gamemall.domain.OrderVO;
import com.gamemall.domain.PaymentVO;
import com.gamemall.mapper.CartMapper;
import com.gamemall.mapper.OrderMapper;

import lombok.Setter;

@Service
public class OrderServiceImpl implements OrderService {

	@Setter(onMethod_ = {@Autowired})
	private OrderMapper orderMapper;
	
	@Setter(onMethod_ = {@Autowired})
	private CartMapper cartMapper;

	@Transactional // 트랜잭션 테스트 할 것. root-context.xml 파일에서 트랜잭션 설정확인.
	@Override
	public void order_save(OrderVO o_vo, PaymentVO p_vo) {
		// TODO Auto-generated method stub
		// 주문정보저장
		orderMapper.order_save(o_vo); // mapper에서 시퀀스를 통한 주문번호가 확보
		// 주문상세정보저장
		orderMapper.order_detail_save(o_vo.getOrd_code());
		// 결제정보저장
		p_vo.setOrd_code(o_vo.getOrd_code());
		orderMapper.payment_save(p_vo);
		
		// 장바구니 비우기
		cartMapper.cart_empty(o_vo.getMbsp_id());
	}
}

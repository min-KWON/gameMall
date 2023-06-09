package com.gamemall.service;

import com.gamemall.domain.OrderVO;
import com.gamemall.domain.PaymentVO;

public interface OrderService {

	// 주문정보
	void order_save(OrderVO o_vo, PaymentVO p_vo);
}

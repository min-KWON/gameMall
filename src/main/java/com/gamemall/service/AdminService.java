package com.gamemall.service;

import com.gamemall.domain.AdminVO;

public interface AdminService {

	AdminVO admin_ok(String admin_id);
	
	void now_visit(String admin_id);
}

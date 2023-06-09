package com.gamemall.mapper;

import com.gamemall.domain.AdminVO;

public interface AdminMapper {

	AdminVO admin_ok(String admin_id);
	
	void now_visit(String admin_id);
}

package com.gamemall.service;

import com.gamemall.dto.EmailDTO;

public interface EmailService {

	void sendMail(EmailDTO dto, String message);
}

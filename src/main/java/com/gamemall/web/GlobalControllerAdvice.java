package com.gamemall.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.gamemall.domain.CategoryVO;
import com.gamemall.service.ProductService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


// com.docmall.controller 패키지안의 컨트롤러에서 설정된 매핑주소가 클라이언트로 부터 요청을 받으면 
// 해당 컨트롤러의 메서드가 동작하기 이전에 이 클래스가 동작이 먼저 진행이된다.
@Log4j
@ControllerAdvice(basePackages = {"com.gamemall.web"})
public class GlobalControllerAdvice {

	@Setter(onMethod_ = {@Autowired})
	private ProductService productService;
	
	@ModelAttribute
	public void categoryList(Model model) {
		log.info("1차 카테고리 목록");
		
		List<CategoryVO> cateList = productService.getCategoryList();
		model.addAttribute("cateList", cateList);
	}
}

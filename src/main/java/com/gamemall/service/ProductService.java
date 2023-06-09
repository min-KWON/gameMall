package com.gamemall.service;

import java.util.List;

import com.gamemall.domain.CategoryVO;
import com.gamemall.domain.ProductVO;
import com.gamemall.dto.Criteria;



public interface ProductService {

	// 1차카테고리.
	List<CategoryVO> getCategoryList();
	// 2차카테고리
	List<CategoryVO> subCategoryList(Integer cat_code);
	
	// 상품목록
	List<ProductVO> pro_list(Integer cat_code, Criteria cri);
	// 상품개수
	int pro_count(Integer cat_code, Criteria cri);
	
	ProductVO pro_detail(Integer pro_num);
}

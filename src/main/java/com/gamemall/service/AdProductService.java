package com.gamemall.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gamemall.domain.CategoryVO;
import com.gamemall.domain.ProductVO;
import com.gamemall.dto.Criteria;



public interface AdProductService {
	
	// 1차 카테고리
	List<CategoryVO> getCategoryList();
	
	// 2차카테고리
	List<CategoryVO> subCategoryList(Integer cat_code);
	
	// 상품 페이지 처리
	public List<ProductVO> getListWithPaging(Criteria cri);

	public int getTotalCount(Criteria cri);
	
	//상품등록
	void pro_insert(ProductVO vo);
	
	// 상품리스트 상품 수정
	ProductVO modify(Integer pro_num);
	CategoryVO get(int cat_code);
	
	void update(ProductVO vo);
	
	// 상품 삭제
	void delete(Integer pro_num);
	
	// 1) 선택 상품 수정 방법
	void pro_checked_modify(List<ProductVO> pro_list);
	
	// 2) 선택상품 수정 
	// void pro_checked_modify2(Integer pro_num, int pro_price, String pro_buy);
	
	// 선택상품 삭제
	void pro_checked_delete(@Param("pro_num_arr") List<Integer> pro_num_arr);
}

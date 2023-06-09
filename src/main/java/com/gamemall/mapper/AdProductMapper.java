package com.gamemall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.gamemall.domain.CategoryVO;
import com.gamemall.domain.ProductVO;
import com.gamemall.dto.Criteria;



// Category Mapper + Product Mapper
public interface AdProductMapper {

	// 1차카테고리.
	List<CategoryVO> getCategoryList();
	// 2차카테고리
	List<CategoryVO> subCategoryList(Integer cat_code);
	
	// 상품 페이징 리스트
	List<ProductVO> getListWithPaging(Criteria cri);

	public int getTotalCount(Criteria cri);
	//상품등록
	void pro_insert(ProductVO vo);
	
	// 상품 리스트 상품 수정
	// 필드 하나만 가져올때는 ProductVO 여러개 가져올때는 List<ProductVO> 컬렉션
	ProductVO modify(Integer pro_num);
	CategoryVO get(int cat_code);
	
	void update(ProductVO vo);
	
	// 상품 삭제
	void delete(Integer pro_num);
	
	// 1) 선택 상품 수정 방법
	void pro_checked_modify(List<ProductVO> pro_list);
	
	// 2) 선택상품 수정 
	// mapper인터페이스에서 파라미터값이 두개 이상일땐 @param어노테이션을 사용해야함.
	// void pro_checked_modify2(@Param("pro_num") Integer pro_num, @Param("pro_price") int pro_price, @Param("pro_buy") String pro_buy);

	// 선택 상품 삭제. 파라미터가 1) 컬렉션일 경우에 mybatis foreach 구문에서는 list, 2) 배열 일 경우 array
	void pro_checked_delete(@Param("pro_num_arr") List<Integer> pro_num_arr);
}

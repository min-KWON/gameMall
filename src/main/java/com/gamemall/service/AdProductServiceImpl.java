package com.gamemall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gamemall.domain.CategoryVO;
import com.gamemall.domain.ProductVO;
import com.gamemall.dto.Criteria;
import com.gamemall.mapper.AdProductMapper;

import lombok.Setter;

@Service
public class AdProductServiceImpl implements AdProductService {

	@Setter(onMethod_ = {@Autowired})
	private AdProductMapper adProductMapper;

	@Override
	public List<CategoryVO> getCategoryList() {
		// TODO Auto-generated method stub
		return adProductMapper.getCategoryList();
	}

	@Override
	public List<CategoryVO> subCategoryList(Integer cat_code) {
		// TODO Auto-generated method stub
		return adProductMapper.subCategoryList(cat_code);
	}

	@Override
	public void pro_insert(ProductVO vo) {
		// TODO Auto-generated method stub
		adProductMapper.pro_insert(vo);
	}

	@Override
	public List<ProductVO> getListWithPaging(Criteria cri) {
		
		return adProductMapper.getListWithPaging(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return adProductMapper.getTotalCount(cri);
	}

	@Override
	public ProductVO modify(Integer pro_num) {
		
		return adProductMapper.modify(pro_num);
	}

	@Override
	public CategoryVO get(int cat_code) {
		
		return adProductMapper.get(cat_code);
	}

	@Override
	public void update(ProductVO vo) {
		
		adProductMapper.update(vo);
	}

	@Override
	public void delete(Integer pro_num) {
		
		adProductMapper.delete(pro_num);
		
	}

	@Override
	public void pro_checked_delete(List<Integer> pro_num_arr) {
		
		adProductMapper.pro_checked_delete(pro_num_arr);
	}

//	@Override
//	public void pro_checked_modify2(Integer pro_num, int pro_price, String pro_buy) {
//		
//		adProductMapper.pro_checked_modify2(pro_num, pro_price, pro_buy);
//	}

	@Override
	public void pro_checked_modify(List<ProductVO> pro_list) {
		// TODO Auto-generated method stub
		adProductMapper.pro_checked_modify(pro_list);
	}
}

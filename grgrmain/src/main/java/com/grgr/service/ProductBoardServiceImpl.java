package com.grgr.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.grgr.dao.ProductBoardDAO;
import com.grgr.dto.ProductBoardVO;
import com.grgr.dto.ProductUserDTO;
import com.grgr.util.Criteria;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProductBoardServiceImpl implements ProductBoardService {

	private final ProductBoardDAO productBoardDAO;

	@Override
	public void add(ProductBoardVO board) {
		productBoardDAO.insert(board);

	}

	@Override
	public List<ProductBoardVO> selectList(Criteria cri) {
		return productBoardDAO.getList(cri);
	}

	@Override
	public ProductBoardVO selectPage(int productId) {
		return productBoardDAO.getPage(productId);
	}

	@Override
	public void update(ProductBoardVO board) {
		productBoardDAO.modify(board);

	}

	@Override
	public void remove(int productId) {
		productBoardDAO.delete(productId);

	}

	@Override
	public void modifyViewCnt(int productId) {
		productBoardDAO.updateViewCnt(productId);

	}

	@Override
	public int getTotal(Criteria cri) {
		return productBoardDAO.getTotal(cri);
	}

	@Override
	public ProductUserDTO getBoardUserInfo(int productId) {
		return productBoardDAO.getBoardUserInfo(productId);
	}

}

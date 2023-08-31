package com.grgr.service;

import java.util.List;

import com.grgr.dto.ProductBoardVO;
import com.grgr.dto.ProductUserDTO;
import com.grgr.util.Criteria;

public interface ProductBoardService {

	/* 게시판 등록 */
	void add(ProductBoardVO board);

	/* 게시판 목록 */
	List<ProductBoardVO> selectList(Criteria cri);

	/* 게시판 조회 */
	ProductBoardVO selectPage(int productId);

	/* 게시판 수정 */
	void update(ProductBoardVO board);

	/* 게시판 삭제 */
	void remove(int productId);

	/* 조회수 증가 */
	void modifyViewCnt(int productId);

	/* 게시판 총 갯수 */
	public int getTotal(Criteria cri);
	
	/* 게시판 상품 정보와 회원 정보 함께 조회 */
	ProductUserDTO getBoardUserInfo(int productId);
}

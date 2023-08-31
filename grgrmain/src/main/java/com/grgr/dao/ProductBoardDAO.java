package com.grgr.dao;

import java.util.List;

import com.grgr.dto.ProductBoardVO;
import com.grgr.dto.ProductUserDTO;
import com.grgr.util.Criteria;

public interface ProductBoardDAO {
	/* 게시판 등록 */
	int insert(ProductBoardVO board);

	/* 게시판 목록 */
	List<ProductBoardVO> getList(Criteria cri);

	/* 게시판 조회 */
	ProductBoardVO getPage(int productId);

	/* 게시판 수정 */
	int modify(ProductBoardVO board);

	/* 게시판 삭제 */
	int delete(int productId);

	/* 조회수 증가 */
	int updateViewCnt(int productId);

	/* 게시판 총 갯수 */
	int getTotal(Criteria cri);

	/* 게시판 상품 정보와 회원 정보 함께 조회 */
	ProductUserDTO getBoardUserInfo(int productId);
}

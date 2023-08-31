package com.grgr.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.grgr.dto.ProductBoardVO;
import com.grgr.service.ProductBoardService;
import com.grgr.util.Criteria;
import com.grgr.util.PagerDTO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class ProductBoardController {

	private final ProductBoardService productBoardService;
	private static final Logger log = LoggerFactory.getLogger(ProductBoardController.class);

	/* 상품 목록 페이지 */
	@GetMapping("/list")
	public String productBoardListGet(Model model, Criteria cri) {
		log.info("상품 목록 페이지 진입");

		model.addAttribute("list", productBoardService.selectList(cri));

		int total = productBoardService.getTotal(cri);

		PagerDTO pager = new PagerDTO(cri, total);

		model.addAttribute("pager", pager);
		return "board/list";
	}

	/* 상품 조회 */
	@GetMapping("/get")
	public String productBoardPageGet(int productId, Model model) {
		log.info("상품 상세 조회 진입");
		model.addAttribute("pageInfo", productBoardService.selectPage(productId));
		model.addAttribute("userInfo", productBoardService.getBoardUserInfo(productId));
		return "board/get";
	}

	/* 상품 등록 페이지 접속 */
	@GetMapping("/insert")
	public String ProductBoardInsertGet() {
		log.info("상품 등록 페이지 진입");
		
		return "board/insert";
	}

	/* 상품 등록 */
	@PostMapping("/insert")
	public String ProductBoardInsertPost(ProductBoardVO board, RedirectAttributes rttr) {
		log.info("ProductBoardVO = " + board);

		productBoardService.add(board);

		rttr.addFlashAttribute("result", "insert success");

		return "redirect:/board/list";
	}

	/* 수정 페이지 이동 */
	@GetMapping("/modify")
	public String ProductBoardModifyGet(Integer productId, Model model) {
		model.addAttribute("pageInfo", productBoardService.selectPage(productId));
		
		return"board/modify";
	}

	/* 페이지 수정 */
	@PostMapping("/modify")
	public String ProductBoardModifyPost(ProductBoardVO board, RedirectAttributes rttr) {
		productBoardService.update(board);

		rttr.addFlashAttribute("result", "update success");

		return "redirect:/board/list";
	}

	/* 페이지 삭제 */
	@PostMapping("/delete")
	public String ProductBoardDeletePost(int productId, RedirectAttributes rttr) {

		productBoardService.remove(productId);

		rttr.addFlashAttribute("result", "delete success");

		return "redirect:/board/list";
	}

}

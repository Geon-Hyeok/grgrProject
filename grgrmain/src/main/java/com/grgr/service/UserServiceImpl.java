package com.grgr.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.grgr.dao.UserDAO;
import com.grgr.dto.MyBoardWriteDTO;
import com.grgr.dto.MyCommentDTO;
import com.grgr.dto.UserVO;
import com.grgr.mapper.UserMapper;
import com.grgr.util.AdminPager;
import com.grgr.util.Pager;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

	private final UserDAO userDAO;
	private final UserMapper userMapper;
    private final JavaMailSender mailSender;

	/* 회원가입 */
	@Override
	public void userJoin(UserVO user) throws Exception {
		userDAO.userJoin(user);
	}

	/* 아이디 중복 검사 */
	@Override
	public int idCheck(String userId) throws Exception {
		return userDAO.idCheck(userId);

	}

	/* 닉네임 중복 검사 */
	@Override
	public int nickNameCheck(String nickName) {
		return userDAO.nickNameCheck(nickName);
	}

	/* 로그인 */
	@Override
	public UserVO userLogin(UserVO user) {
		return userDAO.userLogin(user);
	}

	/* 회원 조회(마이페이지) */
	@Override
	public UserVO userProfile(int uno) {
		return userDAO.userProfile(uno);
	}

	/* 회원 정보 수정 */
	@Override
	public int updateUserProfile(UserVO user) {
		return userDAO.updateUserProfile(user);
	}

	/* 회원 탈퇴 */
	@Override
	public int deleteUserProfile(int uno) {
		return userDAO.deleteUserProfile(uno);
	}

	/* 내가 쓴 댓글 조회 */
	@Override
	public Map<String, Object> getCommentList(int uno, int pageNum) {
		int totalUser = userDAO.selectCommentCount(uno);
		int pageSize = 10;
		int blockSize = 10;

		AdminPager pager = new AdminPager(pageNum, totalUser, pageSize, blockSize);

		System.out.println(uno);
		List<MyCommentDTO> commentList = userDAO.getCommentList(uno, pager.getStartRow(), pager.getEndRow());

		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("pager", pager);
		resultMap.put("commentList", commentList);

		return resultMap;
	}

	@Override
	public Map<String, Object> getBoardWriteList(int uno, int pageNum) {
		int totalUser = userDAO.selectWriteCount(uno);
		int pageSize = 10;
		int blockSize = 10;

		AdminPager pager = new AdminPager(pageNum, totalUser, pageSize, blockSize);

		System.out.println(uno);
		List<MyBoardWriteDTO> boardWriteList = userDAO.getBoardWriteList(uno, pager.getStartRow(), pager.getEndRow());

		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("pager", pager);
		resultMap.put("boardWriteList", boardWriteList);

		return resultMap;
	}
	
	/* 관리자 회원 보기 */
	@Override
	public Map<String, Object> getAllUsers(int pageNum) {
		int totalUser = userDAO.selectUserCount();
		int pageSize = 10;
		int blockSize = 10;

		AdminPager adminPager = new AdminPager(pageNum, totalUser, pageSize, blockSize);

		Map<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("startRow", adminPager.getStartRow());
		pageMap.put("endRow", adminPager.getEndRow());
		List<UserVO> userList = userDAO.getAllUsers(pageMap);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("pager", adminPager);
		resultMap.put("userList", userList);

		return resultMap;
	}
	
	/* 관리자 - 회원 정보 수정*/
	@Transactional
	@Override
	public void updateUser(UserVO user) {
		userDAO.updateUser(user);
	}

	 @Override
	    public String findUserIdByNameAndEmail(String name, String email) {
	        return userDAO.findUserIdByNameAndEmail(name, email);
	    }

	@Override
	public UserVO findUserByIdAndEmail(String userId, String email) {
		return userDAO.findUserByIdAndEmail(userId, email);
	}
	@Transactional
	@Override
	public void updateUserPassword(UserVO user) {
		userDAO.updateUserPassword(user);
		
	}

	@Override
	public void updateUserLocation(String userId, String address) {
		userDAO.updateUserLocation(userId, address);
		
	}

	
		
	}


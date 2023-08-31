package com.grgr.mapper;

import java.util.List;

import java.util.Map;

import com.grgr.dto.FreeComment;

public interface FreeCommentMapper {
	int freeCommentCount(int freeBno);
	List<FreeComment> selectFreeCommentList(Map<String, Object> map);
	int insertFreeComment(FreeComment freeComment);
	int updateFreeComment(FreeComment freeComment);
	int deleteFreeComment(Map<String, Object> map); // infoBno, uno(세션) 필요
	int blindFreeComment(Map<String, Object> map); //uno(세션), infoBno 필요
	int increaseFreeCommentReportNo(int freeBno);
	
}
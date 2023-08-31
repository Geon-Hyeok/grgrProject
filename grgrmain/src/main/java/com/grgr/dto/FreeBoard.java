package com.grgr.dto;

import java.util.Date;

import lombok.Data;

/*
CREATE TABLE FREE_BOARD (FREE_BNO NUMBER PRIMARY KEY,
UNO NUMBER NOT NULL, ),
FREE_KEYWORD NUMBER,
FREE_TITLE VARCHAR2(100) NOT NULL,
FREE_CONTENT VARCHAR2(2000) NOT NULL,
FREE_LOC VARCHAR2(50),
FREE_VIEW_CNT NUMBER DEFAULT 0,
FREE_REPORT_NO NUMBER DEFAULT 0,
FREE_BLINDSTATE NUMBER DEFAULT 1 NOT NULL CHECK(FREE_BLINDSTATE BETWEEN 1 AND 3),
FREE_REGDATE DATE DEFAULT SYSDATE,
FREE_UPDATE DATE DEFAULT SYSDATE,
FREE_UPDATE_UNO NUMBER);

CREATE SEQUENCE FREE_SEQ;
 */
@Data
public class FreeBoard {
	private String freeTitle;
	private String freeContent;
	private String freeLoc;
	private int freeBno;
	private int uno;
	private String freeKeyword;
	private int freeViewCnt;
	private int freeReportNo;
	private int freeBlindstate;
	private int freeUpdateUno;
	private Date freeRegdate;
	private Date freeUpdate;
	private String nickname;
	private String thumbnail;
}	
	/*
	 * 
	freeTitle: 정보 게시물의 제목입니다.
	freeContent: 정보 게시물의 내용입니다.
	freeLoc: 정보 게시물의 위치 정보입니다.
	freeBno: 정보 게시물의 번호입니다. 주로 고유한 식별자로 사용됩니다.
	uno: 게시물을 작성한 사용자의 번호(식별자)입니다.
	freeKeyword: 정보 게시물의 키워드 또는 태그입니다.
	freeViewCnt: 정보 게시물이 조회된 횟수입니다.
	freeReportNo: 정보 게시물에 대한 신고 횟수입니다.
	freeBlindstate: 정보 게시물의 블라인드 상태를 나타냅니다.
	값 1: 일반 상태
	값 2: 블라인드 상태 (관리자에 의해 숨김 처리됨)
	값 3: 삭제 상태 (사용자에 의해 삭제 처리됨)
	freeUpdateUno: 정보 게시물을 업데이트한 사용자의 번호(식별자)입니다.
	freeRegdate: 정보 게시물의 등록일자입니다.
	freeUpdate: 정보 게시물이 마지막으로 업데이트된 일자입니다.
	thumbnail: 정보 게시물에 첨부된 썸네일 이미지 파일의 경로나 정보입니다.
	 * */


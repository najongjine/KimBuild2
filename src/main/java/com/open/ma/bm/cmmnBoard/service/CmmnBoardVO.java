package com.open.ma.bm.cmmnBoard.service;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;
import org.hibernate.validator.constraints.NotEmpty;

import com.open.cmmn.model.CmmnDefaultVO;

/**
 * Content VO 클래스
 * @author 공통서비스 개발팀 yd.go
 * @since 2016.09.08
 * @version 1.0
 * @see
 *  
 
 */
@Alias("cmmnBoardVO")
public class CmmnBoardVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;

	
	/* 일련번호 */
	private String boardSeq;
	
	/* 제목 */
	@NotEmpty
	private String title;
	
	/* 내용 */
	private String cont;
	
	/* 등록일 */
	private String rgstDt;
	
	/* 등록자 */
	private String rgstId;
	
	/* 첨부파일ID */
	private String atchFileId;

	/* 첨부파일ID2 */
	private String atchFileId2;
	
	private String imageFileId;
	
	/* 수정자 */
	private String rvseId;
	
	/* 수정일 */
	private String rvseDt;

	/* 그룹 일련번호 */
	private String boardGrpSeq;
	
	/* 공지여부 */
	private String notiYn;
	
	/* 게시판 구분 */
	private String boardDivn;
	
	/* 게시판 코드 */
	private String boardCd;
	
	
	/* 조회수 */
	private String viewNum;
	
	
	/* 공지 시작일 */
	private String notiStaDate;
	
	
	/* 공지 종료일 */
	private String notiEndDate;
	
	/* 팝업 TOP */
	private String popTop;
	
	/* 팝업 LEFT */
	private String popLeft;
	
	/* 팝업 WIDTH */
	private String popWidth;
	
	/* 팝업 HEIGHT */
	private String popHeight;
	
	private String upCtt;
	
	private String newChk;
	
	private String subCnt;
	
	private String name;
	
	/* 팝업 시작일 */
	private String popStaDate;
	/* 팝업 종료일 */
	private String popEndDate;

	private String fileSn;
	
	private String url;
	
	private String orignFileNm;
	private String secretYn;
	private String workDiv;
	private String sloCate;
	private String inOutDiv;
	private String linkUrl;
	private String siteClcd;
	private String siteClcdNm;
	private String siteClcdCnt;
	private String year;
	
	private String acptStDt;
	private String acptEndDt;
	
	private String notiStDt;
	private String notiEndDt;
	
	private String fileExtsn;
	
	private String minFileSn;
	
	private String boardNm;
	
	private String rnum;
	private String col1;
	private String col2;
	private String col3;
	private String col4;
	private String col5;
	private String pwd;
	private String status;
	private String QnaName;
	private String QnaEmail;
	private String QnaMblp;
	

	public String getBoardSeq() {
		return boardSeq;
	}

	public void setBoardSeq(String boardSeq) {
		this.boardSeq = boardSeq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCont() {
		return cont;
	}

	public void setCont(String cont) {
		this.cont = cont;
	}

	public String getRgstDt() {
		return rgstDt;
	}

	public void setRgstDt(String rgstDt) {
		this.rgstDt = rgstDt;
	}

	public String getRgstId() {
		return rgstId;
	}

	public void setRgstId(String rgstId) {
		this.rgstId = rgstId;
	}

	public String getAtchFileId() {
		return atchFileId;
	}

	public void setAtchFileId(String atchFileId) {
		this.atchFileId = atchFileId;
	}

	public String getRvseId() {
		return rvseId;
	}

	public void setRvseId(String rvseId) {
		this.rvseId = rvseId;
	}

	public String getRvseDt() {
		return rvseDt;
	}

	public void setRvseDt(String rvseDt) {
		this.rvseDt = rvseDt;
	}

	public String getBoardGrpSeq() {
		return boardGrpSeq;
	}

	public void setBoardGrpSeq(String boardGrpSeq) {
		this.boardGrpSeq = boardGrpSeq;
	}

	public String getNotiYn() {
		return notiYn;
	}

	public void setNotiYn(String notiYn) {
		this.notiYn = notiYn;
	}

	public String getBoardDivn() {
		return boardDivn;
	}

	public void setBoardDivn(String boardDivn) {
		this.boardDivn = boardDivn;
	}

	public String getBoardCd() {
		return boardCd;
	}

	public void setBoardCd(String boardCd) {
		this.boardCd = boardCd;
	}

	public String getViewNum() {
		return viewNum;
	}

	public void setViewNum(String viewNum) {
		this.viewNum = viewNum;
	}

	public String getNotiStaDate() {
		return notiStaDate;
	}

	public void setNotiStaDate(String notiStaDate) {
		this.notiStaDate = notiStaDate;
	}

	public String getNotiEndDate() {
		return notiEndDate;
	}

	public void setNotiEndDate(String notiEndDate) {
		this.notiEndDate = notiEndDate;
	}

	public String getPopTop() {
		return popTop;
	}

	public void setPopTop(String popTop) {
		this.popTop = popTop;
	}

	public String getPopLeft() {
		return popLeft;
	}

	public void setPopLeft(String popLeft) {
		this.popLeft = popLeft;
	}

	public String getPopWidth() {
		return popWidth;
	}

	public void setPopWidth(String popWidth) {
		this.popWidth = popWidth;
	}

	public String getPopHeight() {
		return popHeight;
	}

	public void setPopHeight(String popHeight) {
		this.popHeight = popHeight;
	}

	public String getUpCtt() {
		return upCtt;
	}

	public void setUpCtt(String upCtt) {
		this.upCtt = upCtt;
	}

	public String getNewChk() {
		return newChk;
	}

	public void setNewChk(String newChk) {
		this.newChk = newChk;
	}

	public String getSubCnt() {
		return subCnt;
	}

	public void setSubCnt(String subCnt) {
		this.subCnt = subCnt;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPopStaDate() {
		return popStaDate;
	}

	public void setPopStaDate(String popStaDate) {
		this.popStaDate = popStaDate;
	}

	public String getPopEndDate() {
		return popEndDate;
	}

	public void setPopEndDate(String popEndDate) {
		this.popEndDate = popEndDate;
	}

	public String getFileSn() {
		return fileSn;
	}

	public void setFileSn(String fileSn) {
		this.fileSn = fileSn;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getOrignFileNm() {
		return orignFileNm;
	}

	public void setOrignFileNm(String orignFileNm) {
		this.orignFileNm = orignFileNm;
	}

	public String getSecretYn() {
		return secretYn;
	}

	public void setSecretYn(String secretYn) {
		this.secretYn = secretYn;
	}

	public String getWorkDiv() {
		return workDiv;
	}

	public void setWorkDiv(String workDiv) {
		this.workDiv = workDiv;
	}

	public String getSloCate() {
		return sloCate;
	}

	public void setSloCate(String sloCate) {
		this.sloCate = sloCate;
	}

	public String getInOutDiv() {
		return inOutDiv;
	}

	public void setInOutDiv(String inOutDiv) {
		this.inOutDiv = inOutDiv;
	}

	public String getLinkUrl() {
		return linkUrl;
	}

	public void setLinkUrl(String linkUrl) {
		this.linkUrl = linkUrl;
	}

	public String getSiteClcd() {
		return siteClcd;
	}

	public void setSiteClcd(String siteClcd) {
		this.siteClcd = siteClcd;
	}

	public String getSiteClcdNm() {
		return siteClcdNm;
	}

	public void setSiteClcdNm(String siteClcdNm) {
		this.siteClcdNm = siteClcdNm;
	}

	public String getSiteClcdCnt() {
		return siteClcdCnt;
	}

	public void setSiteClcdCnt(String siteClcdCnt) {
		this.siteClcdCnt = siteClcdCnt;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getAcptStDt() {
		return acptStDt;
	}

	public void setAcptStDt(String acptStDt) {
		this.acptStDt = acptStDt;
	}

	public String getAcptEndDt() {
		return acptEndDt;
	}

	public void setAcptEndDt(String acptEndDt) {
		this.acptEndDt = acptEndDt;
	}

	public String getNotiStDt() {
		return notiStDt;
	}

	public void setNotiStDt(String notiStDt) {
		this.notiStDt = notiStDt;
	}

	public String getNotiEndDt() {
		return notiEndDt;
	}

	public void setNotiEndDt(String notiEndDt) {
		this.notiEndDt = notiEndDt;
	}

	public String getFileExtsn() {
		return fileExtsn;
	}

	public void setFileExtsn(String fileExtsn) {
		this.fileExtsn = fileExtsn;
	}

	public String getMinFileSn() {
		return minFileSn;
	}

	public void setMinFileSn(String minFileSn) {
		this.minFileSn = minFileSn;
	}

	public String getAtchFileId2() {
		return atchFileId2;
	}

	public void setAtchFileId2(String atchFileId2) {
		this.atchFileId2 = atchFileId2;
	}

	public String getImageFileId() {
		return imageFileId;
	}

	public void setImageFileId(String imageFileId) {
		this.imageFileId = imageFileId;
	}

	public String getBoardNm() {
		return boardNm;
	}

	public void setBoardNm(String boardNm) {
		this.boardNm = boardNm;
	}

	public String getRnum() {
		return rnum;
	}

	public void setRnum(String rnum) {
		this.rnum = rnum;
	}

	public String getCol1() {
		return col1;
	}

	public void setCol1(String col1) {
		this.col1 = col1;
	}

	public String getCol2() {
		return col2;
	}

	public void setCol2(String col2) {
		this.col2 = col2;
	}

	public String getCol3() {
		return col3;
	}

	public void setCol3(String col3) {
		this.col3 = col3;
	}

	public String getCol4() {
		return col4;
	}

	public void setCol4(String col4) {
		this.col4 = col4;
	}

	public String getCol5() {
		return col5;
	}

	public void setCol5(String col5) {
		this.col5 = col5;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getQnaName() {
		return QnaName;
	}

	public void setQnaName(String qnaName) {
		QnaName = qnaName;
	}

	public String getQnaEmail() {
		return QnaEmail;
	}

	public void setQnaEmail(String qnaEmail) {
		QnaEmail = qnaEmail;
	}

	public String getQnaMblp() {
		return QnaMblp;
	}

	public void setQnaMblp(String qnaMblp) {
		QnaMblp = qnaMblp;
	}
	
		

}
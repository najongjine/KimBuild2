package com.open.ma.sys.mn.service;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

import com.open.cmmn.model.CmmnDefaultVO;

/**
 * Content VO 클래스
 * @author 공통서비스 개발팀 yd.go
 * @since 2016.09.08
 * @version 1.0
 * @see
 *  
 
 */
@Alias("mnVO")
public class MnVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;

	
	/* 일련번호 */
	private String menuSeq;
	
	/* 그룹일련번호 */
	private String menuGroupSeq;
	
	/* 레벨 */
	private String lvl;
	
	/* 순서 */
	private String no;
	
	/* 메뉴명 */
	private String menuNm;
	
	/* 메뉴코드 */
	private String menuCd;
	
	/* url */
	private String url;
	
	/* 메규구분 */
	private String menuCl;
	
	/* 메뉴체크 */
	private String menuChk;
	
	/* 아이디 */
	private String id;
	
	/* 설명 */
	private String description;
	
	/* 게시판 구분 */
	private String boardCl;
	
	private List<MnVO> menuList;
	
	private MnVO menuvo;
	
	private String authCode;
	
	private String useYn;

	private String iconCl;
	/* 등록일 */
	private String rgstDt;
	/* 등록자 */
	private String rgstId;
	
	private String upperMenuNm;
	
	private String hide="N";
	
	private String notRdy="N";
	
	
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

	public String getLvl() {
		return lvl;
	}

	public void setLvl(String lvl) {
		this.lvl = lvl;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getMenuNm() {
		return menuNm;
	}

	public void setMenuNm(String menuNm) {
		this.menuNm = menuNm;
	}

	public String getMenuCd() {
		return menuCd;
	}

	public void setMenuCd(String menuCd) {
		this.menuCd = menuCd;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getMenuChk() {
		return menuChk;
	}

	public void setMenuChk(String menuChk) {
		this.menuChk = menuChk;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public List<MnVO> getMenuList() {
		return menuList;
	}

	public void setMenuList(List<MnVO> menuList) {
		this.menuList = menuList;
	}


	public String getAuthCode() {
		return authCode;
	}

	public void setAuthCode(String authCode) {
		this.authCode = authCode;
	}

	public MnVO getMenuvo() {
		return menuvo;
	}

	public void setMenuvo(MnVO menuvo) {
		this.menuvo = menuvo;
	}

	public String getUseYn() {
		return useYn;
	}

	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}

	public String getMenuSeq() {
		return menuSeq;
	}

	public void setMenuSeq(String menuSeq) {
		this.menuSeq = menuSeq;
	}

	public String getMenuGroupSeq() {
		return menuGroupSeq;
	}

	public void setMenuGroupSeq(String menuGroupSeq) {
		this.menuGroupSeq = menuGroupSeq;
	}

	public String getMenuCl() {
		return menuCl;
	}

	public void setMenuCl(String menuCl) {
		this.menuCl = menuCl;
	}

	public String getBoardCl() {
		return boardCl;
	}

	public void setBoardCl(String boardCl) {
		this.boardCl = boardCl;
	}

	public String getIconCl() {
		return iconCl;
	}

	public void setIconCl(String iconCl) {
		this.iconCl = iconCl;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getUpperMenuNm() {
		return upperMenuNm;
	}

	public void setUpperMenuNm(String upperMenuNm) {
		this.upperMenuNm = upperMenuNm;
	}

	public String getHide() {
		return hide;
	}

	public void setHide(String hide) {
		this.hide = hide;
	}

	public String getNotRdy() {
		return notRdy;
	}

	public void setNotRdy(String notRdy) {
		this.notRdy = notRdy;
	}

	
	
	
}
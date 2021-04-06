package com.open.vo;

import java.io.Serializable;

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
@Alias("imgVO")
public class ImgVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String atchFileId;
	private String fileSn;
	public String getAtchFileId() {
		return atchFileId;
	}
	public void setAtchFileId(String atchFileId) {
		this.atchFileId = atchFileId;
	}
	public String getFileSn() {
		return fileSn;
	}
	public void setFileSn(String fileSn) {
		this.fileSn = fileSn;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
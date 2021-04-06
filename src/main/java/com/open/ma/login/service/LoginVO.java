package com.open.ma.login.service;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

import com.open.cmmn.model.CmmnDefaultVO;

/**
 * 관리자 VO 클래스
 * @author hw.park
 * @since 2015.09.01
 * @version 1.0
 * @see
 *  
 * <pre>
 * << 개정이력(Modification Information) >>
 * 
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2015.09.01  hw.park		최초생성 
 *  
 *  </pre>
 */
@Alias("loginVO")
public class LoginVO extends CmmnDefaultVO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5828229720707546090L;

	private String seq;
	private String id;
	private String pwd;
	private String name;
	private String memDiv;
	private String returnUrl;
	private String busiNo;
	private String email;
	private String clientIp;
	private String addr;
	
	private String snsId;
	private String snsName;
	private String snsType;
	private String snsGender;
	private String snsEmail;
	private String snsAge;
	private String snsBirtday;
	private String snsImg;
	private String authCode;
	private String authCodeNm;
	
	private String empno;
	private String hp;
	private String authNum;
	
	private String keyVal;
	private String regId;
	private String keyDiv;
	private String lastDate;
	private String siteClcd;
	
	private String failCnt;
	
	public String getKeyVal() {
		return keyVal;
	}
	public void setKeyVal(String keyVal) {
		this.keyVal = keyVal;
	}
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
	public String getKeyDiv() {
		return keyDiv;
	}
	public void setKeyDiv(String keyDiv) {
		this.keyDiv = keyDiv;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getReturnUrl() {
		return returnUrl;
	}
	public void setReturnUrl(String returnUrl) {
		this.returnUrl = returnUrl;
	}
	public String getSnsId() {
		return snsId;
	}
	public void setSnsId(String snsId) {
		this.snsId = snsId;
	}
	public String getSnsName() {
		return snsName;
	}
	public void setSnsName(String snsName) {
		this.snsName = snsName;
	}
	public String getSnsType() {
		return snsType;
	}
	public void setSnsType(String snsType) {
		this.snsType = snsType;
	}
	public String getSnsGender() {
		return snsGender;
	}
	public void setSnsGender(String snsGender) {
		this.snsGender = snsGender;
	}
	public String getSnsEmail() {
		return snsEmail;
	}
	public void setSnsEmail(String snsEmail) {
		this.snsEmail = snsEmail;
	}
	public String getSnsAge() {
		return snsAge;
	}
	public void setSnsAge(String snsAge) {
		this.snsAge = snsAge;
	}
	public String getSnsBirtday() {
		return snsBirtday;
	}
	public void setSnsBirtday(String snsBirtday) {
		this.snsBirtday = snsBirtday;
	}
	public String getSnsImg() {
		return snsImg;
	}
	public void setSnsImg(String snsImg) {
		this.snsImg = snsImg;
	}
	public String getMemDiv() {
		return memDiv;
	}
	public void setMemDiv(String memDiv) {
		this.memDiv = memDiv;
	}
	public String getBusiNo() {
		return busiNo;
	}
	public void setBusiNo(String busiNo) {
		this.busiNo = busiNo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAuthCode() {
		return authCode;
	}
	public void setAuthCode(String authCode) {
		this.authCode = authCode;
	}
	public String getClientIp() {
		return clientIp;
	}
	public void setClientIp(String clientIp) {
		this.clientIp = clientIp;
	}
	public String getAuthCodeNm() {
		return authCodeNm;
	}
	public void setAuthCodeNm(String authCodeNm) {
		this.authCodeNm = authCodeNm;
	}
	public String getEmpno() {
		return empno;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getAuthNum() {
		return authNum;
	}
	public void setAuthNum(String authNum) {
		this.authNum = authNum;
	}
	public String getLastDate() {
		return lastDate;
	}
	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}
	public String getSiteClcd() {
		return siteClcd;
	}
	public void setSiteClcd(String siteClcd) {
		this.siteClcd = siteClcd;
	}
	public String getFailCnt() {
		return failCnt;
	}
	public void setFailCnt(String failCnt) {
		this.failCnt = failCnt;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
}

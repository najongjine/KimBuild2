package com.open.ft;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.ehcache.EhCacheCacheManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.open.cmmn.model.CmmnDefaultVO;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.cmmn.util.EncryptUtil;
import com.open.cmmn.util.StringUtil;
import com.open.ma.login.service.LoginVO;

import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class FtRegisterController {
	
	/**
	 * globalProperties.
	 */
	@Resource(name = "globalProperties")
	private Properties globalProperties;
	
	@Resource(name = "cmmnService")
    protected CmmnService cmmnService;
	
	@Resource(name = "FileMngService")
    private FileMngService fileMngService;
    
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	/** fileUploadProperties */
	@Resource(name = "fileUploadProperties")
	Properties fileUploadProperties;
	
	/**
	 * MappingJackson2JsonView.
	 */
	@Resource
	private MappingJackson2JsonView ajaxView;
	
    /** Program ID **/
    private final static String PROGRAM_ID = "Mm";

    /** folderPath **/
    private final static String folderPath = "/ft/";

	//@Resource(name = "beanValidator")
	//protected DefaultBeanValidator beanValidator;
	
    @Autowired
	private EhCacheCacheManager cacheManager;
    
	Logger log = Logger.getLogger(this.getClass());
	
	
	/**
	 * 관리자 로그인 화면을 조회한다.
	 * @param searchVO 검색조건
	 * @param model
	 * @return "brd/egovBoardList"
	 * @throws Exception
	 */
	@RequestMapping(value = folderPath+"register.do")
	public String register(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();	
		session.setAttribute("altTitle", "회원가입");	 			
		LoginVO loginVO = new LoginVO();
		String returnUrl = StringUtil.nullString(request.getParameter("returnUrl"));	
		loginVO.setReturnUrl(URLDecoder.decode(returnUrl, "UTF-8"));	
		model.addAttribute("loginVO", loginVO);
		
		return  ".fLayout:"+ folderPath + "register"; 
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = folderPath+"registerProc.do", method = RequestMethod.POST)
	public String registerProcess(@ModelAttribute("searchVO") LoginVO loginVO	, HttpServletRequest request	, ModelMap model	, SessionStatus status) throws Exception {
		String clientIp = StringUtil.getClientIp(request);
		CmmnDefaultVO searchVO = new CmmnDefaultVO();
		HttpSession session = request.getSession();
		
		loginVO.setPwd(EncryptUtil.getString(EncryptUtil.Sha256EncryptB(loginVO.getPwd().getBytes("UTF-8"))));
		
		cmmnService.insertContents(loginVO, PROGRAM_ID+".insertContentsV2");
		
		model.addAttribute("searchVO", searchVO);
		model.addAttribute("message", "회원가입이 되었습니다.");
		model.addAttribute("cmmnScript", "/");
		return "cmmn/execute";
	}

	
	@ResponseBody
	@RequestMapping(value = folderPath+"checkId.json")
	public Map<String,Object> checkId(@ModelAttribute("searchVO") LoginVO searchVO ,ModelMap model) throws Exception {
		Map<String,Object> data=new HashMap<>();
		LoginVO exId=(LoginVO) cmmnService.selectContents(searchVO, PROGRAM_ID+".selectId");
		if(exId!=null) {
			data.put("success", false);
			return data;
		}
		
		data.put("success", true);
		return data;
	}	
	

}

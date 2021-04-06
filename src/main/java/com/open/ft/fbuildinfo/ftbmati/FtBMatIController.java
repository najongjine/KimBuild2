package com.open.ft.fbuildinfo.ftbmati;

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
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.cmmn.util.StringUtil;
import com.open.ma.login.service.LoginVO;

import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class FtBMatIController {
	
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
    private final static String PROGRAM_ID = "";

    /** folderPath **/
    private final static String folderPath = "/ft/fbuildinfo/ftbmati/";

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
	@RequestMapping(value = folderPath+"list.do")
	public String maLogin(@ModelAttribute("searchVO") LoginVO loginVO, ModelMap model, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();	
		
		String referer = (String)request.getHeader("REFERER");
		referer=StringUtil.nullString(referer);
		if(referer.equals("") || referer.toLowerCase().equals("null") || referer.contains("Form.do") || referer.contains("Proc.do")) {
			
			referer="/";
		}
		String exSeq=StringUtil.nullString(loginVO.getSeq());
		if(!"".equals(exSeq)) {
			model.addAttribute("pName", "seq");	
			model.addAttribute("pValue", loginVO.getSeq());
		}
		if(referer.toLowerCase().contains("view.do") && "".equals(exSeq)) {
			referer="/";
		}
		model.addAttribute("message", "준비중입니다");
		model.addAttribute("cmmnScript",referer);
			
		return "cmmn/execute";
		
		
	}

}

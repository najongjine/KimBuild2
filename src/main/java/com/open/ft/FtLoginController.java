package com.open.ft;

import java.net.URLDecoder;
import java.util.List;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.open.cmmn.model.CmmnDefaultVO;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.cmmn.util.EncryptUtil;
import com.open.cmmn.util.SessionUtil;
import com.open.cmmn.util.StringUtil;
import com.open.ma.bm.cmmnBoard.service.CmmnBoardVO;
import com.open.ma.login.service.LoginVO;
import com.open.ma.sys.mn.service.MnVO;

import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class FtLoginController {
	
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
    private final static String PROGRAM_ID = "Login";

    /** folderPath **/
    private final static String folderPath = "/ft/";

	//@Resource(name = "beanValidator")
	//protected DefaultBeanValidator beanValidator;
	
    @Autowired
	private EhCacheCacheManager cacheManager;
    
	Logger log = Logger.getLogger(this.getClass());
	
	
	/**
	 * ????????? ????????? ????????? ????????????.
	 * @param searchVO ????????????
	 * @param model
	 * @return "brd/egovBoardList"
	 * @throws Exception
	 */
	@RequestMapping(value = folderPath+"login.do")
	public String maLogin(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();	
		session.setAttribute("altTitle", "?????????");
		LoginVO loginVO = new LoginVO();
		String returnUrl = StringUtil.nullString(request.getParameter("returnUrl"));	
		loginVO.setReturnUrl(URLDecoder.decode(returnUrl, "UTF-8"));	
		model.addAttribute("loginVO", loginVO);
		
		return  ".fLayout:"+ folderPath + "login"; 
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = folderPath+"loginProc.do", method = RequestMethod.POST)
	public String loginProcess(@ModelAttribute("searchVO") LoginVO loginVO	, HttpServletRequest request	, ModelMap model	, SessionStatus status) throws Exception {
		String clientIp = StringUtil.getClientIp(request);
		CmmnDefaultVO searchVO = new CmmnDefaultVO();
		
		if(loginVO.getId() != null && loginVO.getPwd() != null && !"".equals(loginVO.getId()) && !"".equals(loginVO.getPwd())){
			loginVO.setPwd(EncryptUtil.getString(EncryptUtil.Sha256EncryptB(loginVO.getPwd().getBytes("UTF-8"))));
			
			LoginVO userLoginVO  = (LoginVO)cmmnService.selectContents(loginVO, PROGRAM_ID);
			
	    	if(userLoginVO == null || userLoginVO.getId() == null || "".equals(userLoginVO.getId())){
	    		model.addAttribute("message", "????????? ?????? ??????????????? ??????????????? ????????????.");
	    		/*????????? ???????????? ??????
	    		cmmnService.updateContents(loginVO, PROGRAM_ID+".failCntUpdateContent");*/
	    		status.setComplete();
	    		return  ".fLayout:"+ folderPath + "login";  
	    	}else{
	    		
	    		 	/** ?????? ?????? ?????? */
					HttpSession session = request.getSession();					
					session.setAttribute(SessionUtil.SESSION_MANAGE_KEY, userLoginVO);
					
					
					session.setAttribute("loginFtId", userLoginVO.getId());		 //????????? ?????????
					session.setAttribute("loginFtNm", userLoginVO.getName());	//????????? ??????
					session.setAttribute("loginFtSeq", userLoginVO.getSeq());	//????????? ????????????
					session.setAttribute("loginFtAuthCode", userLoginVO.getAuthCode()); //??????
					session.setAttribute("loginFtAuthCodeNm", userLoginVO.getAuthCodeNm()); //?????????
					session.setAttribute("loginFtSiteClcd", userLoginVO.getSiteClcd()); //???????????????
					
					
					MnVO auth = new MnVO();
    				auth.setLvl("2");
    				auth.setMenuCl("ft");
    				auth.setSchEtc03("LAYOUT");
    				auth.setAuthCode(userLoginVO.getAuthCode());
    				List<String> authList = (List<String>) cmmnService.selectList(auth, "Mn.menuAuthSelectList");;
    				auth.setLvl("3");
    				List<String> authList2 = (List<String>) cmmnService.selectList(auth, "Mn.menuAuthSelectList");
					
					
    				session.setAttribute(SessionUtil.SESSION_MANAGE_MENU_AUTH_KEY, authList);//????????????2???
    				session.setAttribute(SessionUtil.SESSION_MANAGE_MENU_AUTH_KEY2, authList2);//????????????3???
					
					session.setMaxInactiveInterval(Integer.parseInt(globalProperties.getProperty("Globals.sessionTime")));	
					
		    		status.setComplete();
			        if (loginVO.getReturnUrl() == null || loginVO.getReturnUrl().equals("")) {	
		        		return "redirect:/";
			        } else { 
						String returnUrl = URLDecoder.decode(loginVO.getReturnUrl(), "UTF-8");
						returnUrl = returnUrl.replaceAll("&amp;", "&");
						returnUrl = returnUrl.replaceAll("amp;", "");
						return "redirect:" + returnUrl;
			        } 
		    }    	
		}else{
    		status.setComplete();
			model.addAttribute("message", "?????????????????? ???????????? ???????????????.");
			model.addAttribute("cmmnScript", folderPath+"login.do");
			return "cmmn/execute";
		}
	}

	/**
	 * ????????? ???????????? ????????????.
	 * @param searchVO ????????????
	 * @param model
	 * @return "cm/execute"
	 * @throws Exception
	 */
	@RequestMapping(value = folderPath+"logout.do")
	public String adminLogout(@ModelAttribute("searchVO") LoginVO loginVO, HttpServletRequest request, ModelMap model) throws Exception {

		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:/";
		
	}	
	
	
	@RequestMapping(value = "/ft/cmmn/fail.do")
	public String fail(@ModelAttribute("searchVO") CmmnDefaultVO searchVO ,ModelMap model) throws Exception {
		
		model.addAttribute("message", "??????????????? ???????????????.");
		model.addAttribute("cmmnScript", "/");
		
		return "cmmn/execute";
	}	
	

}

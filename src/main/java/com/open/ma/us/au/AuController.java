package com.open.ma.us.au;

import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.ehcache.EhCacheCacheManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.cmmn.util.SessionUtil;
import com.open.cmmn.util.StringUtil;
import com.open.ma.sys.mn.service.MnVO;
import com.open.ma.us.au.service.AuVO;

import egovframework.rte.fdl.property.EgovPropertyService;

/** 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
 */
@Controller
public class AuController {

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
    private final static String PROGRAM_ID = "Au";

    /** folderPath **/
    private final static String folderPath = "/ma/us/au/";

	//@Resource(name = "beanValidator")
	//protected DefaultBeanValidator beanValidator;
	
    @Autowired
	private EhCacheCacheManager cacheManager;
    
	Logger log = Logger.getLogger(this.getClass());

	/**
	 * 관리자관리 목록화면
	 * @param searchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(folderPath +"list.do")
	public String list(@ModelAttribute("searchVO") AuVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		/* 게시판 목록 리스트 */
		@SuppressWarnings("unchecked")
		List<AuVO> resultList = (List<AuVO>) cmmnService.selectList(searchVO, PROGRAM_ID);
		model.addAttribute("resultList", resultList);
		

		return ".mLayout:"+ folderPath + "list";
	}



	/**
	 * 관리자관리 등록화면
	 * @param searchVO
	 * @param model
	 * @param procType
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath +"{procType}Form.do")
	public String form(@ModelAttribute("searchVO") AuVO searchVO, Model model,@PathVariable String procType, HttpServletRequest request) throws Exception {
		
		AuVO auVO = new AuVO();
		
		if(procType != null){
			if (procType.equals("update")) {
				auVO = (AuVO) cmmnService.selectContents(searchVO, PROGRAM_ID);
				if(!StringUtil.nullString(SessionUtil.getUserDetails().getAuthCode()).equals("1") && !StringUtil.nullString(auVO.getRgstId()).equals(StringUtil.nullString(SessionUtil.getUserDetails().getLoginSeq()))){
					model.addAttribute("message", "비정상적인 접근입니다.");
					model.addAttribute("cmmnScript", "list.do");
					return "cmmn/execute";
				}
			}
		}
			searchVO.setProcType(procType);
			auVO.setSearchVO(searchVO);
			model.addAttribute("auVO", auVO);
			
			/* 1차메뉴 목록 */
			MnVO menuVO = new MnVO();
			menuVO.setLvl("1");
			menuVO.setMenuCl("ma");
			menuVO.setAuthCode(auVO.getAuthCode());
			List<MnVO> menuList = (List<MnVO>) cmmnService.selectList(menuVO, "Mn.menuSelectList");
			menuVO.setMenuList(menuList);
			for (MnVO menuVO2 : menuVO.getMenuList()) {
				menuVO2.setLvl("2");
				menuVO2.setMenuCl("ma");
				menuVO2.setAuthCode(auVO.getAuthCode());
				List<MnVO> manu2List = (List<MnVO>) cmmnService.selectList(menuVO2, "Mn.menuSelectList");
				menuVO2.setMenuList(manu2List);
				
				for (MnVO menuVO3 : manu2List) {
					menuVO3.setLvl("3");
					menuVO3.setMenuCl("ma");
					menuVO3.setAuthCode(auVO.getAuthCode());
					List<MnVO> manu3List = (List<MnVO>) cmmnService.selectList(menuVO3, "Mn.menuSelectList");
					menuVO3.setMenuList(manu3List);
					menuVO2.setMenuvo(menuVO3);
				}
				
				
				menuVO.setMenuvo(menuVO2);
			}
			
			model.addAttribute("menu", menuVO.getMenuList());
		
		return ".mLayout:"+ folderPath + "form";
	}

	/**
	 * 관리자관리 처리
	 * @param searchVO
	 * @param bbsVO
	 * @param model
	 * @param status
	 * @param procType
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = folderPath +"{procType}Proc.do", method = RequestMethod.POST)
	public String proc(@ModelAttribute("searchVO") AuVO searchVO, Model model, SessionStatus status,@PathVariable String procType, HttpServletRequest request) throws Exception {
		if(procType != null){
			
			if (procType.equals("insert")) {
				cmmnService.insertContents(searchVO, PROGRAM_ID);
				
				/* 권한메뉴 등록 */
				if(searchVO.getArrMenu() != null){
					for (int i = 0; i < searchVO.getArrMenu().length; i++) {
						AuVO auVO = new AuVO();
						auVO.setAuthCode(searchVO.getAuthCode());
						auVO.setMenuSeq(searchVO.getArrMenu()[i]);
						cmmnService.insertContents(auVO, PROGRAM_ID+".authInsertContents");
					}
				}
				
			} else if (procType.equals("update") ) {
				
				
				cmmnService.updateContents(searchVO, PROGRAM_ID);
				
				/* 권한메뉴 삭제 */
				cmmnService.deleteContents(searchVO, PROGRAM_ID+".authDeleteContents");
				/* 권한메뉴 재등록 */
				if(searchVO.getArrMenu() != null){
					for (int i = 0; i < searchVO.getArrMenu().length; i++) {
						AuVO auVO = new AuVO();
						auVO.setAuthCode(searchVO.getAuthCode());
						auVO.setMenuSeq(searchVO.getArrMenu()[i]);
						cmmnService.insertContents(auVO, PROGRAM_ID+".authInsertContents");
					}
				}
				
				
			} else if (procType.equals("delete")) {
				
				cmmnService.deleteContents(searchVO, PROGRAM_ID);
				
				/* 권한메뉴 삭제 */
				cmmnService.deleteContents(searchVO, PROGRAM_ID+".authDeleteContents");
				
			}
			
			status.setComplete(); // 중복 Submit 방지 : 세션에 저장된 model 을 삭제한다.
			
			if(procType.equals("update")){
				model.addAttribute("message", "수정되었습니다.");
				model.addAttribute("cmmnScript","updateForm.do?seq="+searchVO.getSeq());
				return "cmmn/execute";
	    	}else if(procType.equals("insert")){
				model.addAttribute("message", "등록되었습니다.");
				model.addAttribute("cmmnScript", "list.do");
				return "cmmn/execute";
	    	}else if(procType.equals("delete")){
				model.addAttribute("message", "삭제되었습니다.");
				model.addAttribute("cmmnScript", "list.do");
				return "cmmn/execute";
	    	}else{
	    		return "redirect:list.do";
	    	}
			
		}

		return "redirect:list.do";
	}
	
	
	/**
	 * 아이디 중복체크
	 * @param searchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = folderPath + "codeOverlap.do")
	public ModelAndView menuCodeOverlap(@ModelAttribute("searchVO") AuVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		
		int overCnt = cmmnService.selectCount(searchVO, PROGRAM_ID+".overlapSelectCount") ;
		
		model.addAttribute("overCnt", overCnt);
		
		return new ModelAndView(ajaxView,model);
		
	}
	
	
	
	
		

}

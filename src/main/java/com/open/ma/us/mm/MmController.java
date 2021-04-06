package com.open.ma.us.mm;

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

import com.open.cmmn.model.FileVO;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.cmmn.util.EncryptUtil;
import com.open.cmmn.util.SessionUtil;
import com.open.cmmn.util.StringUtil;
import com.open.ma.us.au.service.AuVO;
import com.open.ma.us.mm.service.MmVO;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import net.sf.ehcache.Ehcache;
import net.sf.ehcache.Element;

/** 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
 */
@Controller
public class MmController {

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
	
	@Resource(name = "mgrIdGnrService")
	private EgovIdGnrService mgrIdGnrService;
	
	/**
	 * MappingJackson2JsonView.
	 */
	@Resource
	private MappingJackson2JsonView ajaxView;
	
    /** Program ID **/
    private final static String PROGRAM_ID = "Mm";

    /** folderPath **/
    private final static String folderPath = "/ma/us/mm/";

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
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath +"list.do")
	public String list(@ModelAttribute("searchVO") MmVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		AuVO authVO = new AuVO();
		List<AuVO> authList = (List<AuVO>) cmmnService.selectList(authVO, "Au.selectAuthList");
		model.addAttribute("authList", authList);
		
		return ".mLayout:"+ folderPath + "list";
	}
	
	/**
	 * 관리자관리 목록화면
	 * @param searchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(folderPath +"addList.do")
	public String addList(@ModelAttribute("searchVO") MmVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		/**Cache sample */
		Ehcache cache = cacheManager.getCacheManager().getCache("properties");
		Element pageUnit = cache.get("pageUnit");
		Element pageSize = cache.get("pageSize");		 	

		
		if (pageUnit != null && pageSize != null) {
			searchVO.setPageUnit(Integer.parseInt(pageUnit.getValue().toString()));
			searchVO.setPageSize(Integer.parseInt(pageSize.getValue().toString()));
		} else {
			/** EgovPropertyService.sample */
			searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
			searchVO.setPageSize(propertiesService.getInt("pageSize"));
			/** cache에 입력 */
			cache.put(new Element("pageUnit", propertiesService.getInt("pageUnit")));
			cache.put(new Element("pageSize", propertiesService.getInt("pageSize")));
		}


		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		int totCnt = cmmnService.selectCount(searchVO, PROGRAM_ID );
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		

		/* 게시판 목록 리스트 */
		@SuppressWarnings("unchecked")
		List<MmVO> resultList = (List<MmVO>) cmmnService.selectList(searchVO, PROGRAM_ID);
		model.addAttribute("resultList", resultList);
		

		return  folderPath + "addList";
	}

	/**
	 * 관리자관리 상세화면
	 * @param searchVO
	 * @param model
	 * @param procType
	 * @param request
	 * @return
	 * @throws Exception
	 
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath +"view.do")
	public String view(@ModelAttribute("searchVO") MmVO searchVO, Model model, HttpServletRequest request) throws Exception {
		
		MmVO mmVO = new MmVO();
		
		mmVO = (MmVO) cmmnService.selectContents(searchVO, PROGRAM_ID);
		model.addAttribute("mmVO", mmVO);
		
		return ".mLayout:"+ folderPath + "view";
	}*/

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
	public String form(@ModelAttribute("searchVO") MmVO searchVO, Model model,@PathVariable String procType, HttpServletRequest request) throws Exception {
		
		MmVO mmVO = new MmVO();
		
		if(procType != null){
			if (procType.equals("update")) {
				mmVO = (MmVO) cmmnService.selectContents(searchVO, PROGRAM_ID);
				if(!StringUtil.nullString(SessionUtil.getUserDetails().getAuthCode()).equals("1") && !StringUtil.nullString(mmVO.getSeq()).equals(StringUtil.nullString(SessionUtil.getUserDetails().getLoginSeq()))){
					model.addAttribute("message", "비정상적인 접근입니다.");
					model.addAttribute("cmmnScript", "list.do");
					return "cmmn/execute";
				}
			}
		}
			searchVO.setProcType(procType);
			mmVO.setSearchVO(searchVO);
			model.addAttribute("mmVO", mmVO);
			
			searchVO.setSchEtc01("2");
			
			AuVO authVO = new AuVO();
			if(SessionUtil.getUserDetails() != null ){
				authVO.setSchEtc01(StringUtil.nullString(SessionUtil.getUserDetails().getAuthCode()));
			}
			List<AuVO> authList = (List<AuVO>) cmmnService.selectList(authVO, "Au.selectAuthList");
			
			model.addAttribute("authList", authList);
			
		
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
	public String proc(@ModelAttribute("searchVO") MmVO searchVO, Model model, SessionStatus status,@PathVariable String procType, HttpServletRequest request) throws Exception {
		if(procType != null){
			
			if (procType.equals("insert")) {
				String mgrSeq = mgrIdGnrService.getNextStringId();
				searchVO.setSeq(mgrSeq);
				searchVO.setPwd(EncryptUtil.getString(EncryptUtil.Sha256EncryptB(searchVO.getPwd().getBytes("UTF-8"))));
				cmmnService.insertContents(searchVO, PROGRAM_ID);
				
				
			} else if (procType.equals("update") ) {
				
				if(StringUtil.nullString(searchVO.getPwdChk()).equals("CHK")){
					searchVO.setPwd(EncryptUtil.getString(EncryptUtil.Sha256EncryptB(searchVO.getPwd().getBytes("UTF-8"))));
				}
				
				cmmnService.updateContents(searchVO, PROGRAM_ID);
				
				
				
			} else if (procType.equals("delete")) {
				
				cmmnService.deleteContents(searchVO, PROGRAM_ID);
				/*VOC 담당자 삭제*/
				cmmnService.deleteContents(searchVO, PROGRAM_ID+".vocDeleteChgrContents");
				/*첨부파일 삭제*/
				FileVO fvo = new FileVO();
				if(!StringUtil.nullConvert(searchVO.getAtchFileId()).equals("")){
					fvo.setAtchFileId(searchVO.getAtchFileId());
					fileMngService.deleteFileDel(fvo);
				}
				
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
	@RequestMapping(value = folderPath + "userIdOverlap.do")
	public ModelAndView menuCodeOverlap(@ModelAttribute("searchVO") MmVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		
		int overCnt = cmmnService.selectCount(searchVO, PROGRAM_ID+".overlapSelectCount") ;
		
		model.addAttribute("overCnt", overCnt);
		
		return new ModelAndView(ajaxView,model);
		
	}
	
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath +"mypage.do")
	public String mypage(@ModelAttribute("searchVO") MmVO searchVO, Model model, HttpServletRequest request) throws Exception {
		
		MmVO mmVO = new MmVO();
		mmVO = (MmVO) cmmnService.selectContents(searchVO, PROGRAM_ID+".myPageSelectContents");
		mmVO.setSearchVO(searchVO);
		model.addAttribute("mmVO", mmVO);
			
		return ".mLayout:" + folderPath +"mypage";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath +"oldPwdChk.do")
	public ModelAndView oldPwdChk(@ModelAttribute("searchVO") MmVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		searchVO.setPwd(EncryptUtil.getString(EncryptUtil.Sha256EncryptB(searchVO.getPwd().getBytes("UTF-8"))));
		int overCnt = cmmnService.selectCount(searchVO, PROGRAM_ID + ".overlapSelectCount");
		Boolean overChk = false;
		if(overCnt < 1 ){
			overChk = false;
		}else{
			overChk = true;
		}
		model.addAttribute("overChk", overChk);
		return new ModelAndView(ajaxView,model);
	}

	
		

}

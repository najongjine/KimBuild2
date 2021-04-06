package com.open.ma.bm.cmmnBoard;

import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.ehcache.EhCacheCacheManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.open.cmmn.model.CmmnDefaultVO;
import com.open.cmmn.model.FileVO;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.cmmn.util.DateUtils;
import com.open.cmmn.util.SessionUtil;
import com.open.cmmn.util.StringUtil;
import com.open.ma.bm.cmmnBoard.service.CmmnBoardVO;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import net.sf.ehcache.Ehcache;
import net.sf.ehcache.Element;

/** 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
 */
@Controller
public class CmmnBoardController {

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
	
	@Resource(name = "fileIdGnrService")
	private EgovIdGnrService idgenService;
	
	/**
	 * MappingJackson2JsonView.
	 */
	@Resource
	private MappingJackson2JsonView ajaxView;
	
    /** Program ID **/
    private final static String PROGRAM_ID = "CmmnBoard";

    /** folderPath **/
    private final static String folderPath = "/ma/";

	//@Resource(name = "beanValidator")
	//protected DefaultBeanValidator beanValidator;
	
    @Autowired
	private EhCacheCacheManager cacheManager;
    
	Logger log = Logger.getLogger(this.getClass());

	/**
	 * 게시판 관리 화면을 조회한다.
	 * @param searchVO 검색조건
	 * @param model
	 * @return "content/contentList"
	 * @throws Exception
	 */
	@RequestMapping(folderPath+"{step1}/{step2}/{step3}/list.do")
	public String list( @ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model,HttpServletRequest request, @PathVariable String step1, @PathVariable String step2, @PathVariable String step3) throws Exception {
		
		/* 게시판 구분 */
		if(!StringUtil.nullString(step3).equals("")){
			searchVO.setSchEtc09("ma");
			searchVO.setBoardCd(step3);
		}
		if(step3.equals("bd01")){
			searchVO.setSchPageUnit(8);
		}else{
			searchVO.setSchPageUnit(10);
		}
		String boardDivn = (String) cmmnService.selectContents(searchVO, "Mn.boardDivnSelectContents");
		searchVO.setBoardDivn(boardDivn);
		
		String year = DateUtils.getCurrentDate("yyyy");
		model.addAttribute("year", year);
		
		return ".mLayout:" + folderPath + "bm/cmmnBoard/list";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath+"{step1}/{step2}/{step3}/addList.do")
	public String addList( @ModelAttribute("searchVO") CmmnDefaultVO searchVO,  ModelMap model,HttpServletRequest request, @PathVariable String step1, @PathVariable String step2, @PathVariable String step3) throws Exception {
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
		paginationInfo.setRecordCountPerPage(searchVO.getSchPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		
		
		List<CmmnBoardVO> boardList = (List<CmmnBoardVO>) cmmnService.selectList(searchVO, PROGRAM_ID);	
		model.addAttribute("resultList", boardList);

		int totCnt = cmmnService.selectCount(searchVO, PROGRAM_ID);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return folderPath + "bm/cmmnBoard/addList";
	}
	
	
	/**
	 * 글조회 화면으로 이동한다.
	 * @param searchVO 검색조건
	 * @param model
	 * @return "brd/egovBoardRegister"
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath+"{step1}/{step2}/{step3}/view.do")
	public String view(@ModelAttribute("searchVO") CmmnBoardVO searchVO, Model model, @PathVariable String step1, @PathVariable String step2, @PathVariable String step3) throws Exception {
		
		/* 조회수 증가 */
		cmmnService.updateContents(searchVO, PROGRAM_ID + ".viewNumUpdateContents");
		
		
		CmmnBoardVO cmmnBoardVO = new CmmnBoardVO();
		cmmnBoardVO = (CmmnBoardVO)cmmnService.selectContents(searchVO, PROGRAM_ID);
		model.addAttribute("cmmnBoardVO", cmmnBoardVO);
		
		
		return ".mLayout:" + folderPath + "bm/cmmnBoard/view";
	}

	
	/**
	 * 글등록 화면으로 이동한다.
	 * @param searchVO 검색조건
	 * @param model
	 * @return "brd/egovBoardRegister"
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath+"{step1}/{step2}/{step3}/{procType}Form.do")
	public String form(@ModelAttribute("searchVO") CmmnBoardVO searchVO, Model model, @PathVariable String procType, @PathVariable String step1, @PathVariable String step2, @PathVariable String step3, HttpServletRequest request) throws Exception {
		CmmnBoardVO cmmnBoardVO = new CmmnBoardVO();
		if(procType.equals("update")){
			cmmnBoardVO = (CmmnBoardVO)cmmnService.selectContents(searchVO, PROGRAM_ID);
			if(!StringUtil.nullString(SessionUtil.getUserDetails().getAuthCode()).equals("1") && !StringUtil.nullString(cmmnBoardVO.getRgstId()).equals(StringUtil.nullString(SessionUtil.getUserDetails().getLoginSeq()))){
				model.addAttribute("message", "비정상적인 접근입니다.");
				model.addAttribute("cmmnScript", "list.do");
				return "cmmn/execute";
			}
		}
		
		cmmnBoardVO.setSearchVO(searchVO);	//검색 조건 저장
		cmmnBoardVO.setProcType(procType); // 처리구분 저장
		cmmnBoardVO.setBoardDivn(searchVO.getBoardDivn());//게시판 구분 저장
		cmmnBoardVO.setBoardCd(searchVO.getBoardCd());//게시판 코드
		model.addAttribute("cmmnBoardVO", cmmnBoardVO);
		
		String year = DateUtils.getCurrentDate("yyyy");
		model.addAttribute("year", year);
		
		return ".mLayout:" + folderPath + "bm/cmmnBoard/form";
	}
	

	
	/**
	 * 글처리 화면으로 이동한다.
	 * @param searchVO 검색조건
	 * @param model
	 * @return "brd/egovBoardRegister"
	 * @throws Exception
	 */
	@RequestMapping(value = folderPath+"{step1}/{step2}/{step3}/{procType}Proc.do", method = RequestMethod.POST, headers = "Content-type=application/x-www-form-urlencoded")
	public String proc(
			@ModelAttribute("searchVO") CmmnDefaultVO searchVO, @Valid CmmnBoardVO cmmnBoardVO, BindingResult bindingResult
			, Model model
			, SessionStatus status
			, @PathVariable String procType
			, @PathVariable String step1
			, @PathVariable String step2
			, @PathVariable String step3
    		, HttpServletRequest request
			) throws Exception {
		
		if (bindingResult.hasErrors()) {
			searchVO.setProcType(procType);
			return ".mLayout:" + folderPath + "bm/cmmnBoard/form";
		}
		
    	if(procType.equals("insert")){
    		int maxSeq = cmmnService.selectCount(cmmnBoardVO, PROGRAM_ID+".selectMaxSeqContents");
    		cmmnBoardVO.setBoardSeq(Integer.toString(maxSeq));
    		cmmnService.insertContents(cmmnBoardVO, PROGRAM_ID);
    	}else if(procType.equals("update")){
    		cmmnService.updateContents(cmmnBoardVO, PROGRAM_ID);
		}else if(procType.equals("delete")){
			cmmnService.deleteContents(cmmnBoardVO, PROGRAM_ID);
			
			/*첨부파일 삭제*/
			FileVO fvo = new FileVO();
			if(!StringUtil.nullConvert(cmmnBoardVO.getAtchFileId()).equals("")){
				fvo.setAtchFileId(cmmnBoardVO.getAtchFileId());
				fileMngService.deleteFileDel(fvo);
			}
			if(!StringUtil.nullConvert(cmmnBoardVO.getImageFileId()).equals("")){
				fvo.setAtchFileId(cmmnBoardVO.getImageFileId());
				fileMngService.deleteFileDel(fvo);
			}
		}

    	status.setComplete();	  	// 중복 Submit 방지 : 세션에 저장된 model 을 삭제한다.

    	if(procType.equals("insert")){
			model.addAttribute("message", "등록되었습니다.");
			model.addAttribute("cmmnScript", "list.do");
			return "cmmn/execute";
    	}else if(procType.equals("update")){
			model.addAttribute("pName", "boardSeq");	
			model.addAttribute("pValue", cmmnBoardVO.getBoardSeq());
			model.addAttribute("message", "수정되었습니다.");
			model.addAttribute("cmmnScript", "view.do");
			return "cmmn/execute";
    	}else if(procType.equals("delete")){
			model.addAttribute("message", "삭제되었습니다.");
			model.addAttribute("cmmnScript", "list.do");
			return "cmmn/execute";
    	}else{
    		return "redirect:list.do";
    	}
	}
}

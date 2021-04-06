package com.open.ft.ftcustomer.ftnotice;

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
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.open.cmmn.model.CmmnDefaultVO;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.cmmn.util.SessionUtil;
import com.open.cmmn.util.StringUtil;
import com.open.vo.NoticeVO;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import net.sf.ehcache.Ehcache;
import net.sf.ehcache.Element;

/** 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
 */
@Controller
public class FtNoticeController {

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
    private final static String PROGRAM_ID = "Notice";

    /** folderPath **/
    private final static String folderPath = "/ft/ftcustomer/ftnotice/";

	//@Resource(name = "beanValidator")
	//protected DefaultBeanValidator beanValidator;
	
    @Autowired
	private EhCacheCacheManager cacheManager;
    
	Logger log = Logger.getLogger(this.getClass());

	/**
	 * 메뉴권한 목록화면
	 * @param searchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(folderPath + "list.do")
	public String list(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {

		return ".fLayout:"+ folderPath + "list";
	}
	
	/**
	 * 메뉴권한 목록화면
	 * @param searchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("deprecation")
	@RequestMapping(folderPath + "addList.do")
	public String addList(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		

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
		

		@SuppressWarnings("unchecked")
		List<NoticeVO> resultList = (List<NoticeVO>) cmmnService.selectList(searchVO, PROGRAM_ID );
		model.addAttribute("resultList", resultList);
		

		
		return folderPath + "addList";
	}



	/**
	 * 메뉴권한 상세화면
	 * @param searchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath +"view.do")
	public String view(@ModelAttribute("searchVO") NoticeVO searchVO, Model model, HttpServletRequest request) throws Exception {
		
		/* 게시판 상세정보 */
		NoticeVO boardVO = new NoticeVO();
		boardVO = (NoticeVO) cmmnService.selectContents(searchVO, PROGRAM_ID );
		model.addAttribute("boardVO", boardVO);
		
		return ".fLayout:"+ folderPath + "view";
	}

}

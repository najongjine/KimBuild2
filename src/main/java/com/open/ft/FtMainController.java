package com.open.ft;

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
import com.open.vo.BImgVO;
import com.open.vo.ImgVO;
import com.open.vo.NoticeVO;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import net.sf.ehcache.Ehcache;
import net.sf.ehcache.Element;

/** 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
 */
@Controller
public class FtMainController {

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
    private final static String folderPath = "/ft/";

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
	@RequestMapping(folderPath + "main.do")
	public String list(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		searchVO.setFirstIndex(0);
		searchVO.setRecordCountPerPage(4);
		List<NoticeVO> noticeList=(List<NoticeVO>) cmmnService.selectList(searchVO, "Notice.selectList");
		searchVO.setRecordCountPerPage(3);
		List<BImgVO> imgList1=(List<BImgVO>) cmmnService.selectList(searchVO, "BExam.selectList");
		List<BImgVO> imgList2=(List<BImgVO>) cmmnService.selectList(searchVO, "BReco.selectList");
		List<BImgVO> imgList3=(List<BImgVO>) cmmnService.selectList(searchVO, "BField.selectList");
		List<BImgVO> imgList4=(List<BImgVO>) cmmnService.selectList(searchVO, "InteExam.selectList");
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("imgList1", imgList1);
		model.addAttribute("imgList2", imgList2);
		model.addAttribute("imgList3", imgList3);
		model.addAttribute("imgList4", imgList4);
		return folderPath + "main";
	}
	
		

}

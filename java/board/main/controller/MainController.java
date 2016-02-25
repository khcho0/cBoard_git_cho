package board.main.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import board.main.service.MainService;
import board.main.vo.MainVO;

@Controller
public class MainController {
	
Logger log = Logger.getLogger(this.getClass());
	
	private int pageSize = 5;
	private int pageCount;
	private int total;
	private int result2;
	private int nowPage;
	private int nowBlock;
	private int boardCount;

	@Resource(name="mainService")
	private MainService mainService;
	
	@RequestMapping("/mainList.do")
	public ModelAndView mainList(MainVO vo)throws Exception{
		ModelAndView mav = new ModelAndView();
		List<?> result = null;
		
		if(vo.getPageNum() == null){							/* pageNum 설정 (0이면 1) */
			vo.setPageNum("1");
		}
		if(vo.getPageBlock() == null){						/* pageBlock 설정 (0이면 5) */
			vo.setPageBlock("5");
		}

		nowPage = Integer.parseInt(vo.getPageNum());			/* 현재페이지 값 저장변수 */
		nowBlock = Integer.parseInt(vo.getPageBlock());		/* 현재페이지 블록 값 저장변수 */
			
		vo.setStartPage(((nowPage - 1) * nowBlock) + 1);		/* 해당페이지에서 가져올 행의 시작번호 */
		vo.setEndPage(nowPage * nowBlock);					/* 해당페이지에서 가져올 행의 끝번호 */
		
		result = mainService.bdMainList(vo);	/* 게시글 불러오기(start ~ end) */
		boardCount = result.size();
		if(boardCount > 0){
			
			/* pageCount를 계산할 게시판 전체 글 수 */
			total = mainService.bdCount(vo);
			
			/* 화면에 출력할 start와 end를 구할 게시판 페이지 수 */
			pageCount = total / nowBlock;
			if(total % nowBlock != 0){
				pageCount = pageCount + 1;
			}
			
			/* 화면에 표시될 시작페이지 구하기 */
			result2 = nowPage / pageSize;
			if(nowPage % pageSize != 0){
				result2 = result2 + 1;
			}
			vo.setStartPage(((result2 - 1) * pageSize) + 1);

			/* 화면에 표시될 마지막페이지 구하기 */
			result2 = vo.getStartPage() + pageSize - 1;
			if(result2 > pageCount){
				vo.setEndPage(pageCount);
			}else if(result2 <= pageCount){
				vo.setEndPage(result2);
			}
		}
		
		mav.addObject("startPage", vo.getStartPage());
		mav.addObject("endPage", vo.getEndPage());
		mav.addObject("nowPage", nowPage);
		mav.addObject("pageBlock", nowBlock);
		mav.addObject("pageSize", pageSize);
		mav.addObject("pageCount", pageCount);
		mav.addObject("boardCount", boardCount);
		mav.addObject("result", result);
		mav.setViewName("/mainList");
		
		return mav;
	}
	
	@RequestMapping("/writeForm.do")
	public ModelAndView writeForm(MainVO vo)throws Exception{
		ModelAndView mav = new ModelAndView();
		List<?> result = null;
		result = mainService.bdMainList(vo);
		mav.addObject("result", result);
		mav.setViewName("/writeForm");
		
		return mav;
	}
	
	@RequestMapping("/writePro.do")
	public ModelAndView writePro(HttpSession session, MainVO vo)throws Exception{
		ModelAndView mav = new ModelAndView();
		List<?> result = null;
		result = mainService.bdWrite(vo);
		mav.addObject("result", result);
		mav.setViewName("redirect:mainList.do");
		return mav;
		
	}
	
	@RequestMapping("/content.do")
	public ModelAndView content(MainVO vo)throws Exception{
		ModelAndView mav = new ModelAndView();
		List<?> result = null;
		result = mainService.bdContent(vo);
		mav.addObject("result", result);
		mav.setViewName("/content");
		
		return mav;
	}
	
	@RequestMapping("/modifyForm.do")
	public ModelAndView modifyForm(MainVO vo)throws Exception{
		ModelAndView mav = new ModelAndView();
		List<?> result = null;
		result = mainService.bdContent(vo);
		mav.addObject("result", result);
		mav.setViewName("/modifyForm");
		
		return mav;
	}
	
	@RequestMapping("/modifyPro.do")
	public ModelAndView modifyPro(MainVO vo)throws Exception{
		ModelAndView mav = new ModelAndView();
		mainService.bdModify(vo);
		mav.setViewName("redirect:mainList.do");
		
		return mav;
	}
	
	@RequestMapping("/deletePro.do")
	public ModelAndView deletePro(MainVO vo)throws Exception{
		ModelAndView mav = new ModelAndView();
		mainService.bdDelete(vo);
		mav.setViewName("redirect:mainList.do");
		
		return mav;
	}
}
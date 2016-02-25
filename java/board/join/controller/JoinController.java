package board.join.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import board.join.service.JoinService;
import board.join.vo.JoinVO;

@Controller
public class JoinController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="joinService")
	private JoinService joinService;
	
	@RequestMapping("/joinForm.do")
	public ModelAndView joinForm(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/joinForm");
		return mav;
	}
	
	@RequestMapping("joinPro.do")
	public ModelAndView joinPro(JoinVO vo)throws Exception{
		ModelAndView mav = new ModelAndView();
		String result = null;
		result = joinService.bdJoin(vo,"0");
		
		mav.addObject("result", result);
		mav.setViewName("redirect:/loginForm.do");
		return mav;
	}
	
	@RequestMapping("idCheckForm.do")
	public ModelAndView idCheckForm(JoinVO vo)throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/idCheckForm");
		return mav;
	}
	
	@RequestMapping("idCheckPro.do")
	public ModelAndView idCheckPro(JoinVO vo)throws Exception{
		ModelAndView mav = new ModelAndView();
		String result = null;
		result = joinService.bdJoin(vo,"1");

		mav.addObject("result", result);
		mav.setViewName("/idCheckPro");
		return mav;
	}
}
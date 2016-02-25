package board.login.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import board.login.service.LoginService;
import board.login.vo.LoginVO;

@Controller
public class LoginController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="loginService")
	private LoginService loginService;
	
	@RequestMapping("/loginForm.do")
	public ModelAndView loginForm(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/loginForm");
		return mav;
	}
	
	@RequestMapping("/loginPro.do")
	public ModelAndView loginPro(HttpSession session, LoginVO vo)throws Exception{
		ModelAndView mav = new ModelAndView();
		String result = null;
		result = loginService.bdLogin(vo);
		
		if(result == "0"){
			session.setAttribute("id", vo.getId());
		}
		mav.addObject("result", result);
		mav.setViewName("/loginPro");
		return mav;
	}
	
	@RequestMapping("/logOutPro.do")
	public String logOutPro(HttpSession session)throws Exception{
		session.invalidate();
		return "redirect:loginForm.do";
	}
}
	
	


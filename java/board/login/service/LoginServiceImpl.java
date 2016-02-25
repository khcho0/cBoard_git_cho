package board.login.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import board.login.dao.LoginDAO;
import board.login.vo.LoginVO;

@Service("loginService")
public class LoginServiceImpl implements LoginService {
	
	@Resource(name = "loginDAO")
	private LoginDAO loginDAO;
	
	public String bdLogin(LoginVO vo) {
		String result = null;
		try {
			result = loginDAO.confirmId(vo);
			
			if(!(result == null || result.equals(""))){
				result = loginDAO.confirmPw(vo);
				if(result.equals(vo.getPw())){
					result = "0";
				}else{
					result = "1";
				}
			}else{
				result = "2"; 
			}
		}catch(Exception e){
			e.printStackTrace();
		}  
		return result;
	}
	
}


/*String result = null;
try {
	result = loginDAO.confirmId(vo);
	
	if(!(result == null || result.equals(""))){
		result = loginDAO.confirmPw(vo);
		if(result == vo.getPw()){
			session.setAttribute("id", vo.getId());
		}else{
			result = "패스워드가 일치하지 않습니다";
		}
	}else{
		result = "ID가 존재하지 않습니다.";
	}
}catch(Exception e){
	e.printStackTrace();
}  */
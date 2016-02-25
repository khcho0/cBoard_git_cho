package board.login.dao;

import org.springframework.stereotype.Repository;

import board.login.vo.LoginVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("loginDAO")
public class LoginDAO extends EgovAbstractDAO{
	
	public String confirmId(LoginVO vo) throws Exception{
		return (String)select("login.idCheck", vo);
	}
	
	public String confirmPw(LoginVO vo) throws Exception{
		return (String)select("login.pwCheck", vo); 
	}
}

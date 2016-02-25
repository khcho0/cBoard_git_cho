package board.join.dao;

import org.springframework.stereotype.Repository;

import board.join.vo.JoinVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("joinDAO")
public class JoinDAO extends EgovAbstractDAO{
	
	public String insertMember(JoinVO vo) throws Exception{
		return (String)insert("join.insertMember", vo);
		
	}
		
	public String idCheck(JoinVO vo) throws Exception{
		return (String)select("join.idCheck", vo);
	}
}


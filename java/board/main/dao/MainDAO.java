package board.main.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import board.join.vo.JoinVO;
import board.main.vo.MainVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("mainDAO")
public class MainDAO extends EgovAbstractDAO{
	
	public List<?> getBoardList(MainVO vo) throws Exception{
		return list("main.getBoardList", vo);
	}
	
	public List<?> getBoardContent(MainVO vo) throws Exception{
		return list("main.getBoardContent", vo);
	}
	
	public List<?> writeBoard(MainVO vo) throws Exception{
		return (List<?>)insert("main.writeBoard", vo);
	}
	
	public void modifyBoard(MainVO vo) throws Exception{
		update("main.modifyBoard", vo);
	}
	
	public void deleteBoard(MainVO vo) throws Exception{
		delete("main.deleteBoard", vo);
	}
	
	public int countBoard(MainVO vo) throws Exception{
		return (int)select("main.countBoard", vo);
	}
	
/*	public List<?> searchList(MainVO vo) throws Exception{
		return list("main.searchList", vo);
	}*/
}

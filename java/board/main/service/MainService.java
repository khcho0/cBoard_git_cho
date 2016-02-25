package board.main.service;

import java.util.List;

import board.main.vo.MainVO;

public interface MainService{
	
	public List<?> bdMainList(MainVO vo) throws Exception;
	
	public List<?> bdContent(MainVO vo) throws Exception;

	public List<?> bdWrite(MainVO vo) throws Exception;
	
	public void bdModify(MainVO vo) throws Exception;
	
	public void bdDelete(MainVO vo)throws Exception;
	
	public int bdCount(MainVO vo)throws Exception;
	
	/*public List<?> bdSearch(MainVO vo)throws Exception;*/

}
	

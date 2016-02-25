package board.main.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import board.main.dao.MainDAO;
import board.main.vo.MainVO;

@Service("mainService")
public class MainServiceImpl implements MainService{
	
	@Resource(name= "mainDAO")
	private MainDAO mainDAO;
	
	public List<?> bdMainList(MainVO vo){
		List<?> result = null;
		try{
			result = mainDAO.getBoardList(vo);
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	public List<?> bdContent(MainVO vo){
		List<?> result = null;
		try{
			result = mainDAO.getBoardContent(vo);
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	public List<?> bdWrite(MainVO vo){
		List<?> result = null;
		try{
			result = mainDAO.writeBoard(vo);
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	public void bdModify(MainVO vo){
		
		try{
			mainDAO.modifyBoard(vo);
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	public void bdDelete(MainVO vo){
		try{
			mainDAO.deleteBoard(vo);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public int bdCount(MainVO vo){
		int resu = 0;
		try{
			resu = mainDAO.countBoard(vo);
		}catch(Exception e){
			e.printStackTrace();
		}
		return resu;
	}
}

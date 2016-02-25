package board.join.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import board.join.dao.JoinDAO;
import board.join.vo.JoinVO;

@Service("joinService")
public class JoinServiceImpl implements JoinService{
	
	@Resource(name = "joinDAO")
	private JoinDAO joinDAO;
	
	public String bdJoin(JoinVO vo, String flag){
		String result = null;
		try{
			if(flag.equals("0")){
				result = joinDAO.insertMember(vo);
			}else if(flag.equals("1")){
				result = joinDAO.idCheck(vo);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
}
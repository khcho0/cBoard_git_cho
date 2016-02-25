package board.join.service;

import board.join.vo.JoinVO;

public interface JoinService {
	
	public String bdJoin(JoinVO vo, String flag) throws Exception;
	
}

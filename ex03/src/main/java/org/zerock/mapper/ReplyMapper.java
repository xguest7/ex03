package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ReplyVO;

public interface ReplyMapper {
	//1.쓰고
	int insert(ReplyVO vo);
	//2.목록 읽고
	List<ReplyVO> getList(Long bno);
	//3.수정하고
	int update(ReplyVO vo);
	//4.지우고
	int delete(Long rno);
	
	ReplyVO get(Long rno);
}

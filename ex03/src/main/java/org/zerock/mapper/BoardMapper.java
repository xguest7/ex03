package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.HourVO;
import org.zerock.domain.RankVO;

public interface BoardMapper {
	
	//@Select("select * from tbl_board")
	//게시글 목록보기
	List<BoardVO> getList();
	
	//페이지 처리 - 현재는 무조건 2페이지 출력(한페이지당10개)
	List<BoardVO> getListWithPaging(Criteria cri);
	
	//게시글 상세보기
	BoardVO read(Long bno);
	
	//insert,update,delete 시에는 리터타입을 int 하면 처리된 행을 개수가 리턴된다.
	
	//게시글 작성
	void insert(BoardVO vo); 
	
	//게시글 작성(작성된 글번호 확인)
	void insertSelectKey(BoardVO vo);
		
	//게시글 수정
	int	update(BoardVO vo);
	
	//게시글 삭제
	int	delete(Long bno);
	
	//보너스 (작성글 랭킹 5등까지만 작성자,작성글 개수)
	List<RankVO> rank();
	
	//보너스 (수정일 기준으로 최근 갱신된 글 5개)
	List<BoardVO> lastBoard();
	
	//보너스 (시간대별 글개수 통계 작성일 기준) 00  5  / 01  1 / ... / 23   11
	List<HourVO> hourBoard();
	
	//전체 글개수(검색에도 대응) 가져오기;
	Long count(Criteria cri);
	
	//좋아요 
	void good(Long bno);
	
	
	//게시글 페이지 처리 (뒤에)
	
	//게시글 검색 (뒤에)
	
}

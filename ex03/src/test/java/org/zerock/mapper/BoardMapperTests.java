package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
	
	@Autowired
	private BoardMapper boardMapper;
	
	@Test 
	public void TestGetList() {
		boardMapper.getList().forEach(x->log.info(x));
	}
	
	@Test 
	public void TestGetListWithPaging() {
		Criteria cri = new Criteria();
		cri.setType("C");
		cri.setKeyword("알리");
		boardMapper.getListWithPaging(cri).forEach(x->log.info("결과확인:"+x));
	}
	
	@Test
	public void TestRead() {
		log.info("2번글 읽기:"+boardMapper.read(2L));
	}
	
	@Test
	public void TestInsert() {
		BoardVO vo = new BoardVO();
		vo.setTitle("mapper테스트");
		vo.setContent("잘되겠지");
		vo.setWriter("테스터");
		boardMapper.insert(vo);
		log.info("등록된 글번호:"+vo.getBno());
	}
	
	@Test
	public void testUpdate() {
		BoardVO vo = new BoardVO();
		vo.setBno(1L);
		vo.setTitle("수정이다");
		vo.setContent("수정작성자");
		log.info("수정결과:"+boardMapper.update(vo));
	}
	
	@Test
	public void testDelete() {
		log.info("삭제:"+boardMapper.delete(1L));
	}
	
	@Test
	public void TestInsertSelectKey() {
		BoardVO vo = new BoardVO();
		vo.setTitle("mapper테스트");
		vo.setContent("잘되겠지");
		vo.setWriter("테스터");
		boardMapper.insertSelectKey(vo);
		log.info("입력된 글번호는:"+vo.getBno());
	}
	
	@Test //더미 데이터 넣기
	public void insertData() {
		BoardVO vo = new BoardVO();
	
		for(int i=0; i<5; i++) {
			vo.setTitle("mapper테스트"+i);
			vo.setContent("잘되겠지"+i);
			vo.setWriter("테스터"+i);
			boardMapper.insert(vo);
		}
	}
	
	@Test
	public void TestRank() {
		boardMapper.rank().forEach(x->log.info(x));
	}
	
	@Test
	public void TestCount() {
		Criteria cri = new Criteria();
		log.info("전체글 개수:"+boardMapper.count(cri));
		cri.setType("C");
		cri.setKeyword("알리");
		log.info("검색글 개수:"+boardMapper.count(cri));
	}
	
	@Test
	public void testLastBoard() {
		log.info("최신글5개:"+boardMapper.lastBoard());
	}
	@Test
	public void testHouorBoard() {
		log.info("시간대별 통계:"+boardMapper.hourBoard());
	}
	
	@Test
	public void testGood() {
		boardMapper.good(2687010L);
	}
	
	@Test
	public void testBestBoard() {
		log.info("결과:"+ boardMapper.bestBoard());
	}
}






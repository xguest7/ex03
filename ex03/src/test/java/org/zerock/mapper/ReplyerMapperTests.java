package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.ReplyVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyerMapperTests {
		@Autowired
		private ReplyMapper mapper;
		
		@Test
		public void testInsert() {
			ReplyVO vo = new ReplyVO();
			vo.setBno(2687007L);
			vo.setReply("아 졸립다");
			vo.setReplyer("밤샌이");
			mapper.insert(vo);
		}
		
		@Test
		public void testUpdate() {
			ReplyVO vo = new ReplyVO();
			vo.setRno(6L);
			vo.setReply("아 졸립다.잔다로 수정");
			log.info("아데이터값:"+vo);
			mapper.update(vo);
			 
		}
		
		@Test 
		public void testDelete() {
			mapper.delete(4L);
		}
		
		@Test
		public void testgetList() {
			mapper.getList(2687007L).forEach(x->log.info(x));
		}
		
}






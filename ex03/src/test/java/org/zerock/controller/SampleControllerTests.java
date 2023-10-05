package org.zerock.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.zerock.domain.ReplyVO;
import org.zerock.domain.SampleVO;

import com.google.gson.Gson;

import lombok.extern.log4j.Log4j;

@WebAppConfiguration //컨트롤러 테스트위해
@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" }) //컨트롤러 테스트위해
@Log4j
public class SampleControllerTests {
	@Autowired
	private WebApplicationContext ctx; //mockMvc 객체를 만들때 필요.

	private MockMvc mockMvc;  //이 객체를 이용해서 컨트롤러는 테스트를 해야함
		                      //객체를 직접 인스턴해서 사용해야함.
	
	@Before //junit으로 테스트할때 먼저 수행하는 메소드
	public void setup() {
		mockMvc=MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testTicket() throws Exception {
		//넣어주기 위한  json data
		
		SampleVO vo = new SampleVO(2,"abc","def");
		Gson gson=new Gson();
		String jsonData=gson.toJson(vo);
		log.info("json 형태로 변환"+  jsonData);
		
		
		
	
		mockMvc.perform(post("/sample/ticket")
				.contentType(MediaType.APPLICATION_JSON)
				.content(jsonData)).andExpect(status().is(200));
	}
	//crud  =read,create,update,delete
	//method =get,post,put,delete
	
	//json 만들기
	@Test
	public void makeJson() {
		ReplyVO vo = new ReplyVO();
		vo.setBno(2687007L);
		vo.setReply("리플내용");
		vo.setReplyer("작성자");
		log.info("json문자열:"+ new Gson().toJson(vo));
		//{"bno":2687007,"reply":"리플내용","replyer":"작성자"}
	}
}






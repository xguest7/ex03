package org.zerock.controller;

import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.BestBoard;
import org.zerock.domain.BnoVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.Total;
import org.zerock.service.BoardService;
import org.zerock.service.ReplyService;

import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
public class MyAPIController {
	
	ReplyService service;
	BoardService boardService;
	
	@GetMapping("/myapi/replybnocount")
	public String myapi() {
		return service.bnoCount()+"";
	}
	
	@PutMapping(value="/myapi/bestbno",produces= MediaType.APPLICATION_JSON_VALUE)
	public BnoVO bestbno() {
		BnoVO bnoVO=new BnoVO();
		bnoVO.setBno(service.bnoCount());
		return bnoVO;
		
	}
	
	@GetMapping("/myapi/{num1}/{num2}")
	public Total myapiNum1Num2(@PathVariable("num1") int num1,
			@PathVariable("num2") int num2) {
			int sum=0;
			for(int i=num1; i<=num2;i++) {
				sum+=i;
			}
			Total a = new Total();
			a.setCount((long)sum);
			return a;
		
	}
	
	@GetMapping(value="/myapi/board/{page}/{amount}",
			produces= MediaType.APPLICATION_JSON_VALUE)
	public List<BoardVO> getList(@PathVariable("page") int page,
			@PathVariable("amount") int amount){
		Criteria cri =new Criteria();
		cri.setAmount(amount);
		cri.setPageNum(page);
		return boardService.getList(cri);
	}
	
	@PostMapping(value="/myapi/board/{page}/{amount}",
			produces= MediaType.APPLICATION_JSON_VALUE)
	public List<BoardVO> getList(@PathVariable("page") int page,
			@PathVariable("amount") int amount,@RequestBody Criteria cri){
	
		cri.setAmount(amount);
		cri.setPageNum(page);
		return boardService.getList(cri);
	}
	
	@GetMapping("/myapi/bestboard")
	public List<BestBoard> bestboard(){
		return boardService.bestBoard();
	}
	
	
	
}

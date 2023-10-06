console.log("댓글처리하는 자바스크립트 작동");
var replyService = (function(){ 
	
	//댓글등록
	function add(reply,callback,error){
		console.log("댓글 등록.......");
		$.ajax({ 
			type: "post",
			url: "/replies/new",
			data: JSON.stringify(reply),     //json 형태로 리플데이터
			contentType:"application/json;charset=UTF-8",
			success:function(result,status,xhr){
				console.log("댓글등록 정상처리");
				if(callback)
					callback(result);
			},
			error:function(xhr,status,er){
				console.log("댓글등록 처리 실패");
				if(error)
					error(er);
			}
		 })
	}
	
	//댓글목록
	function getList(bno,callback,error){
	console.log("댓글 목록보기......");
/*		$.ajax({ 
			type: "get",
			url: "/replies/pages/"+bno+".json",
			success:function(result,status,xhr){
				console.log("댓글목록 가져오기 정상처리");
				if(callback)
					callback(result);
			},
			error:function(xhr,status,er){
				if(error)
					error(er);
			}
		 }) */
	//$.getJSON(요청주소,성공시처리할함수).fail(실패시처리할함수);	 
	$.getJSON("/replies/pages/"+bno+".json", function(result){
				console.log("댓글목록 가져오기 정상처리");
				if(callback)
					callback(result);
			}).fail(function(xhr,status,er){
				console.log("댓글목록 가져오기 오류발생");
				if(error)
					error(er);
			} ); //fail
		 
	}; //getList
	
	//댓글삭제
	function del(rno,callback,error){
		console.log("댓글 삭제.......");
		$.ajax({ 
			type: "delete",
			url: "/replies/"+rno,
			success:function(result,status,xhr){
				console.log("댓글삭제 성공");
				if(callback)
					callback(result);
			},
			error:function(xhr,status,er){
				console.log("댓글삭제 오류발생");
				if(error)
					error(er);
			}
		 })
	}


	//댓글수정
	function modify(rno,reply,callback,error){
		console.log("댓글 수정.......");
		$.ajax({ 
			type: "put",
			url: "/replies/"+rno,
			data: JSON.stringify(reply),     //json 형태로 리플데이터
			contentType:"application/json;charset=UTF-8",
			success:function(result,status,xhr){
				console.log("댓글수정 정상처리");
				if(callback)
					callback(result);
			},
			error:function(xhr,status,er){
				console.log("댓글수정 오류발생");
				if(error)
					error(er);
			}
		 })
	}
	//댓글1개가져오기
	function get(rno,callback,error){
		console.log("댓글 1개 가져오기......?.");
		$.ajax({ 
			type: "get",
			url: "/replies/"+rno+".json",
			success:function(result,status,xhr){
				console.log("댓글1개 가져오기 정상처리");
				if(callback)
					callback(result);
			},
			error:function(xhr,status,er){
				console.log("댓글1개 가져오기 오류발생");
				if(error)
					error(er);
			}
		 })
	}	
	//시간포맷 처리 함수
	function displayTime(timeValue){
		var dateObj=new Date(timeValue);
		var year=dateObj.getFullYear();
		var month=dateObj.getMonth()+1;  
		var date=dateObj.getDate();
		var day=dateObj.getDay();
		var hh=dateObj.getHours();
		var mi=dateObj.getMinutes();
		var ss=dateObj.getSeconds();
		var ms=dateObj.getMilliseconds();
		
		return hh+":"+ss;
	}



	//  이름 : 값(add함수)
	return {add:add, getList:getList,del:del,modify:modify, get:get, time:displayTime};
})();





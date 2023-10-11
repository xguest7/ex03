<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
페이지 번호:<input type="number" id="page"> <br>
보여줄 개수:<input type="number" id="amount"> <br>
검색할 종류:	<select id="type" >
		<option value="T" >제목</option>
		<option value="C" >내용</option>
		<option value="W" >작성자</option>
		<option value="TC" >제목 or 내용</option>
		<option value="TW" >제목 or 작성자</option>
		<option value="CW" >내용 or 작성자</option>
		<option value="TCW" >제목 or 내용 or 작성자</option>
			</select>
	 <br>
검색할 내용:<input type="text" id="keyword"><br>
<button id="serchBtn">확인</button>
<div>
</div>

 <!-- jQuery -->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
<script>
//1.버튼이 클릭되었을때 필요한 내용실행
//2.사용자가 입력한 값들을 읽어오기
//3.그 값들을 이용해서 필요한 api 요청
//4.응답받은 데이터를 이용해서 필요한 화면부분을 갱신
$(function(){    
	$("#serchBtn").on("click", function(e){  
		e.preventDefault(); //기존 이벤트 무시
		var page=$("#page").val();
		var amount=$("#amount").val();
		var type=$("#type").val();
		var keyword=$("#keyword").val();
		console.log("읽은값 확인:",page,amount,type,keyword);
		$.ajax({ 
			url:"http://localhost:8080/myapi/board/"+page+"/"+amount ,
			type:"post",
			data: '{"keyword":"'+keyword +'","type":"'+type + '"}',
			      //JSON.stringify({keyword:keyword,type:type})
			contentType:"application/json;charset=UTF-8",
			success:function(result){ 
				console.log("요청성공",result);
				var htmlStr="";
				for(var i=0; i<result.length; i++){
					//찍을 html 만들기
					htmlStr += (i+1)+". "+result[i].title+"<br>"
				}
				$("div").html(htmlStr);
			}
		});
		
	});
	
}); //문서가 로딩되면 이함수를 수행하시오.   


</script>




</body>
</html>
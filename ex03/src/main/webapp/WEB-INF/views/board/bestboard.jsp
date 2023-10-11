<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
실시간 인기글

 <!-- jQuery -->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
<script>
	var preResult;
	function bestbno(){
		
		$.ajax({
			url:"/myapi/bestboard.json",
			success:function(result){
				console.log(result);
				//이전데이터와 현재데이터를 비교해서 순위변경 표시
				if(preResult){
					console.log("변경순위확인");
					for(var rank=0; rank<preResult.length; rank++){
						for(var i=0; i<result.length;i++){
							if(preResult[rank].title == result[i].title){
								break;
							}
						}
						if(rank==i){ //순위유지
							console.log(rank+1,"순위유지");
						}else if(i<4){
							console.log(rank+1,"순위변경");
						}
					}
				}
				preResult=result; //이전데이터 보관
			}
		})
	}
	
	//함수를 특정시간에 반복
	setInterval(bestbno,3000); //3초에 한번씩 bestbno함수를 수행
	

</script>
</body>
</html>
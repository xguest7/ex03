<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    ajax test
    <script
    src="https://code.jquery.com/jquery-3.7.1.min.js"
    integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
    crossorigin="anonymous"></script>
<script>
$.ajax({ 
    url:"/ajax.test" , //필수요소
    type:"put",
    data:JSON.stringify({num1:3, num2:4}), 
    //data는 요청할때 보내는 데이터(언제나 파라미터 형태로 a=3&b=10)
    //원하는 형태로 보내기 위해서는 그형태로 만들어서 보내야함.
    
    contentType:"application/json;charset=UTF-8",
    //contentType은 보내는 데이터 형식(당연히 보내는 데이터 형태와 맞춰야 한다.)
    //기본값은 application/x-www-form-urlencoded; charset=UTF-8 즉, 파라미터데이터다)
    //(스프링에서는 파리미터 전송 메소드의 파라미터로 선언해서 수집가능  ex> NumVO vo)
    //(스프링에서 json 데이터 전송은 파라미터에 @RequetBody 어노테이션을 이용)
    //(ex> @RequestBody NumVo vo)
    
    succes: function(result){   //성공시 동작할 내용
         console.log("ajax  요청 성공");
    },
    error:function(){
        console.log("ajax 요청실패");
    }
})//ajax

</script>
</body>
</html>
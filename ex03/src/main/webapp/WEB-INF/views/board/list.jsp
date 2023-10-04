<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%--헤더 파일 넣기 --%>    
<%@ include file="../includes/header.jsp" %>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><i class="fa fa-list-ul"></i> 게시판</h1> 현재시간${now}
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            게시글 목록 보기(<a href="register">게시글 쓰기</a>)
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>글번호</th>
                                        <th>제목</th>
                                        <th>작성자</th>
                                        <th>작성일</th>
                                        <th>수정일</th>
                                        <th>좋아요</th>
                                    </tr>
                                </thead>
                                <tbody>
<c:forEach items="${list}" var="board">
<tr>
    <td>${board.bno}</td>
    <td><a href="/board/get?bno=${board.bno}&pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}"><c:out value="${board.title}"/></a></td>
    <td><c:out value="${board.writer}"/></td>
    <td class="center"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/> </td>
    <td class="center"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updatedate}"/></td>
    <td>${board.good}</td>
</tr>
</c:forEach>	
                                </tbody>
                            </table>
                          
<%--검색바 시작--%>
<form action="/board/list" method="get">
	<select name="type">
		<option value="T"  <c:if test='${pageMaker.cri.type=="T"}'>selected</c:if>>제목</option>
		<option value="C"  <c:if test='${pageMaker.cri.type=="C"}'>selected</c:if>>내용</option>
		<option value="W"  <c:if test='${pageMaker.cri.type=="W"}'>selected</c:if>  >작성자</option>
		<option value="TC" <c:if test='${pageMaker.cri.type=="TC"}'>selected</c:if>>제목 or 내용</option>
		<option value="TW" <c:if test='${pageMaker.cri.type=="TW"}'>selected</c:if>>제목 or 작성자</option>
		<option value="CW" <c:if test='${pageMaker.cri.type=="CW"}'>selected</c:if>>내용 or 작성자</option>
		<option value="TCW" <c:if test='${pageMaker.cri.type=="TCW"}'>selected</c:if>>제목 or 내용 or 작성자</option>
	</select>
	<input type="text" name="keyword" id="keyword" value="${pageMaker.cri.keyword}">
	<input type="submit" value="검색" id="search">
</form>
<%--검색바 끝 --%>                            
                            <%-- 페이지바 시작 --%>
                            <div>
	                            <c:if test="${pageMaker.prev}"><a href="list?pageNum=${pageMaker.startPage-1}&amount=${pageMaker.cri.amount}" >prev</a></c:if>
	                            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
	                            	<c:if test="${num==pageMaker.cri.pageNum}"><b></c:if>
	                            		<a href="list?pageNum=${num}&amount=${pageMaker.cri.amount}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}" >${num}</a>
	                            	<c:if test="${num==pageMaker.cri.pageNum}"></b></c:if>
	                            </c:forEach>                              
	                            <c:if test="${pageMaker.next}"><a href="list?pageNum=${pageMaker.endPage+1}&amount=${pageMaker.cri.amount}" >next</a></c:if> 
                          	</div>
                          	<%-- 페이지바 끝 --%>
                          </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

                            <!-- Modal -->
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                                        </div>
                                        <div class="modal-body">
                                            게시글 ${result}번이 등록되었습니다.
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal -->


<%--footer 파일 넣기 --%>    
<%@ include file="../includes/footer.jsp" %>

<script>
//검색 버튼이 눌렸을경우 사용자 입력 에러처리
$(function(){                        /// 해결책: 있는 요소의 on 걸고 이후 확인
	$("#search").click(function(){  //#주의! 없는 태그(즉,동적생성)는 이벤트를 걸 수 없다.
		console.log("검색버튼 클릭");
		//if(!$("form").find("option:selected").val())
		//	alert("검색종류를 입력하고 검색하시오!!!!!!");
		if(!$("#keyword").val())
			alert("검색어 넣고 검색버튼을 눌러주세요.");
	});
	
})





</script>    
    
    
    
    
    <script>
    	var oper = "${oper}";
	    var bno = "${result}";
	    console.log("보내온 결과:",bno)
	    if(oper!==""){
		    if(oper==="remove"){ //삭제
		    	$("div.modal-body").text(bno+"번 글 삭제가 완료되었습니다.")
		    }
		    else if(oper==="modify"){ //수정
		    	$("div.modal-body").text(bno+"번 글 수정이 완료되었습니다.")
		    }
	  
	    	$("#myModal").modal("show");
	    }
   </script>

</body>

</html>

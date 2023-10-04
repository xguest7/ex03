<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--헤더 파일 넣기 --%>    
<%@ include file="../includes/header.jsp" %>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">게시판</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            게시글 쓰기 <a href="good?bno=${board.bno}"><button type="button">좋아요+1</button></a>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>제목</label>
                                            <input class="form-control" placeholder="제목 입력" name="title" value="${board.title}" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label>작성자</label>
                                            <input class="form-control" placeholder="작성자 입력" name="writer" value="${board.writer}" readonly>
                                        </div>                                        
                                        <div class="form-group">
                                            <label>내용</label>
                                            <textarea class="form-control" rows="5" placeholder="내용 입력" name="content" readonly >${board.content}</textarea>
                                        </div>
                                        <a href="/board/modify?bno=${board.bno}&pageNum=${cri.pageNum}&amount=${cri.amount}"><button type="button" class="btn btn-outline btn-warning">수정으로</button></a>
                                        <a href="/board/list?pageNum=${cri.pageNum}&amount=${cri.amount}"><button type="button" class="btn btn-outline btn-primary">목록보기</button></a>
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                            </div>
                            <!-- /.row (nested) -->
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

<%--footer 파일 넣기 --%>    
<%@ include file="../includes/footer.jsp" %>

</body>

</html>

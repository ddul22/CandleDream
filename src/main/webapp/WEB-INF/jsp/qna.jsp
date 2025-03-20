<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h3>qna게시판</h3>

 
  <div class="center">
    <div class="row">
      <div class="col-sm-4">
        <select class="form-control" name="searchCondition">
          <option value="">선택하세요</option>
          <option value="T" ${searchCondition == "T" ? "selected" : ""}>제목</option>
          <option value="W" ${searchCondition == "W" ? "selected" : ""}selected>작성자</option>
          <option value="TW" ${searchCondition == "TW" ? "selected" : ""}>제목&작성자</option>
        </select>
      </div>
      <div class="col-sm-5">
        <input type="text" class="form-control" name="keyword" value="${keyword }">
      </div>
      <div class="col-sm-2">
        <input closs="btn btn-primary" type="submit" value="조회">
      </div>
    </div>
  </div>
  <button class="btn btn-primary" onclick="location.href='qnaAddForm.do'">글쓰기</button>
  

	<table class="table table-striped">
		<ul>
		<tbody>
		<tr>
			<th>번호</th><th>제목</th><th>작성자</th><th>작성일시</th><th>진행상태</th>
		</tr>		
		<c:forEach var="qna" items="${list }">
			<tr>
			    <td>${qna.qnaNo}</td>
				<td><c:out value="${qna.qnaTitle }"></c:out></a></td>
				<td><c:out value="${qna.userNo }"></c:out></td>
				<td><c:out value="${qna.qnaDate }"></c:out></td>
				<td><c:out value="${qna.qnaContent }"></c:out></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
<script>
	document.querySelector('#header_qna').className += ' active';
</script>
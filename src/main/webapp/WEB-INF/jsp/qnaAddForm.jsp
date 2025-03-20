<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h3 class="mb-5 mt-5" align="center">QnA</h3>
<form action = "qnaAddForm.do" method="post" enctype="multipart/form-data">
	<table class ="table table-dark table-striped w-75 h-75" align="center">
        <tr>
            <th>제목</th>
            <td><input class="form-control w-50"type="text" name="title"></td>
        </tr>
        <tr>
            <th>내용</th>
            <td><textarea class="form-control w-75" rows="3" cols="45" name="content"></textarea></td>
        </tr>
        <tr>
            <th>작성자</th>
            <td><input class="form-control w-25 disabled" type="text" name="writer"   value="${loginId }" readonly></td>
        </tr>
        
        <tr>
        	
        	<td colspan = "2" align="center"><input class="btn btn-primary"type="submit" value="등록onclick="document.location='qna.do'"">
        	<input class="btn btn-danger" type="reset" value="취소"> </td>
        </tr>
    </table>
</form>

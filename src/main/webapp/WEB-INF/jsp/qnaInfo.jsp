<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h3>QnA</h3>
<form action="qnaInfo.do">
	<input type="hidden" name="qnaNo" value="${qnainfo.qnaNo }">
	<table class="table">
		<tr>
			<th>글번호</th>
			<td><c:out value="${qnainfo.qnaNo }"></c:out></td>
			
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="4"><c:out value="${qnainfo.qnaContent }"></c:out></td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="4"><c:out value="${qnainfo.qnaTitle }"></c:out></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><c:out value="${qnainfo.userNo }"></c:out></td>
			<th>작성일시</th>
			<td><c:out value="${qnainfo.qnaDate }"></c:out></td>
		</tr>
		<tr>
			<td colspan="4"><textarea cols="45" rows="15" name="content"></textarea> 
		</tr>
		
		<tr>
		<td colspan="4"><input class="btn btn-primary"type="submit" value="등록"onclick="document.location='qnaReply.do'"></td>
		</tr>
		<c:if test="${msg != null }">
			<tr>
				<td colspan="4" align="center"><span style="color: red;">${msg }</span></td>
			</tr>
		</c:if>
	</table>
</form>

<style>
.reply .content ul {
	list-style-type: none;
}

.reply .content span {
	display: inline-block;
}
</style>

</div>

<script>
	let logid = "${loginId}"; // 자바의 변수값을 script 사용.
	const bno = "${board.boardNo }";
	console.log(bno);
	// 삭제버튼에 클릭이벤트 등록.
	document
			.querySelector('button.btn-danger')
			.addEventListener(
					'click',
					function(e) {
						let writer = document
								.querySelector('table.table>tbody>tr:nth-of-type(4)>td').innerHTML;
						let bno = document.querySelector('input[name="bno"]').value;
						//console.log(writer, logid);
						if (writer == logid)
							location.href = "removeBoard.do?bno=" + bno;
						else
							alert("권한을 확인하세요.");
					});
</script>

<script src="js/replyService.js"></script>
<!-- <script src="js/reply.js"></script> -->
<link rel="stylesheet" href="https://cdn.datatables.net/2.2.2/css/dataTables.dataTables.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://cdn.datatables.net/2.2.2/js/dataTables.js"></script>
<script src="js/reply_dt.js"></script>

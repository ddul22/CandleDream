<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h3 class="mb-5 mt-5" align="center">QnA</h3>
<form action="qnaInfo.do" method="post">
	<input type="hidden" name="qnaNo" value="${qnainfo.qnaNo }">
	<table class="table table-dark table-striped w-75 h-75" align="center">
		<tr>
			<th>글번호</th>
			<td><input class="form-control w-50" type="text" name="qnaNo" value="${qnainfo.qnaNo }" readonly></td>
		</tr>
	
		<tr>
			<th>제목</th>
			<td><input class="form-control w-50" type="text" name="qnaTitle" value="${qnainfo.qnaTitle }" readonly></td>
		</tr>
		
		<tr>
			<th>내용</th>
			<td><textarea class="form-control w-75" rows="3" cols="45"
					name="qnaContent" readonly>${qnainfo.qnaContent }</textarea></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><input class="form-control w-25 disabled" type="text"
				value="${qnainfo.userNo }" readonly></td>
		</tr>
		
		<tr>
			<th>작성일시</th>
			<td><input class="form-control w-25 disabled" type="text"
				value="${qnainfo.qnaDate }" readonly></td>
		</tr>
		
		<tr>
			<th>답변</th>
			<td><textarea class="form-control w-75" rows="3" cols="45"
					name="qnaReply"></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input class="btn btn-primary" type="submit" value="등록">
			<input class="btn btn-danger" type="reset" value="취소">
			</td>
		</tr>
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

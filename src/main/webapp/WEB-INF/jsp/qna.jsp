<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section class="container">
	<div class="row">
		<div class="col-1"></div>
		<div class="col-10 mt-5 mb-5">
			<table class="table table-striped text-center">
				<tbody>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일시</th>
					</tr>
					<c:forEach var="qna" items="${list }">
						<tr onclick="window.location.href='qnaInfo.do?qnaNo=${qna.qnaNo}'">
							<td>${qna.qnaNo}</td>
							<td><c:out value="${qna.qnaTitle }"></c:out></a></td>
							<td><c:out value="${userNo }"></c:out></td>
							<td><c:out value="${qna.qnaDate }"></c:out></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<button class="btn btn-danger" onclick="qnaAddForm()">글쓰기</button>

		</div>
		<div class="col-1"></div>
	</div>
</section>

<script>
	let userNo = '${userNo}';

	function qnaAddForm() {
		if (userNo == null || userNo == '') {
			Swal.fire({
				text : "로그인 후 이용할 수 있습니다",
				confirmButtonText : "확인",
				confirmButtonColor : "#fd7e14"
			})
		} else {
			window.location.href = 'qnaAddForm.do';
		}
	}

	document.querySelector('#header_qna').className += ' active';
</script>
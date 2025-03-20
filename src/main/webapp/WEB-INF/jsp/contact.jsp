<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<section class="contact spad">
	<div class="row">
		<div class="col-lg-3"></div>
		<div class="col-lg-3">
			<div class="contact__text">
				<h3>Contact With us</h3>
				<ul>
					<li>Representatives or Advisors are available:</li>
					<li>Mon-Fri: 5:00am to 9:00pm</li>
					<li>Sat-Sun: 6:00am to 9:00pm</li>
				</ul>
				<img src="img/cake-piece.png" alt="">
			</div>
		</div>
		<div class="col-lg-3">
			<div class="contact__form">
				<form action="contactData.do">
					<div class="row">
						<div class="col-lg-6">
							<input type="text" placeholder="Name" name="cname">
						</div>
						<div class="col-lg-6">
							<input type="email" placeholder="Email" name="cemail" required>
						</div>
						<div class="col-lg-12">
							<textarea placeholder="Message" name="cmsg"></textarea>
							<button type="submit" class="site-btn" id="send">Send Us</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="col-lg-3"></div>
	</div>
</section>

<script>
	
	let msg = '${msg}';
	
	if (msg == '1') {
		msg = '';
		Swal.fire({
			  title: "접수 완료",
			  text : "관심을 가져주셔서 감사합니다",
			  confirmButtonText: "확인",
			  confirmButtonColor: "#fd7e14"
		});
	} else if (msg == '2') {
		msg = '';
		Swal.fire({
			title : "접수 실패",
			text : "잠시 후 다시 시도해주세요",
			icon : "error",
			confirmButtonText: "확인",
			confirmButtonColor: "#fd7e14"
		});
	} 
	
	document.querySelector('#header_contact').className += ' active';
</script>
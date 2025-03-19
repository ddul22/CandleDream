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
							<input type="text" placeholder="Email" name="cemail">
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
	document.querySelector('#header_contact').className += ' active';
</script>
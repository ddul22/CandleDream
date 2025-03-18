<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<main class="form-signin w-100 m-auto">

  <form class="" action="login.do" method="post">
    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>
	
    <div class="form-floating">
      <label for="floatingInput">아이디</label>
      <input type="text" class="form-control" id="floatingInput" name="id" required>
    </div>
    <div class="form-floating">
      <label for="floatingPassword">비밀번호</label>
      <input type="password" class="form-control" id="floatingPassword" name="pwd" required>
    </div>
    
    <button class="btn btn-primary w-100 py-2" type="submit">Sign in</button>
  </form>
    <button class="btn btn-primary w-100 py-2"><a href="addUserForm.do">Sign up</a></button>
  
</main>

<script>

let msg = `${msg}`;

console.log(msg);
if(msg == '1') {
	alert("아이디와 비밀번호를 확인하세요");
}
</script>




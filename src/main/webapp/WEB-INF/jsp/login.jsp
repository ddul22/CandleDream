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

    <div class="form-check text-start my-3">
      <input class="form-check-input" type="checkbox" value="remember-me" id="flexCheckDefault">
      <label class="form-check-label" for="flexCheckDefault">
        Remember me
      </label>
    </div>
    <button class="btn btn-primary w-100 py-2" type="submit">Sign in</button>
    <p class="mt-5 mb-3 text-body-secondary">&copy; 2017–2024</p>
  </form>
</main>
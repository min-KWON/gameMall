<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Log in (v2)</title>

  <!-- Google Font: Source Sans Pro -->
  <%@ include file="/WEB-INF/views/admin/include/LoginPlugin.jsp" %>
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <!-- /.login-logo -->
  <div class="card card-outline card-primary">
    <div class="card-header text-center">
      <a href="../../index2.html" class="h1"><b>Game Mall</br>로그인</a>
    </div>
    <div class="card-body">
      <p class="login-box-msg">로그인 입력</p>

      <form action="/admin/admin_ok" method="post">
        <div class="input-group mb-3">
          <input type="text" name="admin_id" value="admin" class="form-control" placeholder="아이디 입력" required>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" name="admin_pw" value="1234" class="form-control" placeholder="비밀번호 입력" required>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-8">
            <div class="icheck-primary">
              <input type="checkbox" id="remember">
              <label for="remember">
                Remember Me
              </label>
            </div>
          </div>
          <!-- /.col -->
          <div class="col-4">
            <button type="submit" class="btn btn-primary btn-block">로그인</button>
          </div>
          <!-- /.col -->
        </div>
      </form>

      <div class="social-auth-links text-center mt-2 mb-3">
        <a href="#" class="btn btn-block btn-primary">
          <i class="fab fa-facebook mr-2"></i> Sign in using Facebook
        </a>
        <a href="#" class="btn btn-block btn-danger">
          <i class="fab fa-google-plus mr-2"></i> Sign in using Google+
        </a>
      </div>
      <!-- /.social-auth-links -->

      <p class="mb-1">
        <a href="forgot-password.html">비밀번호 찾기</a>
      </p>
      <p class="mb-0">
        <a href="register.html" class="text-center">회원가입</a>
      </p>
    </div>
    <!-- /.card-body -->
  </div>
  <!-- /.card -->
</div>
<!-- /.login-box -->

<!-- jQuery -->
<%@ include file="/WEB-INF/views/admin/include/LoginPlugin2.jsp" %>

 <script>
 	$(document).ready(function() {
 	  let msg = '${msg}';
      if(msg == 'failID') {
        alert("아이디를 확인하세요");
      }else if(msg == 'failPW') {
    	  alert("비밀번호를 확인하세요");
      }
 	});
 
      

 </script>
</body>
</html>

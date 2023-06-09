<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Anime | Template</title>

    <!-- Google Font -->
     <%@ include file="/WEB-INF/views/include/config2.jsp" %>
    <!-- Css Styles -->
<style>

 @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

.input-form {
      max-width: 680px;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
    
    </style>
    
   
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
     <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <!-- Header End -->

    <!-- Normal Breadcrumb Begin -->
    <section class="normal-breadcrumb set-bg" data-setbg="">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="normal__breadcrumb__text">
                        <h2>Login</h2>
                        <p>GaMEmall 로그인</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Normal Breadcrumb End -->

    <!-- Login Section Begin -->
    <section class="login spad">
        <div class="container">
        	<form class="form-horizontal" method="post" action="/member/login">
            <div class="row">
                <div class="col-lg-6">
                    <div class="login__form">
                        <h3>Login</h3>
                        <form action="#">
                            <div class="input__item">
                            	<span class="icon_mail "></span>
                                <input type="text" class="form-control" name="mbsp_id" id="mbsp_id" placeholder="아이디 입력">
                            </div>
                            <div class="input__item">
                            	<span class="icon_lock"></span>
                                <input type="password" class="form-control" name="mbsp_password" id="mbsp_password" placeholder="비밀번호 입력">
                            </div>
                            <br>
                            <button type="submit" class="site-btn">로그인</button>
                        </form>
                        <a href="#" class="forget_pass">Forgot Your Password?</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="login__register">
                        <h3>Dont’t Have An Account?</h3>
                        <a href="/member/join" class="primary-btn">Register Now</a>
                    </div>
                </div>
            </div>
            </form>
            <div class="login__social">
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-6">
                        <div class="login__social__links">
                            <span>or</span>
                            <ul>
                                <li><a href="#" class="facebook"><i class="fa fa-facebook"></i> Sign in With
                                Facebook</a></li>
                                <li><a href="#" class="google"><i class="fa fa-google"></i> Sign in With Google</a></li>
                                <li><a href="#" class="twitter"><i class="fa fa-twitter"></i> Sign in With Twitter</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Login Section End -->

    <!-- Footer Section Begin -->
     <%@ include file="/WEB-INF/views/include/footer.jsp" %>
      <!-- Footer Section End -->

      <!-- Search model Begin -->
      <div class="search-model">
        <div class="h-100 d-flex align-items-center justify-content-center">
            <div class="search-close-switch"><i class="icon_close"></i></div>
            <form class="search-model-form">
                <input type="text" id="search-input" placeholder="Search here.....">
            </form>
        </div>
    </div>
    <!-- Search model end -->

    <!-- Js Plugins -->
<%@ include file="/WEB-INF/views/include/config.jsp" %>
<script>

    $(document).ready(function(){
    	 
    	let msg = '${msg}';
         if(msg == 'failID') {
           alert("아이디 확인바람");
           $("#mbsp_id").focus();
         }else if(msg == 'failPW') {
           alert("비밀번호 확인바람");
           $("#mbsp_password").focus();
         }
    	
    	
      let idCheck = false;
      let isAuthcode = false;

      // ID중복체크
      $("#btn_IdCheck").click(function() {

        if($("#mbsp_id").val() == "") {
          alert("아이디를 입력하세요.");
          $("#mbsp_id").focus();
          return;
        }

        $.ajax({
          url: '/member/idCheck',
          type: 'get',
          dataType: 'text',
          data: {mbsp_id : $("#mbsp_id").val()},
          success: function(result) {

            if(result == "yes") {
              alert("아이디 사용가능");
              idCheck = true;
            }else {
              alert("아이디 사용불가능");
              $("#mbsp_id").val("");
              $("#mbsp_id").focus();
            }        
            
          }
        });
      });

      // 메일인증코드
      $("#btn_authcode").click(function(){
        if($("#mbsp_email").val() == "") {
          alert("메일주소를 입력하세요.");
          $("#mbsp_email").focus();
          return;
        }

        $.ajax({
          url: '/email/send',
          type: 'get',
          dataType: 'text',   
          data: {receiverMail : $("#mbsp_email").val() }, 
          success : function(result) {
            if(result == "success") {
              alert("인증메일이 발송되었습니다. 메일 확인해주세요.");
            }
          }
        });
      });

      //인증확인
      $("#btn_confirmAuthcode").click(function() {
        if($("#email_auth_code").val() == "") {
          alert("인증코드를 입력하세요.");
          $("#email_auth_code").focus();
          return;
        }

        $.ajax({
          url: '/email/confirmAuthcode',
          type: 'get',
          dataType: 'text',   
          data: {authCode : $("#email_auth_code").val() },
          success : function(result) {
            if(result == "success") {
              alert("인증코드가 확인 되었읍니다.");
              isAuthcode = true;
            }else if(result == "fail") {
              alert("인증코드가 다릅니다. 인증코드 요청을 다시 해주세요.");   
            }
          }
        });
      });

      // 회원가입 전송
      $("#btn_join").click(function() {
        let joinForm = $("#joinForm");

        // 자바스크립트 유효성검사 코드작업

        joinForm.submit();
      });

    }); 

  </script>
  
</body>

</html>
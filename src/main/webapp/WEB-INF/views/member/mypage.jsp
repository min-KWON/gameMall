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
    <title>GaMEmall | Template</title>

    <!-- Google Font -->
     <%@ include file="/WEB-INF/views/include/config2.jsp" %>
    <!-- Css Styles -->
   <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.8rem;
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
    
<%@ include file="/WEB-INF/views/include/header.jsp" %>


<body>k
    <!-- Signup Section Begin -->
    <section class="signup spad">
        <div class="container">
            <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">회원가입</h4>
        <form class="validation-form" id="joinForm" method="post" action="/member/join">
          <div class="row">
            <div class="col-md-4 mb-3">
              <label for="mbsp_id">아이디</label>
              <input type="text" class="form-control" name="mbsp_id" id="mbsp_id" placeholder="아이디는 8~15자 이내 입력">
            </div>
            <div class="col-md-3 mb-3">
              <label for="mbsp_idcheck">&nbsp;</label><br>
              <button type="button" id="btn_IdCheck" class="btn btn-primary">ID Check</button>              
            </div>
            <div class="col-md-5 mb-3">
              <label for="mbsp_name">이름</label>
              <input type="text" class="form-control" name="mbsp_name" id="mbsp_name" placeholder="이름을 입력">
            </div>
          </div>
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="mbsp_password">비밀번호</label>
              <input type="text" class="form-control" name="mbsp_password" id="mbsp_password" placeholder="비밀번호 입력">
 			</div>
            <div class="col-md-6 mb-3">
              <label for="mbsp_repassword">비밀번호확인</label>
              <input type="text" class="form-control" id="mbsp_repassword" placeholder="비밀번호 확인">
            </div>
          </div>
		 <div class="row">
          <div class="col-md-4 mb-3">
            <label for="mbsp_email">이메일</label>
            <input type="email" class="form-control" name="mbsp_email" id="mbsp_email" placeholder="you@example.com">
          </div>
          <div class="col-md-3 mb-3">
            <label for="mbsp_email_authcode">&nbsp;</label><br>
            <button type="button" class="btn btn-primary" id="btn_authcode">인증코드요청</button>
          </div>
          <div class="col-md-2 mb-3">
            <label for="email">인증코드</label>
            <input type="text" class="form-control" id="email_auth_code" placeholder="">
          </div>
          <div class="col-md-3 mb-3">
            <label for="mbsp_mailconfirm">&nbsp;</label><br>
            <button type="button" class="btn btn-primary" id="btn_confirmAuthcode">인증확인</button>
          </div>
         </div> 
         <div class="row">
          <div class="col-md-2 mb-3">
            <label for="sample2_postcode">우편번호</label>
            <input type="text" class="form-control" name="mbsp_zipcode" id="sample2_postcode">
          </div>
          <div class="col-md-3 mb-3">
            <label for="email">&nbsp;</label><br>
            <button type="button" onclick="sample2_execDaumPostcode()" class="btn btn-primary">우편번호 찾기</button>
          </div>
		 
          <div class="col-md-7 mb-3">
            <label for="sample2_address">주소</label>
            <input type="text" class="form-control" name="mbsp_addr" id="sample2_address" placeholder="서울특별시 강남구">
          </div>
		 </div>
         <div class="row">
          <div class="col-md-12 mb-3">
            <label for="sample2_detailAddress">상세주소<span class="text-muted">&nbsp;(필수 아님)</span></label>
            <input type="text" class="form-control" name="mbsp_deaddr" id="sample2_detailAddress" placeholder="상세주소를 입력해주세요.">
            <input type="hidden" id="sample2_extraAddress" placeholder="참고항목">
          </div>
         </div>

		  <div class="row">
		  	<div class="col-md-6 mb-3">
              <label for="mbsp_phone">연락처</label>
              <input type="text" class="form-control" name="mbsp_phone" id="mbsp_phone" placeholder="">
            </div>
            <div class="col-md-6 mb-3">
              <label for="mbsp_nick">닉네임</label>
              <input type="text" class="form-control" name="mbsp_nick" id="mbsp_nick" placeholder="">
            </div>
		  </div>
          
          <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" name="mbsp_receive" id="mbsp_receive">
            <label class="custom-control-label" for="mbsp_receive">개인정보 수집 및 이용에 동의합니다.</label>
          </div>
          <div class="mb-4"></div>
          <button class="btn btn-primary btn-lg btn-block" id="btn_join" type="button">가입 완료</button>
        </form>
      </div>
    </div>
            </div>
        </div>
    </section>
    <!-- Signup Section End -->

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

<!-- Modal -->
<div class="modal fade" id="pwchangeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">비밀번호 변경</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-md-4 mb-3">
            <label for="mbsp_id">기존비밀번호</label>
            <input type="password" class="form-control" id="old_mbsp_password">
          </div>
          <div class="col-md-4 mb-3">
            <label for="mbsp_name">신규비밀번호</label>
            <input type="password" class="form-control" id="new_mbsp_password">
          </div>
          <div class="col-md-4 mb-3">
            <label for="mbsp_name">비밀번호확인</label>
            <input type="password" class="form-control" id="re_mbsp_password">
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="btn_pwchange">변경하기</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">회원 탈퇴</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-md-4 mb-3">
            <label for="mbsp_id">비밀번호</label>
            <input type="password" class="form-control" id="mbsp_password">
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="btn_delete">탈퇴하기</button>
      </div>
    </div>
  </div>
</div>
<script>
    $(document).ready(function(){
      $("#btn_pwchange").click(function() {

        if($("#new_mbsp_password").val() != $("#re_mbsp_password").val()) {
          alert("신규비번이 일치하지 않습니다.");
          return;
        }

        $.ajax({
          url: '/member/pwchange',
          type: 'post',
          data: {old_mbsp_password : $("#old_mbsp_password").val(), new_mbsp_password : $("#new_mbsp_password").val()},
          dataType: 'text',
          success: function(result) {
            if(result == "success") {
              alert("비밀번호 변경이 되었읍니다.");
              $("#old_mbsp_password").val('');
              $("#new_mbsp_password").val('');
              $("#re_mbsp_password").val('');

              $('#pwchangeModal').modal('hide')
            }else if(result == "failPW") {
              alert("기존비밀번호가 틀립니다. \n확인바랍니다.");
              $("#old_mbsp_password").val('');
              $("#old_mbsp_password").focus();
            }
          }
        });
      });

      // 회원정보수정
      $("#btn_modify").click(function() {
        location.href = "/member/modify";
      });

      //회원탈퇴하기
      $("#btn_delete").click(function() {
        $.ajax({
          url: '/member/delete',
          type: 'post',
          data: {mbsp_password : $("#mbsp_password").val()},
          dataType: 'text',
          success: function(result) {
            if(result == "success") {
              alert("회원탈퇴 처리가 되었읍니다.");
              $('#deleteModal').modal('hide');

              location.href = "/";

            }else if(result == "failPW") {
              alert("기존비밀번호가 틀립니다. \n확인바랍니다.");
              $("#mbsp_password").val('');
              $("#mbsp_password").focus();
            }
        }
       });
      });

    }); // jquery ready event end
  </script>
  </body>
</html>
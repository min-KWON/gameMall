<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>GameMall | Template</title>
    
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/css/style.css">
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

    <!-- Google Font -->
    <%@ include file="/WEB-INF/views/include/config2.jsp" %>

    <!-- Css Styles -->
    
</head>
  <body>
    
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ include file="/WEB-INF/views/include/categoryMenu.jsp" %>


<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
  <h4 class="display-4">${cat_name }</h4>
</div>

<div class="container">
 <div class="row">
    <div class="col-md-6">
	   <img style="width: 400px; height: 400px" src="/product/displayImage?folderName=${productVO.pro_up_folder }&fileName=${productVO.pro_img}"> 
	</div>
    <div class="col-md-6">
    	<p>상품명: ${productVO.pro_name}</p>
    	<p>가격: <fmt:formatNumber type="currency" pattern="₩#,###" value="${productVO.pro_price}"/></p>
    	<p>제조사: ${productVO.pro_publisher}</p>
    	<p>수량: <input type="text" id="pro_amount" value="1" style="width: 50px;"></p>
    	<button type="button" name="btn_cart"  data-pro_num="${productVO.pro_num}" class="btn btn-link">장바구니</button>
	    <button type="button" name="btn_direct_order" class="btn btn-link">바로구매</button>
    </div> 
 </div>
 
<div class="row">
	<div class="col-md-12"> 
		<div id="tabs">
		  <ul>
		    <li><a href="#pro_desc">상세정보</a></li>
		    <li><a href="#pro_review">상품리뷰</a></li>
		  </ul>
		  <div id="pro_desc">
		    ${productVO.pro_content}
		  </div>
		  <div id="pro_review">
		    <p>상품리뷰</p>
		  </div>
		</div>
	</div>
</div>

<script>
  $(function () {
	  $( "#tabs" ).tabs();
  })
</script>
 

 
  <%@include file="/WEB-INF/views/include/footer.jsp" %>
</div>

<script>

   $(document).ready(function() {
	
      $("#tabs").tabs();	
    	
      // 장바구니 클릭
      $("button[name=btn_cart]").on("click", function() {
		
    	console.log("장바구니");
    	  
        $.ajax({
          url: '/cart/cart_add',
          type: 'post',
          data: {pro_num : $(this).data("pro_num"), cart_amount : $("#pro_amount").val()},
          success: function(result) {
            if(result == "success") {
              alert("장바구니에 추가됨");
              if(confirm("장바구니로 이동하겠읍니까?")) {
                location.href = "/cart/cart_list";
              }
            }
          }
        });
      });
    });



  </script>
    
  </body>
</html>
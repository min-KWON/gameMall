<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Dashboard 2</title>

  <!-- Google Font: Source Sans Pro -->
<%@ include file="/WEB-INF/views/admin/include/plugin.jsp" %>

</head>
<body class="hold-transition dark-mode sidebar-mini layout-fixed  layout-footer-fixed">
<div class="wrapper">

  <!-- Preloader -->
<div class="preloader flex-column justify-content-center align-items-center">
    <img class="animation__wobble" src="dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
  </div>

  <!-- Navbar -->
  <%@ include file="/WEB-INF/views/admin/include/header.jsp" %>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <%@ include file="/WEB-INF/views/admin/include/sidebar.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="container">
  
    <div class="row">
     <div class="col-md-12">
       <div class="box box-primary">
         <form id="productForm" action="" method="post" enctype="multipart/form-data">
         <div class="box-header">
          	수정하기
         </div>
         <div class="box-body">	
          <div class="form-group row">
            <label for="pdt_name" class="col-sm-2 col-form-label">카테고리</label>
            <div class="col-sm-3">
              <select name="cat_prtcode" id="firstCategory" class="form-control">
                <option value="">1차카테고리 선택</option>
                <c:forEach items="${categoryList }" var="category">
                  <option value="${category.cat_code }" ${category.cat_code == categoryVO.cat_code ? 'selected': ''}>${category.cat_name }</option>
                </c:forEach>
               </select>
            </div>
          <div class="col-sm-3">					    	
              <select name="cat_code" id="secondCategory" class="form-control">
                <c:forEach items="${subCategoryList }" var="category">
					<option value="${category.cat_code }" ${category.cat_code ==  productVO.cat_code ? 'selected' : ''}>${category.cat_name }</option>
				</c:forEach>
              </select>
            </div>
          </div>
          <div class="form-group row">
            <label for="pro_name" class="col-sm-2 col-form-label">상품명</label>
            <div class="col-sm-4">
              <input type="hidden" class="form-control" id="pro_num" name="pro_num" value="${productVO.pro_num}">
              <input type="text" class="form-control" id="pro_name" name="pro_name" value="${productVO.pro_name}">
            </div>
            <label for="pro_price" class="col-sm-2 col-form-label">상품가격</label>
            <div class="col-sm-4">
              <input type="text" class="form-control" id="pro_price" name="pro_price" value="${productVO.pro_price}">
            </div>
          </div>
          <div class="form-group row">
            <label for="pro_discount" class="col-sm-2 col-form-label">할인율</label>
            <div class="col-sm-4">
              <input type="text" class="form-control" id="pro_discount" name="pro_discount" value="${productVO.pro_discount}">
            </div>
            <label for="pro_publisher" class="col-sm-2 col-form-label">제조사</label>
            <div class="col-sm-4">
              <input type="text" class="form-control" id="pro_publisher" name="pro_publisher" value="${productVO.pro_publisher}">
            </div>
          </div>
          <div class="form-group row">
            <label for="pdt_img" class="col-sm-2 col-form-label">상품이미지</label>
            <div class="col-sm-4">
               <input type="hidden" name=pro_up_folder value="${productVO.pro_up_folder}">
			   <input type="hidden" name="pro_img" value="${productVO.pro_img}">
			   <input type="file" class="form-control" id="uploadFile" name="uploadFile">
            </div>
            <label for="change_img" class="col-sm-2 col-form-label">현재 / 변경 이미지</label>
            <div class="col-sm-4">
               <img id="curr_img" src="/admin/product/displayImage?folderName=${productVO.pro_up_folder }
               	&fileName=s_${productVO.pro_img}" style="width: 200px;height: 200px;">
            </div>
          </div>
          <div class="form-group row">
            <label for="pro_content" class="col-sm-2 col-form-label">상품설명</label>
            <div class="col-sm-10">
              <textarea class="form-control" id="pro_content" name="pro_content" rows="3">${productVO.pro_content}</textarea>
            </div>
          </div>
          <div class="form-group row">
            <label for="pro_amount" class="col-sm-2 col-form-label">수량</label>
            <div class="col-sm-4">
              <input type="text" class="form-control" id="pro_amount" name="pro_amount" value="${productVO.pro_amount}">
            </div>
            <label for="pro_buy" class="col-sm-2 col-form-label">판매여부</label>
            <div class="col-sm-4">
              <select id="pro_buy" name="pro_buy">
                <option value="Y" ${productVO.pro_buy} == 'Y' ? 'selected':''>판매가능</option>
                <option value="N" ${productVO.pro_buy} == 'N' ? 'selected':''>판매불가</option>
              </select>
            </div>
          </div>	  
       
         </div>
         <div class="box-footer">
           <div class="form-group">
             <ul class="uploadedList"></ul>
           </div>    				
           <div class="form-group row">
            <div class="col-sm-12 text-center">
              <button type="submit" class="btn btn-dark" id="btnProduct">수정 완료</button>
            </div>			
        </div>
         </div>
         </form>
       </div>
     </div>
   </div>


</div>


  <!-- /.content-wrapper -->

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->

  <!-- Main Footer -->
<%@ include file="/WEB-INF/views/admin/include/footer.jsp" %>
</div>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->
<!-- jQuery -->
<%@ include file="/WEB-INF/views/admin/include/plugin2.jsp" %>
<script src="/plugins/ckeditor/ckeditor.js"></script>

<script>
  $(document).ready(function() {
    // ckeditor 버전: 4.12.1 (Standard)환경설정. javascript object구문사용
    let ckeditor_config = {
      resize_enabled : false,
      enterMode : CKEDITOR.ENTER_BR,
      shiftEnterMode : CKEDITOR.ENTER_P,
      toolbarCanCollapse : true,
      removePlugins : "elementspath",
      filebrowserUploadUrl : '/admin/product/imageUpload' // 업로드 탭 표시
    }

    CKEDITOR.replace("pro_content", ckeditor_config);

    console.log("버전: " + CKEDITOR.version);

    $("#firstCategory").change(function() {
      
        let cat_code = $(this).val();

        let url = "/admin/product/subCategory" + cat_code;

        $.getJSON(url, function() {
          let cateOption = "";

          let secondCategory = $("#subCategory")
        });
    });
    
    $("#firstCategory").change(function() {

        let cat_code = $(this).val();

        //console.log("1차 카테고리: " + cat_code);

        let url = "/admin/product/subCategory/" + cat_code + ".json";

        $.getJSON(url, function(subCategoryData){

          //console.log(subCategoryData);

          let optionStr = "";
          let secondCategory = $("#secondCategory");

          secondCategory.find("option").remove(); // 카테고리 변경에 따른 이전 상태를 제거
          secondCategory.append("<option value=''>2차 카테고리 선택</option");

          for(let i=0; i<subCategoryData.length; i++) {
            optionStr += "<option value='" + subCategoryData[i].cat_code + "'>" + subCategoryData[i].cat_name + "</option>";
          }

          //console.log(optionStr);

          secondCategory.append(optionStr);



        });
      });

      //파일첨부 이미지 미리보기
      $("#uploadFile").on("change", function(e) {
        let file = e.target.files[0];  

        let reader = new FileReader(); 

        // 
        reader.onload = function(e) {
          $("#change_img").attr("src", e.target.result);
        }

        reader.readAsDataURL(file); 
      });

    }); // 제이쿼리 끝/
</script>
</body>
</html>

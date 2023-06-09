<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Dashboard 2</title>

  <!-- Google Font: Source Sans Pro -->
<%@ include file="/WEB-INF/views/admin/include/plugin.jsp" %>

</head>
<body class="hold-transition dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed">
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
  
  
  
   <section class="content container-fluid">

      <!--------------------------
        | Your Page Content Here |
        -------------------------->
       
        <div class="row">
        	<div class="col-md-12">
        	
        	<div class="box">
            <div class="box-header with-border">
              <form id="searchForm" action="/admin/product/pro_list" method="get">
                <div class="form-group row">
                  <div class="col-md-6">
                    <select name="type">
                      <option value="" <c:out value="${pageMaker.cri.type == null? 'selected':'' }" />>-----</option>
                      <option value="N" <c:out value="${pageMaker.cri.type eq 'N'? 'selected':'' }" />>상품명</option>
                      <option value="P" <c:out value="${pageMaker.cri.type eq 'P'? 'selected':'' }" />>제조사</option>    
                    </select>
                    <input type="text" name="keyword" placeholder="검색어를 입력하세요." value='<c:out value="${pageMaker.cri.keyword }" />'>
                    <input type="hidden" name="pageNum" value="1">
                    <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                    <button type="submit"  class="btn btn-success">Search</button>
                  </div>
                  <div class="col-md-6">
                    <button type="button" id="btn_checkedModify" class="btn btn-primary">선택상품수정</button>
                    <button type="button" id="btn_checkedDelete" class="btn btn-primary">선택상품삭제</button>
                  </div>
                </div>
              </form>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table class="table table-bordered">
                <tbody><tr>
                  <th style="width: 2%"><input type="checkbox" id="checkAll"></th>
                  <th style="width: 8%">코드</th>
                  <th style="width: 25%">상품명</th>
                  <th style="width: 10%">가격</th>
                  <th style="width: 20%">등록일</th>
                  <th style="width: 10%">판매여부</th>
                  <th style="width: 10%">수정</th>
                  <th style="width: 10%">삭제</th>
                </tr>
                <c:forEach items="${pro_list }" var="productVO">
                <tr>
                  <td><input type="checkbox" name="check" value="${productVO.pro_num }"></td>
                  <td>
                  	<input type="hidden" name="cat_code" value="${productVO.cat_code }">
                  	<c:out value="${productVO.pro_num }"></c:out>
                  </td>
                  <td>
                    <!-- 역슬래시 \ 가 클라이언트 요청데이타로 사용 불가능.-->
                    <a class="move" href="${productVO.pro_num }"><img src="/admin/product/displayImage?folderName=${productVO.pro_up_folder }&fileName=s_${productVO.pro_img}" /></a>
                    <a class="move" href="${productVO.pro_num }"><c:out value="${productVO.pro_name }" ></c:out></a>
                  </td>
                  <td>
                    <input type="text" name="pro_price" style="width:100px" value="${productVO.pro_price }">
                  </td>
                  <td><fmt:formatDate value="${productVO.pro_date }" pattern="yyyy-MM-dd HH:mm"/></td>
                  <td>
                  	<select id="pro_buy" name="pro_buy">
					      	<option value="Y" ${productVO.pro_buy == 'Y' ? 'selected':''}>판매가능</option>
					      	<option value="N" ${productVO.pro_buy == 'N' ? 'selected':''}>판매불가능</option>
					</select>
                 </td>
                  <td><button type="button" name="btn_productEdit" data-pro_num="${productVO.pro_num }" class="btn btn-link">수정</button></td>
                  <td><button type="button" name="btn_productDel" data-pro_num="${productVO.pro_num }" class="btn btn-link">삭제</button></td>
                </tr>
                </c:forEach>
                
              </tbody>
             </table>
            </div>
            <!-- /.box-body -->
            <!-- [이전] 1 2 3 4 5 [다음] 출력작업 -->
            <div class="box-footer clearfix">
              <ul class="pagination pagination-sm no-margin pull-right">
                <c:if test="${pageMaker.prev }">
                	<li><a href="${pageMaker.startPage - 1}">[prev]</a></li>
                </c:if>
                
                <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
                	<li ${pageMaker.cri.pageNum == pageNum ? "class='active'": ""}><a href="${pageNum }">${pageNum }</a></li>
                </c:forEach>
                
                
                <c:if test="${pageMaker.next }">
                	<li><a href="${pageMaker.endPage + 1}">[next]</a></li>
                </c:if>
              </ul>
              <!-- 페이징정보. Criteria 클래스 필드정보작업 -->
              <form id="actionForm" action="/admin/product/pro_list" method="get">
                <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                <input type="hidden" name="type" value="${pageMaker.cri.type}">
                <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
              </form>
            </div>
          </div>
        	
        	</div>
        
        </div>
    </section>


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
   
    let actionForm = $("#actionForm"); // 페이징정보가 있는 form태그. Criteria클래스 필드정보

      // 리스트(목록)에서 제목 클릭-> 상품상세보기.
      $("a.move").on("click", function(e) {
        e.preventDefault(); // a태그의 하이퍼링크 기능이 취소.

        let pro_num = $(this).attr("href");
        
        console.log("글번호: " + pro_num);

        // 목록에서 글번호 선택후, 다시 뒤로가기버튼 클릭시 나타나는 문제발생때문에 아래코드 작업이 필요.
        actionForm.find("input[name='pro_num']").remove();

        actionForm.append("<input type='hidden' name='pro_num' value='" + pro_num + "'>");
        actionForm.attr("action", "/admin/product/get");

        actionForm.submit();

    });

    // 페이지 번호, 이전, 다음 클릭시 actionForm 태그가 전송으로 사용된다.(중요)
      //페이지번호, 이전, 다음 클릭    <ul class="pagination.  
      $("ul.pagination a").on("click", function(e) {
        e.preventDefault(); // a태그의 하이퍼링크 기능이 취소.

        // 현재 페이지번호 변경작업
        // form태그의 정보  
        // <input type="hidden" name="pageNum" value="1">
        // <input type="hidden" name="amount" value="10">
        actionForm.attr("action", "/admin/product/pro_list");
        actionForm.find("input[name='pageNum']").val($(this).attr("href"));

        actionForm.submit();
      });

      
      // 목록에서 수정버튼을 클릭
      $("button[name='btn_productEdit']").on("click", function() {
        // 수정 상품코드
        actionForm.append("<input type='hidden' name='pro_num' value='" + $(this).data("pro_num") + "'>");

        let cat_code = $(this).parent().parent().find("input[name='cat_code']").val();
        actionForm.append("<input type='hidden' name='cat_code' value='" + cat_code + "'>");
        
        actionForm.attr("method", "get");
        actionForm.attr("action", "/admin/product/pro_modify");
        actionForm.submit();
        
      });

      // 목록에서 삭제버튼을 클릭.   name="btn_productDel"
      $("button[name='btn_productDel']").on("click", function() {

        if(!confirm("상품을 삭제하겠읍니까?")) return;

        actionForm.append("<input type='hidden' name='pro_num' value='" + $(this).data("pro_num") + "'>");

        actionForm.attr("method", "post");
        actionForm.attr("action", "/admin/product/pro_delete");
        actionForm.submit();
      });

      // 리스트에서 제목행 체크박스 선택
      let isCheck = true;
      $("#checkAll").on("click", function() {
        // 데이터 행 checkbox 모두선택
        $("input[name='check']").prop("checked", this.checked);
        isCheck = this.checked;
      });

      // 리스트에서 데이터행 체크박스 선택
      $("input[name='check']").on("click", function() {
        // 제목행 checkbox
        $("#checkAll").prop("checked", this.checked);

        //데이터 행의 체크박스 상태를 확인.
        $("input[name='check']").each(function() {
          if(!$(this).is(":checked")) {
            $("#checkAll").prop("checked", false);
          }
        });
      });

      //선택상품수정
      $("#btn_checkedModify").on("click", function() {
        if($("input[name='check']:checked").length == 0) {
          alert("수정할 상품을 체크하세요.");
          return;
        }

        // 자바스크립트 배열문법
        let pro_num_arr = []; // 수정상품코드 배열
        let pro_price_arr = []; //수정상품가격 배열
        let pro_buy_arr = []; // 판매여부 배열

        $("input[name='check']:checked").each(function() {
          pro_num_arr.push($(this).val());
          pro_price_arr.push($(this).parent().parent().find("input[name='pro_price']").val());
          pro_buy_arr.push($(this).parent().parent().find("select[name='pro_buy']").val());
        });
        
        /*
        console.log("수정상품코드: " + pro_num_arr);
        console.log("수정상품가격: " + pro_price_arr);
        console.log("수정상품판매여부: " + pro_buy_arr);
        */

        $.ajax({
          url: '/admin/product/pro_checked_modify',
          type:'post',
          data: {pro_num_arr: pro_num_arr, pro_price_arr:pro_price_arr, pro_buy_arr:pro_buy_arr},
          dataType: 'text',
          success: function(result) {
            if(result == 'success') {
              alert("선택상품이 수정되었읍니다.");
              // location.href = "/admin/product/pro_list";

              actionForm.attr("method", "get");
              actionForm.attr("action", "/admin/product/pro_list");
              actionForm.submit();
            }
          }
        });



      });

      //선택상품삭제
      $("#btn_checkedDelete").on("click", function() {
        
        if($("input[name='check']:checked").length == 0) {
          alert("삭제할 상품을 체크하세요.");
          return;
        }

        if(!confirm("삭제를 하시겠읍니까?")) return;

        let pro_num_arr = []; // 삭제상품코드 배열

        $("input[name='check']:checked").each(function() {
          pro_num_arr.push($(this).val());
        });

        $.ajax({
          url: '/admin/product/pro_checked_delete',
          type:'post',
          data: {pro_num_arr: pro_num_arr},
          dataType: 'text',
          success: function(result) {
            if(result == "success") {
              alert("선택상품이 삭제되었읍니다.");
              // location.href = "/admin/product/pro_list";

              actionForm.attr("method", "get");
              actionForm.attr("action", "/admin/product/pro_list");
              actionForm.submit();
            }
          }
        });

      });

  }); // jquery ready event end
</script>
</body>
</html>

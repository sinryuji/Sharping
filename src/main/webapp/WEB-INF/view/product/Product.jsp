<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product</title>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
<link rel='stylesheet' href='${pageContext.request.contextPath}/resources/css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='${pageContext.request.contextPath}/resources/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
<link rel='stylesheet' href='${pageContext.request.contextPath}/resources/css/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='${pageContext.request.contextPath}/resources/css/font-awesome.min.css' type='text/css' media='all'/>
<%-- <link rel='stylesheet' href='${pageContext.request.contextPath}/resources/css/styleSB.css' type='text/css' media='all'/> --%>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
<link rel='stylesheet' href='${pageContext.request.contextPath}/resources/css/easy-responsive-shortcodes.css' type='text/css' media='all'/>
	
	<style>
    	.site-branding {
    		 text-align: center;
 			 margin: 0 auto;
    	}
    	
    	a{
   	  		text-decoration:none;
   	  		color:black;
   	  	}
   	  	
   	  	h1{
   	  		display:inline;
   	  	}
   	  	
   	  	.chk input[type="checkbox"]{
   	  		display:none;
   	  	}
   	  	
   	  	.chk label{
   	  		width: 20px;
   	  		height:20px;
   	  	}
   	  	
   	  	.chk_img{
   	  		width: 22px;
   	  	}
   	  	
   	  	.chk input[type="checkbox"] + label .chk_img{
   	  		padding: 0 0 0 30px;
   	  		width: 20px;
   	  		height: 20px;
   	  		cursor: pointer;
   	  		background: url('${pageContext.request.contextPath}/resources/images/off.png') no-repeat;
   	  		background-size:20px;
   	  	}
   	  	
   	  	.chk input[type="checkbox"]:checked + label .chk_img{
   	  		padding: 0 0 0 30px;
   	  		width: 20px;
   	  		height: 20px;
   	  		cursor: pointer;
   	  		background: url('${pageContext.request.contextPath}/resources/images/on.png') no-repeat;
   	  		background-size:20px;
   	  	}
   	  	
   	  	.chk, .decl{
   	  		float:left;
   	  	}
   	  	
   	  	input.decl_btn{
   	  		background: url('${pageContext.request.contextPath}/resources/images/신고.png') no-repeat;
   	  		background-size:25px;
   	  		border: none;
   	  		width: 25px;
   	  		height: 25px;
   	  		cursor: pointer;
   	  		outline: none;
   	  		vertical-align: middle;
   	  	}

    </style>
	

</head>
<body class="single single-product woocommerce woocommerce-page">
<div id="basket">
	<div class="page">
		<header id="masthead" class="site-header">
		<div class="site-branding">
			<h1><i><a href="<c:url value='/main'/>">#ing</a></i></h1>
		</div>
		</header>
		</div>
		</div>
	<div id="content" class="site-content">
			<div id="primary" class="content-area column full">
				<main id="main" class="site-main" role="main">
				<div id="container">
					<div id="content" role="main">
						<nav class="woocommerce-breadcrumb" itemprop="breadcrumb">카테고리 가져오면 될듯</nav>
						<nav class="woocommerce-breadcrumb" itemprop="breadcrumb">상품번호:</nav>
						<div itemscope itemtype="http://schema.org/Product" class="product"><!-- 사진 및 상품옵션 보는 묶음 -->
							<div class="images">
								<b><img src="opload/${product.productImage}" width="250" height="250"></b>
							</div>
							<div class="summary entry-summary">
								<c:if test="${!empty authInfo}">
									<div class="chk">
										<input type="checkbox" id="wish" class="wish" ${result == 1 ? "checked" : "" }>
										<label for="wish">
											<div class="chk_img"></div>
										</label>
									</div>
									<div class="decl">
										<input type="button" class="decl_btn" onclick="popup()">
										<input type="hidden" name="sellerId" id="sellerId" value="${product.id}">
									</div>
									<br>
									<br>
								</c:if>
								<form action="orderPage" id="orderPage">
								<input type="hidden" name="productNum" id="productNum" value="${product.productNum}">
								<h1 itemprop="name" class="product_title entry-title">${product.productName}</h1><!-- 상품명 -->
								<div class="woocommerce-product-rating" itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i>
									<a href="#reviews" class="woocommerce-review-link" rel="nofollow">(<span itemprop="reviewCount" class="count">리뷰남긴사람수)</span>고객리뷰</a>
								</div>
								<div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
									<p class="price">
										<span class="amount">${product.productPrice}원</span><!--가격  -->
									</p>
								</div>
								<div itemprop="description">
									<p>
										${product.productText}<!--상품설명  -->
									</p>
									<p>
									상품소재 : ${product.productMeterial}<br>
									 제조사 : ${product.manufacturer}<br>
									 원산지 : ${product.origin}<br>
									</p>
								</div>
								<div class="sumthing">
									<h3 class="옵션석택 스타일 찾아"> 옵션 선택</h3>
									<c:if test="${maxOptionLevel == 0}">
										<input type="hidden" name="optionOneNum" value="0">
										<input type="hidden" name="optionTwoNum" value="0">
										<input type="hidden" name="optionThreeNum" value="0">
									</c:if>
									<c:if test="${maxOptionLevel == 1}">
										<select name="optionOneNum" id="optionOneNum" class="optionNums">
										<option id="default1" value="0">${product.optionOneName}</option>
										<c:forEach var="detailOption" items="${detailOptionList}" varStatus="status">
										<c:if test="${detailOption.optionLevel == 1}">
										<option value="${detailOption.doNum}">${detailOption.optionName}</option>
										</c:if>
										</c:forEach>
										</select>
									</c:if>
									<c:if test="${maxOptionLevel == 2 }">
										<select name="optionOneNum" id="optionOneNum" class="optionNums">
											<option id="default1" value="0">${product.optionOneName}</option>
											<c:forEach var="detailOption" items="${detailOptionList}" varStatus="status">
											<c:if test="${detailOption.optionLevel == 1}">
											<option value="${detailOption.doNum}">${detailOption.optionName}</option>
											</c:if>
											</c:forEach>
										</select>
										<select name="optionTwoNum" id="optionTwoNum" class="optionNums" disabled="disabled">
											<option id="default2" value="0">${product.optionTwoName}</option>
											<c:forEach var="detailOption" items="${detailOptionList}" varStatus="status">
											<c:if test="${detailOption.optionLevel == 2}">
											<option value="${detailOption.doNum}">${detailOption.optionName}</option>
											</c:if>
											</c:forEach>
										</select>
									
									</c:if>
									
									<c:if test="${maxOptionLevel == 3}">
											<select name="optionOneNum" id="optionOneNum" class="optionNums">
											<option id="default1" value="0">${product.optionOneName}</option>
											<c:forEach var="detailOption" items="${detailOptionList}" varStatus="status">
											<c:if test="${detailOption.optionLevel == 1}">
											<option value="${detailOption.doNum}">${detailOption.optionName}</option>
											</c:if>
											</c:forEach>
											</select>
											<select name="optionTwoNum" id="optionTwoNum" class="optionNums" disabled="disabled">
											<option id="default2" value="0">${product.optionTwoName}</option>
											<c:forEach var="detailOption" items="${detailOptionList}" varStatus="status">
											<c:if test="${detailOption.optionLevel == 2}">
											<option value="${detailOption.doNum}">${detailOption.optionName}</option>
											</c:if>
											</c:forEach>
											</select>
											<select name="optionThreeNum" id="optionThreeNum" class="optionNums" disabled="disabled">
											<option id="default3" value="0">${product.optionThreeName}</option>
											<c:forEach var="detailOption" items="${detailOptionList}" varStatus="status">
											<c:if test="${detailOption.optionLevel == 3}">
											<option value="${detailOption.doNum}">${detailOption.optionName}</option>
											</c:if>
											</c:forEach>
											</select>
									</c:if>
									<br>
									<br>
									<div class="quantity"><!--상품수량 -->
										<h4>수량:<span><input type="number" name="cnt" id="cnt" value="1" min="1"></span></h4>
									</div>
								</div>
								<div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
									<p class="price">
										<h4>결제금액:<span class="amount"><input type="number" name="payPrice" id="payPrice" value="${product.productPrice }" readonly></span></h4>
									</p>
								</div>
								<input type="hidden" name="deliveryPrice" id="deliveryPrice" value="${product.deliveryPrice}">
								<input type="button" class="basketBtn" style="margin: 0;" value="담기">
								<input type="button" class="orderBtn" id="t" style="margin: 0;" value="주문">
								</form>
							</div>
						</div>
					</div>
				</div>
				</main>
			</div>
	</div>
<script>
$('.orderBtn').click(function(){
	if('<%=session.getAttribute("authInfo")%>' != 'null'){
		$('#orderPage').submit();
	}else {
		var result = confirm('비회원으로 주문하시겠습니까?'); 
		if(result) { //yes 
			$('#orderPage').submit();
		} else {
			//로그인 페이지 전환
			window.location.href='<%=request.getContextPath()%>/login';
		}
	}
})
</script>
<script>
$('#cnt').change(function(){
	$('#payPrice').val(${product.productPrice} * $('#cnt').val());
})
</script>
<script>


	var count = "${maxOptionLevel}";
	var count2 = 0;
	var count3 = 0;
	var count4 = 0;
	var optionOneName = "${product.optionOneName}";
	var optionTwoName = "${product.optionTwoName}";
	var optionThreeName = "${product.optionThreeName}";
	
	$(document).ready(function(){
		
		console.log(count);
		
		if(count != 0) {
			$("#t").attr("disabled", "disabled");
			$(".basketBtn").attr("disabled", "disabled");
		}
		
	})

	$(".basketBtn").click(function(){
		
	 	var cnt = $("#cnt").val();
		var productNum = ${product.productNum};
		var optionOneNum = $("select[name=optionOneNum]").val();
		var optionTwoNum = $("select[name=optionTwoNum]").val();
		var optionThreeNum = $("select[name=optionThreeNum]").val();
		var data = { 
				cnt : cnt,
				productNum : productNum,
				optionOneNum : optionOneNum,
				optionTwoNum : optionTwoNum,
				optionThreeNum : optionThreeNum
				};
		$.ajax({
			type:"get",
			url:"<%=request.getContextPath()%>/basketInsert",
			data: data,
			success : function(result){
				if(result == 1){
					var result1 = confirm("장바구니에 추가 되었습니다. 계속 쇼핑 하시겠습니까?");
					if(result1){
					location.reload();
					}else{
					window.location.href='<%=request.getContextPath()%>/basket';	
					}
				}else{
					alert("로그인하세요");
					window.location.href='<%=request.getContextPath()%>/login';
				}
			}
			
		});
	});
	
	// 1차 옵션을 고르는 경우
	
	$("#optionOneNum").change(function(){
		
		if($("#optionOneNum").val() == 0) {
			$("#default2").prop("selected", "selected");
			$("#default3").prop("selected", "selected");
			count2 = 0;
			$("#optionTwoNum").attr("disabled", "disabled");
			$("#optionThreeNum").attr("disabled", "disabled");
		}
		else if($("#optionOneNum").val() != 0) {
			
			$.ajax({
				url : "<%=request.getContextPath()%>/selectOptionOne",
					type : "post",
					data : {
						productNum : $("#productNum").val(),
						optionOneNum : $('#optionOneNum').val(),
						optionTwoNum : $('#optionTwoNum').val(),
						optionThreeNum : $('#optionThreeNum').val()
					},
					
					dataType : 'json',
					
					success : function(data) {
						
						var htmls = '<option id="default2" value="0">' + optionTwoName  + '</option>';
						for(var i = 0 ; i < data.list.length ; i++) {
							var option = data.list[i];
							htmls += '<option value="' + option.doNum + '">' + option.optionName + '</option>'
						}
						
						$("#optionTwoNum").html(htmls);
						$("#optionThreeNum").html('<option id="default3" value="0">' + optionThreeName + '</option>');
		
					} 
					
			});

			count2 = 1;
			$("#optionTwoNum").removeAttr("disabled");
		}
		
	});
	
	// 2차 옵션을 고르는 경우
	
	$("#optionTwoNum").change(function(){
		
		if($("#optionTwoNum").val() == 0) {
			$("#default3").prop("selected", "selected");
			count3 = 0;
			$("#optionThreeNum").attr("disabled", "disabled");
		}
		else if($("#optionTwoNum").val() != 0) {
			
			$.ajax({
				url : "<%=request.getContextPath()%>/selectOptionTwo",
					type : "post",
					data : {
						productNum : $("#productNum").val(),
						optionOneNum : $('#optionOneNum').val(),
						optionTwoNum : $('#optionTwoNum').val(),
						optionThreeNum : $('#optionThreeNum').val()
					},
					
					dataType : 'json',
					
					success : function(data) {
						
						var htmls = '<option id="default3" value="0">' + optionThreeName  + '</option>';
						for(var i = 0 ; i < data.list.length ; i++) {
							var option = data.list[i];
							htmls += '<option value="' + option.doNum + '">' + option.optionName + '</option>'
						}
						
						$("#optionThreeNum").html(htmls);
		
					} 
					
			});
			
			count3 = 1;
			$("#optionThreeNum").removeAttr("disabled");
		}
	});
	
	// 3차 옵션을 고르는 경우
	
	$("#optionThreeNum").change(function(){
		
		if($("#optionThreeNum").val() == 0) {
			count4 = 0;
		}
		else if($("#optionThreeNum").val() != 0) {
			count4 = 1;
		}
		
	});
	
	// 주문 버튼 활성화/비활성화
	
	$(document).on("change", ".optionNums", function(){
		
		if(count == 1) {
			if(count2 == 1) {
				$("#t").removeAttr('disabled');
				$(".basketBtn").removeAttr("disabled");
			}
			else {
				$("#t").attr('disabled', 'disabled');
				$(".basketBtn").attr("disabled", "disabled");
			}
		}
		
		else if(count == 2) {
			if(count2 == 1 && count3 == 1) {
				$("#t").removeAttr('disabled');
				$(".basketBtn").removeAttr("disabled");
			}
			else {
				$("#t").attr('disabled', 'disabled');
				$(".basketBtn").attr("disabled", "disabled");
			}
		}
		
		else if(count == 3) {
			if(count2 == 1 && count3 == 1 && count4 == 1) {
				$("#t").removeAttr('disabled');
				$(".basketBtn").removeAttr("disabled");
			}
			else {
				$("#t").attr('disabled', 'disabled');
				$(".basketBtn").attr("disabled", "disabled");
			}
		}
		
	})
	
	/* 관심상품 */
	
	$(function(){
      if(document.getElementById("wish").checked == true){
    	  document.getElementById("wish").value = '1';
      } else {
    	  document.getElementById("wish").value = '0';
      }               
   });
	
 	$("#wish").click(function(){
	      if($(this).is(":checked")){
	         document.getElementById("wish").value = '1';
	      } else {
	         document.getElementById("wish").value = '0';
	      }
	      
	      $.ajax({
	         url : "<%=request.getContextPath()%>/wishControl",
	            type : "post",
	            data : {
	               productNum : $("#productNum").val(),
	               result : $("#wish").val(),
	            }, 
	            success: function(data) {
	               
	            }
	      });
	   });
 	
 	var pop;
 	function popup(){
 		var url = "decl";
 		var name = "decl";
 		var option = "width = 500, height = 350, top = 100, left = 800";
 		pop = window.open(url, name, option);
 	}
	
</script>

</body>
</html>
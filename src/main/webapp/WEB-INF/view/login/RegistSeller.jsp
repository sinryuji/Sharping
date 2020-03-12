<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>RegistSeller</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous">
</script>
<!-- 문자 인증 -->
<script>

var phoneChk = false;
var idChk = false;

/* 인증번호 발송 */
function sendSms() {
	
	
	
	$.ajax({
		url : "<%=request.getContextPath()%>/sendSms",
		data : {
			receiver : $("#phone").val()
		},
		type : "post",
		success : function(result) {
			if (result == "true") {
				alert("인증번호 전송!")
				console.log(result);
			} else {
				alert("인증번호 전송 실패");
			}
		}
	});
}

/* 인증번호 체크 */
function phoneCheck() {
	$.ajax({
		url : "<%=request.getContextPath()%>/smsCheck",
			type : "post",
			data : {
				code : $("#confirmNumber").val()
			},
			success : function(result) {
				if (result == "ok") {
					alert("번호 인증 성공");
					phoneChk = true;
					if(phoneChk == true && idChk == true){
					$("#regist").removeAttr("disabled");
					}
				} else {
					alert("번호 인증 실패");
				}
			}
		});
	}

function idCheck(){
	 var query = {id : $("#id").val()};
	 
	 $.ajax({
	  url : "/Sharping/idCheck",
	  type : "post",
	  data : query,
	  dataType : "json",
	  success : function(data) {
	  
		if(data == 1){
		   alert("중복된 아이디입니다.");
		  /*  $(".submit").attr("disabled", "disabled"); */
		   $("#id").val('');
		   $("#id").focus();
	   	} else if(data == 0){
		   alert("사용가능한 아이디입니다.");
		   idChk = true;
		   if(phoneChk == true && idChk == true){
		   $("#regist").removeAttr("disabled");
		   }
	   	}
	  }
	 });  // ajax 끝
	};

</script>
<!-- 카카오 주소 찾기 api -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		function openDaumZipAddress() {
			new daum.Postcode({
				oncomplete:function(data) {
					$("#post").val(data.zonecode);
					$("#address").val(data.address);
					$("#addressEtc").focus();
					console.log(data);
				}
			}).open();
		}
	</script>
</head>
<body>
	<form action="registCompleteSeller" method="post">
		이름:<input type="text" name="name"><br> 
		아이디 : <input type="text" id="id" name="id"/>&nbsp&nbsp&nbsp<input type="button" onClick="idCheck();" value="중복확인"><br><br>
		비밀번호:<input type="text" name="password" /><br> 
		비밀번호 재입력:<input type="text" name="passwordCheck" /><br> 
		휴대폰번호:<input type="text" name="phone" id="phone" />
		<button type="button" onclick="sendSms();">전송</button><br> 
		인증번호:<input type="text" name="confirmNumber" id="confirmNumber" />
		<button type="button" onclick="phoneCheck();">인증</button><br>
		이메일:<input type="text" name="email" /><br> 
		스토어이름:<input type="text" name="storeName" /><br> 
		스토어주소:<input type="text" name="storeAddress" /><br>
		스토어소개글:<input type="text" name="storeText" /><br>
		우편번호:<input type="text" name="post" id="post" readonly /> &nbsp;
		주소:<input type="text" name="address" id="address" readonly /> &nbsp;
		상세주소:<input type="text" name="addressEtc" id="adressEtc"> &nbsp; <input type="button" onClick="openDaumZipAddress();" value = "주소 찾기" /> <br> 
		계좌번호:<input type="text" name="bankAccount" /><br> 
		은행코드:<input type="number" name="bankCode" /><br> 
		<input type="submit" name="regist" id="regist" value="회원가입하기" disabled="true">
	</form>



</body>
</html>
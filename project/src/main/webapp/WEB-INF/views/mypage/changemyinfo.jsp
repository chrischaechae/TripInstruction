<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="utf-8" %>
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Jua|Noto+Sans+KR&display=swap" rel="stylesheet">
<c:url value="/" var="root"></c:url>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="${root }css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="${root }css/travel.css" />
<link href="https://github.com/uniqueHRH/final/blob/master/project/src/main/webapp/imgs/shortlogo.png?raw=true" rel="shortcut icon" type="image/x-icon">
<style type="text/css">
	#allContain {
		width:1000px;
		margin:0 auto;
		padding-left:200px;
		font-family: 'Jua';
	}
	form {
		width:800px;      
		margin:0 auto;
		font-family: 'Jua';
		font-size:18px;
		align:center;
		text-align:center;
		padding:0px;
	}
	#table{
		margin-top: 50px;
	}
    #infocomm{
    	font-size: 20px;
    }
	#table tr, #table td {
		text-align: center;
	}
	#table tr td{
		font-size: 15px;
	}
	#resetbtn , #changebtn, #submitbtn {
		display:inline;
		margin-top: 30px;
		width: 200px;
	}
	.form-control{
		width: 250px;
	}
	#nickdupli,#client_nick1{
		display: inline;
	}
	#client_phone{
		position: relative;
		left: 28px;
	}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/menubar.jsp"/>

<div id="allContain">
	<div class="page-header" align="center">
		<h1>내 정보관리</h1>
		<p id="infocomm">내정보를 최신정보로 관리해주세요</p>
	</div>

	<form action="../mypage/changemyinfo" name="cac" method="post">
		<div id="table">
			<table class="table table-hover">
				<tr>
					<td width="150px;" style="font: bold; font-size: 20px;">아이디</td>
					<td width="250px;">여행사용설명서 아이디</td>
					<td width="400px;">${sessionScope.check.client_id }</td>
				</tr>
				<tr>
					<td style="font: bold; font-size: 20px;"><br/>닉네임/연락처</td>
					<td>닉네임<br/><br/><br/>연락처</td>
					<td><input type="text" class="form-control" id="client_nick1" name="client_nick1" placeholder="2-15자 이내만 가능합니다" maxlength="15">
				<button type="button" id="nickdupli" class="btn btn-default">중복 확인</button>
				<input type="hidden" id="duplicheck1" name="duplicheck1" value="0" style="display: none;"><br/><br/>
					<input type="text" class="form-control" id="client_phone" name="client_phone" value="${sessionScope.check.client_phone }"/></td>
				</tr>
				<tr>
					<td style="font: bold; font-size: 20px;">이름/생년월일</td>
					<td>이름<br/><br/>생년월일</td>
					<td>${sessionScope.check.client_name }<br/><br/>${sessionScope.check.client_birth }</td>
				</tr>
				<tr>
					<td style="font: bold; font-size: 20px;">알림설정</td>
					<td>소식/광고알림</td>
					<td>수신함</td>
				</tr>
			</table>
		</div>
		<input type="hidden" id="client_id" name="client_id" value="${sessionScope.check.client_id }">
		<div id="buttons">
			<a href="${root }main/mypage/changepw"><button type="button" class="btn btn-default" id="changebtn">비밀번호변경</button></a>
			<button type="submit" class="btn btn-default" id="submitbtn">변경 완료</button>
			<button type="button" class="btn btn-default" id="resetbtn" onclick="location.href='../myinfo'">취 소</button>
		</div>
	</form>   
</div>

<!-- contents end -->
<jsp:include page="/WEB-INF/remote.jsp"/>
<jsp:include page="/WEB-INF/socket.jsp"/>
<jsp:include page="/WEB-INF/footer.jsp"/>
<script type="text/javascript" src="${root }js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${root }js/bootstrap.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		  $('#nickdupli').on('click',function() {
	          
		      var nick = $('#client_nick1').val();
		      var nickname =  /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,15}$/;
		      var nickcheck = nickname.test(nick);
		      $.ajax({
		               url:'../nickdupli',
		               type:'POST',
		               data:{client_nick1:nick},
		                success:function(data){
		                   
		                   var check = data.Nickdupli;
		                   
		                   if(check == null && nickcheck != false){
		                	   swal({
		    					   title: "사용가능한 닉네임입니다.",
		    					   icon: "info"
		    				  		})
		                      $('input[name=duplicheck1]').attr('value', 1);
		                   }else if(nickcheck == false){
		                      swal({
		   					   title: "형식에 맞게 입력하세요",
		   					   icon: "warning"
		   					 	 })
		                   }else{
		                      swal({
		      					   title: "이미 사용중인 닉네임입니다",
		      					   icon: "info"
		      					  })
		                   }
		                }
		      });
		   });
		
	$('form[name="cac"]').bind('submit',function(){
		var duplicheck1 = $("#duplicheck1").val();
		var phone = /(01[016789])([1-9]{1}[0-9]{2,3})([0-9]{4})$/;
		var phonecheck = phone.test($("#client_phone").val());
		
		if(phonecheck !=true){
			swal({
				  title: "연락처를 확인해주세요",
				  icon: "info"
			})
			return false;
		}else if(duplicheck1 == 0){
           swal({
				   title: "닉네임 중복 확인을 해주세요",
				   icon: "info"
				  })
           return false;
		}else {
			
			return true;
		}
	});
	

});

</script>
</body>
</html>
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
		width:600px;      
		margin:0 auto;
		font-family: 'Jua';
		font-size:15px;
		align:center;
		text-align:center;
		padding:100 0 0 0;
	}
    label {
		display:inline-block;
		width:130px;
    }
    #staff_pw, #staff_newpw1, #staff_newpw2 {
		display:inline-block;
    	width:250px;
    	padding:0;
    }
    #btn {
    	text-align:center;
    }
    #resetbtn,#changepwbtn{
    	width: 180px;
    }
</style>
</head>
<body>
<jsp:include page="/WEB-INF/menubar.jsp"/>
                     <!-- contents start -->
<div id="allContain">
	<div class="page-header" align="center">
		<h1>비밀번호변경</h1>
	</div>
	<form action="../mypage/changestaffpw" class="form-horizontal" method="post">
		<div class="form-group" id="insertid" align="center">
			<label for="staff_pw" id="idd">현재비밀번호</label>
			<input type="password" class="form-control" id="staff_pw" name="staff_pw">
			<input type="hidden" class="form-control" id="staff_no" name="staff_no" value="${sessionScope.staffcheck.staff_no}">
			<input type="hidden" class="form-control" id="staff_pw2" name="staff_pw2" value="${sessionScope.staffcheck.staff_pw}">
		</div>
		<div class="form-group" align="center">
			<label for="staff_newpw1" id="pww">새비밀번호</label>
			<input type="password" class="form-control" id="staff_newpw1" name="staff_newpw1" placeholder="영문+숫자 조합 8자리이상">
		</div>
		<div class="form-group" align="center">
			<label for="staff_newpw2" id="pww2">새비밀번호(확인)</label>
			<input type="password" class="form-control" id="staff_newpw2" name="staff_newpw2" placeholder="비밀번호를 한번 더 입력해주세요" >
		</div>
		<div id="btn">
			<button type="button" id="changepwbtn" class="btn btn-default btn-lg">변경완료</button>
			<button type="button" id="resetbtn" class="btn btn-default btn-lg" onclick="location.href='../staffinfo'">취소</button>
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
     
      
      
	   $("#changepwbtn").on('click',function(){
	         var no = $('#staff_no').val();
	         var pw = $('#staff_pw').val();
	         var pw2 = $('#staff_pw2').val();
	         var newpw1 = $('#staff_newpw1').val();
	         var newpw2 = $('#staff_newpw2').val();
	         
	          var newpw = /^.*(?=.{8,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
	            var pwcheck = newpw.test($("#staff_newpw1").val());
	         
	         if(!pw || !newpw1 || !newpw2){
	        	 swal({
	  			   title: "비밀번호를 확인해주세요",
	  			   icon: "warning",
	  			   button: "확인"
	  			})
	            return false;
	         }else if(newpw1 != newpw2){
	        	 swal({
	  			   title: "새 비밀번호가 일치하지않습니다",
	  			   icon: "warning",
	  			   button: "확인"
	  			})
	            return false;
	         }else if(pw2 != pw){
	        	 swal({
	  			   title: "현재 비밀번호를 확인해주세요",
	  			   icon: "warning",
	  			   button: "확인"
	  			})
	            return false;
	         }else if(!pwcheck){
	        	 swal({
	  			   title: "새비밀번호를 확인해주세요",
	  			   icon: "warning",
	  			   button: "확인"
	  			})
	            return false;
	         }else{
	        	 swal({
						title: "비밀번호를 변경하시겠습니까?",
						icon: "warning",
						buttons: ["아니요", "네"]
				 }).then((네) => {
						if(네) {
	           				 $.ajax({
	            			   url:'../mypage/changestaffpw',
	               			   type:'POST',
	              			   data:{staff_pw:newpw1, staff_no:no},
	              			   success:function(){
	                  				location.href="../login";
	              			   }
	           				 });
						}
				 })
	         }
	      });
	      
	   });
	</script>
	</body>
	</html>
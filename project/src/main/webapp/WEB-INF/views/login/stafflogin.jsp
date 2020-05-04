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
   #table{
   		font-family: "Jua";
   		padding-left: 200px;
   }
    form {
      	width:550px;
      	margin: 0 auto;
      	text-align: center;
      	padding:0 0 220 0;
    }
    #loginbar{
    	width: 800px;
    	margin: 0px auto;
    	padding-bottom: 50px;
    	padding-top: 30px;
    }
    #insertid{
    	padding-top: 20px;
    }
   #loginbtn{
       margin: 0px auto;
       text-align:center;
       width: 330px;
    }
    #idd,#pww {
       display:inline block;
    }
 
</style>
</head>
<body>
<jsp:include page="/WEB-INF/menubar.jsp"/>
                        <!-- menubar start -->

<!-- menubar end -->
                     <!-- contents start -->
  <div id="table">
      <div class="page-header" align="center">
     <h1>직원로그인</h1>
   </div>
   			<!-- loginbar start-->
   <ul class="nav nav-tabs nav-justified" id="loginbar">
 	 <li role="presentation"><a href="${root }main/login">회원로그인</a></li>
  	<li role="presentation" class="active"><a href="${root }main/stafflogin">직원로그인</a></li>
	</ul>
  			 <!-- loginbar end -->
      
   	<!-- 직원로그인start -->
   <form action="../main/stafflogin" class="form-horizontal" name="sac" method="post">
     <div class="form-group" id="insertid">
       <label for="staff_no" class="col-sm-2 control-label" id="idd">사번</label>
       <div class="col-sm-10">
         <input type="text" class="form-control" id="staff_no" name="staff_no" placeholder="사번을 입력하세요" style="width:350px">
       </div>
     </div>
     <div class="form-group">
       <label for="staff_pw" class="col-sm-2 control-label" id="pww">비밀번호</label>
       <div class="col-sm-10">
         <input type="password" class="form-control" id="staff_pw" name="staff_pw" placeholder="비밀번호를 입력하세요" style="width:350px">
       </div>
     </div>
     <input type="hidden" id="msg" value="${msg }">
     <button type="submit" id="loginbtn" class="btn btn-default btn-lg btn-block">로그인</button>
     </form>
    </div>
     
     								<!-- 직원로그인 end -->   
   
                         <!-- contents end --> 
<jsp:include page="/WEB-INF/footer.jsp"/> 
 <script type="text/javascript" src="${root }js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${root }js/bootstrap.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	$('form[name="sac"]').bind('submit',function(){
		var id = $("#staff_no").val();
		var pw = $("#staff_pw").val();
		var sabun = /^[0-9]*$/;
        var sabuncheck = sabun.test($("#staff_no").val());
		if(!id || !pw){
			swal({
				   title: "사번과 비밀번호를 확인해주세요",
				   icon: "warning",
				   button: "확인"
				})
			return false;
		}else if(sabuncheck == false){
			swal({
				   title: "사번과 비밀번호를 확인해주세요",
				   icon: "warning",
				   button: "확인"
				})
			return false;
		}else{
			return true;
		}
	});
	var message = $("#msg").val();
	if(message=='fail'){
		swal({
			   title: "사번과 비밀번호를 확인해주세요",
			   icon: "warning",
			   button: "확인"
			})
	}
	
});

</script>
</body>

</html>

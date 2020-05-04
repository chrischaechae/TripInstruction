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
		width:500px;      
		margin:0 auto;
		font-family: 'Jua';
		font-size:18px;
		align:center;
		text-align:center;
		padding:100 0 0 0;
	}
	label, input {
		display:inline-block;
	}
    #client_pw, #staff_pw{
    	width:250px;
    	padding:0 0 0 20;
		display:inline-block;
    }
    #btn {
    	text-align:center;
    }
    #resetbtn,#changepwbtn{
    	width: 150px;
    }
</style>
</head>
<body>
<jsp:include page="/WEB-INF/menubar.jsp"/>
                     <!-- contents start -->
<div id="allContain">
    <div class="page-header" align="center">
     <h1>비밀번호 확인</h1>
   	</div>
   	<c:if test="${sessionScope.check ne null and sessionScope.staffcheck eq null}">
   <form action="../mypage/lock" class="form-horizontal" method="post">
     <div class="form-group" id="insertid" align="center">
       	 <label for="client_pw" id="cpw">현재 비밀번호</label>
         <input type="password" class="form-control" id="client_pw" name="client_pw">
         <input type="hidden" class="form-control" id="client_id" name="client_id" value="${sessionScope.check.client_id}" >
     </div>
     <div id="btn">
     	<button type="submit" id="changepwbtn" class="btn btn-default btn-lg">확인</button>
     	<button type="button" id="resetbtn" class="btn btn-default btn-lg" onclick="location.href='../myinfo'">취소</button>
     </div>
    </form>
    <input type="hidden" id="msg1" value="${msg2 }">
    </c:if>
   <c:if test="${sessionScope.staffcheck ne null and sessionScope.check eq null}">
   <form action="../mypage/lock2" class="form-horizontal" method="post">
     <div class="form-group" id="insertid" align="center">
       	 <label for="staff_pw" id="cpw">현재 비밀번호</label>
         <input type="password" class="form-control" id="staff_pw" name="staff_pw">
         <input type="hidden" class="form-control" id="staff_no" name="staff_no" value="${sessionScope.staffcheck.staff_no}" >
     </div>
     <div id="btn">
     	<button type="submit" id="changepwbtn" class="btn btn-default btn-lg">확인</button>
     	<button type="button" id="resetbtn" class="btn btn-default btn-lg" onclick="location.href='../myinfo'">취소</button>
     </div>
     </form>
     <input type="hidden" id="msg2" value="${msg }">
      </c:if>
      
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
var msg1 = $("#msg1").val();
var msg2 = $("#msg2").val();
if(msg1=='fail' || msg2=='fail'){
	swal({
		   title: "비밀번호를 확인해주세요",
		   icon: "warning",
		   button: "확인"
		})
}
});
</script>
</body>
</html>

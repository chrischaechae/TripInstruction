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
		padding-left:170px;
		font-family: 'Jua';
	}
	form {
		width:900px;      
		margin:0 auto;
		font-family: 'Jua';
		font-size:17px;
		align:center;
		text-align:center;
		padding:50 0 0 0;
	}
    #infocomm{
    	font-size: 20px;
    }
	#table tr{
		text-align: center;
	}
	#table tr td{
		text-align: center;
		font-size: 15px;
	}
	#changeinfobtn{
		width: 150px;
	}
	.form-control{
		width: 200px;
	}
	#client_point{
		margin-top: -30px;
	}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/menubar.jsp"/>

                     <!-- contents start -->
 
 <div id="allContain">
 	 <div class="page-header" align="center">
    	 <h1>직원 정보</h1>
  	 </div>
 <form class="form-horizontal" method="post">
	<div id="table">
		<table class="table table-hover">
		<tr>
			<td width="30%">NO/이름</td>
			<td width="40%">NO<br/></br>이름</td>
			<td width="50%">${bean.client_no }<br/></br>${bean.client_name }</td>
			<input type="hidden" id="client_no" name="client_no" value="${bean.client_no }"/>
		</tr>
		<tr>
			<td>ID/닉네임</td>
			<td>ID<br/><br/>닉네임</td>
			<td>${bean.client_id }<br/><br/>${bean.client_nick1 }</td>
		</tr>
		<tr>
			<td>연락처/이메일</td>
			<td>연락처<br><br>이메일</td>
			<td>${bean.client_phone }<br><br>${bean.client_email }</td>
		</tr>
		<tr>
			<td>등급/포인트</td>
			<td>등급<br><br>포인트</td>
			<td><input type="text" class="form-control" id="client_level" name="client_level" value="${bean.client_level }"/><br><br><input type="text" class="form-control" id="client_point" name="client_point" value="${bean.client_point }"/></td>
		</tr>
		<tr>
			<td>생년월일/가입일</td>
			<td>생년월일<br><br>가입일</td>
			<td>${bean.client_birth }<br><br>${bean.client_joindate }</td>
		</tr>
	   </table>
	 <button type="submit" id="changeinfobtn" class="btn btn-default">수정완료</button>
	 <a href="../clientDe/${bean.client_no}"><button type="button" id="changeinfobtn" class="btn btn-default">취 소</button></a>
	</div>
</form>
</div>
      
<!-- contents end -->
<jsp:include page="/WEB-INF/remote.jsp"/>
<jsp:include page="/WEB-INF/socket.jsp"/>
<jsp:include page="/WEB-INF/footer.jsp"/>
<script type="text/javascript" src="${root }js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${root }js/bootstrap.js"></script>
<script type="text/javascript">
  
</script>
</body>
</html>

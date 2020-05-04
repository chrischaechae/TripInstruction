<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page pageEncoding="utf-8" import="com.bit.project.model.entity.*, java.util.List"%>
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Jua|Noto+Sans+KR&display=swap" rel="stylesheet">
<c:url value="/" var="root"></c:url>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
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
		font-size:18px;
		align:center;
		text-align:center;
		padding:0;
	}
	button, a {
		font-family: 'Jua';
	}
	#table1{
		margin-bottom: 80px; 
	}
	#btn {
		text-align:center;
		padding:30 0 0 0;
	}
	#submitbtn,#backbtn{
		width: 230px;
	}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/menubar.jsp"/>

<!-- contents start -->
<div id="allContain">
	<div class="page-header" id="page-header" align="center">
		<h1>여행상품 관리</h1>
	</div>
  	 
	<h3 style="text-align: center; font-family: 'Jua'; margin-top: 30px;">지역기본정보</h3>
  	 <table class="table table-hover" id="table1">
	  	 <tr>
	  	 	<td class="active" style="width: 200px; text-align: center;">상품번호</td>
	  	 	<td style="width: 200px;">${bean.tour_no }</td>
	  	 	<td class="active" style="width: 200px; text-align: center;">지역</td>
	  	 	<td style="width: 400px;">${bean.land }/${bean.country }</td>
	  	 </tr>
	  	 <tr>
	  	 	<td class="active" style="text-align: center;">도시</td>
	  	 	<td>${bean.city }</td>
	  	 	<td class="active" style="text-align: center;">도시좌표</td>
	  	 	<td>${bean.latlng }</td>
	  	 </tr>
  	 </table>
  	 
  	 <h3 style="text-align: center; font-family: 'Jua';">상품내용</h3>
  	 <form action="../../tour/editconfirm" method="post">
	  	 <table class="table table-hover" id="table2">	
	  	 	<tr>
	  	 		<td class="active" style="width: 200px; text-align: center;">테마</td>
	  	 		<td style="width: 200px;"><select class="form-control" name="theme">
	  	 									<option value="">없음</option>
	  	 									<option value="힐링">힐링</option>
	  	 									<option value="스냅">스냅</option>
	  	 									<option value="엑티비티">엑티비티</option>
	  	 									<option value="식도락">식도락</option>
	  	 									<option value="영화">영화</option>
	  	 									<option value="스포츠">스포츠</option>
	  	 								</select></td>
	  	 		<td class="active" style="width: 200px; text-align: center;">상품이름</td>
	  	 		<td style="width: 400px; text-align: center;"><input type="text" class="form-control" name="name" value="${bean.name }"></td>
	  	 	</tr>
	  	 	<tr>
	  	 		<td class="active" style="text-align: center;">차량정보</td>
	  	 		<td><select class="form-control" name="vehicle">
	  	 			<option value="포함">포함</option>
	  	 			<option value="미포함">미포함</option>
	  	 			</select></td>
	  	 		<td class="active" style="text-align: center;">비용</td>
	  	 		<td><input type="text" class="form-control" name="cost" value="${bean.cost }"></td>
	  	 	</tr>
	  	 	<tr>
	  	 		<td class="active" style="width: 200px; text-align: center;">상품소개</td>
	  	 		<td colspan="3" style="text-align: left;"><input type="text" class="form-control" name="comments" value="${bean.comments }"></td>
	  	 	</tr>
	  	 	<tr>
	  	 		<td class="active" style="width: 200px; text-align: center;">코스이미지</td>
	  	 		<td colspan="3" style="text-align: left;"><input type="text" class="form-control" name="course" value="${bean.course }"></td>
	  	 	</tr>
	  	 	<tr>
	  	 		<td class="active" style="width: 200px; text-align: center;">메인이미지</td>
	  	 		<td colspan="3" style="text-align: left;"><input type="text" class="form-control" name="mainimg" value="${bean.mainimg }"></td>
	  	 	</tr>
	  	 	<tr>
	  	 		<td class="active" style="width: 200px; text-align: center;">소개이미지1</td>
	  	 		<td colspan="3" style="text-align: left;"><input type="text" class="form-control" name="firstimg" value="${bean.firstimg }"></td>
	  	 	</tr>
	  	 	<tr>
	  	 		<td class="active" style="width: 200px; text-align: center;">소개이미지2</td>
	  	 		<td colspan="3" style="text-align: left;"><input type="text" class="form-control" name="secondimg" value="${bean.secondimg }"></td>
	  	 	</tr>
	  	 	<tr>
	  	 		<td class="active" style="width: 200px; text-align: center;">소개이미지3</td>
	  	 		<td colspan="3" style="text-align: left;"><input type="text" class="form-control" name="thirdimg" value="${bean.thirdimg }"></td>
	  	 		<td><input type="hidden" name="tour_no" value="${bean.tour_no }"></td>
	  	 	</tr>
	  	 </table>
	  	 <div id="btn">
		  	 <button type="submit" id="submitbtn" class="btn btn-default btn-lg">수정</button>
		  	 <button type="button" id="backbtn" class="btn btn-default btn-lg" onclick="history.back();">취소</button>
		</div>
	</form>
</div>
  	 	 	
<!-- contents end --> 
<jsp:include page="/WEB-INF/remote.jsp"/>
<jsp:include page="/WEB-INF/socket.jsp"/>
<jsp:include page="/WEB-INF/footer.jsp"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="${root }js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${root }js/bootstrap.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<script type="text/javascript">	

</script>
</body>
</html>
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
	#table1,#table2 {
		width:1000px;
		margin:0 auto;
		padding:0px;
		text-align:center;
		font-family: 'Jua';
		font-size:18px;
	}
	#btn {
		width:1000px;
		padding:30 0 0 0;
		text-align:right;
	}
	#edittourbtn{
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
	  	 	<td class="active" style="width: 200px;">상품번호</td>
	  	 	<td style="width: 200px;">${bean.tour_no }</td>
	  	 	<td class="active" style="width: 200px;">지역</td>
	  	 	<td style="width: 400px;">${bean.land }/${bean.country }</td>
	  	 </tr>
	  	 <tr>
	  	 	<td class="active">도시</td>
	  	 	<td>${bean.city }</td>
	  	 	<td class="active">도시좌표</td>
	  	 	<td>${bean.latlng }</td>
	  	 </tr>
  	 </table>
  	 <h3 style="text-align: center; font-family: 'Jua';">상품내용</h3>
  	 <table class="table table-hover" id="table2">	
  	 	<tr>
  	 		<td class="active" style="width: 200px;">테마</td>
  	 		<td style="width: 200px;">${bean.theme }</td>
  	 		<td class="active" style="width: 200px;">상품이름</td>
  	 		<td style="width: 400px;">${bean.name }</td>
  	 	</tr>
  	 	<tr>
  	 		<td class="active">차량정보</td>
  	 		<td>${bean.vehicle }</td>
  	 		<td class="active">비용</td>
  	 		<td><fmt:formatNumber value="${bean.cost}" pattern="#,###"/>원</td>
  	 	</tr>
  	 	<tr>
  	 		<td class="active" style="width: 200px;">상품소개</td>
  	 		<td colspan="3" style="text-align: left;">${bean.comments }</td>
  	 	</tr>
  	 </table>
  	 <div id="btn">
  	 	<a href="../../system/tour/${bean.tour_no }/edit"><button type="button" id="edittourbtn" class="btn btn-default btn-lg">정보수정</button></a>
  	 </div>
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
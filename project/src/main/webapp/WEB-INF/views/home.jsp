<%@page import="com.bit.project.model.entity.ClientVo"%>
<%@page import="com.mysql.jdbc.interceptors.SessionAssociationInterceptor"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page pageEncoding="utf-8" %>
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Jua|Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${root }css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="${root }css/travel.css" />
<link href="https://github.com/uniqueHRH/final/blob/master/project/src/main/webapp/imgs/shortlogo.png?raw=true" rel="shortcut icon" type="image/x-icon">
<c:url value="/" var="root"></c:url>
<html>
<head>
<meta charset="utf-8">
<title>여행사용설명서</title>
<style type="text/css">
	.jumbotron {
		background-image:url(https://github.com/uniqueHRH/final/blob/master/project/src/main/webapp/imgs/background.jpg?raw=true);
		background-size: cover;
		width: 100%;
	} 
	#logo {
		position:fixed;
		top:25;
		width:350px;
	}
	
	/* 메뉴바 */
	#top1 {
		height:100px;
		font-family: 'Jua';
	}
	#top2 {
		background-color:141414;
		height:100px;
		line-height:30px;
	}
	#bs-example-navbar-collapse-1{
		width: 100%;
	}
	#menubar {
		margin:0 auto;
		text-align:center;
		padding:35 150 0 450;
	}
	#menubar>li {
		padding:0 15px 0 0;
		text-align:center;
	}
	#menubar>li>a {
		font-size:23px;
		font-weight:bold;
		color:white;
		padding:20 50;
		text-align:center;
	}
	#menubar li>ul>li>a {
		font-size:18px;
		color:black;
		text-align: center;
	}
	#login {
		font-size:18px;
		padding:0 30 0 0;
	}
	#login li>a {
		color:white;
		padding:20;
	}
	#login li>ul>li>a {
		color:black;
		text-align:center;
		font-size: 18px;
		margin-bottom: -25px;
	}
	#count {
		font-size:11px;
		color:white;
		text-align:center;
		background-color:#FF0E0E;
		border:0;
		width:19;
		border-radius:50%;
		padding:1 0 0 0;
	}
	body {
		padding-top:100px;
	}
/* 추천상품 */
	#mainI, #mainI2, #mainI3 {
		width:1800px;
		text-align:center;
		font-family: 'Jua';
		padding:40 0;
	}
	#mainI2 {
		background-image:url(https://github.com/uniqueHRH/final/blob/master/project/src/main/webapp/imgs/main2img.jpg?raw=true);
		background-size:cover;
	}
	#mainP {
		text-align: left;
		font-size: 48px;
		margin:0 auto;
		padding-left: 120px;
	}
	p {
		display:inline-block;
	}
	#go {
		text-align:right;
		width:330px;
		padding-top: 10px;
	}
	#star {
		font-size:50px;
		padding:0 1300 0 0;
	}
	#main1 {
		display: inline-block;
		padding:20 20;
		border:1px solid #e8e8e8;
		margin:0 10px;
		background-color:white;
 	}
 	img {
 		width:330px;
 		border-radius:2%;
 	}
	#main1>a, #main2>a, #main3>a, #main4>a {
		color:black;
		font-size:15px;
		text-decoration: none;
	}
	#main1 p, #main2 p, #main3 p, #main4 p{
		text-align:right;
	}
	
/* 검색 */
	#MainSea {
		width:1000px;
		margin:0 auto;
		font-family:'Jua';
		text-align:center;
		align:center;
		padding:500 0 0 0;
	}
	#searchType {
		height:50px;
	}
	#keyword {
		width:500px;
		height:50px;
		font-size:18px;
		display:inline-block;
	}
	#searchGo {
		width:60px;
		height:50px;
	}
	#recommimg1,#recommimg2,#recommimg3{
		width: 330px;
		height: 230px;
	}
/* footer*/
	#footer{
		width: 1800px;
		font-family:"Jua";
		font-size: 15px;
		color: silver;
		margin-bottom: 0px;
		padding-bottom: 0px;
		float: right;
	}
	#footer1{
		padding-top: 20px;
		padding-left: 380px;
	}
	#footer2{
		margin-top: 10px;
		padding-left: 380px;
	}
	#footer3{
		padding-top: 23px;
		padding-left: 380px;
		padding-bottom: 20px;
	}

</style>
</head>
<body>
<div class="jumbotron">
<div id="mainTop">
	<nav class="navbar navbar-default navbar-fixed-top" id="top1">
		<div class="container-fluid" id="top2">
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<a href="${root }"><img src="https://github.com/uniqueHRH/final/blob/master/project/src/main/webapp/imgs/logo.png?raw=true" id="logo"></a>
				<!-- 로그인 -->
				<div id="login">
					<ul class="nav navbar-nav navbar-right">
						<c:if test="${sessionScope.check eq null && sessionScope.staffcheck eq null }">
							<li><a href="${root }main/login">로그인</a></li>
					        <li><a href="${root }main/admin">회원가입</a></li>
			        	</c:if>
						
						<!-- 직원로그인시 -->
				        <li class="dropdown">
					        <c:if test="${sessionScope.check eq null and sessionScope.staffcheck ne null }">
					        	<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">${sessionScope.staffcheck.staff_name} 님<span class="caret"></span></a>
					        	<ul class="dropdown-menu" role="menu">
					        		<li><a href="${root }main/staffinfo">내정보관리</a></li>
				            		<li><a href="${root }main/logout" style="margin-bottom: 0px;">로그아웃</a></li>
					        	</ul>
					        </c:if>
						</li>
				        <!-- 회원로그인시 -->
				        <c:if test="${sessionScope.staffcheck eq null and sessionScope.check ne null }">
				        <input type="hidden" id="session" value="${sessionScope.check.client_nick1}"/>
					        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">${sessionScope.check.client_nick1} 님<span class="caret"></span></a>
					        	<ul class="dropdown-menu" role="menu">
					        		<li><a href="${root }main/message/?id=${sessionScope.check.client_nick1}" id="msg">쪽지함<input type="hidden" id="count" value=""></a></li>
					        		<li><a href="${root }main/mywish/?id=${sessionScope.check.client_name}">찜한상품</a></li>
					        		<li><a href="${root }main/mybooking/?id=${sessionScope.check.client_name}">예약상품</a></li>
					        		<li><a href="${root }main/myBoard/?id=${sessionScope.check.client_nick1}">내가쓴글</a></li>
					        		<li><a href="${root }main/myinfo">내정보관리</a></li>
					        		<li><a href="${root }main/logout" style="margin-bottom: 0px;">로그아웃</a></li>
					        	</ul>
							</li>
						</c:if>
					</ul>
				</div>
				<div id="top3" align="center">
					<!-- 메뉴바 -->
					<ul class="nav navbar-nav" id="menubar">
				        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">투&nbsp; &nbsp; &nbsp;어</a>
							<ul class="dropdown-menu" role="menu">
					            <li><a href="${root }tour/eastasia">중국/일본</a></li>
					       		<li><a href="${root }tour/southeastasia">동남아시아</a></li>
					       		<li><a href="${root }tour/america">아 메 리 카</a></li>
					       		<li><a href="${root }tour/europe">유 &nbsp; &nbsp; &nbsp; &nbsp;럽</a></li>
					       		<li><a href="${root }tour/pacific">남 태 평 양</a></li>
					       		<li><a href="${root }tour/africa">아 프 리 카</a></li>
					       		<li><a href="${root }tour/theme">테 마 여 행</a></li>
							</ul>
				        </li>
				        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">커뮤니티</a>
							<ul class="dropdown-menu" role="menu">
					            <li><a href="${root }board/review">여행후기</a></li>
					       		<li><a href="${root }board/partner">동행구하기</a></li>
					       		<li><a href="${root }board/free">자유게시판</a></li>
							</ul>
				        </li>
				        <li class="dropdown"><a href="${root }board/event">이벤트</a></li>
				        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">고객센터</a>
							<ul class="dropdown-menu" role="menu">
					            <li><a href="${root }board/notice">공 &nbsp; &nbsp; &nbsp; &nbsp;지</a></li>
							    <li><a href="${root }board/faq">자주묻는질문</a></li>
							</ul>
				        </li>
				        <c:if test="${sessionScope.staffcheck ne null }">
					        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">관리자센터</a>
								<ul class="dropdown-menu" role="menu">
						            <li><a href="${root }system/staff">직원 관리</a></li>
						       		<li><a href="${root }system/guide">가이드 관리</a></li>
						       		<li><a href="${root }system/client">회원 관리</a></li>
						       		<li><a href="${root }system/paid">결제 관리</a></li>
						       		<li><a href="${root }system/tour">투어 관리</a></li>
								</ul>
					        </li>
				        </c:if>
					</ul>
				</div>   <!-- 메뉴바 -->
				
			</div><!-- /.navbar-collapse -->
		</div><!-- /.container-fluid -->
	</nav>
</div>

	<div id="MainSea">
		<select id="searchType">
		    <option value="country">나 &nbsp; 라</option>
		    <option value="city">도 &nbsp; 시</option>
		    <option value="theme">테 &nbsp; 마</option>
		</select>
		<input type="text" class="form-control" id="keyword" name="keyword" placeholder="나라 도시 테마 검색">
		<a class="btn btn-default" href="#" role="button" id="searchGo">G O</a>
	</div>
	
</div>   <!-- 점보트론 -->

	<!-- 추천상품img -->
	<div id="mainI">
		<p id="mainP">MD 추천 여행지</p><p id="star"> &nbsp;♬</p>
			<c:forEach items="${list1 }" var="bean1">
			<div id="main1">
					<img src="${bean1.mainimg }" id="recommimg1"/><br/>
						<h3 style="margin-bottom: -10px;">${bean1.name }</h3><br/>
					<div style="font-size: 22px;">${bean1.city }(${bean1.country })</div><a href="${root }tour/detail/${bean1.tour_no}"><div id="go">바로가기 ▶</div></a>
			</div>	
		</c:forEach>	
	</div>	
	<div id="mainI2">
		<p id="mainP" style="color:white">봄 여행지 즐기기</p><p id="star" style="color:white"> &nbsp;♬</p>
			<c:forEach items="${list2 }" var="bean2">
			<div id="main1">
					<img src="${bean2.mainimg }" id="recommimg2"/><br/>
						<h3 style="margin-bottom: -10px;">${bean2.name }</h3><br/>
					<div style="font-size: 22px;">${bean2.city }(${bean2.country })</div><a href="${root }tour/detail/${bean2.tour_no}"><div id="go">바로가기 ▶</div></a>
			</div>	
		</c:forEach>	
	</div>	
	<div id="mainI3">
		<p id="mainP">2020 핫 여행지</p><p id="star"> &nbsp;♬</p>
			<c:forEach items="${list3 }" var="bean3">
			<div id="main1">
					<img src="${bean3.mainimg }" id="recommimg3"/><br/>
						<h3 style="margin-bottom: -10px;">${bean3.name }</h3><br/>
					<div style="font-size: 22px;">${bean3.city }(${bean3.country })</div><a href="${root }tour/detail/${bean3.tour_no}"><div id="go">바로가기 ▶</div></a>
			</div>	
		</c:forEach>	
	</div>		
<!-- footer -->
<div id="footer">
<hr style="border: solid 1px silver;">
	<div id="footer1">
	상호명 (주)여행사용설명서 | 대표 정지문 | 개인정보보호책임자 홍혜리 | 사업자등록번호 100-00-00000 사업자정보확인 | 통신판매업신고번호 2020-서울강남-0000
	</div>
	<div id="footer2">
	주소 서울특별시 서초구 강남대로 459 | 이메일 help@tripinstruction.com | 마케팅/제휴 문의 marketing@tripinstruction.com
	</div>
	<div id="footer3">
	자사는 서울특별시관광협회 공제영업보증보험에 가입되어 있습니다. 여행사용설명서는 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 상품·거래정보 및 거래에 대하여 책임을 지지않습니다.
	</div>
</div>
<!-- footer end -->
<jsp:include page="/WEB-INF/socket.jsp"/>
<script type="text/javascript" src="${root }js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${root }js/bootstrap.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		var id=$('#session').val();
		//안읽은 쪽지 갯수 확인
		if(id){
			$.ajax({
				url: "/project/count",
				type:"POST",
				data:{client_nick2:id},
				success:function(data){
					if(data.Data == 0){
						$("#count").prop("type","hidden");
					}else{
						$("#count").prop("type","text");
						$("#count").attr('value',data.Data);
					}
					
				},
				error:function(){
				}	
			});
		}	
		
		// 상품검색
		$('#searchGo').on('click',function() {
			var url='${root }tour';
			url=url+'?searchType='+$('#searchType').val();
			url=url+'&keyword='+$('#keyword').val();
			
			location.href=url;
		});
		
	});
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<c:url value="/" var="root"></c:url>
<html>
<head>
<meta charset="EUC-KR">
<title>여행사용설명서</title>
<style type="text/css">
	#logo {
		position:fixed;
		top:30;
		left:700;
		width:350px;
	}
	/* 메뉴바 */
	#top1 {
		height:110px;
		font-family: 'Jua';
	}
	#top2 {
		background-color:141414;
		height:110px;
		line-height:30px;
	}
	#top3 {
		position:fixed;
		font-size:17px;
		font-family: 'Jua';
		background-color:141414;
		width:260px;
		height:1000px;
		text-align:center;
		list-style:none;
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
/* 메뉴 */
	#tourM, #boardM, #serviceM, #eventM, #systemM {
		font-size:25px;
		text-align:center;
		color:white;
		padding:15 70;
		border-bottom:1px solid #e8e8e8;
		cursor:pointer;
	}
	#eventM>a {
		text-decoration:none;
		color:white;
	}
	#eventM>a:visited {
		color:white;
	}
	#tourM {
		padding:50 0 15 0;
	}
/* 하위 메뉴 */
	#menubar>div>a {
		padding:20 80;
		font-size:20px;
		color:white;
		text-decoration:none;
	}
	#tourS, #boardS, #serviceS, #systemS {
		background-color:#0F0F0F;
	}
	#menubar>div>a:hover {
		background-color:#e8e8e8;
		font-weight:bold;
		font-size:20px;
		color:black;
	}
	#login {
		padding:0 30 0 0;
	}
	#login li>a {
		color:white;
		padding:20;
		font-size: 18px;
	}
	#login li>ul>li>a {
		color:black;
		text-align:center;
		font-size: 18px;
		margin-bottom: -25px;
	}
	body {
		padding-top:100px;
	}
	#aa,#bb,#cc,#dd,#ee,#ff,#hh,#ii,#kk,#mm,#nn,#oo,#pp,#qq,#rr{
		margin-bottom: -35px;
		display: block;
	}
	#gg,#jj,#ll{
		display: block;
	}
</style>
</head>
<body>
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
					        <c:if test="${sessionScope.staffcheck ne null }">
					        	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">${sessionScope.staffcheck.staff_name} 님<span class="caret"></span></a>
					        	<ul class="dropdown-menu" role="menu">
					        		<li><a href="${root }main/staffinfo">내정보관리</a></li>
				            		<li><a href="${root }main/logout" style="margin-bottom: 0px;">로그아웃</a></li>
					        	</ul>
					        </c:if>
						</li>
				        <!-- 회원로그인시 -->
				        <c:if test="${sessionScope.check ne null }">
					        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">${sessionScope.check.client_nick1} 님<span class="caret"></span></a>
					        <input type="hidden" id="session" value="${sessionScope.check.client_nick1}"/>
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
			</div><!-- /.navbar-collapse -->
		</div><!-- /.container-fluid -->
	</nav>
	
	
	<div id="top3">
		<div id="menubar">
	        <li id="tourM">투&nbsp; &nbsp; &nbsp;어</li>
        	<div id="tourS">
			    <a href="${root }tour/eastasia" id="aa">중국 /일본</a>
			    <a href="${root }tour/southeastasia" id="bb">동남아시아</a>
		    	<a href="${root }tour/america" id="cc">아 메 리 카</a>
	    		<a href="${root }tour/europe" id="dd">유 &nbsp; &nbsp; &nbsp; &nbsp;럽</a>
	       		<a href="${root }tour/pacific" id="ee">남 태 평 양</a>
	       		<a href="${root }tour/africa" id="ff">아 프 리 카</a>
	       		<a href="${root }tour/theme" id="gg">테 마 여 행</a>
	       	</div>
	        <li id="boardM">커뮤니티</li>
        	<div id="boardS">
	            <a href="${root }board/review" id="hh">여행 후기</a>
	            <a href="${root }board/partner" id="ii">동행구하기</a>
	       		<a href="${root }board/free" id="jj">자유게시판</a>
	       	</div>
	       	<li id="eventM"><a href="${root }board/event">이 벤 트</a></li>
	        <li id="serviceM">고객센터</li>
        	<div id="serviceS">
	            <a href="${root }board/notice" id="kk">공 &nbsp; &nbsp; &nbsp; &nbsp;지</a>
			    <a href="${root }board/faq" id="ll">자주묻는질문</a>
	       	</div>
	        
	        <c:if test="${sessionScope.staffcheck ne null }">
	        <li id="systemM">관리자센터</li>
        	<div id="systemS">
	            <a href="${root }system/staff" id="mm">직원 관리</a>
	       		<a href="${root }system/guide" id="nn">가이드 관리</a>
	       		<a href="${root }system/client" id="oo">회원 관리</a>
	       		<a href="${root }system/paid" id="pp">결제 관리</a>
	       		<a href="${root }system/tour" id="qq">투어 관리</a>
	       	</div>
	        </c:if>
		</div>
	</div>
</div>
<script type="text/javascript" src="${root }js/jquery-1.12.4.js"></script>
<script type="text/javascript">
 	$(document).ready(function() {
		$('#tourS').hide();
		$('#boardS').hide();
		$('#serviceS').hide();
		$('#systemS').hide();
		
		$('#tourM').on('click',function() {
			$('#tourS').toggle();
		});
		$('#boardM').on('click',function() {
			$('#boardS').toggle();
		});
		$('#serviceM').on('click',function() {
			$('#serviceS').toggle();
		});
		$('#systemM').on('click',function() {
			$('#systemS').toggle();
		});
		
		
		//안읽은 쪽지
		var id=$('#session').val();
		
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
					console.log('error');
				}	
			});
		}	
		
		
		
	}); 
</script>
</body>
</html>
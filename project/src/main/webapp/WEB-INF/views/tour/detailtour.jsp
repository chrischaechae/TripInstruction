<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
   .container{
      	font-family: 'Jua';
		text-align: center;
		width: 1200px;
		margin-left: 330px;
   }
   #firstimg,#secondimg,#thirdimg{
      display: inline-block;
      width: 360px;
      height: 330px;
      margin-bottom: 30px;
      margin-top: 10px;
   }
   .thumbnail{
      border: none;
   }
   #comments{
      font-size: 20px;
      text-align: left;
   }
   
   #tourtable{      
       width: 700px;
      position: absolute;
      left: 60px;
      height: 150px;
      display: inline-block;
      margin: 0px;
      font-size: 20px;
      margin-top: 10px;
   }
   #mapbtn{
   	  position: absolute;
      left: 1110px;
      top: 1000px;
   }
   #bookbtn{
      width: 300px;
      position: absolute;
      left: 900px;
      top: 1050px;
   }
   #course{
      position: absolute;
      font-size: 30px;
      left: 350px;
      top: 770px;
   }
   #courseimg{
      position: absolute;
      left: 70px;
      top: 830px;
   }
   #map {
        width: 330px;
        height: 350px;
        position: relative fixed; 
        left: 870px;
   }
   #map1{
   		width: 600px;
        height: 500px;
        position: relative;
        left: 400px;
   }
   #footer{
   		position: relative;
   		bottom: -400px;
   }
   /* 리모컨 */ 
	#remote {
		position:fixed;
		left:1580px;
		top:720px;
		width:150px;
	}
	#kakao-talk-channel-chat-button {
		width:150px;
	}
	.kakaoChat {
		text-align:center;
		padding:0;
		margin:0;
	}
	#top, #wish {
		height:40px;
	}
	button {
		font-family:"Jua";
	}
	#star {
		font-size:18px;
		color:red;
		border:0;
		outline:0;
		width:20;
		background-color:white;
	}
</style>

</head>
<body>
<jsp:include page="/WEB-INF/menubar.jsp"/>
<div class="container">     
 <div class="row">
   <div class="col-md-12">
   
      <div class="page-header" align="center">
     <h1>${bean.name }</h1>
 	</div>
 	
   <!-- contenets start -->
  <p id="comments">여행의 포인트 : ${bean.comments }</p>   
   <!-- img넣기 -->
   
   <div class="row">
  <div class="col-xs-6 col-md-4" id="thumbnail">
    <class="thumbnail">
      <img id="firstimg" src="${bean.firstimg }">
    
  </div>
  <div class="col-xs-6 col-md-4" id="thumbnail">
    <class="thumbnail">
      <img id="secondimg" src="${bean.secondimg }">
    
  </div>
  <div class="col-xs-6 col-md-4" id="thumbnail">
    <class="thumbnail">
      <img id="thirdimg" src="${bean.thirdimg }" >
    
  </div>
 </div>
      <!-- img end -->
      
      
           <div style="padding-top: 30px;"><h1>여행정보</h1></div>
           
     
    <table class="table table-condensed" id="tourtable">
      <tr>
         <td class="active" style="text-align: center; width: 150px">상풍명</td>
         <td style="width: 350px;">${bean.name }</td>
         <td class="active" style="text-align: center; width: 150px">지역</td>
         <td width="200px;">${bean.city }</td>
      </tr>
      <tr>
         <td class="active" style="text-align: center;">투어일</td>
         <td>매일</td>
         <td class="active" style="text-align: center;">가이드</td>
         <td>포함(${bean.guideVo.guide_name } 가이드)</td>
      </tr>
      <tr>
         <td class="active" style="text-align: center;">차량</td>
         <td>${bean.vehicle }</td>
         <td class="active" style="text-align: center;">상품가</td>
         <td> <fmt:formatNumber value="${bean.cost}" pattern="#,###"/>원</td>
         <td><input type="hidden" id="check" value="${sessionScope.check}"></td>
      </tr>
      </table>
      
      <div id="map"></div>
    
      <!-- Button trigger modal -->
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" id="mapbtn">자세히보기</button>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
         	<div id="map1"></div>
      </div>    
</div>
<!-- model end -->
   <a id="bookform" href="${root }tour/${bean.tour_no}/booking"><button type="button" id="bookbtn" class="btn btn-default btn-lg">예약하기</button></a>
   <input type="hidden" id="wish_no" value="">
      
      <div id="course"> <여행일정> </div>
      <div id="courseimg">
     <img src="${bean.course }">
     </div>
     
    </div>
  </div>
</div>
<!-- 리모컨 -->
<div class="btn-group-vertical fixed-top" id="remote" role="group" aria-label="...">
	<div id="kakao-talk-channel-chat-button" class="kakaoChat"></div>
	<button type="button" class="btn btn-default" id="wish">찜하기<input type="text" id="star" value=" ☆" disabled></button>
	<button type="button" class="btn btn-default" id="top">TOP ▲</button>
</div>
<jsp:include page="/WEB-INF/socket.jsp"/>
<jsp:include page="/WEB-INF/footer.jsp"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="${root }js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${root }js/bootstrap.js"></script>
 <script type="text/javascript">
   $(document).ready(function() {
	   //찜 체크되어 있는 상품인지 확인
	   var id=$('#session').val();
	   if(id){
	   var client_name="${sessionScope.check.client_name}";
		   $.ajax({
				url: '../../tour/keepwish',
				type:'POST',
				data:{client_name:client_name,tour_no:${bean.tour_no}},
				success:function(data){
					if(data.Wishchk.wishchk ==1){
						$('#star').val(' ★');
						 $('#wish_no').val(data.Wishchk.wish_no);
					}
									
				},
				error:function(){
				}	
			});
	  }
	  //로그인 안되어 있을 때 로그인 페이지로 이동
      $('#bookbtn').click(function(){
            var check = $('#check').val();
            if(!check){
               $("#bookform").attr("href", "../../main/login");
            }           
         });
      
      
//	리모컨 top
  	$('#top').on('click',function() {
  		$('html,body').scrollTop(0);
  	});

	$('#wish').mouseenter(function() {
		$('#star').css('background-color','#e8e8e8');
	}).mouseleave(function() {
		$('#star').css('background-color','white');
	});
	//찜 버튼 클릭했을 때 찜 , 찜취소 이벤트 
	$('#wish').on('click', function() {
		var check = $('#check').val();
		$('#star').css('background-color','#e8e8e8');
		var client_name="${sessionScope.check.client_name}";
		
			if($('#star').val()==" ☆" && ${sessionScope.check ne null }){
					$.ajax({
					url:'../../tour/wishon',
					type:'POST',
					data:{tour_no:${bean.tour_no},client_name:client_name},
					success:function() {
						$('#star').val(' ★');
					},
					error:function() {
					}
				});
			}else if($('#star').val()==' ★' && ${sessionScope.check ne null }){
				var wish_no=$('#wish_no').val();
				$.ajax({
					url:'../../tour/wishoff',
					type:'POST',
					data:{wish_no:wish_no},
					success:function() {
						$('#star').val(' ☆');
					},
					error:function() {
					}
				});		
			}	
	});
	
  	Kakao.init('acc658a670e9ed5918d11647040b5bc5');
  	Kakao.Channel.createChatButton({
  	  container: '#kakao-talk-channel-chat-button',
  	  channelPublicId: '_wxfwxfxb' // 카카오톡 채널 홈 URL에 명시된 id로 설정합니다.
  	});
   });
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
   //구글맵API
   function initMap() {
  	 var myLatLng = myLatlng = new google.maps.LatLng(${bean.latlng});//메인구글맵좌표
  	  
	//메인구글맵 start
 	 var map = new google.maps.Map(document.getElementById('map'), {
    	zoom: 7,
    	center: myLatLng
      });
 
 	 var marker = new google.maps.Marker({
    position: myLatLng,//좌표선택해주면됨
    icon:"https://github.com/uniqueHRH/final/blob/master/project/src/main/webapp/imgs/pin.png?raw=true",
    map: map,
    title: '${bean.city}'//marker  표시
  }); 
 	//메인구글맵end
 	//자세히 보기 구글맵
 	var map1 = new google.maps.Map(document.getElementById('map1'), {
    	zoom: 10,
    	center: myLatLng
      });
 	var spot=new Array();
 	var latlng1=new Array();
 	<c:forEach items="${lists}" var="bean1">
 	spot.push("${bean1.spot}");// 배열에 spot이 담겨있음
 	latlng1.push("${bean1.latlng}");//배열에 좌표가 담겨있음.
    </c:forEach>
	    
	//배열 반복문으로 다량의 title 표시
 	for(var i=0; i<latlng1.length; i++){
 		var myLatLng1 ={lat:Number(latlng1[i].split(",")[0]), lng:Number(latlng1[i].split(",")[1])};//디테일구글맵좌표
	   	var marker1 = new google.maps.Marker({
		    position:myLatLng1,//좌표선택해주면됨
	    	map: map1,
	    	title: spot[i]//marker  표시
 	 });
			   	
   }
} 
    
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBOqxnoiL8ERSpf1bmFqxC7SjKeup1twK8&callback=initMap"
    async defer></script> <!-- 구글맵 script -->
</body>
</html>

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
   .thumbnail{
      width: 330px;
   }
   .page-header{
      margin-bottom: 35px;
   }
   #mainimg{
      width: 300px;
      height: 250px;
      padding-top: 15px;
      padding-left: 10px;
      padding-right: 10px;      
   }   
   .caption div{
      width:100%;
      height:30px;      
   }
   #themename{
      font-size: 24px;
      padding-bottom: 50px;
   }
   #healing,#snap,#activity,#food,#movie,#sports{
      text-decoration: none;
      color: black;   
   }
   #themename>a:hover{
      color: orange;
   }
</style>

</head>
<body>
<jsp:include page="/WEB-INF/menubar.jsp"/>
<div class="container">     
 <div class="row">
   <div class="col-md-12">   
      <div class="page-header" align="center">
     <h1>특별한 여행을 하고 싶다면? 테마가 있는 여행은 어떠세요?</h1>
 </div>
   </div>
<div id="themename">   
<a href="#" id="healing"><span>#힐링</span></a> &nbsp;&nbsp;&nbsp;&nbsp;<a href="#" id="snap"><span>#스냅</span></a> &nbsp;&nbsp;&nbsp;&nbsp;<a href="#" id="activity"><span>#액티비티</span></a> &nbsp;&nbsp;&nbsp;&nbsp;<a href="#" id="food"><span>#식도락</span></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" id="movie"><span>#영화</span></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" id="sports"><span>#스포츠</span></a>
</div>
<div class="row">
   
<c:forEach items="${list }" var="bean">
  <a href="${root }tour/detail/${bean.tour_no}"><div class="col-sm-6 col-md-4">
    <div class="thumbnail">
      <img src="${bean.mainimg }" alt="" id="mainimg">
      <div class="caption">
        <h3>${bean.name }</h3>
        <div style="font-size: 20px;">
           ${bean.city }(${bean.country })
        </div>
        <div id="cost" style="color: red; font-size: 20px;">
              <fmt:formatNumber value="${bean.cost}" pattern="#,###"/>원
        </div>
      </div>
    </div>
  </div> 
  </a> 
</c:forEach>
 
  </div>
 </div>
</div>
<jsp:include page="/WEB-INF/remote.jsp"/>
<jsp:include page="/WEB-INF/socket.jsp"/>
   <div id="footer">
      <jsp:include page="/WEB-INF/footer.jsp"/>
   </div>
<script type="text/javascript" src="${root }js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${root }js/bootstrap.js"></script>
<script type="text/javascript">

$(document).ready(function() {
//테마명 클릭했을 때 각각의 상품 띄울 수 있음
   $('#healing').click(function(){
      $.ajax({
         url:'../tour/theme',
         type:'GET',
         success:function(data) {
            location.href="../tour/theme";
         },
         error:function() {
         }
      });  
   }); 
   $('#snap').click(function(){
      $.ajax({
         url:'../tour/themesnap',
         type:'GET',
         success:function(data) {
            location.href="../tour/themesnap";
         },
         error:function() {
         }
      });   
   }); 
   $('#activity').click(function(){
      $.ajax({
         url:'../tour/themeactivity',
         type:'GET',
         success:function(data) {
            location.href="../tour/themeactivity";
         },
         error:function() {
         }
      });   
   });
   $('#food').click(function(){
      $.ajax({
         url:'../tour/themefood',
         type:'GET',
         success:function(data) {
            location.href="../tour/themefood";
         },
         error:function() {
         }
      });   
   });
   $('#movie').click(function(){
      $.ajax({
         url:'../tour/thememovie',
         type:'GET',
         success:function(data) {
            location.href="../tour/thememovie";
         },
         error:function() {
         }
      });   
   });
   $('#sports').click(function(){
      $.ajax({
         url:'../tour/themesports',
         type:'GET',
         success:function(data) {
            location.href="../tour/themesports";
         },
         error:function() {
         }
      });   
   });
   
});
</script>
</body>
</html>
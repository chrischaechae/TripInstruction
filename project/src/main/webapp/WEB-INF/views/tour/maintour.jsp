<%@page import="org.springframework.web.context.annotation.SessionScope"%>
<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page pageEncoding="utf-8" import="com.bit.project.model.entity.*, java.util.List"%>
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
      margin-left: -30px;
      width: 330px;
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
   #right_zzim {
      position: fixed;
      top: 120px;
      left: 54%;
      margin-left: 530px;
      border:1px solid #B0B5BD;
      width:265px;
      height:600px;
      font-family:"Jua";
   }
   #rightSide #right_zzim  div {
      text-align:center;
   }
   #rightSide #right_zzim  div.recTit{
      line-height:1.5em;
      padding:5px;
      color:white;
      background-color:#505A69;
   }
   #rightSide #right_zzim ul {
      list-style: none;
      padding-left:0px;
      min-height: 300px;
   }
   #rightSide #right_zzim  li{
      text-align:center;
      padding:5px;
      position:relative;
   }
   #recentName {
      color:black;
      text-decoration:none;
   }
   #recentImg {
      width:210px;
   }
</style>

</head>
<body>
<jsp:include page="/WEB-INF/menubar.jsp"/>
<div class="container">     
 <div class="row">
   <div class="col-md-12">   
      <div class="page-header" align="center">
     <h1>어디로 떠나세요?</h1>
 </div>
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
<!-- 최근본상품 -->
<div id="rightSide">
   <div style="overflow-y:auto; width:270px; height:600px;" id="right_zzim">
      <div class="recTit">최근본상품 <span id=recentCnt></span></div>
         <ul>
            <!-- 최근본 상품이 뿌려질 부분  -->
         </ul> 
   </div>
</div> 
<jsp:include page="/WEB-INF/footer.jsp"/>
<jsp:include page="/WEB-INF/remote.jsp"/>
<jsp:include page="/WEB-INF/socket.jsp"/>
<script type="text/javascript" src="${root }js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${root }js/bootstrap.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	//최근본 상품
    var list= '${sessionScope.Coolist2}';
    var list2 = list.replace('[','');
    var list3 = list2.replace(']','');
    var list4 = list3.split(',');
    if(list4 ==''){
    }else{
       for(var i=0; i<list4.length-(4*i-1); i++){
          $('#right_zzim ul').prepend('<li><a href="/project/tour/detail/'+list4[4*i+1]+'" id="recentName"><img src="'+list4[4*i]+'" id="recentImg"><p>'+list4[4*i+2]+'('+list4[4*i+3]+' )</p></a></li>');
       }
    }
   
});
var uri='<%= request.getRequestURI() %>';
console.log(uri);
</script>
</body>
</html>
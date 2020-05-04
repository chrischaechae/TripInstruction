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
      display: inline-block;
      font-family: 'Jua';
      text-align: center;
      width: 1200px;
      margin-left: 330px;
    }
    .form-horizontal {
       width:700px;
       position: absolute;
       left: 200px;
       top: 230px;
    }
    #paid_count1{
       width: 300px;
    }
    #countlabel{
       margin-right: 15px;
    }
    #img{
       width: 380px;
       position: absolute;
       margin-top: 50px;
       left: 720px;
    }
    #infor1{
       width: 330px;
       position: absolute;
       left: 750px;
       top: 470px;
    
    }
    #infor2{
       width: 250px;
       position: absolute;
       left: 750px;
       top: 570px;
    
    }
    #checkcostbtn{
       position: absolute;
       left: 1010px;
       top: 575px;
    }
    #confirmbtn{
       width: 200px;
       position: relative;
       left: 400px;
       top: 430px;
    }
    #bookbtn{
       width: 300px;
       position: absolute;
       left: 800px;
       top: 650px;
    }
    .page-header1{
       position: absolute;
       top: 720px;
       left: 200px;
    }
    .page-header2{
       position: absolute;
       top: 1020px;
       left: 200px;
    }
   #caution{
         position: absolute;
         top: 780px;
         left: 200px;
      
   }
   #clause{
         position: absolute;
         width: 800px;
         top: 1100px;
       left: 200px;
   }
   .checkbox{
         position: absolute;
         top: 1670px;
       	left: 630px;
       	padding-bottom: 200px;   
   }
   }
   input[type="checkbox"]{
      width: 17px; 
      height: 17px; 
   }
   #footer{
         position: relative;
         bottom: -530px;
   }

</style>
<script type="text/javascript" src="${root }js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${root }js/bootstrap.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/menubar.jsp"/>
<div class="container">
   <div class="row">
      <div class="col-md-12">


                     
<!-- contents start -->
         <div class="page-header" align="center">
            <h1>예약하기</h1>
         </div>
         
   <div id="allinfo">
      <img id="img" src="${bean.firstimg }">
         
         <table class="table" id="infor1">
            <tr>
               <td class="active" style="width: 100px; text-align: center;">상품명</td>
               
               <td>${bean.name }(${bean.city })</td>
            </tr>
            <tr>
               <td class="active" style="text-align: center;">1인 상품가</td>
               <td><fmt:formatNumber value="${bean.cost}" pattern="#,###"/>원</td>   
            <tr>   
         </table>
          <button type="button" id="checkcostbtn" class="btn btn-default">총 금액확인</button>
         
         <table class="table" id="infor2">
            <tr>
               <td class="active" style="width: 100px; text-align: center;">총 상품가</td>
               <td> </td>   
            <tr>   
         </table>
      </div>
      <p style="font-size: 25px; margin-top: 50px; position: absolute; left: 400px; top: 130px;" >예약자 정보</p>
      <form class="form-horizontal">
         <div id="form-group">
            <div class="form-group">
               <label for="tour_date1" class="col-sm-2 control-label">여행일</label>
               <div class="col-sm-10">
                  <input type="date" class="form-control" id="tour_date1" style="width:300px" >
                  <div id="date_check"></div>
               </div>
            </div>
            <div class="form-group">
               <label for="paid_name1" class="col-sm-2 control-label" >여행자 이름</label>
               <div class="col-sm-10">
                  <input type="text" class="form-control" id="paid_name1" placeholder="대표자 이름을 입력하세요" style="width:300px" >
                  <div id="name_check"></div>
               </div>
            </div>
            <div class="form-group">
               <label for="paid_count1" class="col-sm-2 control-label" id="countlabel">여행인원</label>
               <select class="form-control" id="paid_count1">
                             <option value="">인원수를 선택해 주세요.</option>
                             <option value="1">1명</option>
                             <option value="2">2명</option>
                             <option value="3">3명</option>
                             <option value="4">4명</option>
                             <option value="5">5명</option>
                             <option value="6">6명</option>
                             <option value="7">7명</option>
                             <option value="8">8명</option>
                             <option value="9">9명</option>              
               </select>
               <div id="count_check"></div>
            </div>
            <div class="form-group">
               <label for="paid_phone1" class="col-sm-2 control-label" >여행자 연락처</label>
               <div class="col-sm-10">
                  <input type="text" class="form-control" id="paid_phone1" placeholder="대표자연락처를 입력하세요" style="width:300px" >
                  <div id="phone_check"></div>
               </div>
            </div>
            <div class="form-group">
               <label for="paid_birth1" class="col-sm-2 control-label">여행자 생년월일</label>
               <div class="col-sm-10">
                  <input type="text" class="form-control" id="paid_birth1" placeholder="대표자 생년월일을 입력하세요 ex)19920216" style="width:300px" >
               <div id="birth_check"></div>
               </div>
            </div>
            <div class="form-group">
               <label for="paid_kakaoid1" class="col-sm-2 control-label">카카오톡 아이디</label>
               <div class="col-sm-10">
                  <input type="text" class="form-control" id="paid_kakaoid1" placeholder="카카오톡아이디를 입력하세요(선택)" style="width:300px">
               </div>
            </div>
         </div>   
      </form> 
            <button id="confirmbtn" class="btn btn-default btn-lg btn-block">확인</button>
            
            <div class="page-header1" >
              <h2>주의사항 </h2>
            </div>
      <img id="caution" src="https://github.com/uniqueHRH/final/blob/master/project/src/main/webapp/imgs/caution.png?raw=true">
      <div class="page-header2" >
              <h2>약관</h2>
            </div>
       <!-- Nav tabs -->
<div id="clause"> 
  <div>
     <ul class="nav nav-tabs" role="tablist">
       <li role="presentation" class="active"><a href="#healing" aria-controls="healing" role="tab" data-toggle="tab" style="width: 250px;">특별약관(필수)</a></li>
       <li role="presentation"><a href="#snap" aria-controls="snap" role="tab" data-toggle="tab" style="width: 250px;">개인정보 수정 및 이용동의(필수)</a></li>
       <li role="presentation"><a href="#activity" aria-controls="activity" role="tab" data-toggle="tab" style="width: 250px;">개인정보 수정 및 이용동의(필수)</a></li>
       
     </ul>
  </div>
  <!-- Tab panes -->
     <div class="tab-content">
       <div role="tabpanel" class="tab-pane active" id="healing">
          <img src="https://github.com/uniqueHRH/final/blob/master/project/src/main/webapp/imgs/clause1.png?raw=true">
       </div>
       <div role="tabpanel" class="tab-pane" id="snap">
          <img src="https://github.com/uniqueHRH/final/blob/master/project/src/main/webapp/imgs/clause2.png?raw=true">
       </div>
       <div role="tabpanel" class="tab-pane" id="activity">
          <img src="https://github.com/uniqueHRH/final/blob/master/project/src/main/webapp/imgs/clause3.png?raw=true">
       </div>
       
     </div>
</div>    

<div class="checkbox">
    <label style="font-size: 23px;">
      <input id="allclause" type="checkbox">위 약관에 모두 동의합니다.
    </label>
  </div>  
         <!-- jquery로 생성되는 form tag -->   
         <form id="bookform" name="bookform" method="post">   
            <input type="hidden" id="tour_no" name="tour_no" value="${bean.tour_no }">
         <button type="submit" id="bookbtn" class="btn btn-default btn-lg btn-block">예약하기</button>
         </form>   
      </div>   
   </div>
</div>
<jsp:include page="/WEB-INF/socket.jsp"/>
<jsp:include page="/WEB-INF/remote.jsp"/>
<!-- contents end -->
<script type="text/javascript">
   $(document).ready(function() {
      $('#confirmbtn').click(function(){
         
         var tour_date=$('#tour_date1').val();
         var paid_name=$('#paid_name1').val();
         var paid_count=$("#paid_count1 option:selected").val();
         var paid_phone=$('#paid_phone1').val();
         var paid_birth=$('#paid_birth1').val();
         var paid_kakaoid=$('#paid_kakaoid1').val();
         var paid_total=Number(paid_count)*Number(${bean.cost });
   
         if(tour_date=="" | paid_name=="" | paid_count=="" | paid_phone=="" | paid_birth==""){
            swal({
                  title: "예약자정보를 확인해주세요",
                  icon: "warning"
                  })
            return false;
         }else{
        		 swal({
                     title: "작성한 정보 재확인요청",
                     text: "확인 이후 수정이 불가능합니다.",
                     icon: "info",
                     buttons: ["아니요","네"],
                     })
                     .then((네) => {
         //hidden input 값 받아오는 함수
         $('#bookform').append('<input type="hidden" id="client_name" name="client_name" value="'+'${sessionScope.check.client_name}'+'">');
         $('#bookform').append('<input type="hidden" id="tour_date" name="tour_date" value="'+tour_date+'">');
         $('#bookform').append('<input type="hidden" id="paid_name" name="paid_name" value="'+paid_name+'">');
         $('#bookform').append('<input type="hidden" id="paid_count" name="paid_count" value="'+paid_count+'">');
         $('#bookform').append('<input type="hidden" id="paid_phone" name="paid_phone" value="'+paid_phone+'">');
         $('#bookform').append('<input type="hidden" id="paid_birth" name="paid_birth" value="'+paid_birth+'">');
         $('#bookform').append('<input type="hidden" id="paid_kakaoid" name="paid_kakaoid" value="'+paid_kakaoid+'">');
         $('#bookform').append('<input type="hidden" id="paid_total" name="paid_total" value="'+paid_total+'">');
         //hidden input end
         $(this).hide();
         $('#tour_date1').attr('readonly',true);
         $('#paid_name1').attr('readonly',true);
         $('#paid_count1').attr('readonly',true);
         $('#paid_phone1').attr('readonly',true);
         $('#paid_birth1').attr('readonly',true);
         $('#paid_kakaoid1').attr('readonly',true);
                  
        	 });
         }	 
        });
      //유효성검사
      $('#bookbtn').click(function(){
         var tour_date=$('#tour_date1').val();
         var paid_name=$('#paid_name1').val();
         var paid_count=$("#paid_count1 option:selected").val();
         var paid_phone=$('#paid_phone1').val();
         var paid_birth=$('#paid_birth1').val();
      
          if(tour_date=="" | paid_name=="" | paid_count=="" | paid_phone=="" | paid_birth==""){
            swal({
                  title: "예약자정보를 확인해주세요",
                  icon: "warning"
                  })
            return false;
         }
         $('form[name="bookform"]').bind('submit',function(){
            if($('#allclause').prop('checked') == false){
                swal({
                     title: "필수 약관에 동의 하셔야 합니다",
                     icon: "warning"
                     })
                return false;
            }
         });
         
      });
           
      $('#checkcostbtn').click(function(){
         
         var paid_count=$("#paid_count1 option:selected").val();
         var paid_total=Number(paid_count)*Number(${bean.cost });
         if(paid_count==""){
            swal({
                  title: "인원수를 선택해주세요",
                  icon: "warning" //"info,success,warning,error" 중 택1
               })
            return false;
         }
         //총 금액 함수
         $('#infor2 tr:nth-child(1)>td:last').remove();
         $('#infor2 tr:nth-child(1)').append('<td style="color: red;">'+paid_total+'&nbsp원</td>');
         //총금액함수 end
      });
      
   });
</script>
</body>
</html>
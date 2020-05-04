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
		width:585px;
		margin: 0 auto;
		text-align: center;
		padding-top: 30px;
    }
    #client_nick1, #client_id, #nickdupli, #iddupli {
    	display:inline-block;
    }
    .table table-hover{
		width:570px;
		margin: 0 auto;
		text-align: center;
    }
    .list-group{
    	width:550px;
    	margin:0 auto;
    	padding-bottom: 30px;
    }
    #adminbtn{
    	width:550px;
    	margin:0 auto;
    }
    #client_sex{
       width: 400px;
       margin: 0px auto;
       text-align: center;
    }
</style>
</head>
<body>
<jsp:include page="/WEB-INF/menubar.jsp"/>

<!-- contents start -->
<div id="allContain">
	<div class="page-header" id="page-header" align="center">
		<h1>회원가입</h1>
	</div>
   

	<form action="../main/admin" name="adm" class="form-horizontal" method="post">
		<div class="form-group">
			<label for="client_name" class="col-sm-2 control-label">이름</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="client_name" name="client_name" placeholder="이름을 입력하세요" style="width:400px">
			</div>
		</div>
		<div class="form-group">
			<label for="client_nick1" class="col-sm-2 control-label">닉네임</label>
				<input type="text" class="form-control" id="client_nick1" name="client_nick1" placeholder="2-15자 이내만 가능합니다" style="width:400px" maxlength="15">
				<button type="button" id="nickdupli" class="btn btn-default">중복 확인</button>
				<input type="hidden" id="duplicheck1" name="duplicheck1" value="0" style="display: none;">
		</div>
		<div class="form-group">
			<label for="client_id" class="col-sm-2 control-label">아이디</label>
				<input type="text" class="form-control" id="client_id" name="client_id" placeholder="4-15자이내 영문(대,소),숫자만 가능합니다" style="width:400px" maxlength="15">
				<button type="button" id="iddupli" class="btn btn-default">중복 확인</button>
				<input type="hidden" id="duplicheck2" name="duplicheck2" value="0" style="display: none;">
		</div>
		<div class="form-group">
			<label for="client_pw" class="col-sm-2 control-label">비밀번호</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" id="client_pw1" placeholder="영문+숫자 조합 8자리이상" style="width:400px">
				<div id="pw_check1"></div>
			</div>
		</div>
		<div class="form-group">
			<label for="client_pw" class="col-sm-2 control-label">비밀번호확인</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" id="client_pw2" name="client_pw" placeholder="비밀번호를 한번 더 입력해주세요" style="width:400px">
				<div id="pw_check2"></div>
			</div>
		</div>
		<div class="form-group">
			<label for="client_sex" class="col-sm-2 control-label">성별</label>
			<div id="client_sex"><label><input type="radio" name="client_sex" id="man" value="1">&nbsp;남&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
				<label><input type="radio" name="client_sex" id="woman" value="2">&nbsp;여</label>
			</div>
		</div>
		<div class="form-group">
			<label for="client_birth" class="col-sm-2 control-label">이메일</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="client_email" name="client_email" placeholder="E-mail을 입력하세요" style="width:400px">
				<div id="email_check"></div>
			</div>
		</div>
		<div class="form-group">
			<label for="client_phone" class="col-sm-2 control-label">연락처</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="client_phone" name="client_phone" placeholder="연락처를 입력하세요 ex)01012345678" style="width:400px" maxlength="11">
				<div id="phone_check"></div>
			</div>
		</div>
		<div class="form-group">
		<label for="client_birth" class="col-sm-2 control-label">생년월일</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="client_birth" name="client_birth" placeholder="8자리로 입력하세요 ex)19920216" style="width:400px" maxlength="8">
			<div id="birth_check"></div>
		</div>
		</div>
		<ul class="list-group">
			<li class="list-group-item disabled">
				<label><input type="checkbox" id="allclause" name="allclause" value="allclause">&nbsp;전체 약관 동의</label>
			</li>
			<li class="list-group-item"><input type="checkbox" id="chk1" name="clause" value="clause1">&nbsp;<span data-toggle="modal" data-target="#myModal1">회원 가입 및 운영약관 동의 (필수)></span></li>
			<li class="list-group-item"><input type="checkbox" id="chk2" name="clause" value="clause2">&nbsp;<span data-toggle="modal" data-target="#myModal2">개인정보 수집 및 이용 (필수)></span></li>
			<li class="list-group-item"><input type="checkbox" id="chk3" name="clause" value="clause3">&nbsp;<span data-toggle="modal" data-target="#myModal3">위치정보 이용약관 (필수)> </span></li>
		</ul>
       
         <!-- 약관1 start -->
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="myModalLabel">회원 가입 및 운영약관 동의 (필수)</h4>
				</div>
				<div class="modal-body">
					<div style="font-size: 20px;">제 1 조 (목적)</div>
	이 약관은 주식회사 여행사용설명서(이하 "당사"이라 합니다)이 운영하는 웹사이트및 어플리케이션(Application)에서 제공하는 서비스(이하 "서비스"라 합니다)를 이용함에 있어 "당사"와 이용자의 권리 및 의무 및 책임사항을 규정함을 목적으로 합니다.</div>
	<div style="font-size: 20px;">제 2 조 (정의)</div>
	<div>1. "당사"란 서비스를 제공하는 (주)여행사용설명서를 말하며, (주)여행사용설명서 중개 및 판매하는 재화 또는 용역(이하 "재화 등"이라 합니다)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장인 사이버 몰의 의미로도 사용합니다.</div>
	<div>2. "이용자"란 "당사"에 접속하여 이 약관에 따라 "당사"가 제공하는 서비스를 받는 회원을 말합니다.</div>
	<div>3. "회원"이라 함은 "당사"에 개인정보를 제공하여 회원등록을 한 자로서,"당사"의 정보를 지속적으로 제공받으며,"당사"가 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.</div>
	<div>4. “파트너"라고 함은 당사가 여행자에게 중개한 자로서 여행자에게 각종 여행 서비스를 제공하는 자를 말합니다.</div>
	<div>5. "가이드"라고 함은 파트너 중 마이리얼트립 플랫폼을 통해 직접 여행지에서 여행자에게 투어 서비스를 제공하는 자를 말합니다.</div>
				<div class="modal-footer">
				  <button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>         
         <!--약관1 end-->
   <!-- 약관2 start -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">개인정보 수집 및 이용 (필수)</h4>
      </div>
      <div class="modal-body">
 <div style="font-size: 20px;">1. 개인정보 수집 및 이용목적</div>
<div>당사는 여행상품 판매 및 중개, 고객관리 등의 업무를 처리하기 위하여 고객으로부터 최소한의 필수정보를 수집하며, 수집한 모든 개인정보는 고객의 별도 동의가 없는 이상 동의 받은 목적 외 다른 목적으로 사용하지 않습니다.
당사는 다음 목적을 위하여 고객으로부터 수집한 개인정보를 사용합니다.</div>
<div style="font-size: 20px;">2. 개인정보 수집 항목 및 보유 및 이용기간</div>
<div>당사는 고객의 개인정보를 정보통신망법, 개인정보보호법 등 관계법령에 따라 적법한 절차를 거쳐 수집하고, 수집 및 이용 목적에 필요한 최소한의 정보만을 수집하고 있습니다.</div>
<div>또한, 당사는 보유 및 이용기간이 종료된 개인정보를 전자적 파일은 복원이 불가능한 방법으로 영구 삭제하고, 종이 문서는 파쇄 또는 소각함으로써 재생 불가능한 방법으로 파기하고 있습니다.</div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>         
         <!--약관2 end-->
         <!-- 약관3 start -->
<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">위치정보 이용약관 (필수)</h4>
      </div>
      <div class="modal-body">
      <div style="font-size: 20px;"> 제1조 (목적)</div>
<div>본 약관은 회원(주식회사 마이리얼트립의 서비스 이용약관에 동의한 자를 말합니다. 이하 “회원” 또는 “개인위치정보주체”이라고 합니다.)</div>
<div>이 주식회사 마이리얼트립(이하 “당사”라고 합니다.)이 운영하는 웹사이트 및 어플리케이션(Application, 이하 웹사이트와 어플리케이션을 통칭하여 “당사 플랫폼”)에서 제공하는 위치기반서비스(이하 “서비스”라고 합니다.)를 이용함에 있어 당사와 개인위치정보주체(회원)간의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>         

<button type="submit" id="adminbtn" class="btn btn-default btn-lg btn-block">회원가입</button>
 </form>
</div>
    <!-- 약관3 end --> 
<jsp:include page="/WEB-INF/footer.jsp"/>
<script type="text/javascript" src="${root }js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${root }js/bootstrap.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
   $(document).ready(function() {
      //clause
      $('#allclause').click(function() {
         if($('#allclause').prop("checked")){
                $("input[name=clause]").prop("checked",true);
           }else{
                 $("input[name=clause]").prop("checked",false);
           }
       });
      
   //닉네임 중복 검사
   $('#nickdupli').on('click',function() {
          
      var nick = $('#client_nick1').val();
      var nickname =  /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,15}$/;
      var nickcheck = nickname.test($("#client_nick1").val());
      $.ajax({
               url:'../main/nickdupli',
               type:'POST',
               data:{client_nick1:nick},
                success:function(data){
                   
                   var check = data.Nickdupli;
                   
                   if(check == null && nickcheck != false){
                	   swal({
    					   title: "사용가능한 닉네임입니다.",
    					   icon: "info",
    					   button:"확인"
    				  		})
                      $('input[name=duplicheck1]').attr('value', 1);
                   }else if(nickcheck == false){
                      swal({
   					   title: "형식에 맞게 입력하세요",
   					   icon: "warning",
   					   button:"확인"
   					 	 })
                   }else{
                      swal({
      					   title: "이미 사용중인 닉네임입니다",
      					   icon: "warning",
      					   button:"확인"
      					  })
                   }
                }
      });
   });
   
   //아이디 중복검사
   $('#iddupli').on('click',function() {
          
      var id = $('#client_id').val();
      
      var Id = /^[A-Za-z0-9]{4,20}$/;
      var idcheck = Id.test($("#client_id").val());
      
      $.ajax({
               url:'../main/iddupli',
               type:'POST',
               data:{client_id:id},
                success:function(data){
                   
                   var check = data.Iddupli
                   
                   if(check == null && idcheck != false){
                	   swal({
    					   title: "사용가능한 아이디입니다.",
    					   icon: "info",
    					   button:"확인"
    				  		})
                       $('input[name=duplicheck2]').attr('value', 1);
                   }else if(idcheck == false){
                	   swal({
       					   title: "형식에 맞게 입력하세요",
       					   icon: "warning",
       					   button:"확인"
       					 	 })
                   }else{
                	   swal({
      					   title: "이미 사용중인 닉네임입니다",
      					   icon: "warning",
      					   button:"확인"
      					  })
                   }
                }
      });
   });
      
      
      //유효성검사
      
      //이름 정규식
      /* $('#client_name').blur(function(){
         var name = /^[가-힣]{2,4}$/;
         var namecheck = name.test($("#client_name").val());
         
         if(namecheck){
            $('#name_check').text('');
         }else{
            $('#name_check').text('이름을 확인해주세요');
            $('#name_check').css('color', 'red');
         }
      });
      
      //비밀번호 정규식
      $('#client_pw1').blur(function(){
         var pw = /^.*(?=.{8,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
         var pwcheck = pw.test($("#client_pw1").val());
         
         if(pwcheck){
            $('#pw_check1').text('');
         }else{
            $('#pw_check1').text('비밀번호를 확인해주세요');
            $('#pw_check1').css('color', 'red');
         }
      });
      
      //비밀번호 일치 확인
      $('#client_pw2').blur(function(){
         var pw1 = $("#client_pw1").val();
         var pw2 = $("#client_pw2").val();
         if(pw1==pw2){
            $('#pw_check2').text('');
         }else{
            $('#pw_check2').text('비밀번호가 일치하지 않습니다');
            $('#pw_check2').css('color', 'red');
         }
      });
      
      //이메일 정규식
      $('#client_email').blur(function(){
         var email = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
         var emailcheck = email.test($("#client_email").val());
         
         if(emailcheck){
            $('#email_check').text('');
         }else{
            $('#email_check').text('이메일 형식이 아닙니다.');
            $('#email_check').css('color','red');
         }
      });
      
      
      //생년월일 정규식
      $('#client_birth').blur(function(){
         
         var client_birth = $("#client_birth").val();
         
         var year = Number(client_birth.substr(0,4));
         var month = Number(client_birth.substr(4,2));
         var day = Number(client_birth.substr(6,2));
         var today=new Date();
         var yearNow = today.getFullYear()-1;
         
         if( client_birth.length <=8 ){
            if( year>yearNow || year<1900){ // 1900년 - 2019년까지만 입력가능
               
               $('#birth_check').text('생년월일을 확인해주세요');
               $('#birth_check').css('color', 'red');
               
            }else if(month<1 || month>12){ // 1월 - 12월까지만 입력가능
               
               $('#birth_check').text('생년월일을 확인해주세요');
               $('#birth_check').css('color', 'red');
               
            }else if(day<1 || day>31){ // 1일 - 31일까지 입력가능
               
               $('#birth_check').text('생년월일을 확인해주세요');
               $('#birth_check').css('color', 'red');
               
            }else if((month==4 || month==6 || month==9 || month==11) && day == 31){ // 30일까지 있는 달에 31일이 들어가지못하게
               
               $('#birth_check').text('생년월일을 확인해주세요');
               $('#birth_check').css('color', 'red');
               
            }else if(month==2){
               var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)); //윤년
                   
                 if (day>29 || (day==29 && !isleap)) { // 28일까지 입력 가능, 윤년은 29일까지 가능
                    
                    $('#birth_check').text('생년월일을 확인해주세요 :)');
                  $('#birth_check').css('color', 'red'); 
                
               }else{
                  $('#birth_check').text('');
               }
            }else{
               $('#birth_check').text(''); 
            }
         }else{
            
            $('#birth_check').text('8자리로 입력하세요 ex)19920216');
            $('#birth_check').css('color', 'red');
         }
      });
      
         //핸드폰 정규식
          $('#client_phone').blur(function(){
            var phone = /(01[016789])([1-9]{1}[0-9]{2,3})([0-9]{4})$/;
            var phonecheck = phone.test($("#client_phone").val());
            if(phonecheck){
               $('#phone_check').text('');
               return true;
            }else{
               $('#phone_check').text('ex)01012345678');
               $('#phone_check').css('color', 'red');
               return false;
            }
         
         }); */
       
         
      $('form[name="adm"]').bind('submit',function(){
         var name = /^[가-힣]{2,4}$/;
         var namecheck = name.test($("#client_name").val());
         
         var nick =  /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,15}$/;
         var nickcheck = nick.test($("#client_nick1").val());
         
         var id = /^[A-Za-z0-9]{4,20}$/;
         var idcheck = id.test($("#client_id").val());
         
         var pw = /^.*(?=.{8,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
         var pwcheck = pw.test($("#client_pw1").val());
         
         var pw1 = $("#client_pw1").val();
         var pw2 = $("#client_pw2").val();
         
         var email = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
         var emailcheck = email.test($("#client_email").val());
         
         var phone = /(01[016789])([1-9]{1}[0-9]{2,3})([0-9]{4})$/;
         var phonecheck = phone.test($("#client_phone").val());
         
         var client_birth = $("#client_birth").val();
         var year = Number(client_birth.substr(0,4));
         var month = Number(client_birth.substr(4,2));
         var day = Number(client_birth.substr(6,2));
         var today=new Date();
         var yearNow = today.getFullYear();
         
         var duplicheck1 = $("#duplicheck1").val();
         var duplicheck2 = $("#duplicheck2").val();
         
         var agree1 = $("input[name=allclause]").is(':checked');
         var agree2 = $("input[id=chk1]").is(':checked');
         var agree3 = $("input[id=chk2]").is(':checked');
         var agree4 = $("input[id=chk3]").is(':checked');
         
         if(namecheck != true){
            swal({
				   title: "이름을 확인해주세요",
				   icon: "warning",
				   button:"확인"
				  })
            return false;
         }else if(nickcheck != true){
            swal({
				   title: "닉네임을 확인해주세요",
				   icon: "warning",
				   button:"확인"
				  })
            return false;
         }else if(duplicheck1 == 0){
            swal({
				   title: "닉네임 중복 확인을 해주세요",
				   icon: "warning",
				   button:"확인"
				  })
            return false;
         }else if(idcheck != true){
            swal({
				   title: "아이디를 확인해주세요",
				   icon: "warning",
				   button:"확인"
				  })
            return false;
         }else if(duplicheck2 == 0){
        	 swal({
				   title: "아이디 중복 확인을 해주세요",
				   icon: "warning",
				   button:"확인"
				  })
            return false;
         }else if(pwcheck != true){
        	 swal({
				   title: "비밀번호를 확인해주세요",
				   icon: "warning",
				   button:"확인"
				  })
            return false;
         }else if(pw1 != pw2){
            swal({
				   title: "비밀번호가 일치하지 않습니다",
				   icon: "warning",
				   button:"확인"
				  })
            return false;
         }else if($('#man').prop('checked') == false && $('#woman').prop('checked') == false){
            swal({
				   title: "성별을 체크해주세요",
				   icon: "warning",
				   button:"확인"
				  })
            return false;
         }else if(emailcheck != true){
            swal({
				   title: "이메일을 확인해주세요",
				   icon: "warning",
				   button:"확인"
				  })
            return false;
         }else if(phonecheck != true){
        	 swal({
				   title: "연락처를 확인해주세요",
				   icon: "warning",
				   button:"확인"
				  })
            return false;
         }else if($("#client_phone").val() == ""){
        	 swal({
				   title: "연락처를 확인해주세요",
				   icon: "warning",
				   button:"확인"
				  })
		    return false;
         }else if(agree1 != true && (agree2 != true || agree3 != true || agree4 != true)){
        	 swal({
				   title: "약관에 동의해주세요",
				   icon: "warning",
				   button:"확인"
				  })
        	 return false;
         }else if(client_birth.length <=8){
            if( year>2019 || year<1900){ // 1900년 - 2019년까지만 입력가능
            	swal({
 				   title: "생년월일을 확인해주세요",
 				   icon: "warning",
 				   button:"확인"
 				  })
               return false;
            }else if(month<1 || month>12){ // 1월 - 12월까지만 입력가능
            	swal({
  				   title: "생년월일을 확인해주세요",
  				   icon: "warning",
  				   button:"확인"
  				  })
               return false;
            }else if(day<1 || day>31){ // 1일 - 31일까지 입력가능
            	swal({
  				   title: "생년월일을 확인해주세요",
  				   icon: "warning",
  				   button:"확인"
  				  })
               return false;
            }else if((month==4 || month==6 || month==9 || month==11) && day == 31){ // 30일까지 있는 달에 31일이 들어가지못하게
            	swal({
  				   title: "생년월일을 확인해주세요",
  				   icon: "warning",
  				   button:"확인"
  				  })
               return false;
            }else if(month==2){
               var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)); //윤년
                            
               if (day>29 || (day==29 && !isleap)) { // 28일까지 입력 가능, 윤년은 29일까지 가능
            	   swal({
     				   title: "생년월일을 확인해주세요",
     				   icon: "warning",
     				   button:"확인"
     				  })
                  return false;
               }else{
                  return true;
               }
            }else{
               return true;
            }
            return false;
         }else{
        	 swal({
				   title: "회원가입이 완료되었습니다.",
				   icon: "success",
				   button:"확인"
				  })
            return true;
         }
         
      });
      
   
   
   });
      
</script>
</body>
</html>
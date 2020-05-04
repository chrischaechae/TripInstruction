<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="utf-8" %>
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Jua|Noto+Sans+KR&display=swap" rel="stylesheet">
<c:url value="/" var="root"></c:url>
<html>
<head>
<meta charset="utf-8">
<!-- 카카오 API -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<link rel="stylesheet" type="text/css" href="${root }css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="${root }css/travel.css" />
<link href="https://github.com/uniqueHRH/final/blob/master/project/src/main/webapp/imgs/shortlogo.png?raw=true" rel="shortcut icon" type="image/x-icon">
<style type="text/css">
    #table {
      	font-family:"Jua";
      	padding-left: 200px;
    }
 
    form{
      	width:550px;
      	margin: 0 auto;
      	text-align: center;
      	padding:0 0 155 0;
    }
    #loginbar{
    	width: 800px;
    	margin: 0px auto;
    	padding-bottom: 50px;
    	padding-top: 30px;
    }
    #insertid{
    	padding-top: 20px;
    }
    #findid,#findpw{
       margin-top: 20px;
       width:200px;
    }
    #loginbtn{
       margin: 0px auto;
       text-align:center;
       width: 330px;      
    }
    #idd,#pww {
       display:inline-block;
      
    }
 
</style>

</head>
<body>
<jsp:include page="/WEB-INF/menubar.jsp"/>
                        <!-- menubar start -->
<!-- menubar end -->
	<div id="table">
<!-- contents start -->
			<div class="page-header" align="center">
				<h1>로그인</h1>
			</div>
<!-- loginbar start-->
			<ul class="nav nav-tabs nav-justified" id="loginbar">
				<li role="presentation" class="active"><a href="${root }main/login">회원로그인</a></li>
			  	<li role="presentation"><a href="${root }main/stafflogin">직원로그인</a></li>
			</ul>
<!-- loginbar end -->
      
<!-- 고객로그인start -->
			<form action="../main/login" name="lac" class="form-horizontal" method="post">
				<div class="form-group" id="insertid">
					<label for="client_name" class="col-sm-2 control-label" id="idd">아이디</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="client_id" name="client_id" placeholder="아이디를 입력하세요" style="width:350px">
					</div>
				</div>
				<div class="form-group">
					<label for="client_pw" class="col-sm-2 control-label" id="pww">비밀번호</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="client_pw" name="client_pw" placeholder="비밀번호를 입력하세요" style="width:350px">
					</div>
				</div>
				
    			 <input type="hidden" id="msg" value="${msg }">
    		
				<button type="submit" id="loginbtn" class="btn btn-default btn-lg btn-block">로그인</button>
			<div>
				<a href="${root }main/login/findid"><button type="button" id="findid" class="btn btn-default btn-lg">아이디 찾기</button></a>
				<a href="${root }main/login/findpw"><button type="button" id="findpw" class="btn btn-default btn-lg">비밀번호 찾기</button></a>
				<!-- <br/>--------------------------------------또는--------------------------------------
					<a id="kakao-login-btn"></a>
					<a href="http://developers.kakao.com/logout"></a>
			        <button type="button" id="facebookbtn" class="btn btn-default btn-lg btn-block">페이스북으로 로그인</button>
			        <button type="button" id="naverbtn" class="btn btn-default btn-lg btn-block">네이버로 로그인</button> -->
			</div>
			</form>
	</div>
<!-- contents end -->

<jsp:include page="/WEB-INF/footer.jsp"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="${root }js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${root }js/bootstrap.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
   $(document).ready(function() {
	$('form[name="lac"]').bind('submit',function(){
		var id = $("#client_id").val();
		var pw = $("#client_pw").val();
		
		if(!id || !pw){
			swal({
				   title: "아이디와 비밀번호를 확인해주세요",
				   icon: "warning",
				   button: "확인"
				})
			return false;
		}else{
			return true;
		}
	});
	var message = $("#msg").val();
	if(message=='fail'){
		swal({
			   title: "아이디와 비밀번호를 확인해주세요",
			   icon: "warning",
			   button: "확인"
			})
	}
	
	// 카카오 로그인
	// 카카오 로그인으로 받아올 수 있는 정보
	// 1. id : 유저 고유 ID (String, int)
	// 2. kaccount_email : 사용자 카카오계정 이메일 (String)
	// 3. kaccount_email_verified : 인증받은 이메일인지 . 미인증 이메일은 변경될 수 있음 (boolean)
	// 4. properties : 사용자 정보 . JSON . 키를 지정하면 값을 가져올 수 있다
	//<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('acc658a670e9ed5918d11647040b5bc5');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
        // 로그인 성공시, API를 호출합니다.
        Kakao.API.request({
          url: '/v2/user/me',
          success: function(res) {
			/* 
            console.log(res);
			console.log(res.kakao_account);   // 계정정보 전체 받아온다
            console.log(res.properties.nickname);
			console.log(res.properties.profile_image);   // 예전거가 뜨긴한데..
			console.log(res.id);   // 숫자형태의 id
			console.log(res.kakao_account.email);
			console.log(res.kakao_account.birthday);   // 생일
			console.log(res.kakao_account.gender);   // 성별
			 */
			
            
			// document.write(res.properties.nickname+"님 환영합니다.");   // 정상적으로 화면 전환됨
          },
          fail: function(error) {
            alert(JSON.stringify(error));
          }
        });
      },
      fail: function(err) {
        alert(JSON.stringify(err));
      }
    });
  //]]>
	
	
	});
	
</script>
</body>
</html>
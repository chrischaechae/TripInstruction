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
		padding-left:150px;
		font-family: 'Jua';
	}
	form {
		width:750px;      
		margin:0 auto;
		font-size:18px;
		align:center;
		text-align:center;
		padding:70 0 0 0;
	}
	label {
		display:inline-block;
		width:100px;
	}
	#staff_name, #staff_phone, #staff_email, #staff_team {
		display:inline-block;
		width:300px;
	}
    #adminbtn,#cancelbtn{
       width: 190px;
       position: relative;
       left: 20px;
       display: inline;
       margin-top: 20px;
    }
    #img {
    	padding:0;
    	border-radius:2%;
    	border:1px solid gray;
    }
    #contentM {
    	padding:20 60 0 0;
    }
    #board_img, #dele {
    	display:inline-block;
    }
</style>
</head>
<body>
<jsp:include page="/WEB-INF/menubar.jsp"/>

<!-- contents start -->
<div id="allContain">
	<div class="page-header" id="page-header" align="center">
		<h1>직원 등록</h1>
	</div>
   
	<form action="../system/staffIns" name="adm" class="form-horizontal" method="post" enctype="multipart/form-data">
	  
		<div class="upload">
			<div class="board_img"><img src="" id="img"/></div>
			<input type="file" id="board_img" name="file" />
			<a class="btn btn-default" role="button" id="dele">삭제</a>
		</div>
		<div id="contentM">
		  <div class="form-group" id="staff_name1">
		    <label for="staff_name">이 름</label>
		      <input type="text" class="form-control" id="staff_name" name="staff_name">
		  </div>
		  <div class="form-group">
		    <label for="staff_phone">연락처</label>
		      <input type="text" class="form-control" id="staff_phone" name="staff_phone">
		  </div>
		  <div class="form-group">
		    <label for="staff_email">이메일</label>
		      <input type="text" class="form-control" id="staff_email" name="staff_email">
		  </div>
		  <div class="form-group">
		    <label for="staff_team">부 서</label>
		     <select class="form-control" id="staff_team" name="staff_team">
				    <option value="경영">경영</option>
				    <option value="인사">인사</option>
				    <option value="CS">CS</option>
				    <option value="디자인">디자인</option>
				    <option value="마케팅">마케팅</option>
				</select>
			</div>
		</div>
       
		<button type="submit" id="adminbtn"  class="btn btn-default btn-lg">등록 완료</button>
		<button type="button" id="cancelbtn" class="btn btn-default btn-lg" onclick="location.href='../system/staff'">취 소</button>
	</form>
</div>

<jsp:include page="/WEB-INF/remote.jsp"/>
<jsp:include page="/WEB-INF/socket.jsp"/>
<jsp:include page="/WEB-INF/footer.jsp"/>
<script type="text/javascript" src="${root }js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${root }js/bootstrap.js"></script>
<script type="text/javascript">
   $(document).ready(function() {
		// 파일업로드
		$('#dele').hide();
		$('#board_img').change(function(){
			if(this.files && this.files[0]) {
				var reader = new FileReader;
				reader.onload = function(data) {
					$('.board_img img').attr('src', data.target.result).width(200);
					$('.board_img img').attr('src', data.target.result).height(200);
				}
				reader.readAsDataURL(this.files[0]);
				$('#dele').toggle();
			}
		});
		
		$('#dele').on('click', function() {
			$('#board_img').val('');
			$('#img').attr('src','');

		});
		
   });
      
</script>
</body>
</html>
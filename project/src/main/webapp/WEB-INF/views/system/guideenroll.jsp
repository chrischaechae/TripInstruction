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
		padding-left:170px;
		font-family: 'Jua';
	}
	form {
		width:500px;      
		margin:0 auto;
		font-family: 'Jua';
		font-size:18px;
		align:center;
		text-align:center;
		padding:70 0 0 0;
	}
	#formSub {
		padding:0 0 0 50;
	}
	#guide_name, #guide_phone, #guide_city, #guide_email {
		width:300px;
	}
	#btn {
		text-align:center;
		padding:10 0 0 0;
	}
    #board_img, #dele {
    	display:inline-block;
    }
    #adminbtn,#cancelbtn{
       width: 170px;
       display: inline;
    }
</style>
</head>
<body>
<jsp:include page="/WEB-INF/menubar.jsp"/>

<!-- contents start -->
<div id="allContain">
	<div class="page-header" id="page-header" align="center">
		<h1>가이드 등록</h1>
	</div>

	<form action="../system/guideIns" class="form-horizontal" method="post" enctype="multipart/form-data">
		<div class="upload">
			<div class="board_img"><img src="" id="img"/></div>
			<input type="file" id="board_img" name="file" />
			<a class="btn btn-default" role="button" id="dele">삭제</a>
		</div>
		<div id="formSub">
			<div class="form-group">
				<label for="guide_name" class="col-sm-2 control-label">이 름</label>
				<input type="text" class="form-control" id="guide_name" name="guide_name">
			</div>
			<div class="form-group">
				<label for="guide_phone" class="col-sm-2 control-label">연락처</label>
				<input type="text" class="form-control" id="guide_phone" name="guide_phone">
			</div>
			<div class="form-group">
				<label for="guide_city" class="col-sm-2 control-label">지 역</label>
				<input type="text" class="form-control" id="guide_city" name="guide_city">
			</div>
			<div class="form-group">
				<label for="guide_email" class="col-sm-2 control-label">이메일</label>
				<input type="text" class="form-control" id="guide_email" name="guide_email">
			</div>
		</div>
		<div id="btn">
			<button type="submit" id="adminbtn" class="btn btn-default btn-lg">등록 완료</button>
			<button type="button" id="cancelbtn" class="btn btn-default btn-lg" onclick="location.href='../system/guide'">취 소</button>
		</div>
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
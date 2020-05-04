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
		width:900px;      
		margin:0 auto;
		font-family: 'Jua';
		font-size:17px;
		align:center;
		text-align:center;
		padding:50 0 0 0;
	}
	.upload {
		text-align:left;
	}
	#uploadI {
    	padding:0;
    	width:200px;
		height:200px;
		border:1px solid #e8e8e8;
		border-radius:2%;
    	border:1px solid gray;
    	position: relative;
    	left: 300px;
    }
	#board_img, #dele {
    	display:inline-block;
    }
    #infocomm{
    	font-size: 20px;
    }
	#table tr{
		text-align: center;
	}
	#table tr td{
		text-align: center;
		font-size: 15px;
	}
	#changeinfobtn{
		width: 150px;
	}
	#guide_city{
		margin-top: -30px;
	}
	#board_img{
		position: relative;
		left: 300px;
		padding-bottom: 30px; 
	}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/menubar.jsp"/>

<div id="allContain">
	<div class="page-header" align="center">
		<h1>가이드 정보</h1>
	</div>
	<form class="form-horizontal" method="post" enctype="multipart/form-data">
		<div class="upload">
			<div class="board_img">
				<img src="${root }resources/${bean.guide_thumb }" id="uploadI"/>
				<input type="hidden" name="guide_img" value="${bean.guide_thumb }"/>
				<input type="hidden" name="guide_thumb" value="${bean.guide_img }"/>
			</div>
			<input type="file" id="board_img" name="file" />
		</div>
		
	<div id="table">
		<table class="table table-hover">
		<tr>
			<td width="30%">번호/이름</td>
			<td width="40%">번호<br/></br>이름</td>
			<td width="50%">${bean.guide_no }<br/></br><input type="text" class="form-control" id="guide_name" name="guide_name" value="${bean.guide_name }"/></td>
			<input type="hidden" class="form-control" id="guide_no" name="guide_no" value="${bean.guide_no }"/>
		</tr>
		<tr>
			<td>연락처/지역</td>
			<td>연락처<br/><br/>지역</td>
			<td><input type="text"  class="form-control" id="guide_phone" name="guide_phone" value="${bean.guide_phone }"/><br/><br/><input type="text" class="form-control" id="guide_city" name="guide_city" value="${bean.guide_city }"/></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>이메일</td>
			<td><input type="text" class="form-control" id="guide_email" name="guide_email" value="${bean.guide_email }"/></td>
		</tr>
	   </table>
	 <button type="submit" id="changeinfobtn" class="btn btn-default">수정완료</button>
	 <a href="../guideDe/${bean.guide_no}"><button type="button" id="changeinfobtn" class="btn btn-default">취 소</button></a>
	</div>
</form>
</div>
      
<!-- contents end -->
<jsp:include page="/WEB-INF/remote.jsp"/>
<jsp:include page="/WEB-INF/socket.jsp"/>
<jsp:include page="/WEB-INF/footer.jsp"/>
<script type="text/javascript" src="${root }js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${root }js/bootstrap.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	// 이미지 수정
	var img='${bean.guide_thumb }';
	if(img=='') {
		$('#dele').hide();
	}
	$('#board_img').change(function(){
		if(this.files && this.files[0]) {
			var reader = new FileReader;
			reader.onload = function(data) {
				$('.board_img img').attr('src', data.target.result).width(200);
				$('.board_img img').attr('src', data.target.result).height(200);        
			}
			reader.readAsDataURL(this.files[0]);
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

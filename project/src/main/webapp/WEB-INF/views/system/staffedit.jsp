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
		width:700px;      
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
    	left: 230px;
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
	#staff_email{
		margin-top: -30px;
	}
	#board_img{
		position: relative;
		left: 230px;
		padding-bottom: 30px;
	}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/menubar.jsp"/>

<div id=allContain>
	<div class="page-header" align="center">
		<h1>직원 정보</h1>
	</div>
	<form name="adm" class="form-horizontal" method="post" enctype="multipart/form-data"> 	 
		<div class="upload">
			<div class="board_img">
				<img src="${root }resources/${bean.staff_thumb }" id="uploadI"/>
				<input type="hidden" name="staff_img" value="${bean.staff_thumb }"/>
				<input type="hidden" name="staff_thumb" value="${bean.staff_img }"/>
			</div>
			<input type="file" id="board_img" name="file" />
		</div>
		
		<div id="table">
			<table class="table table-hover">
				<tr>
					<td width="150px">사번/이름</td>
					<td width="200px">사번<br/></br>이름</td>
					<td width="350px">${bean.staff_no }<br/></br><input type="text" class="form-control" id="staff_name" name="staff_name" value="${bean.staff_name }"/></td>
				<input type="hidden" class="form-control" id="staff_no" name="staff_no" value="${bean.staff_no }"/>
				</tr>
				<tr>
					<td>연락처/이메일</td>
					<td>연락처<br><br>이메일</td>
					<td><input type="text" class="form-control" id="staff_phone" name="staff_phone" value="${bean.staff_phone }"/><br><br><input type="text" class="form-control" id="staff_email" name="staff_email" value="${bean.staff_email }"/></td>
				</tr>
				<tr>
					<td>부서/입사일</td>
					<td>부서<br><br><br>입사일</td>
					<td>
					<select class="form-control" id="staff_team" name="staff_team" >
					    <option value="경영" <c:if test="${bean.staff_team eq '경영'}">selected</c:if>>경영</option>
						<option value="인사" <c:if test="${bean.staff_team eq '인사'}">selected</c:if>>인사</option>
						<option value="CS" <c:if test="${bean.staff_team eq 'CS'}">selected</c:if>>CS</option>
						<option value="디자인" <c:if test="${bean.staff_team eq '디자인'}">selected</c:if>>디자인</option>
						<option value="마케팅" <c:if test="${bean.staff_team eq '마케팅'}">selected</c:if>>마케팅</option>
				</select>
				<br>${bean.staff_joindate }</td>
				</tr>
			</table>
		<button type="submit" id="changeinfobtn" class="btn btn-default">수정완료</button>
		<a href="../staffDe/${bean.staff_no}"><button type="button" id="changeinfobtn" class="btn btn-default">취 소</button></a>
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
		var img='${bean.staff_thumb }';
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

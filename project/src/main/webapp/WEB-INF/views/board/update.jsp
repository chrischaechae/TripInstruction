<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		width:950px;
		margin:0 auto;
		padding-left:100px;
		font-family:"Jua";
	}
	form {
     	width:1000px;
		padding:0;
		font-size:17px;
	}
	.form-group {
		width:1100px;
	}
	#select {
		width:800px;
		margin:0 auto;
	}
	label {
		font-weight:normal;
		padding:0;
		width:80px;
	}
	#sub {
		width:1000px;
		margin:0 auto;
		text-align:center;      
	}
	#sub_sub {
		width:1000px;
		margin:0 auto;
		text-align:center;      
		padding:5 0;
	}
	#textarea {
		width:1000px;
		margin:0 auto;
		padding:10 0 10 100;
	}
	#theme {
		width:800px;
		margin:0 auto;
		text-align:center;
		padding:20 0 20 200;
	}
/* 나라 선택 */   
	#land {
		border-radius:5px;
		font-size:14px;
		text-align:center;
		width:85px;
		height:33px;
		padding:0px 0px 0px 5px;
	}
	#land:hover {
		background-color:#e8e8e8;
	}
	#land>option {
		font-size:13px;
		text-align:center;
		font-weight:normal;
	}
	#board_sub, #client_nick1, #board_date, #board_count, #board_content {
		background-color:white;
	}
	#board_sub {
		width:670px;
		align:left;
		text-align:left;
	}
	#client_nick1, #board_date, #board_count {
		width:161px;
	}
	#btn {
		width:1100px;
		text-align:center;
	}
/* 이미지 수정 */
	.board_img img {
		margin:20px 0;
	}
	.upload {
		width:800px;
		padding:10 0 0 0;
		margin:0 auto;
	}
	#board_img {
		display:inline-block;
		width:245px;
	}
	#deleImg {
		display:inline-block;
	}
	.swal-text {
		text-align:center;
		font-size:25px;
		font-weight:bold;
	}
	#uploadI {
		width:300px;
	}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/menubar.jsp"/>

<!-- contents start -->
<div id="allContain">
	<div class="page-header" id="page-header" align="center">
		<h1>나의 여행기</h1>
	</div>
	      
	<!-- 제목 -->
	<form class="form-inline" method="POST" enctype="multipart/form-data">
		<div id="select">
			<select id="land" name="board_land" style="cursor:pointer">
				<option value="${bean.board_land }">${bean.board_land }</option>
				<option value="중국/일본">중국/일본</option>
				<option value="동남아시아">동남아시아</option>
				<option value="아메리카">아메리카</option>
				<option value="유&nbsp; &nbsp; &nbsp;럽">유&nbsp; &nbsp; &nbsp;럽</option>
				<option value="남태평양">남태평양</option>
				<option value="아프리카">아프리카</option>
			</select>
		</div>
		<div class="form-group" id="sub">
			<label for="exampleInputName2" id="subject">제 &nbsp; 목</label>
			<input type="text" class="form-control" id="board_sub" name="board_sub" value="${bean.board_sub }">
			<input type="hidden" id="board_no" name="board_no" value="${bean.board_no }">
		</div>
		<div id="sub_sub">
			<label for="exampleInputName2">닉네임</label>
			<input type="text" class="form-control" id="client_nick1" value="${bean.client_nick1 }" style="cursor:default" disabled>
		&nbsp; &nbsp;
			<fmt:formatDate value="${bean.board_date}" pattern="yyyy-MM-dd HH:mm" var="date"/>
			<label for="exampleInputEmail2">작성일</label>
			<input type="email" class="form-control" id="board_date" value="${date }" style="cursor:default" disabled>
		&nbsp; &nbsp;
			<label for="exampleInputEmail2">조회수</label>
			<input type="email" class="form-control" id="board_count" value="${bean.board_count }" style="cursor:default" disabled>
		</div>
		<div id="textarea">
			<textarea class="form-control" id="board_content" name="board_content">${bean.board_content }</textarea>
		</div>
		<!-- 테마 선택 -->	
		<div class="checkbox" align="center" id="theme">
			<label class="checkbox-inline">
				<input type="checkbox" id="inlineCheckbox1" name="theme" value="힐링">힐링
			</label>
			<label class="checkbox-inline">
				<input type="checkbox" id="inlineCheckbox2" name="theme" value="스냅">스냅
			</label>
			<label class="checkbox-inline">
				<input type="checkbox" id="inlineCheckbox3" name="theme" value="액티비티">액티비티
			</label>
			<label class="checkbox-inline">
				<input type="checkbox" id="inlineCheckbox4" name="theme" value="식도락">식도락
			</label>
			<label class="checkbox-inline">
				<input type="checkbox" id="inlineCheckbox5" name="theme" value="영화">영화
			</label>
			<label class="checkbox-inline">
				<input type="checkbox" id="inlineCheckbox6" name="theme" value="스포츠">스포츠
			</label>
			
			<input type="hidden" id="board_theme" name="board_theme" value="${bean.board_theme }">
		</div>
	<!-- 이미지 수정 -->
		<div class="upload">
			<input type="file" id="board_img" name="file" />
			<a class="btn btn-default" role="button" id="deleImg">삭제</a>
			<div class="board_img">
				<img src="${root }resources/${bean.board_thumb }" id="uploadI"/>
				<input type="hidden" name="board_img" value="${bean.board_thumb }"/>
				<input type="hidden" name="board_thumb" value="${bean.board_img }"/>
			</div>
		</div>
		
		<div id="btn">
			<button type="submit" class="btn btn-default" id="subm">수정완료</button> &nbsp;
			<button type="reset" class="btn btn-default" id="dele">초기화</button> &nbsp;
			<button type="button" class="btn btn-default" id="goList">작성취소</button>
		</div>
	</form>
</div>
<jsp:include page="/WEB-INF/remote.jsp"/>
<jsp:include page="/WEB-INF/socket.jsp"/>
<jsp:include page="/WEB-INF/footer.jsp"/>
<script type="text/javascript" src="${root }js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${root }js/bootstrap.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="${root }ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		CKEDITOR.replace('board_content');
		
		$('#dele').hide();
		// 테마 불러오기
		var theme=$('#board_theme').val();
		var chkbox=$('input[type=checkbox]');
		
 		theme=theme.split(',');
		
		for(i=0; i<theme.length; i++) {
			
			for(j=0; j<chkbox.length; j++) {
				if(theme[i]==chkbox[j].value) {
					chkbox[j].checked=true;
				}
			}
		}
		
		// 체크박스 선택 개수 제한
		$('input[type=checkbox]').on('click',function() {
			var cnt=$('input[type=checkbox]:checked').length;
			if(cnt>3) {
				$(this).attr('checked',false);
				swal({
					text:'테마는 최대\n"세 개까지 선택이 가능합니다',
					icon:'warning',
					button:'확인'
				})
			}
		});
		
		// 체크박스 값 넘기기
		$('#subm').on('click',function() {
			var pick=Array();
			var pick_cnt=0;
			var chkbox=$('input[type=checkbox]');
			
			for(i=0; i<chkbox.length; i++) {
				if(chkbox[i].checked==true) {
					pick[pick_cnt]=chkbox[i].value;
					pick_cnt++;
				}
			}
			$('#board_theme').val(pick);
			
		});
		var thu=$('input[name=board_thumb]').val();
		if(thu) {
			$('#dele').show();
		}
		// 이미지 수정
		$('#board_img').change(function(){
			if(this.files && this.files[0]) {
				var reader = new FileReader;
				reader.onload = function(data) {
					$('.board_img img').attr('src', data.target.result).width(200);        
				}
				reader.readAsDataURL(this.files[0]);
			}
		});
		$('#deleImg').on('click', function() {
			$('#board_img').val('');
			$('#uploadI').attr('src','');

		});
		// 취소버튼
		$('#goList').on('click',function() {
			swal({
				title: "작성내용이 사라집니다\n그래도 돌아가시겠습니까?",
				icon: "warning",
				buttons: ["아니요", "네"]
			}).then((네) => {
				if(네) {
					location.href="../reviewDe/${bean.board_no}";
				}
			})
		});      
   });
</script>
</body>
</html>

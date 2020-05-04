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
	#table {
		width:900px;      
		margin:0 auto;
		font-family: 'Jua';
		font-size:17px;
		align:center;
		text-align:center;
		padding:50 0 0 0;
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
	#editbtn, #delbtn, #listbtn {
		width:150px;
		height:35px;
		padding:0 0 0 10;
	}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/menubar.jsp"/>

                     <!-- contents start -->
 
 <div id="allContain">
 	 <div class="page-header" align="center">
    	 <h1>회원 관리</h1>
  	 </div>
	<div id="table">
		<table class="table table-hover">
		<tr>
			<td width="30%">NO/이름</td>
			<td width="40%">NO<br/></br>이름</td>
			<td width="50%">${bean.client_no }<br/></br>${bean.client_name }</td>
		</tr>
		<tr>
			<td>ID/닉네임</td>
			<td>ID<br/><br/>닉네임</td>
			<td>${bean.client_id }<br/><br/>${bean.client_nick1 }</td>
		</tr>
		<tr>
			<td>연락처/이메일</td>
			<td>연락처<br><br>이메일</td>
			<td>${bean.client_phone }<br><br>${bean.client_email }</td>
		</tr>
		<tr>
			<td>생년월일/가입일</td>
			<td>생년월일<br><br>가입일</td>
			<td>${bean.client_birth }<br><br>${bean.client_joindate }</td>
		</tr>
	   </table>
	 <input type="hidden" id="clientno" value="${bean.client_no }">
	 <a href="../clientEdit/${bean.client_no }"><button type="button" id="editbtn" class="btn btn-default">수 정</button></a>
	 <button type="button" id="delbtn" class="btn btn-default">삭 제</button>
	 <a href="../client"><button type="button" id="listbtn" class="btn btn-default">목 록</button></a>
	</div>
</div>
      
<!-- contents end -->
<jsp:include page="/WEB-INF/remote.jsp"/>
<jsp:include page="/WEB-INF/socket.jsp"/>
<jsp:include page="/WEB-INF/footer.jsp"/>
<script type="text/javascript" src="${root }js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${root }js/bootstrap.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
   $(document).ready(function() {
		$("#delbtn").on('click',function(){
			swal({
				  title: "삭제하시겠습니까?",
				  //text: "", (""안에 내용쓰면 title 밑에 작은 글씨로 들어감)
				  icon: "warning", //"info,success,warning,error" 중 택1
				  buttons: ["아니요", "네"]//버튼 내용 작성가능
				})//삭제버튼 클릭했을 때 이벤트
				.then((네) => {//네 클릭했을 때 이벤트
				  if (네) {
						    $.ajax({
						    	url:'../clientDel',
			               	 	type:'POST',
			               	 	data:{key:$('#clientno').val()},
				                  success:function() {
									    swal({
									      title: "삭제되었습니다.",
									      icon: "success",
									      button: "확인"
									    })
									    .then((확인) => {//확인 클릭했을 때 이벤트
									    	location.href="../client";
									    });	
				                  },
				                  error:function() {
				                  }
				            });//ajax
					  } else {
						    swal({
						    	title: "삭제에 실패했습니다",
						    	icon: "error",
						    	button: "확인"
						    })
					  }//if 
			});
			
		});
		
   });
</script>
</body>
</html>

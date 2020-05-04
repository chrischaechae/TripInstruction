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
<link rel="stylesheet" type="text/css" href="${root }css/boardDetail.css" />
<link href="https://github.com/uniqueHRH/final/blob/master/project/src/main/webapp/imgs/shortlogo.png?raw=true" rel="shortcut icon" type="image/x-icon">
<style type="text/css">
   
</style>
</head>
<body>
<jsp:include page="/WEB-INF/menubar.jsp"/>


<!-- contents start -->
<div id="allContain">
	<div class="page-header" id="page-header" align="center">
		<h1>공지사항</h1>
	</div>
      
	<!-- 제목 -->
	<form class="form-inline" method="POST">
	   <div>
			<input type="text" class="form-control" id="board_sub" name="board_sub" value="${bean.notice_sub }" style="cursor:default" disabled>
			<input type="hidden" id="board_no" name="board_no" value="${bean.notice_no }">
			<input type="hidden" id="log" name="log" value="${sessionScope.staffcheck.staff_name}">
	   </div>
	   <p></p>
	   <div>
	      <div class="form-group" align="left">
	         <label for="exampleInputName2">닉네임</label>
	         <input type="text" class="form-control" id="client_nick1" name="client_nick1" value="관리자" style="cursor:default" disabled>
	      </div>
	      &nbsp; &nbsp;
	      <div class="form-group">
	         <label for="exampleInputEmail2">조회수</label>
	         <input type="text" class="form-control" id="board_count" value="${bean.notice_count }" style="cursor:default" disabled>
	      </div>
	      &nbsp; &nbsp;
	      <div class="form-group" align="left">
	      	<label for="exampleInputEmail2">작성일</label>
			<input type="text" class="form-control" id="board_date" value="${bean.notice_date }" style="cursor:default" disabled>
	      </div>
	   </div>
	   <p></p>
	   <div contenteditable="false" id="contentM">
			<img src="${root }resources/${bean.notice_thumb }" id="board_thumb"/>
			<input type="hidden" id="hiddenI" value="${bean.notice_thumb }"/>
			<div id="contentS">${bean.notice_content }</div>
	   </div>
	   <p></p>
	   <div id="btn">
	      <button type="button" class="btn btn-default" id="subm">수정하기</button>
	      <button type="button" class="btn btn-default" id="dele">삭제하기</button>
	      <button type="button" class="btn btn-default" id="goList">목록으로</button>
	   </div>
	
	</form>
</div>
<!-- contents end -->
<jsp:include page="/WEB-INF/remote.jsp"/>
<jsp:include page="/WEB-INF/socket.jsp"/>
<jsp:include page="/WEB-INF/footer.jsp"/>
</body>
<script type="text/javascript" src="${root }js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${root }js/bootstrap.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
   $(document).ready(function() {
		// 이미지가 없을 때 출력되지 않도록
		var img=$('#hiddenI').val();
		var text='none.png';
		
		$('#contentM').on( 'keyup', 'textarea', function (e){
			$(this).css('height', 'auto' );
			$(this).height( this.scrollHeight );
		});
		$('#contentM').find( 'textarea' ).keyup();
		
		var contents=$('#contentS').html();
		contents=contents.replace(/(\n|\r\n)/g, '<br>');
		$('#contentS').html(contents);
		
		if(img.indexOf(text)!=-1) {
			$('#board_thumb').remove();
		}
		if(img=='') {
			$('#board_thumb').remove();
		}
		
		// 작성자만 수정/삭제 가능
		var log=$('#log').val();
		if(log=='') {
			$('#subm').hide();
			$('#dele').hide();
		}
		// 수정버튼
		$('#subm').on('click',function() {
			location.href="../noticeUp/${bean.notice_no}";
		});
      
      // 삭제버튼
		$('#dele').on('click',function() {
			swal({
				  title: "삭제하시겠습니까?",
				  icon: "warning",
				  buttons: ["아니요", "네"]
			}).then((네) => {
				if(네) {
					$.ajax({
		                  url:'../noticeDel',
		                  type:'POST',
		                  data:{key:$('#board_no').val()},
		                  success:function() {
		                	  swal({
		                			title:'삭제되었습니다',
		                			icon:'warning',
		                			button:'확인'
		                		}).then((확인) => {
				                      location.href="../notice";
		                		})
		                  },
		                  error:function() {
		                	  swal({
		                			title:'삭제에 실패했습니다',
		                			icon:'success',
		                			button:'확인'
		                		}).then((확인) => {
		                			reload();
		                		})
		                  }
		            });
				}
			})
		});

      	$('#goList').on('click', function() {
	      	location.href="../notice";
      	});
      	
      function reload() {
    	  location.reload();
      }
      
   });
   
</script>
</html>

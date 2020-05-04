<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page pageEncoding="utf-8" import="com.bit.project.model.entity.*, java.util.List"%>
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Jua|Noto+Sans+KR&display=swap" rel="stylesheet">
<c:url value="/" var="root"></c:url>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<link rel="stylesheet" type="text/css" href="${root }css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="${root }css/travel.css" />
<link rel="stylesheet" type="text/css" href="${root }css/board.css" />
<link href="https://github.com/uniqueHRH/final/blob/master/project/src/main/webapp/imgs/shortlogo.png?raw=true" rel="shortcut icon" type="image/x-icon">
<style type="text/css">
	#allContain {
		width:1000px;
		margin:0 auto;
		padding-left:120px;
		font-family: 'Jua';
	}
	#containerTable {
		width:1000px;
		margin:0 auto;
		padding:10 0;
		font-size:16px;
	}
	#containerTable>thead th:nth-child(1) {
		width:120;
	}
	#containerTable>thead th:nth-child(2) {
		width:600;
	}
	#containerTable>thead th:nth-child(3) {
		width:180;
	}
	#containerTable>thead th:nth-child(4) {
		width:100;
	}
	#containerTable>tbody td:nth-child(3) {
		text-align:left;
	}
	#containerTable>tbody td:nth-child(2),
	#containerTable>tbody td:nth-child(3) {
		text-align:left; 
	}
	#containerTable>tbody td>a {
		text-decoration:none;
	}
	#containerTable>tbody td>a:hover {
		color:black;
	}
	.board_id {
		border:0;
		outline:0;
		width:75;
		background-color:rgba(1,1,1,0);
		padding:0 0 0 13;
		margin:0;
	}
	td {
		cursor:pointer;
	}
	img {
		width:100px;
		padding:0px;
		margin:0px;
	}
</style>

</head>
<body>
   <!-- menubar start -->
<jsp:include page="/WEB-INF/menubar.jsp"/>
<!-- contents start -->
<div id="allContain">
	<div class="page-header" id="page-header" align="center">
		<h1>내가 쓴 글</h1>
	</div>
   
	
   
	<table class="table table-hover" id="containerTable">
	<!-- 정렬 드롭다운 -->
		<div class="topMenu" id="theme">
			<input type="text" value="<c:out value="${listCnt}"></c:out>개의 게시물이 조회되었습니다" id="listCnt" disabled/>
			<div id="fff"></div>
		   <input type="hidden" id="loginCk" value="${sessionScope.check.client_nick1}"/>
		</div>
	
	<!-- 리스트 출력 -->
	   <thead>
	      <tr class="active">
	         <th colspan="2">게시판</th>
	         <th>제 목</th>
	         <th>날 짜</th>
	         <th>조회수</th>
	      </tr>
	   </thead>
	   <tbody>
			<c:forEach items="${list }" var="bean">
			<c:set var="i" value="${i+1 }"/>
			<fmt:formatDate value="${bean.board_date}" pattern="yyyy-MM-dd HH:mm" var="date"/>
			<tr>
				<td name="num_${i }" class="num_${i }"><input type="text" class="board_id" name="boardId_${bean.board_id }" value="${bean.board_id }" disabled></td>
				<td name="num_${i }">${bean.board_no }<input type="hidden" class="num_${i }" value="${bean.board_no }"></td>
				<td name="num_${i }">${bean.board_sub }</td>
				<td name="num_${i }">${date }</td>
				<td name="num_${i }">${bean.board_count }</td>
			</tr>
			</c:forEach>
	   </tbody>
	</table>
	
	<nav id="pageNum">
	<!-- 페이지넘버링 -->
		<div id="paginationBox">
			<ul class="pagination">
				<c:if test="${pagination.prev}">
					<li class="page-item"><a class="page-link" href="#" onClick="prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Prev</a></li>
				</c:if>
				<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
					<li class="page-item <c:out value="${pagination.page==idx?'active' : ''}"/>"><a class="page-link" href="#" onClick="pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')">${idx}</a></li>
				</c:forEach>
				<c:if test="${pagination.next}">
					<li class="page-item"><a class="page-link" href="#" onClick="next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}')" >Next</a></li>
				</c:if>
			</ul>
		</div>
	
	
	<!-- 검색 -->
	   <div class="topMenu" id="search">
			<select id="searchType">
			    <option value="board_sub">제 &nbsp; 목</option>
			</select>
	      <input type="text" class="form-control" id="keyword" name="wri" style="width:200px; display:inline-block;">
			<a class="btn btn-default" href="#" role="button" id="searchGo">G O</a>
			<div id="fff"></div>
		</div>
		
	</nav>
</div>

<!-- contents end -->
<jsp:include page="/WEB-INF/remote.jsp"/>
<jsp:include page="/WEB-INF/socket.jsp"/>
<jsp:include page="/WEB-INF/footer.jsp"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="${root }js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${root }js/bootstrap.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// 게시판명 출력
		$('input[name=boardId_2]').val('후기게시판');
		$('input[name=boardId_3]').val('동행게시판');
		$('input[name=boardId_4]').val('자유게시판');
		
		$('td[name^=num_').on('click',function() {
			var num=$(this).attr('name');
			num=num.split('_');
			num=num[1];
			
			var child=$('td[name=num_'+num+']').children().val();
			var idx=$('input[class=num_'+num+']').val();

			if(child=='후기게시판') {
				location.href='../../board/reviewDe/'+idx;
			} else if(child=='동행게시판') {
				location.href='../../board/partnerDe/'+idx;
			} else if(child=='자유게시판') {
				location.href='../../board/freeDe/'+idx;
			}
		});
//////////////////////////////////////////////////////////////////////////////////////////		
		// 검색
		$('#searchGo').on('click',function() {
			var url='${root }main/myBoard/?id=${sessionScope.check.client_nick1}';
			url=url+'&searchType='+$('#searchType').val();
			url=url+'&keyword='+$('#keyword').val();
			
			location.href=url;
		});
		
   });
//////////////////////////////////////////////////////////////////////////////////////////
		var uri='${url}';
		uri=uri.split('main/')[1];
		console.log(uri);
		// 페이징
		//이전 버튼 이벤트
		function prev(page, range, rangeSize) {
			var page=((range-2)*rangeSize)+1;
			var range=range-1;
			var url='${root }main/'+uri+'/?id=${sessionScope.check.client_nick1}';
			url=url+"&page="+page;
			url=url+"&range="+range;
			location.href=url;
		}
		//페이지 번호 클릭
		function pagination(page, range, rangeSize) {
			var url='${root }main/'+uri+'/?id=${sessionScope.check.client_nick1}';
			url=url+"&page="+page;
			url=url+"&range="+range;
			location.href = url;	
		}
		//다음 버튼 이벤트
		function next(page, range, rangeSize) {
			var page=parseInt((range*rangeSize))+1;
			var range=parseInt(range)+1;
			var url='${root }main/'+uri+'/?id=${sessionScope.check.client_nick1}';
			url=url+"&page="+page;
			url=url+"&range="+range;
			location.href=url;
		}
		
</script>
</body>
</html>
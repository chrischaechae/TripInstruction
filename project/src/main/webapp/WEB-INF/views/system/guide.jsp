<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<link rel="stylesheet" type="text/css" href="${root }css/staff.css" />
<link href="https://github.com/uniqueHRH/final/blob/master/project/src/main/webapp/imgs/shortlogo.png?raw=true" rel="shortcut icon" type="image/x-icon">
<style type="text/css">
</style>
</head>
<body>
<jsp:include page="/WEB-INF/menubar.jsp"/>

<!-- contents start -->
<div id="allContain">
	<div class="page-header" id="page-header" align="center">
		<h1>가이드 관리</h1>
	</div>
   
	<table class="table table-hover" id="table">
	<!-- 정렬 드롭다운 -->
		<div class="topMenu" id="theme">
			<select id="dropdownMenu1">
			    <option value="정렬">정 렬</option>
			    <option value="NO">N O</option>
			    <option value="이름">이 름</option>
			    <option value="지역">지 역</option>
			</select>
			<a class="btn btn-default" href="#" role="button" id="sel">조회</a>
			<input type="text" value="<c:out value="${listCnt}"></c:out>개의 게시물이 조회되었습니다" id="listCnt" disabled/>
			<div id="fff"></div>
		   <a class="btn btn-default" href="${root }system/guideIns" role="button" id="wri">등록</a>
		</div>
	
	<!-- 리스트 출력 -->
	   <thead>
	      <tr class="active">
	         <th style="width: 100px">NO</th>
	         <th style="width: 100px">이 &nbsp;름</th>
	         <th style="width: 250px">연락처</th>
	         <th style="width: 250px">지 &nbsp;역</th>
	         <th style="width: 250px">이메일</th>
	      </tr>
	   </thead>
	   <tbody>
			<c:forEach items="${list }" var="bean">
			<tr>
				<td><a href="../system/guideDe/${bean.guide_no }">${bean.guide_no }</a></td>
				<td><a href="../system/guideDe/${bean.guide_no }">${bean.guide_name }</a></td>
				<td><a href="../system/guideDe/${bean.guide_no }">${bean.guide_phone }</a></td>
				<td><a href="../system/guideDe/${bean.guide_no }">${bean.guide_city }</a></td>
				<td><a href="../system/guideDe/${bean.guide_no }">${bean.guide_email }</a></td>
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
					<li class="page-item <c:out value="${pagination.page==idx?'active' : ''}"/>"><a class="page-link" href="#" onClick="pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}', '${search.searchType}', '${search.keyword }' )">${idx}</a></li>
				</c:forEach>
				<c:if test="${pagination.next}">
					<li class="page-item"><a class="page-link" href="#" onClick="next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}')" >Next</a></li>
				</c:if>
			</ul>
		</div>
	
	<!-- 검색 -->
	   <div class="topMenu" id="search">
			<select id="searchType">
			    <option value="guide_name">이 름</option>
			    <option value="guide_city">지 역</option>
			</select>
	      <input type="text" class="form-control" id="keyword" name="keyword" style="width:200px; display:inline-block;">
			<a class="btn btn-default" href="#" role="button" id="searchGo">G O</a>
		</div>
		
	</nav>
</div>

<jsp:include page="/WEB-INF/remote.jsp"/>
<jsp:include page="/WEB-INF/socket.jsp"/>
<jsp:include page="/WEB-INF/footer.jsp"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="${root }js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${root }js/bootstrap.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		/* 정렬 */
		$('#sel').on('click',function() {
			var up=$('#dropdownMenu1').val();
			if(up=='정렬') {
				$.ajax({
					url:'../system/guide',
					type:'GET',
					success:function(data) {
						location.href="../system/guide";
					},
					error:function() {
					}
				});   // ajax
			}   // if
			if(up=='NO') {
				$.ajax({
					url:'../system/guideNo',
					type:'GET',
					success:function(data) {
						location.href="../system/guideNo";
					},
					error:function() {
					}
				});   // ajax
				return false;
			}   // if
			if(up=='이름') {
				$.ajax({
					url:'../system/guideNo',
					type:'GET',
					success:function() {
						location.href="../system/guideName";
					},
					error:function() {
					}
				});   // ajax
			}   // if
			if(up=='지역') {
				$.ajax({
					url:'../system/guideCity',
					type:'GET',
					success:function() {
						location.href="../system/guideCity";
					},
					error:function() {
					}
				});   // ajax
			}   // if
		});
		
//////////////////////////////////////////////////////////////////////////////////////////		
		// 검색
		$('#searchGo').on('click',function() {
			var url='${root }system/guide';
			url=url+'?searchType='+$('#searchType').val();
			url=url+'&keyword='+$('#keyword').val();
			
			location.href=url;
			console.log(url);
		});
		
   });
		
		// 페이징
		//이전 버튼 이벤트
		var uri='${url}';
		uri=uri.split('system/')[1];
		function prev(page, range, rangeSize) {
			var page=((range-2)*rangeSize)+1;
			var range=range-1;
			var url='${root }system/'+uri;
			url=url+"?page="+page;
			url=url+"&range="+range;
			location.href=url;
		}
		//페이지 번호 클릭
		function pagination(page, range, rangeSize, searchType, keyword) {
			var url='${root }system/'+uri;
			url=url+"?page="+page;
			url=url+"&range="+range;
			url=url+"&searchType="+$('#searchType').val();
			url=url+"&keyword="+keyword;
			location.href = url;	
		}
		//다음 버튼 이벤트
		function next(page, range, rangeSize) {
			var page=parseInt((range*rangeSize))+1;
			var range=parseInt(range)+1;
			var url='${root }system/'+uri;
			url=url+"?page="+page;
			url=url+"&range="+range;
			location.href=url;
		}
		
		
</script>
</body>
</html>
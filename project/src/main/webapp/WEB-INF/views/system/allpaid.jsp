<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link href="https://github.com/uniqueHRH/final/blob/master/project/src/main/webapp/imgs/shortlogo.png?raw=true" rel="shortcut icon" type="image/x-icon">
<style type="text/css">
	#allContain {
		width:1000px;
		margin:0 auto;
		padding-left:150px;
		font-family: 'Jua';
	}
	#table {
		width:950px;      
		margin:0 auto;
		font-family: 'Jua';
		font-size:18px;
		align:center;
		text-align:center;
		padding:0px;
	}
	select, button, a {
		font-family: 'Jua';
	}
/* 나라정렬 버튼 */
	#theme {
		width:1050px;
		margin:0 auto;
		padding:8px 0;
	}
/* 정렬버튼 */
	#dropdownMenu1:hover {
		background-color:#e8e8e8;
	}

/* 나라정렬 조회버튼 */
	#sel {
		display:inline-block;
		border-radius:5px;
		font-size:14px;
		text-align:center;
		height:30px;
		vertical-align:middle;
	}
	#table th {
		text-align:center;
	}
	#table>tbody td,
	#table>tbody td>a {
		font-size:15px;
	}
	#table>thead th:nth-child(1) {
		width:50px;
	}
	#table>thead th:nth-child(2) {
		width:80px;
	}
	#table>thead th:nth-child(3) {
		width:80px;
	}
	#table>thead th:nth-child(4) {
		width:80px;
	}
	#table>thead th:nth-child(5) {
		width:60px;
	}
	#table>thead th:nth-child(6) {
		width:50px;
	}
	#table>thead th:nth-child(7) {
		width:60px;
	}
	#table>thead th:nth-child(8) {
		width:60px;
	}
	#table>thead th:nth-child(9) {
		width:80px;
	}
	#table>thead th:nth-child(10) {
		width:80px;
	}
	#table>thead th:nth-child(11) {
		width:80px;
	}
	#table>tbody td>a {
		text-decoration:none;
	}
	#table>tbody td>a:hover {
		color:black;
	}
	#pageNum, #search {
		width:350px;      
		margin:0 auto;
		text-align:center;
	}
	tbody td>a {
		color:black;
		text-decoration:none;
   }
	.dropdown {
		font-family: 'Jua';
		font-size: 18px;
	}
	#searchType {
		width:87px;
	}

</style>
</head>
<body>
<jsp:include page="/WEB-INF/menubar.jsp"/>

<!-- contents start -->
<div id="allContain">
	<div class="page-header" id="page-header" align="center">
		<h1>예약 및 결제관리</h1>
	</div>
   
	<table class="table table-hover" id="table">
	<div class="topMenu" id="theme">
			<select id="dropdownMenu1">
			    <option value="정렬">정 &nbsp;렬</option>
			    <option value="결제상태">결제상태</option>
			    <option value="확정여부">확정여부</option>
			    <option value="출발일">출발일</option>
			</select>
			<a class="btn btn-default" href="#" role="button" id="sel">조회</a>
			<input type="text" value="<c:out value="${listCnt}"></c:out>개의 결제건이 조회되었습니다" id="listCnt" disabled/>
		</div>
	<!-- 리스트 출력 -->
	   <thead>
	      <tr class="active">
	         <th>NO</th>
	         <th>상품번호</th>
	         <th>예약자</th>
	         <th>여행자</th>
	         <th>출발일</th>
	         <th>총원</th>
	         <th>총금액</th>
	         <th>예약일</th>
	         <th>결제상태</th>
	         <th>확정여부</th>
	      </tr>
	   </thead>
	   <tbody>
			<c:forEach items="${list }" var="bean">
			<c:set var="i" value="${i+1 }"/>
			<tr>
				<td>${i }</td>
				<td><a href="${root }system/paid/${bean.paid_no }">${bean.tour_no }</a></td>
				<td><a href="${root }system/paid/${bean.paid_no }">${bean.client_name }</a></td>
				<td><a href="${root }system/paid/${bean.paid_no }">${bean.paid_name }</a></td>
				<td><a href="${root }system/paid/${bean.paid_no }">${bean.tour_date }</a></td>
				<td><a href="${root }system/paid/${bean.paid_no }">${bean.paid_count }명</a></td>
				<td><a href="${root }system/paid/${bean.paid_no }"> <fmt:formatNumber value="${bean.paid_total}" pattern="#,###"/>원</a></td>
				<td><a href="${root }system/paid/${bean.paid_no }">${bean.book_date }</a></td>
				<td><a href="${root }system/paid/${bean.paid_no }">${bean.paid_state }</a></td>
				<td><a href="${root }system/paid/${bean.paid_no }">${bean.paid_confirm }</a></td>
				
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
			    <option value="client_name">예약자</option>
			    <option value="paid_name">여행자</option>
			    <option value="paid_state">결제상태</option>
			    <option value="paid_confirm">확정여부</option>
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
					url:'../system/paid',
					type:'GET',
					success:function(data) {
						location.href="../system/paid";
					},
					error:function() {
					}
				});   // ajax
			}   // if
			if(up=='결제상태') {
				$.ajax({
					url:'../system/paidState',
					type:'GET',
					success:function(data) {
						location.href="../system/paidState";
					},
					error:function() {
					}
				});   // ajax
				return false;
			}   // if
			if(up=='확정여부') {
				$.ajax({
					url:'../system/paidConfirm',
					type:'GET',
					success:function() {
						location.href="../system/paidConfirm";
					},
					error:function() {
					}
				});   // ajax
			}   // if
			if(up=='출발일') {
				$.ajax({
					url:'../system/paidDate',
					type:'GET',
					success:function() {
						location.href="../system/paidDate";
					},
					error:function() {
					}
				});   // ajax
			}   // if
		});
		
		
		
		// 검색
		$('#searchGo').on('click',function() {
			var url='${root }system/paid';
			url=url+'?searchType='+$('#searchType').val();
			url=url+'&keyword='+$('#keyword').val();
			
			location.href=url;
		});
   });
//////////////////////////////////////////////////////////////////////////////////////////		
		// 페이징
		var uri='${url}';
      uri=uri.split('system/')[1];
		//이전 버튼 이벤트
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
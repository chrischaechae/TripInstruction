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
<link rel="stylesheet" type="text/css" href="${root }css/board.css" />
<link href="https://github.com/uniqueHRH/final/blob/master/project/src/main/webapp/imgs/shortlogo.png?raw=true" rel="shortcut icon" type="image/x-icon">
<style type="text/css">
	#allContain {
		width:1000px;
		margin:0 auto;
		padding-left:150px;
		font-family: 'Jua';
	}
	#theme {
		width:900;
		margin:0;
		padding:20 20 20 20;
		background-color:#e8e8e8;
		border-radius:15px;
	}
	#queIns {
		width:780px;
		height:32px;
		border-radius:0;
		resize:none;
		display:inline-block;
		padding:5 10;
		margin:0 20;
	}
	#ansIns {
		width:780;
		height:100;
		display:inline-block;
		resize:none;
		padding:5 10;
		margin:8 20;
	}
	#btnIns {
		width:800;
	}
	#ins {
		display:inline-block;
	}
	#list {
		width:900;
		padding:30 0 0 0;
	}
	input {
		width:850px;
		border:0;
		outline:0;
		border-radius:15px;
	}
	#tab_s {
		width:850px;
		padding:3px 0;
	}
	.question {
		width:900px;
		padding:20 0 20 20;
		background-color:#e8e8e8;
		font-size:18px;
		cursor:pointer;
		margin:5 0;
		border-bottom:1px solid gray;
	}
	.answer {
		width:900px;
		padding:20 0 25 35;
		font-size:15px;
		font-weight:normal;
		background-color:white;
		resize:none;
		outline:none;
		border:0;
	}
	#pageNum {
		padding:30 0;
	}
</style>
</head>
<body>	
<jsp:include page="/WEB-INF/menubar.jsp"/>


<!-- contents start -->
<div id="allContain">
	<div class="page-header" id="page-header" align="center">
		<h1>자주묻는질문</h1>
	</div>

	<div class="topMenu" id="theme" align="left">
		<input type="hidden" id="loginCk" value="${sessionScope.staffcheck.staff_name}"/>
		<textarea id="queIns" placeholder="질문을 입력해주세요"></textarea>
		<textarea id="ansIns" placeholder="답변을 입력해주세요"></textarea>
		<div id="btnIns" align="right">
			<a class="btn btn-default" role="button" id="ins">완료</a>
			<a class="btn btn-default" role="button" id="res">취소</a>
		</div>
	</div>
	<!-- 리스트 출력 -->
	<div id="list">
		<c:forEach items="${list }" var="bean">
			<div id="tab">
				<input type="text" id="qus_${bean.faq_no }" class="question" value="${bean.faq_question }" readonly>
			</div>
			<div id="tabs">
				<textarea id="ans_${bean.faq_no }" class="answer" readonly>${bean.faq_answer }</textarea>
				<div id="tab_s" align="right">
					<a class="btn btn-default" role="button" id="upd_${bean.faq_no }">수정</a>
					<a class="btn btn-default" role="button" id="ins_${bean.faq_no }">완료</a>
					<a class="btn btn-default" role="button" id="can_${bean.faq_no }">취소</a>
					<a class="btn btn-default" role="button" id="del_${bean.faq_no }">삭제</a>
				</div>
			</div>
			<div>
			</div>
		</c:forEach>
	</div>
	
	<nav id="pageNum">
	<!-- 검색 -->
	   <div class="topMenu" id="search">
			<select id="searchType">
			    <option value="faq_question">질 &nbsp; 문</option>
			</select>
	      <input type="text" class="form-control" id="keyword" name="keyword" style="width:200px; display:inline-block;">
			<a class="btn btn-default" href="#" role="button" id="searchGo">G O</a>
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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

	    var id=$('#loginCk').val();
	    if(id=='') {
			$('#theme').hide();
	    }
	    
	   $('#ins').on('click',function() {
		   var question=$('#queIns').val();
		   var answer=$('#ansIns').val();
		   
		   if(question=='') {
			   swal({
					title:'질문을 입력해주세요',
					icon:'warning',
					button:'확인'
				})
		   } else if(answer=='') {
			   swal({
					title:'대답을 입력해주세요',
					icon:'warning',
					button:'확인'
				})
		   } else {
			   $.ajax({
				   url:'../board/faqIns',
				   type:'POST',
				   data:{faq_question:question, faq_answer:answer},
				   success:function() {
					   reload();
				   },
				   error:function() {
					   swal({
							title:'다시 시도해주세요',
							icon:'warning',
							button:'확인'
						})
					}
			   });
		   }
	   });
	   
		$('#res').on('click',function() {
	    	swal({
	    		title: "작성을 취소하시겠습니까?",
	    		icon: "warning",
	    		buttons: ["아니요", "네"]
	    	}).then((네) => {
	    		if(네) {
					reload();
	    		}
	    	})
	    });
		
//////////////////////////////////////////////////////////////////////////////////////		
		// 리스트 출력
		$('textarea[id^=ans_]').hide();
		$('a[id^=upd_]').hide();
		$('a[id^=ins_]').hide();
		$('a[id^=can_]').hide();
		$('a[id^=del_]').hide();
		$('input[id^=qus_]').on('click',function() {
			var btn=$(this).attr('id');
			var num=btn.split('_');
			var num=num[1];
			
			var log=$('#loginCk').val();
			
			$('textarea[id^=ans_'+num+']').toggle();
			if(log) {
				$('a[id^=upd_'+num+']').toggle();
				$('a[id^=del_'+num+']').toggle();
			}
		});
		
		// 수정
		$('a[id^=upd_]').on('click',function() {
			var btn=$(this).attr('id');
			var num=btn.split('_');
			var num=num[1];
			
			$('input[id=qus_'+num+']').off('click');
			$('input[id=qus_'+num+']').attr('readonly',false);
			$('textarea[id=ans_'+num+']').attr('readonly',false);
			$('a[id=upd_'+num+']').toggle();
			$('a[id=ins_'+num+']').toggle();
			$('a[id=can_'+num+']').toggle();
			$('a[id=del_'+num+']').toggle();
			
			$('textarea[id=ans_'+num+']').css('border-radius','10px').css('border','2px solid #6A8DED');
			
			$('a[id=ins_'+num+']').on('click',function() {
				var question=$('input[id=qus_'+num+']').val();
				var answer=$('textarea[id=ans_'+num+']').val();
				$.ajax({
					url:'../board/faqUp',
					type:'POST',
					data:{faq_question:question, faq_answer:answer, faq_no:num},
					success:function() {
						swal({
						      title: "수정되었습니다.",
						      icon: "success",
						      button: "확인"
						}).then((확인) => {
					    	reload();
					    });
					},
					error:function() {
						swal({
							title:'다시 시도해주세요',
							icon:'warning',
							button:'확인'
						})
					}
				});   // ajax
			});   // click
			$('a[id=can_'+num+']').on('click',function() {
				swal({
					title: "작성을 취소하시겠습니까?",
					icon: "warning",
					buttons: ["아니요", "네"]
				}).then((네) => {
					if(네) {
				    	reload();
					}
				})
			});
		});
		
		// 삭제
		$('a[id^=del_]').on('click',function() {
			var btn=$(this).attr('id');
			var num=btn.split('_');
			var num=num[1];
			
			swal({
				title: "삭제하시겠습니까?",
				icon: "warning",
				buttons: ["아니요", "네"]
			}).then((네) => {
				if(네) {
					$.ajax({
						url:'../board/faqDel',
						type:'POST',
						data:{key:num},
						success:function() {
							swal({
    		            		title:'삭제되었습니다',
    		            		icon:'success',
    		            		button:'확인'
    		            	}).then((네) => {
    		            		reload();
    		            	})
						},
						error:function() {
							swal({
								title:'다시 시도해주세요',
								icon:'warning',
								button:'확인'
							}).then((네) => {
     		            		reload();
     		            	})
						}
					});   // ajax
				}
			})
		});
//////////////////////////////////////////////////////////////////////////////////////////		
		// 검색
		$('#searchGo').on('click',function() {
			var url='${root }board/faq';
			url=url+'?searchType='+$('#searchType').val();
			url=url+'&keyword='+$('#keyword').val();
			
			location.href=url;
		});
		
		function reload() {
	    	  location.reload();
	      }
   });
		
		
</script>
</body>
</html>
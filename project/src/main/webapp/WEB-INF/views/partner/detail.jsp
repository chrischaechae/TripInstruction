  
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
		<h1>나의 여행메이트</h1>
	</div>
      
<!-- 제목 -->
	<form class="form-inline" method="POST">
	   <div>
	      <input type="text" class="form-control" id="board_sub" name="board_sub" value="${bean.partner_sub }" style="cursor:default" disabled>
	      <input type="hidden" id="board_no" name="board_no" value="${bean.board_no }">
	   </div>
	   <p></p>
	   <div>
	      <div class="form-group" align="left">
	         <label for="exampleInputName2">닉네임</label>
	         <input type="text" class="form-control" id="client_nick1" name="client_nick1" value="${bean.client_nick1 }" disabled>
	         <button type="button" class="btn btn-default" id="sendMsg">쪽지</button>
	      </div>
	      &nbsp; &nbsp;
	      <div class="form-group">
	         <label for="exampleInputEmail2">조회수</label>
	         <input type="text" class="form-control" id="board_count" value="${bean.partner_count }" style="cursor:default" disabled>
	         <input type="hidden" id="log" name="log" value="${sessionScope.check.client_nick1}">
	         <input type="hidden" id="staffLog" name="staffLog" value="${sessionScope.staffcheck.staff_name}">
	      </div>
	      &nbsp; &nbsp;
	      <div class="form-group" align="left">
	      <fmt:formatDate value="${bean.partner_date}" pattern="yyyy-MM-dd HH:mm" var="date"/>
			<label for="exampleInputEmail2">작성일</label>
			<input type="text" class="form-control" id="board_date" value="${date }" style="cursor:default" disabled>
	      </div>
	   </div>
	   <p></p>
	   <div contenteditable="false" id="contentM">
			<img src="${root }resources/${bean.partner_thumb }" id="board_thumb"/>
			<input type="hidden" id="hiddenI" value="${bean.partner_thumb }"/>
			<div id="contentS">${bean.partner_content }</div>
	   </div>
	   <p></p>
	   <div id="btn">
	      <button type="button" class="btn btn-default" id="subm">수정하기</button>
	      <button type="button" class="btn btn-default" id="dele">삭제하기</button>
	      <button type="button" class="btn btn-default" id="goList">목록으로</button>
	   </div>
	
	<!-- 댓글 출력 -->
	   <div id="table">
	      <table>
	         <tbody id="tbody">
	         <c:forEach items="${list }" var="beans">
	         <fmt:formatDate value="${beans.reply_date}" pattern="yyyy-MM-dd HH:mm:ss" var="date2"/>
	            <tr id="tr1">
	               <th id="th">${beans.client_nick1 }</th>
	               <th id="th">${date2 }</th>
	               <th><input type="hidden" id="repId" name="repId_${beans.reply_no }" value="${beans.client_nick1 }"><th>
				</tr>
				<tr id="tr2">
					<td colspan="2"><input type="text" id="reply" name="reply_${beans.reply_no }" value="${beans.reply_content }" disabled></td>
					<td>
						<button type="button" id="edit" name="edit_${beans.reply_no }" class="btn btn-default"><img src="https://github.com/uniqueHRH/final/blob/master/project/src/main/webapp/imgs/edit.png?raw=true" width="15px" height="20px"/></button>
						<button type="button" id="update" name="update_${beans.reply_no }" class="btn btn-default"><img src="https://github.com/uniqueHRH/final/blob/master/project/src/main/webapp/imgs/insert.png?raw=true" width="15px" height="20px"/></button>
						<button type="button" id="cancel" name="cancel_${beans.reply_no }" class="btn btn-default"><img src="https://github.com/uniqueHRH/final/blob/master/project/src/main/webapp/imgs/delete.png?raw=true" width="15px" height="15px"/></button>
						<button type="button" id="dele2" name="dele2_${beans.reply_no }" class="btn btn-default"><img src="https://github.com/uniqueHRH/final/blob/master/project/src/main/webapp/imgs/delete.png?raw=true" width="15px" height="15px"/></button>
					</td>
	            </tr>
	         <input type="hidden" id="reply_no" name="reply_no" value="${beans.reply_no}">
	         </c:forEach>
	         </tbody>
	      </table>
	      <p></p>
	      <input type="text" class="form-control" id="reply_content" name="reply_content">
	      <button type="button" id="insert" class="btn btn-default"><img src="https://github.com/uniqueHRH/final/blob/master/project/src/main/webapp/imgs/insert.png?raw=true" width="30px" height="27px" style="vertical-align:30px;"/></button>
	   </div>
	      
	</form>
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
	   $('#subm').hide();
		$('#dele').hide();
		
		$('#contentM').on( 'keyup', 'textarea', function (e){
			$(this).css('height', 'auto' );
			$(this).height( this.scrollHeight );
		});
		$('#contentM').find( 'textarea' ).keyup();
		
		var contents=$('#contentS').html();
		contents=contents.replace(/(\n|\r\n)/g, '<br>');
		$('#contentS').html(contents);
		
		$('button[name^=cancel_').hide();
		$('button[name^=update_').hide();
		$('button[name^=edit_').hide();
		$('button[name^=dele2_').hide();
		
		// 이미지가 없을 때 출력되지 않도록
		var img=$('#hiddenI').val();
		var text='none.png';
		
		if(img.indexOf(text)!=-1) {
			$('#board_thumb').remove();
		}
		if(img=='') {
			$('#board_thumb').remove();
		}
		
		// 쪽지보내기 기능
		var log=$('#log').val();
		var nick=$('#client_nick1').val();
		
		
		if(log=='' || log==nick) {
		} else {
			$('#sendMsg').on('click',function() {
				var data=$('#client_nick1').val();
				window.open('../../partner/?msg='+data,'쪽지보내기','width=470, height=340, left=500, top=50');
			});
		}
		
///////////////////////////////////////////////////////////////////////////
		// 작성자+관리자만 수정/삭제 가능
		var mas=$('#client_nick1').val();
		var log=$('#log').val();
		var repLog=$('input[name^=repId_').val();
		var staffLog=$('#staffLog').val();
		
		if(mas==log) {
			$('#subm').show();
			$('#dele').show();
		}
		if(staffLog) {
			$('#subm').show();
			$('#dele').show();
		}
		
		$('input[name^=repId').each(function() {
			var log=$('#log').val();
			var id=$(this).val();
			var num=$(this).attr('name');
			num=num.split('_');
			num=num[1];
			
			if(log==id) {
				$('button[name^=edit_'+num+']').show();
				$('button[name=dele2_'+num+']').show();
			} else if(staffLog) {
				$('button[name^=edit_'+num+']').show();
				$('button[name=dele2_'+num+']').show();
			}
		});
      
      // 수정버튼
      $('#subm').on('click',function() {
         location.href="../partnerUp/${bean.board_no}";
      });
      
      // 삭제버튼
		$('#dele').on('click',function() {
			swal({
				  title: "삭제하시겠습니까?",
				  icon: "warning",
				  buttons: ["아니요", "네"]
				})
				.then((네) => {
				  if (네) {
					    $.ajax({
					    	  url:'../partnerDel',
			                  type:'POST',
			                  data:{key:$('#board_no').val()},
			                  success:function() {
								    swal({
								      title: "삭제되었습니다.",
								      icon: "success",
								      button: "확인"
								    })
								    .then((확인) => {
								    	 location.href="../partner";
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
            
	// 목록버튼
	$('#goList').on('click',function() {
		location.href="../partner";
	});
	
		// 입력 버튼
		var log=$('#log').val();
		var staffLog=$('#staffLog').val();
		
		if(log) {
				$('#reply_content').attr('disabled',false);
		} else if(staffLog) {
			$('#reply_content').attr('disabled',false);
		} else {
			$('#reply_content').val('로그인 후 이용이 가능합니다').attr('disabled',true);
			return false;
		}
			
		$('#insert').on('click',function() {
			var text=$('#reply_content').val();
			var no=$('#board_no').val();
			var reply=$('#reply_content').val();
			
			if(!text) {
				swal({
	  				   title: "내용을 입력해주세요",
	  				   icon: "warning"
	  				  })
				return false;
				event.preventDefault();
			} else {
				$.ajax({
		            url:'../partnerRepIn',
		            type:'POST',
   		            cache:false,
		            data:{board_no:$('#board_no').val(), client_nick1:log, reply_content:reply},
		            success:function() {
		            	reload();
		            },
		            error:function() {
		            	swal({
			  				   title: "다시 시도해주세요",
			  				   icon: "warning",
			  				   button:'확인'
						})
		            }
	         	});
			}
      	});
      
		// 댓글 수정버튼
		$('button[name^=edit]').on('click',function() {
     		var name=$(this).attr('name');
     		var num=name.replace('edit_','');
     		$('button[name=edit_'+num+']').on('click',function() {
				$('input[name=reply_'+num+']').attr('disabled',false);
				$('button[name=edit_'+num+']').hide();
				$('button[name=dele2_'+num+']').hide();
				$('button[name=update_'+num+']').show();
				$('button[name^=cancel_'+num+']').show();
				$('button[name=cancel_'+num+']').on('click',function() {
					swal({
						  title: "수정을 취소하시겠습니까?",
						  icon: "warning",
						  buttons: ["아니요", "네"]
						})
						.then((네) => {
							reload();
					});
					
				});
				
				$('button[name=update_'+num+']').on('click',function() {
					var text=$('input[name=reply_'+num+']').val();
					
					swal({
						  title: "수정하시겠습니까?",
						  icon: "warning",
						  buttons: ["아니요", "네"]
					}).then((네) => {
						  if (네) {
								    $.ajax({
								    	 url:'../partnerRepUp',
								            type:'POST',
								            data:{reply_no:num, reply_content:text},
						                  success:function() {
											    swal({
											      title: "수정되었습니다.",
											      icon: "success",
											      button: "확인"
											    })
											    .then((확인) => {
											    	reload();
											    });	
						                  },
						                  error:function() {
						                	  swal({
													title:'다시 시도해주세요',
													icon:'errer',
													button:'확인'
												})
						                  }
						            });//ajax
							  } else {
								    swal({
								    	title: "다시 시도해주세요",
								    	icon: "error",
								    	button: "확인"
								    })
							  }//if 
					});
				});
     		});
		});
      
      // 삭제버튼
     	$('button[name^=dele2]').on('click',function() {
     		var name=$(this).attr('name');
     		var num=name.replace('dele2_','');   // 버튼의 값
     		
     		$('button[name=dele2_'+num+']').on('click',function() {
     			swal({
  				  title: "삭제하시겠습니까?",
  				  icon: "warning",
  				  buttons: ["아니요", "네"]
  				})
  				.then((네) => {
  				  if (네) {
  						    $.ajax({
  						    	 url:'../partnerRepDel',
  		     		            type:'POST',
  		     		            cache:false,
  		     		            data:{key:num},
  		     		         	success:function(obj) {
  									    swal({
  									      title: "삭제되었습니다.",
  									      icon: "success",
										  button:'확인'
  									  }).then((확인) => {
  									  	reload();
  									  })
  				                  },
  				                  error:function() {
  				                	swal({
  		    		            		title:'다시 시도해주세요',
  		    		            		icon:'warning',
  		    		            		button:'확인'
  		    		            	}).then((확인) => {
  		    		            		reload();
  		    		            	})
  				                  }
  				            });//ajax
  					  }//if 
  				});
     			
     		});
     	});
      
      function reload() {
    	  location.reload();
      }
      
   });
   
</script>
</body>
</html>
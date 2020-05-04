<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<c:url value="/" var="root"></c:url>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
/* 리모컨 */ 
	#remote {
		position:fixed;
		left:1580px;
		top:730px;
		width:150px;
	}
	#kakao-talk-channel-chat-button {
		width:150px;
	}
	.kakaoChat {
		text-align:center;
		padding:0;
		margin:0;
	}
	#top {
		height:40px;
	}
</style>
</head>
<body>

<!-- 리모컨 -->
	<div class="btn-group-vertical fixed-top" id="remote" role="group" aria-label="...">
		<div id="kakao-talk-channel-chat-button" class="kakaoChat"></div>
		<button type="button" class="btn btn-default" id="top">T O P ▲</button>
	</div>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="${root }js/jquery-1.12.4.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	//리모컨 top
	$('#top').on('click',function() {
		$('html,body').scrollTop(0);
	});

	//<![CDATA[
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('acc658a670e9ed5918d11647040b5bc5');
	// 카카오톡 채널 1:1채팅 버튼을 생성합니다.
	Kakao.Channel.createChatButton({
	  container: '#kakao-talk-channel-chat-button',
	  channelPublicId: '_wxfwxfxb' // 카카오톡 채널 홈 URL에 명시된 id로 설정합니다.
	});
	//]]>
});
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">

<!-- JavaScript Bundle with Popper -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
</head>

<script>
	window.onload = function() {
		$("#textarea").focus();
	}
</script>

<style>
li{
	list-style: none	
}
#comments_users_id{
	margin-left : 20px;
	font-size: 20px;
}
#comments_date{
	float:right;
	text-align: right;
}

#comments_contents{
	margin-bottom: 50px; 
	margin-top: 20px; 
	border-bottom: 1px solid #dee2e6;
}
#comments_modi{
	margin-left:0;	
}
#comments_del{
	margin-left: -30px;
}

#comments_modi_btn{
	margin-bottom: 50px;
}

</style>

<body>

	<%@ include file="/WEB-INF/views/comments_detail.jsp"%>

	<form action="comments_modi" method="post">
		<div class="container">
			<span><strong>Comments</strong></span>
		</div>
		<div  class="container">
			<table class="table">
				<tr>
					<td><input type="hidden" name="users_id" id="users_id" value="${dto.users_id }"/> <textarea
							class="form-control" placeholder="댓글을 입력하세요."
							name="comments_contents" maxlength="2048" cols="100"
							id="textarea">${dto2. comments_contents }</textarea> <input
						type="hidden" name="meeting_number" value="${dto.meeting_number }" />
						<div>
							<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}" />
							<input type="submit" id="comments_modi_btn" class="btn btn-dark mt-3" value="수정하기">
						</div>
					</td>
				</tr>	
			</table>
		</div>
		<br />
		<div class="container">
			<table class="table">
				<c:forEach var="dto" items="${list}">
					<ul>
						<li>
							<span id="comments_users_id">${dto. users_id }</span>
								<a href="comments_modi?comments_number=${dto.comments_number}&meeting_number=${dto.meeting_number }">
									<input type="button" value="[수정]" id="comments_modi" class="btn btn-default btn-xs" /></a>
									<input type="hidden" name="comments_number" value="${dto2.comments_number }" />															 
								<a href="comments_delete?comments_number=${dto.comments_number}&meeting_number=${dto.meeting_number }">
									<input type="button" value="[삭제]" id="comments_del" class="btn btn-default btn-xs" /></a>
							<small> 
							<span id="comments_date">${dto. comments_date }</span>
							</small>
							
							<div id="comments_contents">
								<ul>
									<li>${dto. comments_contents }</li>
								</ul>
								<br />
							</div>
						</li>
					</ul>
				</c:forEach>
			</table>
		</div>
	</form>

</body>
</html>
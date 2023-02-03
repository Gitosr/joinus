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

<body>

	<%@ include file="/WEB-INF/views/comments_detail.jsp"%>

	<form action="comments_modi" method="post">
		<div class="container">
			<span><strong>Comments</strong></span>
		</div>
		<div  class="container">
			<table class="table">
				<tr>
					<td><input type="text" name="users_id" id="" /> <textarea
							class="form-control" placeholder="댓글을 입력하세요."
							name="comments_contents" maxlength="2048" cols="100"
							id="textarea">${dto2. comments_contents }</textarea> <input
						type="hidden" name="meeting_number" value="${dto.meeting_number }" />
						<div>
							<input type="submit" class="btn btn-dark mt-3" value="수정하기">
						</div></td>
				</tr>
				<tr>
					<td><input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}" /></td>
				</tr>
			</table>
		</div>


		<div class="container">
			<table class="table">
				<c:forEach var="dto" items="${list}">
					<ul>
						<li style="list-style: none"><span style="font-size: 25px;">${dto. users_id }</span>
							<small> <span style="text-align: right;">${dto. comments_date }</span>
						</small>
							<div>
								<a href="comments_modi?comments_number=${dto.comments_number}&meeting_number=${dto.meeting_number }">
									<input type="button" value="[수정]" id="comments_modi" class="btn btn-default btn-xs" /></a>
									 
									<input type="hidden" name="comments_number" value="${dto2.comments_number }" /> 
									
								<a href="comments_delete?comments_number=${dto.comments_number}&meeting_number=${dto.meeting_number }">
									<input type="button" value="[삭제]" class="btn btn-default btn-xs" /></a>
							</div>

							<div>
								<div
									style="margin-bottom: 50px; margin-top: 20px; border-bottom: 1px solid #dee2e6;">
									<ul>
										<li style="list-style: none">${dto. comments_contents }</li>

									</ul>
									<br />
								</div>
							</div>
						</li>
					</ul>
				</c:forEach>
			</table>
		</div>
	</form>

</body>
</html>
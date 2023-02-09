<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row" id="list">
	<c:forEach var="dto" items="${list }" varStatus="status">
		<div
			class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 aos-init aos-animate"
			data-aos="zoom-in" data-aos-delay="100">
			<a href="/meeting/detail?meeting_number=${dto.meeting_number }">
				<div class="icon-box">

					<div class="studyItem_schedule">
						<p class="startedate">시작 예정일 | ${dto.meeting_startdate }</p>
					</div>
					<h4 class="studyItem_title">${dto.meeting_title }</h4>
					<p class="studyItem_place">${dto.meeting_skill }</p>

					<div class="studyItem_info">
						<p class="">
							<img src="" alt="" />작성자 : ${dto.users_id }
						</p>
					</div>
				</div>
			</a>
		</div>
	</c:forEach>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../views/script.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CODEE</title>

<!-- CSS only -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css"
	integrity="sha512-mSYUmp1HYZDFaVKK//63EcZq4iFWFjxSL+Z3T/aCt4IO9Cejm03q3NKKYN6pFQzY0SBOr8h+eCIAZHPXcpZaNw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />


<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">


<!-- JavaScript Bundle with Popper -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"
	integrity="sha512-T/tUfKSV1bihCnd+MxKD0Hm1uBBroVYBOYSk1knyvQ9VyZJpc/ALb4P0r6ubwVPSGB2GvjeoMAJJImBG12TiaQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js"
	integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/bbbootstrap/libraries@main/choices.min.css">
<script
	src="https://cdn.jsdelivr.net/gh/bbbootstrap/libraries@main/choices.min.js"></script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- ???????????? -->
<script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath}/resources/summernote/summernote-ko-KR.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">

</head>
<script>
	$(function() {
		$(document).ready(function() {
				var multipleCancelButton = new Choices(
						'#choices-multiple-remove-button', {
							removeItemButton : true,
							maxItemCount : 5,
							searchResultLimit : 5,
							renderChoiceLimit : 20
						});

					});

		$('#date-picker').datepicker({
			format : 'yyyy-mm-dd',
			language : "ko",
			keyboardNavigation : false,
			forceParse : false,
			autoclose : true,
			todayHighlight : true						
		});
		
		$('.summernote').summernote({
			  height: 500,
			  width: 950,
			  lang: "ko-KR",
			  toolbar: [
				    // ?????? ??????
				    ['fontname', ['fontname']],
				    // ?????? ?????? ??????
				    ['fontsize', ['fontsize']],
				    // ??????, ????????????, ??????,?????? ???, ???????????????
				    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				    // ?????????
				    ['color', ['forecolor','color']],
				    // ????????????
				    ['table', ['table']],
				    // ????????? ??????, ???????????????, ????????????
				    ['para', ['ul', 'ol', 'paragraph']],
				    // ?????????
				    ['height', ['height']],
				    // ????????????, ???????????????, ???????????????
				    ['insert',['picture','link','video']],
				  ],
				  // ????????? ??????
				fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','?????? ??????','??????','?????????','??????','?????????','?????????'],
				 // ????????? ???????????????
				fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
										  
		});
		
		$("#write_button").click(function(){
			if($('#meeting_category').val()=='???????????????'){
				$('#meeting_category').focus();
				alert("??????????????? ??????????????????");
				return false;
			};
			
			if($('#meeting_membernum').val()=='???????????????'){
				$('#meeting_membernum').focus();
				alert("??????????????? ??????????????????");
				return false;
			};
			
			if($('#meeting_onoff').val()=='???????????????'){
				$('#meeting_onoff').focus();
				alert("??????????????? ??????????????????");
				return false;
			};
			
			if($('#meeting_period').val()=='???????????????'){
				$('#meeting_period').focus();
				alert("??????????????? ??????????????????");
				return false;
			};
			
			if($('#choices-multiple-remove-button').val().length==0){
				$('#choices-multiple-remove-button').focus();
				alert("????????? ??????????????????");
				return false;
			};
			
			if($('#meeting_title').val().length==0){
				$('#meeting_title').focus();
				alert("????????? ??????????????????");
				return false;
			};
			
			if($('#meeting_contents').val().length==0){
				$('#meeting_contents').focus();
				alert("????????? ??????????????????");
				return false;
			};							
		});
	});
	
	/* ?????? API */
	window.onload=function(){
		var btn = document.getElementById("addr");
		btn.onclick=openKakaoPostcode;
	}
	function openKakaoPostcode(){

		new daum.Postcode({
			oncomplete: function(data){

			document.getElementById("addr").value=data.roadAddress;
			}
		}).open();
		
	}
		
</script>

<style>
.choices__list--multiple .choices__item {
    display: inline-block;
    vertical-align: middle;
    border-radius: 20px;
    padding: 4px 10px;
    font-size: 12px;
    font-weight: 500;
    margin-right: 3.75px;
    margin-bottom: 3.75px;
    background-color: rgb(68, 68, 68);
    border: 1px solid rgb(68, 68, 68);
    color: #fff;
    word-break: break-all;
}

li{
	list-style: none
}

.information_title{
	margin-top: 100px;
} 
  
.form-select{
	width: 450px;
	height: 50px;
}
.form-control{
	width: 450px;
	height: 50px;
}

.one_line_ul{
	margin-left: 100px;
    margin-top: 50px;   	
}

.one_line_li1{
	float: left;
}

.one_line_li2{
	float: left;
	margin-left: 50px;
}

.two_line_ul{
	margin-left: 100px;
    margin-top: 100px;   	
}

.two_line_li1{
	float: left;
}

.two_line_li2{
	float: left;
	margin-left: 50px;
}

.three_line_ul{
	margin-left: 100px;
    margin-top: 100px;   	
}

.three_line_li1{
	float: left;
}

.three_line_li2{
	float: left;
	margin-left: 50px;
}

.four_line_ul{
	margin-left: 100px;
    margin-top: 100px;   	
}

.four_line_li1{
	float: left;
}


.choices__inner{
	float: right;
	margin-left: 90px;
	width: 450px;
	height: 50px;
	border-radius: 7px;
}

.five_line_ul{
	margin-left: 100px;
    margin-top: 50px;   	
}

.four_line_li1{
	float: left;
}

#meeting_title{
	width: 950px;
}

.four_line_li2{
	float: left;
	margin-left: 100px;
}

.information_title{
	display: flex;
    align-items: center;
    padding: 16px;
    margin-bottom: 36px;
    border-bottom: 3px solid #f2f2f2;
    margin-left: 100px;
    width: 1000px;
}

.number_icon1{
	margin-right: 8px;
    width: 28px;
    height: 28px;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 50%;
    background: #ffcd00;
    font-size: 16px;
    font-weight: 700;
    line-height: 19px;
    color: #fff;
}

.information_insert{
	font-weight: 700;
    font-size: 24px;
    line-height: 40px;
    letter-spacing: -.05em;
    margin: 0;
}

.contents_title{
	margin-top:100px;
	display: flex;
    align-items: center;
    padding: 16px;
    margin-bottom: 36px;
    border-bottom: 3px solid #f2f2f2;
    margin-left: 100px;
    width: 1000px;
}

.number_icon2{
	margin-right: 8px;
    width: 28px;
    height: 28px;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 50%;
    background: #ffcd00;
    font-size: 16px;
    font-weight: 700;
    line-height: 19px;
    color: #fff;
}

.contents_insert{
	font-weight: 700;
    font-size: 24px;
    line-height: 40px;
    letter-spacing: -.05em;
    margin: 0;
}
.write_back_button{
	display: flex;
    justify-content: flex-end;
    align-items: center;
    margin-top: 1rem;
    margin-right: 210px;
}

#write_button{
	margin-left: 10px;
}

.label{
	display: inline-block;
    margin-bottom: 5px;
    color: #333;
    font-weight: bold;
    font-size: 18px;
}

a{
	text-decoration: none;
}

a:hover{
	text-decoration:none;
}


</style>

<body>

	<jsp:include page="head.jsp" />

	<div class="container">
		<form action="write" method="post">
			<input type="hidden" name="users_id" id="users_id" value="${ldto.users_id}" />
			<div>
			<section>
				<div class="information_title">
					<span class="number_icon1">1</span>
					<h2 class="information_insert">?????? ????????? ??????????????????.</h2>
				</div>
			</section>
				<ul class="one_line_ul">
					<li class="one_line_li1">
						<label class="label">?????? ??????</label>
						<div>
							<select class="form-select" aria-label="Default select example"
								name="meeting_category" id="meeting_category">
								<option selected>???????????????</option>
								<option value="0">????????????</option>
								<option value="1">?????????</option>
							</select>
						</div>
					</li>
					<li class="one_line_li2">
						<label class="label">?????? ??????</label>
						<div>
							<select class="form-select" aria-label="Default select example"
								name="meeting_membernum" id="meeting_membernum">
								<option selected>???????????????</option>								
								<option value="1">1???</option>
								<option value="2">2???</option>
								<option value="3">3???</option>
								<option value="4">4???</option>
								<option value="5">5???</option>
								<option value="6">6???</option>
							</select>
						</div>
					</li>
				</ul>
			</div>
			<br>
			<div>
				<ul class="two_line_ul">
					<li class="two_line_li1">
						<label class="label">?????? ??????</label>
						<div>
							<select class="form-select" aria-label="Default select example"
								name="meeting_onoff" id="meeting_onoff">
								<option selected>???????????????</option>
								<option value="?????????">?????????</option>
								<option value="????????????">????????????</option>
							</select>
						</div>
					</li>
					<li class="two_line_li2">
						<label class="label">?????? ??????</label>
						<div>
							<select class="form-select" aria-label="Default select example"
								name="meeting_period" id="meeting_period">
								<option selected>???????????????</option>
								<option value="1~2??????">1~2??????</option>
								<option value="2~3??????">2~3??????</option>
								<option value="3~4??????">3~4??????</option>
								<option value="5??????~??????">5??????~??????</option>
							</select>

						</div>
					</li>
				</ul>
			</div>
			<br>
			<div>
				<ul class="three_line_ul">
					<li class="three_line_li1">
						<label class="label">?????? ??????</label>
						<div>
							<input type="text" id="date-picker"
							class="form-control bg-white border-1 small" aria-label="Search"
							aria-describedby="basic-addon2" name="meeting_startdate" id="meeting_startdate" value="??????">					
						</div>
					</li>
					<li class="three_line_li2">
						<label class="label">?????? ??????</label>
						<div>
							<input type="text"  class="form-control" name="meeting_place" id="addr" size="30" placeholder="?????? ??????"/>											
						</div>
					</li>
				</ul>
			</div>
			<br>
			<div>
				<ul class="four_line_ul">
					<li class="four_line_li1">
						<label class="label">?????? ??????</label>
						<div>
							<input type="text" class="form-control" name="meeting_contact" id="" value="https://open.kakao.com/" />					
						</div>
					</li>
					<li class="four_line_li2">
						<label style="margin-left: -50px;" class="label">?????? ??????</label>
						<div class="row d-flex justify-content-center mt-100">
						<div class="col-md-6">
							<select id="choices-multiple-remove-button"
								placeholder="Select upto 5 tags" class="mul-select" name="meeting_skill" multiple>
								<option value="java">java</option>
								<option value="Spring">Spring</option>
								<option value="Nodejs">Nodejs</option>
								<option value="Kotlin">Kotlin</option>
								<option value="TypeScript">TypeScript</option>
								<option value="React">React</option>
								<option value="Vue">Vue</option>
								<option value="MySQL">MySQL</option>
								<option value="Python">Python</option>
								<option value="php">php</option>
							</select>
						</div>
						</div>
					</li>
				</ul>
			</div>
			<br>
			<br>
			<br>
			<br>
			<br>
			<div>
			<section>
				<div class="contents_title">
					<span class="number_icon2">2</span>
					<h2 class="contents_insert">??????????????? ??????????????????.</h2>
				</div>
			</section>
				<ul class="five_line_ul">
					<li class="five_line_li1">
						<label class="label">??????</label>
						<div>
							<input class="form-control" type="text" name="meeting_title" id="meeting_title" />
							<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}" />					
						</div>
						<br>
						<div>
							<textarea class="summernote" name="meeting_contents" id="meeting_contents"></textarea> 
						</div>
					</li>					
				</ul>
			</div>
			<br>
			<div>
				<section class="write_back_button">
					<a href="/joinus/main"><input type="button" value="??????" id="back_button"  class="btn btn-light" /></a>
					<input type="submit" value="????????????" id="write_button" class="btn btn-dark"/>	
				</section>
			</div>
		</form>
	</div>

</body>
</html>
$(function() {
	$("#idBtn").on("click", idCheck);

	$("#id").on("keyup", function() {
		$("#idCheck").html("");
	});

	$("#mytype li > a").on("click", function() {
		// 버튼에 선택된 항목 텍스트 넣기 
		$("#email2").val($(this).text());
	});

	$("#rePw").on("change keyup paste", function() {
		if ($("#pw").val() == $("#rePw").val()) {
			$("#pwCheck").html("비밀번호가 일치합니다.");
		} else {
			$("#pwCheck").html("비밀번호가 일치하지 않습니다.");
		}
	});

	$("#searchAddrs").on("click", execDaumPostcode);

	/*이메일 인증 버튼 눌렀을 때 이벤트*/
	$("#checkEmail").click(function() {
		//이메일 안 쓴 경우
		if($("#email1").val == "" || $("#email2").val() == ""){
			alert('이메일을 입력해주세요');
			return false;
		}
		
		//해당 이메일이 존재하는지 검증
		$.ajax({
			type: "GET",
			url: "/isExistEmail",
			data: { "users_email": $("#email1").val() + "@" + $("#email2").val().trim() },
			success: function(data) {
				console.log(data);
				if (data == 1) {
					alert("이미 가입된 이메일입니다.");
					return false;
				} else{
							
					//인증메일 보내기
					$.ajax({
						type: "POST",
						url: "login/mailConfirm",
						data: {
							"email": $("#email1").val() + "@" + $("#email2").val().trim()
						},
						success: function(data) {
							alert("해당 이메일로 인증번호 발송이 완료되었습니다.");
							console.log("data : " + data);
							chkEmailConfirm(data, $("#memailconfirm"), $("#memailconfirmTxt"));
						}
					})
				}
			}
		})
	})
});

function idCheck() {
	var txt = $("#id").val().trim();

	if (txt == "") {
		alert("id를 입력하세요.");
		return false;
	}

	var regid = /^[A-Za-z]{1}[A-Za-z0-9]{3,19}$/;
	if (!regid.test(txt)) {
		alert("아이디는 4~12자의 영문 또는 숫자 조합으로 적어야 합니다.");
		$("#id").focus();
		return false;
	}

	//json방식으로 ajax해보기
	$.ajax({
		type: "GET",
		async: true, //비동기화방식으로
		url: "/isExistId", //찾아갈 url
		data: { "users_id": $("#id").val() }, //전송할 데이터
		success: function(data) {
			console.log(data);
			if (data == 1) {
				$("#idCheck").html("아이디가 존재합니다.");
				return false;
			} else {
				$("#idCheck").html("사용 가능한 아이디입니다.");
			}
		}
	});

	return true;
}

function execDaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수
			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}
			// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			if (data.userSelectedType === 'R') {
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
			}
			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById("zipcode").value = data.zonecode;
			document.getElementById("address").value = addr;
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("addrsDetail").focus();
		}
	}).open();
}

function checkAll() {
	if (!checkId($("#id").val())) {
		return false;
	} else if (!checkEmail($("#email1").val(), $("#email2").val())) {
		return false;
	} else if (!checkPw($("#pw").val(), $("#rePw").val())) {
		return false;
	} else if (!checkNickname($("#nickname").val())) {
		return false;
	} else if (!checkName($("#name").val())) {
		return false;
	} else if (!checkPhone($("#phone").val())) {
		return false;
	} else if (!checkAddress($("#zipcode").val(), $("#addrsDetail").val())) {
		return false;
	} else if (!checkEmailAuth($("#memailconfirm").val())){
		return false;
	}
	return true;
}

function checkMsg(){
	if($("#memailconfirmTxt").text() == "인증번호가 잘못되었습니다"){
		alert("올바른 인증번호를 입력하세요");
		return false;
	}
	return true;
}

function checkExist(value, msg) {
	if (value == "") {
		alert(msg + " 입력하세요.");
		return false;
	}
	return true;
}

function checkId(id) {
	if (!checkExist(id, "아이디를")) {
		return false;
	}

	if ($("#idCheck").text() == "") {
		alert("아이디 중복확인을 하세요.");
		return false;
	} else if ($("#idCheck").text() == "id가 존재합니다.") {
		alert("다른 id를 사용하세요.");
		$("#id").focus();
		return false;
	}

	return true;
}

function checkEmail(em1, em2) {
	if (!checkExist(em1, "이메일 아이디를")) {
		$("#email1").focus();
		return false;
	}
	if (!checkExist(em2, "이메일 주소를")) {
		$("#email2").focus();
		return false;
	}
	return true;
}

function checkPw(pw1, pw2) {
	if (!checkExist(pw1, "비밀번호를")) {
		$("#pw").focus();
		return false;
	}

	if (!checkExist(pw2, "비밀번호 확인을")) {
		$("rePw").focus();
		return false;
	}

	if (pw1 != pw2) {
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}

	var regpw = /^[a-zA-z0-9]{4,12}$/;
	if (!regpw.test(pw1)) {
		alert("비밀번호는 4~12자의 영문 대소문자 또는 숫자로 입력해야합니다.");
		return false;
	}

	if ($("#id").val() == $("#pw").val()) {
		alert("아이디와 비밀번호는 같을 수 없습니다.");
		$("#pw").focus();
		return false;
	}

	return true;
}

function checkNickname(nickname) {
	if (!checkExist(nickname, "닉네임을")) {
		$("#nickname").focus();
		return false;
	}

	var regnickname = /^[가-힣a-zA-Z0-9]{2,10}$/;
	if (!regnickname.test(nickname)) {
		alert("닉네임은 2~10자 이내의 한글, 숫자, 영문만 입력 가능합니다.");
		$("#nickname").focus();
		return false;
	}
	return true;
}

function checkName(name) {
	if (!checkExist(name, "이름을")) {
		$("#name").focus();
		return false;
	}

	var regname = /^[가-힣]{2,4}$/;
	if (!regname.test(name)) {
		alert("이름은 2~4자 이내의 한글만 입력 가능합니다.");
		$("#name").focus();
		return false;
	}
	return true;
}

function checkPhone(phone) {
	if (!checkExist(phone, "전화번호를")) {
		$("#phone").focus();
		return false;
	}

	var regphone = /^[0-9]{8,11}$/;
	if (!regphone.test(phone)) {
		alert("전화번호는 8~11자 이내의 숫자만 입력 가능합니다.");
		$("#phone").focus();
		return false;
	}
	return true;
}

function checkAddress(zipcode, addrsDetail) {
	if (!checkExist(zipcode, "주소를")) {
		$("#zipcode").focus();
		return false;
	}

	if (!checkExist(addrsDetail, "상세주소를")) {
		$("#addrsDetail").focus();
		return false;
	}
	return true;
}

// 이메일 인증번호 체크 함수
function chkEmailConfirm(data, $memailconfirm, $memailconfirmTxt) {
	$memailconfirm.on("keyup", function() {
		if (data != $memailconfirm.val()) { //
			emconfirmchk = false;
			$memailconfirmTxt.html("<span id='emconfirmchk'>인증번호가 잘못되었습니다</span>")
			$("#emconfirmchk").css({
				"color": "#FA3E3E",
				"font-weight": "bold",
				"font-size": "10px"

			})
			//console.log("중복아이디");
		} else { // 아니면 중복아님
			emconfirmchk = true;
			$memailconfirmTxt.html("<span id='emconfirmchk'>인증번호 확인 완료</span>")

			$("#emconfirmchk").css({
				"color": "#0D6EFD",
				"font-weight": "bold",
				"font-size": "10px"

			})
		}
	})
}

function checkEmailAuth(authCode){
	if (!checkExist(authCode, "인증번호를")) {
		$("#memailconfirm").focus();
		return false;
	}

	if (!checkMsg()) {
		$("#memailconfirm").focus();
		return false;
	}
	return true;
}
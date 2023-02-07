package kr.co.joinus.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.joinus.service.RegisterMail;

@Controller
public class AccountController {
	
	@Autowired
	RegisterMail registerMail;

	//이메일 인증
	@PostMapping("/login/mailConfirm")
	@ResponseBody
	String mailConfirm(@RequestParam("email") String email) throws Exception {
		
		String code = registerMail.sendSimpleMessage(email);
		System.out.println("인증코드: "+code);
		return code;
	}
}
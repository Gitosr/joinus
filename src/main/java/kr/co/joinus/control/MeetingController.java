package kr.co.joinus.control;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import kr.co.joinus.dto.MeetingDTO;
import kr.co.joinus.service.MeetingService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/meeting")
public class MeetingController {

	@Autowired
	MeetingService service;

	
	@GetMapping("/write")
	public String wirteForm() {

		
		return "/writeForm";
	}
	
	@PostMapping("/write")
	public String WriteOk(@ModelAttribute("dto")MeetingDTO dto,
						  HttpServletRequest request,
						  Model model) {			
		//미팅 등록
		service.add(dto);
				
		return "redirect:/joinus/main";		
	}	
	
	@GetMapping("/detail")
	public String detail(@RequestParam("meeting_number")int meeting_number, Model model) {
		MeetingDTO dto = service.selectOne(meeting_number);


		model.addAttribute("dto", dto);


		return "detail";
	}
	
	@GetMapping("/modify")
	public String modifyForm(@RequestParam("meeting_number")int meeting_number, Model model) {
		MeetingDTO dto = service.selectOne(meeting_number);

		model.addAttribute("dto", dto);

		System.out.println(dto);

		return "/modifyForm";
	}
	
	@PostMapping("/modify")
	public String modifyOk(@ModelAttribute("dto")MeetingDTO dto) {
		
		service.updateOne(dto);

		return "redirect:/joinus/main";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("meeting_number")int meeting_number) {

		service.deleteOne(meeting_number);
		return "redirect:/joinus/main";
	}
	
	@GetMapping("/skill")
	public String Meetinglist(@RequestParam("skill")String skill, Model model) {
				
		List<MeetingDTO> list = service.getSkill(skill);
		
		model.addAttribute("list", list);
				
		System.out.println(list);
		
		return "main";
	}
	

	
	
}
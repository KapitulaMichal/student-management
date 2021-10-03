package com.studentmanagement.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.studentmanagement.api.Login;
import com.studentmanagement.api.Teacher;
import com.studentmanagement.service.TeacherService;

@Controller
public class LoginController {

	@Autowired
	TeacherService teacherService;

	@GetMapping("/")
	public String login(@ModelAttribute Login login) {

		return "login";
	}

	@PostMapping("/loginProcess")
	public String loginProcess(Login login, Model model, HttpSession session) {

		Teacher teacher = teacherService.validateTeacher(login);

		if (teacher != null) {
			session.setAttribute("login", teacher);
			return "redirect:students";
		} else {
			model.addAttribute("message", "Incorrect email or password");
			return "login";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
	}
}

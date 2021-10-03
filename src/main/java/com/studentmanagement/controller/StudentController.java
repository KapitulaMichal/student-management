package com.studentmanagement.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.studentmanagement.api.Student;
import com.studentmanagement.api.Teacher;
import com.studentmanagement.service.StudentService;

@Controller
public class StudentController {

	@Autowired
	StudentService studentService;

	@GetMapping("students")
	public String showStudents(Model model, HttpSession session) {
		
		Teacher login = (Teacher) session.getAttribute("login");
		
		if(login == null)
			return "redirect:/";

		List<Student> studentList = studentService.loadStudents();

		model.addAttribute("students", studentList);

		return "student-list";
	}

	@GetMapping("/addStudent")
	public String showAddStudentPage(@ModelAttribute Student student) {

		return "add-student";
	}

	@PostMapping("/addOrModifyStudent")
	public String addOrModifyStudent(@Valid Student student, BindingResult result) {
		
		if(result.hasErrors()) {
			System.out.println("my form has errors");
			
			List<ObjectError> allErrors = result.getAllErrors();
			
			for(ObjectError temp : allErrors) {
				System.out.println(temp);
			}
			
			return "add-student";
		}

		if (student.getId() == 0) {
			studentService.saveStudent(student);
		} else {
			studentService.updateStudent(student);
		}

		return "redirect:/students";
	}

	@GetMapping("/editStudent")
	public String editStudent(@RequestParam("studentId") int id, Model model) {

		model.addAttribute("student", studentService.loadStudent(id));

		return "edit-student";
	}

	@GetMapping("/deleteStudent")
	public String deleteStudent(@RequestParam("studentId") int id) {

		studentService.deleteStudent(id);

		return "redirect:/students";
	}
}

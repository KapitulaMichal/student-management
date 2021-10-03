package com.studentmanagement.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.studentmanagement.api.Course;
import com.studentmanagement.api.Student;
import com.studentmanagement.api.Teacher;
import com.studentmanagement.service.CourseService;

@Controller
public class CourseController {

	@Autowired
	CourseService courseService;

	@GetMapping("/test")
	public String test(Model model) {

		courseService.loadStudentsFromCourse(1);

		return "hello";
	}

	@GetMapping("/courses")
	public String showCourses(Model model, HttpSession session) {

		Teacher login = (Teacher) session.getAttribute("login");

		if (login == null)
			return "redirect:/";

		List<Course> courseList = courseService.loadCourses();
		model.addAttribute("courses", courseList);

		return "courses-list";
	}

	@GetMapping("/coursePage")
	public String coursePage(@RequestParam("courseId") int id, Model model) {

		Course course = courseService.getCourse(id);
		model.addAttribute("course", course);

		List<Student> courseStudents = courseService.loadStudentsFromCourse(id);
		model.addAttribute("courseStudents", courseStudents);

		List<Student> otherStudents = courseService.loadStudentsOutsideOfTheCourse(id);
		model.addAttribute("otherStudents", otherStudents);

		return "course-page";
	}

	@GetMapping("/addStudentToCourse")
	public String addStudentToCourse(@RequestParam("courseId") int courseId, @RequestParam("studentId") int studentId) {

		courseService.addStudentToCourse(courseId, studentId);

		return "redirect:/coursePage?courseId=" + courseId;
	}

	@GetMapping("/deleteStudentFromCourse")
	public String deleteStudentFromCourse(@RequestParam("courseId") int courseId,
			@RequestParam("studentId") int studentId) {

		courseService.deleteStudentFromCourse(courseId, studentId);

		return "redirect:/coursePage?courseId=" + courseId;
	}
}

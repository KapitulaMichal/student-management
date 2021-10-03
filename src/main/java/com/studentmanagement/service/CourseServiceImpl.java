package com.studentmanagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studentmanagement.api.Course;
import com.studentmanagement.api.Student;
import com.studentmanagement.dao.CourseDAO;

@Service
public class CourseServiceImpl implements CourseService {

	@Autowired
	CourseDAO courseDAO;

	@Override
	public List<Course> loadCourses() {

		return courseDAO.loadCourses();
	}

	@Override
	public List<Student> loadStudentsFromCourse(int courseId) {

		return courseDAO.loadStudentsFromCourse(courseId);
	}

	@Override
	public List<Student> loadStudentsOutsideOfTheCourse(int courseId) {

		return courseDAO.loadStudentsOutsideOfTheCourse(courseId);
	}

	@Override
	public Course getCourse(int id) {

		return courseDAO.getCourse(id);
	}

	@Override
	public void addStudentToCourse(int courseId, int studentId) {

		courseDAO.addStudentToCourse(courseId, studentId);

	}

	@Override
	public void deleteStudentFromCourse(int courseId, int studentId) {

		courseDAO.deleteStudentFromCourse(courseId, studentId);

	}

}

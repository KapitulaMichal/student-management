package com.studentmanagement.service;

import java.util.List;

import com.studentmanagement.api.Course;
import com.studentmanagement.api.Student;

public interface CourseService {

	public List<Course> loadCourses();

	public List<Student> loadStudentsFromCourse(int courseId);
	
	public List<Student> loadStudentsOutsideOfTheCourse(int courseId);
	
	public void addStudentToCourse(int courseId, int studentId);
	
	public void deleteStudentFromCourse(int courseId, int studentId);
	
	public Course getCourse(int id);
}

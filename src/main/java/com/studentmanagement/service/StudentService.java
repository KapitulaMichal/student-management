package com.studentmanagement.service;

import java.util.List;

import com.studentmanagement.api.Student;

public interface StudentService {
	
	public List<Student> loadStudents();
	
	public Student loadStudent(int id);
	
	public void saveStudent(Student student);
	
	public void updateStudent(Student student);
	
	public void deleteStudent(int id);

}

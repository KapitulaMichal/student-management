package com.studentmanagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studentmanagement.api.Student;
import com.studentmanagement.dao.StudentDAO;

@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	StudentDAO studentDAO;

	@Override
	public List<Student> loadStudents() {

		return studentDAO.loadStudents();
	}

	@Override
	public Student loadStudent(int id) {

		return studentDAO.loadStudent(id);
	}

	@Override
	public void saveStudent(Student student) {

		studentDAO.saveStudent(student);

	}

	@Override
	public void updateStudent(Student student) {

		studentDAO.updateStudent(student);

	}

	@Override
	public void deleteStudent(int id) {
		studentDAO.deleteStudent(id);

	}

}

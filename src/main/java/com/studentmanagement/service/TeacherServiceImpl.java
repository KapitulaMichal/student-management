package com.studentmanagement.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studentmanagement.api.Login;
import com.studentmanagement.api.Teacher;
import com.studentmanagement.dao.TeacherDAO;

@Service
public class TeacherServiceImpl implements TeacherService {

	@Autowired
	TeacherDAO teacherDAO;	
	
	@Override
	public Teacher validateTeacher(Login login) {
		
		return teacherDAO.validateTeacher(login);
	}

}

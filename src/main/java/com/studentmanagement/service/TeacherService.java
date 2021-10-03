package com.studentmanagement.service;

import com.studentmanagement.api.Login;
import com.studentmanagement.api.Teacher;

public interface TeacherService {
	
	public Teacher validateTeacher(Login login);

}

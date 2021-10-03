package com.studentmanagement.dao;

import com.studentmanagement.api.Login;
import com.studentmanagement.api.Teacher;

public interface TeacherDAO {
	
	public Teacher validateTeacher(Login login);
}

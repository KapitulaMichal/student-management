package com.studentmanagement.rowmappers;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import org.springframework.jdbc.core.RowMapper;

import com.studentmanagement.api.Student;

public class StudentRowMapper implements RowMapper<Student> {

	@Override
	public Student mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		Student student = new Student();
		
		student.setId(rs.getInt("id"));
		student.setName(rs.getString("name"));
		student.setSurname(rs.getString("surname"));
		student.setDateOfBirth(LocalDate.parse(rs.getString("date_of_birth")));
		student.setPhone(rs.getLong("phone"));
		
		return student;
	}

}

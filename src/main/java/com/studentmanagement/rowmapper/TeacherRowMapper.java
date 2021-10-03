package com.studentmanagement.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.studentmanagement.api.Teacher;

public class TeacherRowMapper implements RowMapper<Teacher> {

	@Override
	public Teacher mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		Teacher teacher = new Teacher();
		
		teacher.setId(rs.getInt("id"));
		teacher.setName(rs.getString("name"));
		teacher.setSurname(rs.getString("surname"));
		teacher.setPhone(rs.getLong("phone"));
		teacher.setEmail(rs.getString("email"));
		
		return teacher;
	}

}

package com.studentmanagement.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.studentmanagement.api.Login;
import com.studentmanagement.api.Teacher;
import com.studentmanagement.rowmappers.TeacherRowMapper;

@Repository
public class TeacherDAOImpl implements TeacherDAO {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public Teacher validateTeacher(Login login) {

		String sql = "SELECT * FROM teachers WHERE email = ? AND password = ?";

		Teacher teacher;

		try {
			teacher = jdbcTemplate.queryForObject(sql, new TeacherRowMapper(), login.getEmail(), login.getPassword());
		} catch (EmptyResultDataAccessException e) {
			return null;
		}

		return teacher;

	}

}

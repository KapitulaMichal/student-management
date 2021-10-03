package com.studentmanagement.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.studentmanagement.api.Student;
import com.studentmanagement.rowmappers.StudentRowMapper;

@Repository
public class StudentDAOImpl implements StudentDAO {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public List<Student> loadStudents() {

		String sql = "SELECT * FROM students";

		List<Student> studentList = jdbcTemplate.query(sql, new StudentRowMapper());

		return studentList;
	}

	@Override
	public Student loadStudent(int id) {
		String sql = "SELECT * FROM students WHERE id = ?";

		Student student = jdbcTemplate.queryForObject(sql, new StudentRowMapper(), id);

		return student;
	}

	@Override
	public void saveStudent(Student student) {
		String sql = "INSERT INTO students(name, surname, date_of_birth, phone) VALUES (?, ?, ?, ?);";
		
		Object[] args = {student.getName(), student.getSurname(), student.getDateOfBirth(), student.getPhone()};
		
		jdbcTemplate.update(sql, args);

	}

	@Override
	public void updateStudent(Student student) {
		String sql = "UPDATE students SET name = ?, surname = ?, date_of_birth = ?, phone = ? WHERE id = ?";
		
		Object[] args = {student.getName(), student.getSurname(), student.getDateOfBirth(), student.getPhone(), student.getId()};
		
		jdbcTemplate.update(sql, args);

	}

	@Override
	public void deleteStudent(int id) {
		String sql = "DELETE FROM students WHERE id = ?";
		
		jdbcTemplate.update(sql, id);
	}

}

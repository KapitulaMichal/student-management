package com.studentmanagement.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.studentmanagement.api.Course;
import com.studentmanagement.api.Student;
import com.studentmanagement.rowmapper.StudentRowMapper;

@Repository
public class CourseDAOImpl implements CourseDAO {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public List<Course> loadCourses() {

		String sql = "SELECT * FROM courses";

		List<Course> courseList = jdbcTemplate.query(sql, new BeanPropertyRowMapper<Course>(Course.class));

		return courseList;
	}

	@Override
	public Course getCourse(int id) {

		String sql = "SELECT * FROM courses WHERE id = ?";

		Course course = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<Course>(Course.class), id);

		return course;
	}

	@Override
	public List<Student> loadStudentsFromCourse(int courseId) {

		String sql = "SELECT s.id, s.name, s.surname, s.date_of_birth, s.phone FROM students s INNER JOIN enrollments e on (s.id = e.student_id) INNER JOIN courses c ON (c.id = e.course_id) WHERE c.id = ?";

		List<Student> studentList = jdbcTemplate.query(sql, new StudentRowMapper(), courseId);

		return studentList;
	}

	@Override
	public List<Student> loadStudentsOutsideOfTheCourse(int courseId) {

		String sql = "SELECT s.id, s.name, s.surname, s.date_of_birth, s.phone FROM students s WHERE s.id NOT IN(\n"
				+ "    SELECT s.id FROM students s \n" + "    INNER JOIN enrollments e on (s.id = e.student_id) \n"
				+ "    INNER JOIN courses c ON (c.id = e.course_id) \n" + "    WHERE c.id = ?\n" + ")";

		List<Student> studentList = jdbcTemplate.query(sql, new StudentRowMapper(), courseId);

		return studentList;
	}

	@Override
	public void addStudentToCourse(int courseId, int studentId) {
		
		String sql = "INSERT INTO enrollments(course_id, student_id) VALUES (?, ?)";
		
		jdbcTemplate.update(sql, courseId, studentId);

	}

	@Override
	public void deleteStudentFromCourse(int courseId, int studentId) {

		String sql = "DELETE FROM enrollments WHERE course_id = ? AND student_id = ?";

		jdbcTemplate.update(sql, courseId, studentId);

	}

}

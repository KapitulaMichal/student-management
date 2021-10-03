package com.studentmanagement.api;

import java.time.LocalDate;

import javax.validation.constraints.Digits;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

public class Student {

	private int id;
	
	@NotBlank(message = "Name cannot be blank")
	@Size(min = 2, max = 15, message="Name should be between 2 and 15 characters")
	private String name;
	
	@NotBlank(message = "Surname cannot be blank")
	@Size(min = 3, max = 30, message="Name should be between 3 and 30 characters")
	private String surname;
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private LocalDate dateOfBirth;
	
	@Min(value = 100000000, message = "Phone must have 8 to 10 digits")
	@Max(value = 1000000000, message = "Phone must have 8 to 10 digits")
	private Long phone;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public LocalDate getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(LocalDate dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public Long getPhone() {
		return phone;
	}

	public void setPhone(Long phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "Student [id=" + id + ", name=" + name + ", surname=" + surname + ", dateOfBirth=" + dateOfBirth
				+ ", phone=" + phone + "]";
	}

}

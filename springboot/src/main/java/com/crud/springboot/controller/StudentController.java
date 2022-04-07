package com.crud.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.crud.springboot.model.Student;
import com.crud.springboot.service.StudentService;

@RestController
public class StudentController {

	@Autowired
	private StudentService studentService;

	@RequestMapping(value = "/student", method = RequestMethod.POST)
	public Student createstudent(@RequestBody Student student) {
		return studentService.createStudent(student);
	}

	@RequestMapping(value = "/student", method = RequestMethod.GET)
	public List<Student> listStudents() {
		return studentService.getStudents();
	}

	@RequestMapping(value = "/student/{id}", method = RequestMethod.PUT)
	public Student readStudent(@PathVariable(value = "id") Long id, @RequestBody Student student) {
		return studentService.updateStudent(id, student);
	}

	@RequestMapping(value = "/student/{id}", method = RequestMethod.DELETE)
	public void deleteStudent(@PathVariable(value = "id") Long id) {
		studentService.deleteStudent(id);
	}
}
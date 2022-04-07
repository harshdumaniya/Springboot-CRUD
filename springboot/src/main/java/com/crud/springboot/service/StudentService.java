package com.crud.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.crud.springboot.model.Student;
import com.crud.springboot.repository.StudentRepository;

@Service
public class StudentService {

	@Autowired
	private StudentRepository studentRepository;

	public Student createStudent(Student student) {
		return studentRepository.save(student);
	}

	public List<Student> getStudents() {
		return studentRepository.findAll();
	}

	public Student updateStudent(Long studentId, Student studentDetails) {
		Student student = studentRepository.findById(studentId).get();
		student.setFirstName(studentDetails.getFirstName());
		student.setLastName(studentDetails.getLastName());
		student.setAge(studentDetails.getAge());
		student.setGender(studentDetails.getGender());
		student.setMobileNo(studentDetails.getMobileNo());
		student.setAddress(studentDetails.getAddress());
		return studentRepository.save(student);
	}

	public void deleteStudent(Long studentId) {
		studentRepository.deleteById(studentId);
	}

}
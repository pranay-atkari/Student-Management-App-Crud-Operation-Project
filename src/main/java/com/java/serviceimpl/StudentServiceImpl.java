package com.java.serviceimpl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.model.Student;
import com.java.repository.StudentRepository;
import com.java.service.StudentService;

@Service
public class StudentServiceImpl  implements StudentService
{
	@Autowired
	private StudentRepository sr;

	@Override
	public void saveStudentDetails(Student st) 
	{
		sr.save(st);
		
	}

	@Override
	public List<Student> getAllStudent() {
		
		return sr.findAll();
	}

	@Override
	public List<Student> searchStudentsByBatch(String batchNumber) 
	{
		List<Student> batchStudents= sr.findAllByBatchNumber(batchNumber);
		
		return batchStudents ;
	}

	@Override
	public Student getSingleStudent(int id) 
	{
		Optional<Student> opStudent=sr.findById(id);
		return opStudent.get();
	}

	@Override
	public void updateStudentFees(int studentid, float ammount) 
	{
		Optional<Student> opStudent=sr.findById(studentid);
		Student st=opStudent.get();
		
		st.setFeesPaid(st.getFeesPaid()+ammount);
		sr.save(st);
		
	}

}

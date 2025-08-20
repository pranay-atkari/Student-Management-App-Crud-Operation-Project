package com.java.serviceimpl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.model.Student;
import com.java.repository.StudentRepository;
import com.java.service.StudentService;

@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	private StudentRepository sr;

	@Override
	public void saveStudentDetails(Student st) {
		sr.save(st);
	}

	@Override
	public List<Student> getAllStudent() {
		return sr.findAll();
	}

	@Override
	public List<Student> searchStudentsByBatch(String batchNumber) {
		return sr.findAllByBatchNumber(batchNumber);
	}

	@Override
	public Student getSingleStudent(int id) {
		Optional<Student> op = sr.findById(id);
		return op.orElse(null);
	}

	@Override
	public void updateStudentFees(int studentid, float amount) {
		Optional<Student> op = sr.findById(studentid);
		if (op.isPresent()) {
			Student st = op.get();
			st.setFeesPaid(st.getFeesPaid() + amount);
			sr.save(st);
		}
	}

	@Override
	public void deleteStudent(int id) {
		sr.deleteById(id);
	}
}
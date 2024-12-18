package com.java.service;

import java.util.List;

import com.java.model.Student;

public interface StudentService 
{
    public void saveStudentDetails(Student st);
    
    public List<Student> getAllStudent();
    
    public List<Student> searchStudentsByBatch(String batchNumber);

	public Student getSingleStudent(int id);

	public void updateStudentFees(int studentid, float ammount);
}

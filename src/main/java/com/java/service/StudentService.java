package com.java.service;

import java.util.List;
import com.java.model.Student;

public interface StudentService {
    void saveStudentDetails(Student st);

    List<Student> getAllStudent();

    List<Student> searchStudentsByBatch(String batchNumber);

    Student getSingleStudent(int id);

    void updateStudentFees(int studentid, float amount);

    void deleteStudent(int id); // The method is declared here
}
package com.java.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.java.model.Student;

public interface StudentRepository extends JpaRepository<Student, Integer>
{

	List<Student> findAllByBatchNumber(String batchNumber);

}
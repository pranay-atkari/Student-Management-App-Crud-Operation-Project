package com.java.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.java.model.Student;
import com.java.service.StudentService;

@Controller
public class AdminController {

	@Autowired
	private StudentService ss;

	@GetMapping("/")
	public String preLogin() {
		return "login";
	}

	@PostMapping("/login")
	public String onlogin(@RequestParam String username, @RequestParam String password, Model m) {
		if ("pranayatkari58@gmail.com".equals(username) && "Pranay123".equals(password)) {
			return "redirect:/admin";
		} else {
			m.addAttribute("login_fail", "Enter valid login details.");
			return "login";
		}
	}

	@GetMapping("/admin")
	public String adminPage() {
		return "adminscreen";
	}

	@PostMapping("/enroll_student")
	public String saveStudent(@ModelAttribute Student student) {
		ss.saveStudentDetails(student);
		return "redirect:/student-details";
	}

	@GetMapping("/student-details")
	public String viewAllStudents(Model m) {
		List<Student> students = ss.getAllStudent();
		m.addAttribute("data", students);
		return "studentdetails";
	}

	@GetMapping("/search")
	public String getBatchStudent(@RequestParam String batchNumber, Model m) {
		List<Student> result = ss.searchStudentsByBatch(batchNumber);
		if (result != null && result.size() > 0) {
			m.addAttribute("data", result);
		} else {
			List<Student> students = ss.getAllStudent();
			m.addAttribute("data", students);
			m.addAttribute("message", "List Not Available for batch '" + batchNumber + "'");
		}
		return "studentdetails";
	}

	@GetMapping("/fees")
	public String onFees(@RequestParam int id, Model m) {
		Student st = ss.getSingleStudent(id);
		m.addAttribute("st", st);
		return "fees";
	}

	@PostMapping("/payfees")
	public String payFees(@RequestParam int studentid, @RequestParam float ammount) {
		ss.updateStudentFees(studentid, ammount);
		return "redirect:/student-details";
	}

	@GetMapping("/delete")
	public String deleteStudent(@RequestParam int id, RedirectAttributes redirectAttributes) {
		ss.deleteStudent(id); // The correct method is called here
		redirectAttributes.addFlashAttribute("success", "Student deleted successfully!");
		return "redirect:/student-details";
	}
}
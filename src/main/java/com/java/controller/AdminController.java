package com.java.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.java.model.Student;
import com.java.service.StudentService;

@Controller
public class AdminController 
{
	@Autowired
	private StudentService ss;
	
     @RequestMapping("/")
	  public String preLogin()
	  {
		  return "login";
	  }
    
     @RequestMapping("/login")
     public String onlogin(@RequestParam String username,@RequestParam String password, Model m)
     {
    	if(username.equals("pranayatkari58@gmail.com") && password.equals("Pranay123")) 
    	{
    		List<Student> student= ss.getAllStudent();
    		m.addAttribute("data", student);
    		return "adminscreen";
    	}
    	else {
    		m.addAttribute("login_fail","Enter valid login details.");
    		
    			return "login";
    	     }
    	}
     
     
     @RequestMapping("/enroll_student")
       public String saveStudent(@ModelAttribute Student student, Model m)
       {
    	   ss.saveStudentDetails(student);
    	   
    	   List<Student> students= ss.getAllStudent();
   		m.addAttribute("data", students);
    	   
    	   return "adminscreen";
       }
     
     @RequestMapping("/search")
     public String getBatchStudent(@RequestParam String batchNumber, Model m)
     {
    	 List<Student> result=ss.searchStudentsByBatch(batchNumber);
    	 if(result.size()>0)
    	 {
    		 m.addAttribute("data",result);
    	 }
    	 else {
    		 List<Student> students=ss.getAllStudent();
    		 m.addAttribute("data", students);
    		 m.addAttribute("message", "List Are Not Available  '"+batchNumber+"'....!");
    	 }
    	 
    	return "adminscreen"; 
     }
     
     @RequestMapping("/fees")
     public String onFees(@RequestParam int id,Model m)
     {
    	 Student st=ss.getSingleStudent(id);
    	 m.addAttribute("st", st);
    	 return "fees";
     }
     
     @RequestMapping("/payfees")
     public String payFees(@RequestParam int studentid, @RequestParam float ammount,Model m)
     {
    	 ss.updateStudentFees(studentid,ammount);
    	 List<Student> students=ss.getAllStudent();
    	 m.addAttribute("data",students);
    	 return "adminscreen";
     }
     
     
}

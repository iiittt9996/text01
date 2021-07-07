package com.bjpowernode.controller;


import com.bjpowernode.domain.Student;
import com.bjpowernode.service.StudentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping(value = "/student")
public class MyController {
    @Resource(name = "studentServiceImpl")
    private StudentService studentService;



    @RequestMapping(value = "/addStudent.do")
    @ResponseBody
    public ModelAndView addStudent(Student student) {
        ModelAndView mv = new ModelAndView();
        int count = studentService.addStudent(student);
        if (count > 0) {
            mv.addObject("flag","注册成功");
        } else {
            mv.addObject("flag","注册失败");
        }
        mv.setViewName("/WEB-INF/view/show.jsp");
        return mv;
    }

    @RequestMapping(value = "/findStudents.do")
    @ResponseBody
    public List<Student> findStudents() {
        return studentService.findStudents();
    }
}

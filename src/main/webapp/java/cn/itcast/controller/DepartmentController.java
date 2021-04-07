package cn.itcast.controller;

import cn.itcast.domain.Department;
import cn.itcast.domain.Doctor;
import cn.itcast.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/department")
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    @RequestMapping("/findOne")
    public void findOne(){
    }

    @RequestMapping("/findAll")
    @ResponseBody
    public List<Department> findAll(){
        List<Department> departments = departmentService.findAll();
        return departments;
    }
}

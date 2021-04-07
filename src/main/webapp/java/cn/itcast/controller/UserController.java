package cn.itcast.controller;

import cn.itcast.domain.Department;
import cn.itcast.domain.Doctor;
import cn.itcast.domain.Patient;
import cn.itcast.domain.User;
import cn.itcast.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    //登入
    @RequestMapping("/login")
    public String login(User user, HttpServletRequest request, HttpServletResponse response) throws IOException {
        boolean flag = userService.login(user);
        if(!flag){
            return "loginFalse";
        }
        HttpSession session = request.getSession();
        session.setAttribute("username",user.getUsername());
        response.sendRedirect(request.getContextPath()+"/user/findAllPatient");
        return null;
    }

    //病人管理
    @RequestMapping("/findAllPatient")
    public String findAllPatient(Model model,HttpServletRequest request){
        String username = (String)request.getSession().getAttribute("username");
        if(username==null){
            return "loginFalse";
        }
        List<Patient> patients = userService.findAllPatient();
        model.addAttribute("patients",patients);
        return "userIndex";
    }

    @RequestMapping("/updatePatient")
    public void updatePatient(Patient patient,HttpServletRequest request,HttpServletResponse response) throws IOException {
        userService.updatePatient(patient);
        response.sendRedirect(request.getContextPath()+"/user/findAllPatient");
    }

    @RequestMapping("/toUpdate")
    public String toUpdate(int patientid,Model model){
        Patient patient = userService.findPatient(patientid);
        model.addAttribute("patient",patient);
        return "toUpdatePatient";
    }

    @RequestMapping("/findSomePatients")
    public String findSomePatients(String onename,Model model){
        List<Patient> patients = userService.findSomePatients(onename.trim());
        model.addAttribute("patients",patients);
        return "userIndex";

    }

    //医生管理
    @RequestMapping("/findAllDoctor")
    public String findAllDoctor(Model model,HttpServletRequest request){
        String username = (String)request.getSession().getAttribute("username");
        if(username==null){
            return "loginFalse";
        }
        List<Doctor> doctors = userService.findAllDoctor();
        model.addAttribute("doctors",doctors);
        return "doctorsInfo";
    }

    @RequestMapping("/findSomeDoctors")
    public String findSomeDoctors(String onename,Model model,HttpServletRequest request){
        String username = (String)request.getSession().getAttribute("username");
        if(username==null){
            return "loginFalse";
        }
        System.out.println(onename);
        List<Doctor> doctors = userService.findSomeDoctors(onename.trim());
        model.addAttribute("doctors",doctors);
        return "doctorsInfo";
    }

    @RequestMapping("/addDoctor")
    public void addDoctor(Doctor doctor,HttpServletRequest request,HttpServletResponse response) throws IOException {
        doctor.setPassword("123456");
        doctor.setState("1");
        userService.addDoctor(doctor);
        response.sendRedirect(request.getContextPath()+"/user/findAllDoctor");
    }

    @RequestMapping("/updateDoctor")
    public void updateDoctor(Doctor doctor,HttpServletRequest request,HttpServletResponse response) throws IOException {
        userService.updateDoctor(doctor);
        System.out.println(doctor.getSex());
        response.sendRedirect(request.getContextPath()+"/user/findAllDoctor");
    }

    @RequestMapping("/getOneDoctor")
    @ResponseBody
    public Doctor getOneDoctor(int doctorid){
        Doctor doctor = userService.getOneDoctor(doctorid);
        return doctor;

    }

    @RequestMapping("/toAddDoctor")
    public String toAddDoctor(){
        return "addDoctor";
    }

    @RequestMapping("/toUpdateDoctor")
    public String toUpdateDoctor(int doctorid,Model model){
        Doctor doctor = userService.findDoctor(doctorid);
        model.addAttribute("doctor",doctor);
        return "updateDoctor";
    }

    @RequestMapping("/resetPassword")
    @ResponseBody
    public int resetPassword(int doctorid){
        userService.resetPassword(doctorid);
        return 1;
    }

    @RequestMapping("/resign")
    @ResponseBody
    public int resign(int doctorid){
        userService.resign(doctorid);
        return 1;
    }
    //根据科室查询医生
    @RequestMapping("/findDoctorsByDepartid")
    @ResponseBody
    public List<Doctor> findDoctorsByDepartid(int departid){
        return userService.findDoctorsByDepartid(departid);
    }

    //科室管理
    @RequestMapping("/findAllDepartment")
    public String findAllDepartment(Model model,HttpServletRequest request){
        String username = (String)request.getSession().getAttribute("username");
        if(username==null){
            return "loginFalse";
        }
        List<Department> departments = userService.findAllDepartment();
        model.addAttribute("departments",departments);
        return "departmentsInfo";
    }

    @RequestMapping("/findSomeDepartments")
    public String findSomeDepartments(String onename,Model model,HttpServletRequest request){
        String username = (String)request.getSession().getAttribute("username");
        if(username==null){
            return "loginFalse";
        }
        System.out.println(onename);
        List<Department> departments = userService.findSomeDepartments(onename.trim());
        model.addAttribute("departments",departments);
        return "departmentsInfo";
    }

    @RequestMapping("/addDepartment")
    public void addDepartment(Department department,HttpServletRequest request,HttpServletResponse response) throws IOException {
        userService.addDepartment(department);

        response.sendRedirect(request.getContextPath()+"/user/findAllDepartment");
    }

    @RequestMapping("/updateDepartment")
    public void updateDepartment(Department department,HttpServletRequest request,HttpServletResponse response) throws IOException {
        userService.updateDepartment(department);
        response.sendRedirect(request.getContextPath()+"/user/findAllDepartment");
    }

    @RequestMapping("/toAddDepartment")
    public String toAddDepartment(){
        return "addDepartment";
    }

    @RequestMapping("/toUpdateDepartment")
    public String toUpdateDepartment(int departid,Model model){
        Department department = userService.findDepartment(departid);
        model.addAttribute("department",department);
        return "updateDepartment";
    }

    @RequestMapping("/deleteDepartment")
    @ResponseBody
    public int deleteDepartment(int departid){
        userService.deleteDepartment(departid);
        return 1;
    }

    //分配科室
    @RequestMapping("/assign")
    public void assign(Doctor doctor,HttpServletRequest request,HttpServletResponse response) throws IOException {
        userService.assign(doctor);
        response.sendRedirect(request.getContextPath()+"/jsp/assign.jsp");
    }

    //获取所有医生
    @RequestMapping("/getAllDoctors")
    @ResponseBody
    public List<Doctor> getAllDoctors(){
        return userService.findAllDoctor();
    }

    //退出
    @RequestMapping("/clearSession")
    public void clearSession(HttpServletRequest request,HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        Enumeration em = session.getAttributeNames();
        while(em.hasMoreElements()){
            session.removeAttribute(em.nextElement().toString());
        }
        response.sendRedirect(request.getContextPath()+"/jsp/userLogin.jsp");
    }
}

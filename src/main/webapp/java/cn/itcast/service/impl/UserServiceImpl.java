package cn.itcast.service.impl;

import cn.itcast.dao.DepartmentDao;
import cn.itcast.dao.DoctorDao;
import cn.itcast.dao.PatientDao;
import cn.itcast.dao.UserDao;
import cn.itcast.domain.Department;
import cn.itcast.domain.Doctor;
import cn.itcast.domain.Patient;
import cn.itcast.domain.User;
import cn.itcast.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private PatientDao patientDao;

    @Autowired
    private DoctorDao doctorDao;

    @Autowired
    private DepartmentDao departmentDao;

    @Override
    public boolean login(User user) {
        User user1 = userDao.findByUser(user);
        if(user1 == null){
            return false;
        }
        return true;
    }

    @Override
    public List<Patient> findAllPatient() {
        return patientDao.findAll();
    }

    @Override
    public void updatePatient(Patient patient) {
        patientDao.updatePatient(patient);
        return;
    }

    @Override
    public Patient findPatient(int patientid) {
        return patientDao.findById(patientid);
    }

    @Override
    public List<Doctor> findAllDoctor() {
        return doctorDao.findAll();
    }

    @Override
    public List<Doctor> findSomeDoctors(String doctorname) {
        return doctorDao.findByName("%"+doctorname+"%");
    }

    @Override
    public void addDoctor(Doctor doctor) {
        doctorDao.saveDoctor(doctor);
    }

    @Override
    public Doctor getOneDoctor(int doctorid) {
        return doctorDao.findById(doctorid);
    }

    @Override
    public void updateDoctor(Doctor doctor) {
        doctorDao.updateDoctor(doctor);
    }

    @Override
    public Doctor findDoctor(int doctorid) {
        return doctorDao.findById(doctorid);
    }

    @Override
    public void resign(int doctorid) {
        doctorDao.deletDoctor(doctorid);
    }

    @Override
    public void resetPassword(int doctorid) {
        doctorDao.resetPassword(doctorid);
    }

    @Override
    public List<Department> findSomeDepartments(String departname) {
        return departmentDao.findByName("%"+departname+"%");
    }

    @Override
    public List<Department> findAllDepartment() {
        return departmentDao.findAll();
    }

    @Override
    public void addDepartment(Department department) {
        departmentDao.saveDepartment(department);
    }

    @Override
    public void updateDepartment(Department department) {
        departmentDao.updateDepartment(department);
    }

    @Override
    public Department findDepartment(int departid) {
        return departmentDao.findById(departid);
    }

    @Override
    public void deleteDepartment(int departid) {
        departmentDao.deleteDepartment(departid);
    }

    @Override
    public List<Doctor> findDoctorsByDepartid(int departid) {
        return doctorDao.findByDepartid(departid);
    }

    @Override
    public void assign(Doctor doctor) {
        doctorDao.assign(doctor);
    }

    @Override
    public List<Patient> findSomePatients(String patientname) {
        return patientDao.findAllByName("%"+patientname+"%");
    }


}

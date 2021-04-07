package cn.itcast.service;

import cn.itcast.domain.Department;
import cn.itcast.domain.Doctor;
import cn.itcast.domain.Patient;
import cn.itcast.domain.User;

import java.util.List;

public interface UserService {
    public boolean login(User user);

    public List<Patient> findAllPatient();

    public void updatePatient(Patient patient);

    public Patient findPatient(int patientid);

    public List<Doctor> findAllDoctor();

    public List<Doctor> findSomeDoctors(String doctorname);

    public void addDoctor(Doctor doctor);

    public Doctor getOneDoctor(int doctorid);

    public void updateDoctor(Doctor doctor);

    public Doctor findDoctor(int doctorid);

    public void resign(int doctorid);

    public void resetPassword(int doctorid);

    public List<Department> findSomeDepartments(String departname);

    public List<Department> findAllDepartment();

    public void addDepartment(Department department);

    public void updateDepartment(Department department);

    public Department findDepartment(int departid);

    public void deleteDepartment(int departid);

    public List<Doctor> findDoctorsByDepartid(int departid);

    public void assign(Doctor doctor);

    public List<Patient> findSomePatients(String patientname);
}

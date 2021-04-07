package cn.itcast.service.impl;


import cn.itcast.dao.DepartmentDao;
import cn.itcast.dao.GuahaoDao;
import cn.itcast.dao.PatientDao;
import cn.itcast.domain.Department;
import cn.itcast.domain.Guahao;
import cn.itcast.domain.Patient;
import cn.itcast.service.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Service("patientService")
public class PatientServiceImpl implements PatientService {
    @Autowired
    private PatientDao patientDao;
    @Autowired
    private GuahaoDao guahaoDao;
    @Autowired
    private DepartmentDao departmentDao;
    @Override
    public void guahao(String sidno, int departid, int doctorid) {
        Patient patient = patientDao.findBySidno(sidno);
        int patientid=0;
        if(patient==null){
            patient = new Patient();
            patient.setSidno(sidno);
            patientid = patientDao.savePatient(patient);
        }
        System.out.println(patientid);
        Guahao guahao = new Guahao();
        guahao.setDepartid(departid);
        guahao.setDoctorid(doctorid);
        guahao.setPatientid(patient.getPatientid());
        guahao.setGuahaoprice(20.0);
        guahao.setState("等待中");
        guahao.setTime(new Timestamp(new Date().getTime()));
        guahaoDao.saveGuahao(guahao);
    }

    @Override
    public List<Guahao> findAllWaitGuahao() {
        return guahaoDao.findAllWaitGuahao();
    }

    @Override
    public void tuihao(int guahaoid) {
        guahaoDao.deleteGuahao(guahaoid);
    }

    @Override
    public Guahao findByGuahaoId(int guahaoid,String sidno) {
        Guahao guahao = guahaoDao.findById(guahaoid);
        //没找着时,返回一个初始挂号
        if(guahao==null){
            return new Guahao();
        }
        //找着了再判断身份证号
        if(!sidno.equals(guahao.getPatient().getSidno())){//若不等,也返回一个初始挂号
            return new Guahao();
        }
        return guahao;
    }

    @Override
    public void updateDAD(Guahao guahao, String sidno) {
        guahaoDao.updateDAD(guahao);
    }

    @Override
    public Patient findBySidno(String sidno) {
        return patientDao.findBySidno(sidno);
    }
}

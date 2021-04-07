package cn.itcast.service.impl;

import cn.itcast.dao.DoctorDao;
import cn.itcast.dao.GuahaoDao;
import cn.itcast.dao.PatientDao;
import cn.itcast.domain.Doctor;
import cn.itcast.domain.Guahao;
import cn.itcast.domain.Patient;
import cn.itcast.service.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("doctorService")
public class DoctorServiceImpl implements DoctorService {

    @Autowired
    private DoctorDao doctorDao;

    @Autowired
    private GuahaoDao guahaoDao;

    @Autowired
    private PatientDao patientDao;

    @Override
    public Doctor findById(int doctorid) {
        return doctorDao.findById(doctorid);
    }

    @Override
    public List<Doctor> findByDepartid(int departid) {
        return doctorDao.findByDepartid(departid);
    }

    @Override
    public int jiaohao(int doctorid) {
        List<Guahao> guahaoList = guahaoDao.findByDoctorId(doctorid);
        for (Guahao guahao:guahaoList){
            String state = guahao.getState();
            if("等待中".equals(state)){
                guahao.setState("挂号结束");
                guahaoDao.updateGuahao(guahao);
                return guahao.getGuahaoid();
            }
        }
        return -1;
    }

    @Override
    public void updateDAD(Guahao guahao, String sidno) {
        guahaoDao.updateDAD(guahao);
    }

    @Override
    public List<Guahao> findAllWaitGuahao(int doctorid) {
        return guahaoDao.findAllWait(doctorid);
    }

    @Override
    public List<Guahao> historicalRegistration(int doctorid) {
        return guahaoDao.findAllEnd(doctorid);
    }

    @Override
    public List<Guahao> findByPatientName(String onename,int doctorid) {
        List<Patient> patients = patientDao.findByName("%"+onename+"%");//模糊查询到病人
        if(patients!=null){
            List<Guahao> guahaos = new ArrayList<Guahao>();
            for (Patient patient:patients){//遍历查到的病人
                List<Guahao> guahaoList = patient.getGuahaoList();
                for (Guahao guahao:guahaoList){
                    if(guahao.getDoctorid()==doctorid){
                        guahaos.add(guahao);
                    }
                }
            }
            return guahaos;
        }
        return null;
    }


}

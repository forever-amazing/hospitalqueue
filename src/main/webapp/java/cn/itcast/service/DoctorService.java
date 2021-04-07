package cn.itcast.service;

import cn.itcast.domain.Doctor;
import cn.itcast.domain.Guahao;

import java.util.List;

public interface DoctorService {
    public Doctor findById(int doctorid);
    public List<Doctor> findByDepartid(int departid);
    public int jiaohao(int doctorid);
    public void updateDAD(Guahao guahao, String sidno);
    public List<Guahao> findAllWaitGuahao(int doctorid);
    public List<Guahao> historicalRegistration(int doctorid);
    public List<Guahao> findByPatientName(String onename,int doctorid);
}

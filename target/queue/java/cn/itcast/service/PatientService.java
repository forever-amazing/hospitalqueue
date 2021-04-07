package cn.itcast.service;

import cn.itcast.domain.Guahao;
import cn.itcast.domain.Patient;

import java.util.List;

public interface PatientService {

    public void guahao(String sidno, int departid, int doctorid);

    public List<Guahao> findAllWaitGuahao();

    public void tuihao(int guahaoid);

    public Guahao findByGuahaoId(int guahaoid,String sidno);

    public void updateDAD(Guahao guahao,String sidno);

    public Patient findBySidno(String sidno);
}

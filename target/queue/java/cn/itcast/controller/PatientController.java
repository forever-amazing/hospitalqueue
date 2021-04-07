package cn.itcast.controller;

import cn.itcast.domain.Guahao;
import cn.itcast.domain.Patient;
import cn.itcast.service.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/patient")
public class PatientController {
    @Autowired
    private PatientService patientService;

    @RequestMapping("/guahao")
    public void guahao(String sidno, int departid, int doctorid,HttpServletRequest request,HttpServletResponse response) throws IOException {
        Patient patient = patientService.findBySidno(sidno);
        if(patient!=null){//存了病人
            if(patient.getGuahaoList().size()>0){//有挂号记录
                Guahao guahao=patient.getGuahaoList().get(0);
                if(guahao.getState().contains("结束")){//之前挂过但已挂号完毕
                    patientService.guahao(sidno,departid,doctorid);
                }else{//重挂号
                    System.out.println("在挂，请勿重新挂号");
                }
            }else{//没有挂号记录
                patientService.guahao(sidno,departid,doctorid);
            }
        }else{//之前没存病人 第一次挂号
            patientService.guahao(sidno,departid,doctorid);
        }
        response.sendRedirect(request.getContextPath()+"/patient/findAllWaitGuahao");
    }

    @RequestMapping("/findAllWaitGuahao")
    public String findAllWaitGuahao(Model model){
        List<Guahao> guahaos = patientService.findAllWaitGuahao();
        model.addAttribute("guahaos",guahaos);
        return "paidui";
    }

    @RequestMapping("/tuihao")
    public void tuihao(int guahaoid, HttpServletRequest request, HttpServletResponse response) throws IOException {
        patientService.tuihao(guahaoid);
        response.sendRedirect(request.getContextPath()+"/patient/findAllWaitGuahao");
    }

    @RequestMapping("/findGuahaoById")
    @ResponseBody
    public Guahao findGuahaoById(int guahaoid,String sidno){
        Guahao guahao = patientService.findByGuahaoId(guahaoid,sidno);
        return guahao;
    }

    @RequestMapping("/change")
    public void change(Guahao guahao,String sidno,HttpServletRequest request, HttpServletResponse response) throws IOException {
        patientService.updateDAD(guahao,sidno);
        response.sendRedirect(request.getContextPath()+"/patient/findAllWaitGuahao");
    }

}

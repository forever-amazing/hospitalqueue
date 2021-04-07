package cn.itcast.controller;

import cn.itcast.domain.Doctor;
import cn.itcast.domain.Guahao;
import cn.itcast.service.DoctorService;
import cn.itcast.util.TTS;
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
import java.util.Iterator;
import java.util.List;

@Controller
@RequestMapping("/doctor")
public class DoctorController {

    @Autowired
    private DoctorService doctorService;

    @RequestMapping("/login")
    public String login(String doctorid,Model model,String password,HttpServletRequest request,HttpServletResponse response){
        HttpSession session = request.getSession();
        Doctor doctor = doctorService.findById(Integer.parseInt(doctorid));
        if (doctor == null){
            return "loginFalse";
        }
        if(!password.equals(doctor.getPassword())){
            return "loginFalse";
        }
        session.setAttribute("doctor",doctor);
        List<Guahao> guahaos = doctor.getGuahaoList();
        Iterator<Guahao> iterator = guahaos.iterator();
        while(iterator.hasNext()){
            Guahao guahao = iterator.next();
            if(guahao.getState().contains("结束")){
                iterator.remove();
            }
        }
        model.addAttribute("guahaos",guahaos);
        return "doctorIndex";
    }

    @RequestMapping("/findByDepartid")
    @ResponseBody
    public List<Doctor> findByDepartName(int departid){
        return doctorService.findByDepartid(departid);
    }

    @RequestMapping("/jiaohao")
    public void jiaohao(int doctorid, HttpServletResponse response, HttpServletRequest request) throws IOException {
        HttpSession session = request.getSession();
        int guahaoid =doctorService.jiaohao(doctorid);
        session.setAttribute("guahaoid",guahaoid);
        response.sendRedirect(request.getContextPath()+"/doctor/findAllWaitGuahao?doctorid="+doctorid);
    }

    @RequestMapping("/findAllWaitGuahao")
    public String findAllWaitGuahao(int doctorid,Model model){
        List<Guahao> guahaos = doctorService.findAllWaitGuahao(doctorid);
        model.addAttribute("guahaos",guahaos);
        return "doctorIndex";
    }

    @RequestMapping("/historicalRegistration")
    public String historicalRegistration(int doctorid,Model model){
        List<Guahao> guahaos = doctorService.historicalRegistration(doctorid);
        model.addAttribute("guahaos",guahaos);
        return "historicalRegistration";
    }

    @RequestMapping("/dchange")
    public void dchange(Guahao guahao,String sidno,HttpServletResponse response, HttpServletRequest request) throws IOException {
        doctorService.updateDAD(guahao,sidno);//转科
        Doctor doctor = (Doctor) request.getSession().getAttribute("doctor");
        int doctorid = doctor.getDoctorid();
        response.sendRedirect(request.getContextPath()+"/doctor/findAllWaitGuahao?doctorid="+doctorid);
    }

    @RequestMapping("/fuzzyQueryByName")
    public String fuzzyQueryByName(String onename,Model model,HttpServletRequest request){
        Doctor doctor = (Doctor) request.getSession().getAttribute("doctor");
        int doctorid = doctor.getDoctorid();
        List<Guahao> guahaos = doctorService.findByPatientName(onename,doctorid);
        model.addAttribute("guahaos",guahaos);
        return "historicalRegistration";
    }

    @RequestMapping("/clearSession")
    public void clearSession(HttpServletRequest request,HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();

        Enumeration em = session.getAttributeNames();
        while(em.hasMoreElements()){
            session.removeAttribute(em.nextElement().toString());
        }
        System.out.println(session.getAttribute("doctor"));
        response.sendRedirect(request.getContextPath()+"/jsp/doctorLogin.jsp");
    }

    @RequestMapping("/tts")
    @ResponseBody
    public void tts(HttpServletRequest request){
        HttpSession session = request.getSession();
        Object s = session.getAttribute("guahaoid");
        System.out.println("adad");
        if(s != null){
            if(!s.toString().equals("-1")){
                for (int i=0;i<3;i++){
                    TTS.toVoice("请"+s.toString()+"号病人到对应医生处报到");
                }
            }
        }
    }

}

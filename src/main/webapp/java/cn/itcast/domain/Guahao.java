package cn.itcast.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * 挂号
 */
@JsonIgnoreProperties(value = "handler")
public class Guahao implements Serializable {
    private int guahaoid;
    private int departid;
    private int doctorid;
    private int patientid;
    private Double guahaoprice;
    private Timestamp time;
    private String state;
    private Doctor doctor;
    private Patient patient;

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public int getGuahaoid() {
        return guahaoid;
    }

    public void setGuahaoid(int guahaoid) {
        this.guahaoid = guahaoid;
    }

    public int getDepartid() {
        return departid;
    }

    public void setDepartid(int departid) {
        this.departid = departid;
    }

    public int getDoctorid() {
        return doctorid;
    }

    public void setDoctorid(int doctorid) {
        this.doctorid = doctorid;
    }

    public int getPatientid() {
        return patientid;
    }

    public void setPatientid(int patientid) {
        this.patientid = patientid;
    }

    public Double getGuahaoprice() {
        return guahaoprice;
    }

    public void setGuahaoprice(Double guahaoprice) {
        this.guahaoprice = guahaoprice;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "Guahao{" +
                "guahaoid=" + guahaoid +
                ", departid=" + departid +
                ", doctorid=" + doctorid +
                ", patientid=" + patientid +
                ", guahaoprice=" + guahaoprice +
                ", time=" + time +
                ", state='" + state + '\'' +
                '}';
    }
}

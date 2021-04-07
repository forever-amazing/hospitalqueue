package cn.itcast.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * 值班
 */
@JsonIgnoreProperties(value = "handler")
public class Duty implements Serializable {
    private int dutyid;
    private int doctorid;
    private String day;
    private Timestamp starttime;
    private Timestamp endtime;
    private Doctor doctor;

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public int getDutyid() {
        return dutyid;
    }

    public void setDutyid(int dutyid) {
        this.dutyid = dutyid;
    }

    public int getDoctorid() {
        return doctorid;
    }

    public void setDoctorid(int doctorid) {
        this.doctorid = doctorid;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public Timestamp getStarttime() {
        return starttime;
    }

    public void setStarttime(Timestamp starttime) {
        this.starttime = starttime;
    }

    public Timestamp getEndtime() {
        return endtime;
    }

    public void setEndtime(Timestamp endtime) {
        this.endtime = endtime;
    }

    @Override
    public String toString() {
        return "Duty{" +
                "dutyid=" + dutyid +
                ", doctorid=" + doctorid +
                ", day='" + day + '\'' +
                ", starttime=" + starttime +
                ", endtime=" + endtime +
                '}';
    }
}

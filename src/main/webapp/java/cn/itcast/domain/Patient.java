package cn.itcast.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.io.Serializable;
import java.util.List;

/**
 * 病人
 */
@JsonIgnoreProperties(value = "handler")
public class Patient implements Serializable {
    //要记录的
    private int patientid;
    private String patientname;
    private String sex;
    private int age;
    private String sidno;
    private String address;
    private String phone;
    private String email;
    //暂时不记录的
    private String sidtype;
    private String firstman;
    private String relation;
    private String firstmanphone;
    private String firstmanaddress;
    private String guomin;
    private String shoushu;
    private String cardtype;
    private String recorddate;
    @JsonIgnore
    private List<Guahao> guahaoList;

    public List<Guahao> getGuahaoList() {
        return guahaoList;
    }

    public void setGuahaoList(List<Guahao> guahaoList) {
        this.guahaoList = guahaoList;
    }

    public int getPatientid() {
        return patientid;
    }

    public void setPatientid(int patientid) {
        this.patientid = patientid;
    }

    public String getPatientname() {
        return patientname;
    }

    public void setPatientname(String patientname) {
        this.patientname = patientname;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getSidno() {
        return sidno;
    }

    public void setSidno(String sidno) {
        this.sidno = sidno;
    }

    public String getSidtype() {
        return sidtype;
    }

    public void setSidtype(String sidtype) {
        this.sidtype = sidtype;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstman() {
        return firstman;
    }

    public void setFirstman(String firstman) {
        this.firstman = firstman;
    }

    public String getRelation() {
        return relation;
    }

    public void setRelation(String relation) {
        this.relation = relation;
    }

    public String getFirstmanphone() {
        return firstmanphone;
    }

    public void setFirstmanphone(String firstmanphone) {
        this.firstmanphone = firstmanphone;
    }

    public String getFirstmanaddress() {
        return firstmanaddress;
    }

    public void setFirstmanaddress(String firstmanaddress) {
        this.firstmanaddress = firstmanaddress;
    }

    public String getGuomin() {
        return guomin;
    }

    public void setGuomin(String guomin) {
        this.guomin = guomin;
    }

    public String getShoushu() {
        return shoushu;
    }

    public void setShoushu(String shoushu) {
        this.shoushu = shoushu;
    }

    public String getCardtype() {
        return cardtype;
    }

    public void setCardtype(String cardtype) {
        this.cardtype = cardtype;
    }

    public String getRecorddate() {
        return recorddate;
    }

    public void setRecorddate(String recorddate) {
        this.recorddate = recorddate;
    }

    @Override
    public String toString() {
        return "Patient{" +
                "patientid=" + patientid +
                ", patientname='" + patientname + '\'' +
                ", sex='" + sex + '\'' +
                ", age=" + age +
                ", sidno='" + sidno + '\'' +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}

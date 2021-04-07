package cn.itcast.dao;

import cn.itcast.domain.Patient;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;

import java.util.List;
/**
 * 持久层接口
 */
@Repository
public interface PatientDao {
    //查询一个病人（id）
    @Select("select * from patient where patientid=#{patientid}")
    @Results(id = "patientMap",value = {
            @Result(id = true,column = "patientid",property = "patientid"),
            @Result(column = "patientname",property = "patientname"),
            @Result(column = "sex",property = "sex"),
            @Result(column = "age",property = "age"),
            @Result(column = "sidno",property = "sidno"),
            @Result(column = "address",property = "address"),
            @Result(column = "phone",property = "phone"),
            @Result(column = "email",property = "email"),
            @Result(property = "guahaoList",column = "patientid",
                    many = @Many(select = "cn.itcast.dao.GuahaoDao.findByPatientId",
                            fetchType = FetchType.LAZY)),
    })
    public Patient findById(int patientid);

    @Select("select * from patient where sidno=#{sidno}")
    @ResultMap("patientMap")
    public Patient findBySidno(String sidno);

    //根据名字模糊查询病人有限制条数
    @Select("select * from patient where patientname like #{patientname}")
    @ResultMap("patientMap")
    public List<Patient> findByName(String patientname);

    //查询所有病人
    @Select("select * from patient")
    @ResultMap("patientMap")
    public List<Patient> findAll();

    //保存病人信息
    @Insert("insert into patient (patientname,sex,age,sidno,address,phone,email) values (#{patientname},#{sex},#{age},#{sidno},#{address},#{phone},#{email})")
    @SelectKey(keyColumn = "patientid",keyProperty = "patientid",before = false,resultType = Integer.class,statement = "select last_insert_id()")
    public int savePatient(Patient patient);

    //更新病人信息（id）
    @Update("update patient set patientname=#{patientname},sex=#{sex},age=#{age},address=#{address},phone=#{phone} where patientid=#{patientid}")
    public void updatePatient(Patient patient);

    //删除病人信息（id）
    @Delete("delete from patient where patientid=#{patientid}")
    public void DeletePatient(int patientid);

    //根据名字模糊查询病人无限制条数
    @Select("select * from patient where patientname like #{patientname}")
    @ResultMap("patientMap")
    public List<Patient> findAllByName(String patientname);
}

package cn.itcast.dao;

import cn.itcast.domain.Guahao;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;

import java.util.List;
/**
 * 持久层接口
 */
@Repository
public interface GuahaoDao {
    //查询一个挂号信息（id）
    @Select("select * from guahao where guahaoid=#{guahaoid}")
    @Results(id = "guahaoMap",value = {
            @Result(id = true,column = "guahaoid",property = "guahaoid"),
            @Result(column = "departid",property = "departid"),
            @Result(column = "doctorid",property = "doctorid"),
            @Result(column = "patientid",property = "patientid"),
            @Result(column = "guahaoprice",property = "guahaoprice"),
            @Result(column = "time",property = "time"),
            @Result(column = "state",property = "state"),
            @Result(property = "doctor",column = "doctorid",
                    one = @One(select ="cn.itcast.dao.DoctorDao.findById",
                            fetchType = FetchType.EAGER)),
            @Result(property = "patient",column = "patientid",
                    one = @One(select ="cn.itcast.dao.PatientDao.findById",
                            fetchType = FetchType.EAGER)),
    })
    public Guahao findById(int guahaoid);

    //查询指定病人的挂号记录
    @Select("select * from guahao where patientid=#{patientid} order by time desc limit 3")
    @ResultMap(value = "guahaoMap")
    public List<Guahao> findByPatientId(int patientid);

    //查询所有挂号信息
    @Select("select * from guahao order by time asc")
    @ResultMap("guahaoMap")
    public List<Guahao> findAll();

    //查询已诊断的挂号信息(根据医生id)
    @Select("select * from guahao where doctorid=#{doctorid} and state='挂号结束' order by time asc")
    @ResultMap("guahaoMap")
    public List<Guahao> findAllEnd(int doctorid);

    //查询未诊断的挂号信息(根据医生id)
    @Select("select * from guahao where doctorid=#{doctorid} and state like '%中%' order by time asc")
    @ResultMap("guahaoMap")
    public List<Guahao> findAllWait(int doctorid);

    //根据医生id查询挂号信息
    @Select("select * from guahao where doctorid=#{doctorid} order by time asc")
    @ResultMap("guahaoMap")
    public List<Guahao> findByDoctorId(int doctorid);

    //查询已诊断的挂号信息(根据医生id)
    @Select("select * from guahao where doctorid=#{doctorid} and state='挂号结束' order by time asc")
    @ResultMap("guahaoMap")
    public List<Guahao> findEndByDoctorId(int doctorid);

    //查询未诊断完毕的挂号信息(根据医生id)
    @Select("select * from guahao where doctorid=#{doctorid} and state like '%中%' order by time asc")
    @ResultMap("guahaoMap")
    public List<Guahao> findWaitByDoctorId(int doctorid);

    //查询未诊断完毕的挂号信息
    @Select("select * from guahao where state like '%中%' order by time asc")
    @ResultMap("guahaoMap")
    public List<Guahao> findAllWaitGuahao();

    @Select("select count(*) from guahao where doctorid=#{doctorid} and state like '%中%'")
    public int getCount(int doctorid);

    //保存挂号信息
    @Insert("insert into guahao (departid,doctorid,patientid,guahaoprice,time,state) values (#{departid},#{doctorid},#{patientid},#{guahaoprice},#{time},#{state})")
    public void saveGuahao(Guahao guahao);

    //更新挂号信息（id）
    @Update("update guahao set state=#{state}where guahaoid=#{guahaoid}")
    public void updateGuahao(Guahao guahao);

    //更新挂号信息的科室和医生（id）
    @Update("update guahao set departid = #{departid}, doctorid = #{doctorid} where guahaoid=#{guahaoid}")
    public void updateDAD(Guahao guahao);

    //删除挂号信息（id）
    @Delete("delete from guahao where guahaoid=#{guahaoid}")
    public void deleteGuahao(int guahaoid);


}

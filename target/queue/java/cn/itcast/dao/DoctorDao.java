package cn.itcast.dao;

import cn.itcast.domain.Doctor;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * DoctorDao持久层接口
 */
@Repository
public interface DoctorDao {
    //查询一个医生（id）
    @Select("select * from doctor where doctorid=#{doctorid}")
    @Results(id = "doctorMap",value = {
            @Result(id = true,column = "doctorid",property = "doctorid"),
            @Result(column = "doctorname",property = "doctorname"),
            @Result(column = "account",property = "account"),
            @Result(column = "password",property = "password"),
            @Result(column = "sex",property = "sex"),
            @Result(column = "departid",property = "departid"),
            @Result(column = "zhicheng",property = "zhicheng"),
            @Result(column = "phone",property = "phone"),
            @Result(column = "description",property = "description"),
            @Result(column = "state",property = "state"),
            @Result(property = "guahaoList",column = "doctorid",
                    many = @Many(select = "cn.itcast.dao.GuahaoDao.findByDoctorId",
                            fetchType = FetchType.LAZY)),
            @Result(property = "department",column = "departid",
                    one = @One(select ="cn.itcast.dao.DepartmentDao.findById",
                            fetchType = FetchType.EAGER)),
            @Result(property = "dutyList",column = "doctorid",
                    many = @Many(select = "cn.itcast.dao.DutyDao.findByDoctorId",
                            fetchType = FetchType.LAZY)),
    })
    public Doctor findById(int doctorid);

    //根据名字模糊查询医生
    @Select("select * from doctor where doctorname like #{doctorname}")
    @ResultMap("doctorMap")
    public List<Doctor> findByName(String doctorname);

    //根据科室号查询医生
    @Select("select * from doctor where departid=#{departid}")
    @ResultMap("doctorMap")
    public List<Doctor> findByDepartid(int departid);

    //查询所有医生
    @Select("select * from doctor")
    @ResultMap("doctorMap")
    public List<Doctor> findAll();

    //保存医生信息
    @Insert("insert into doctor (doctorname,account,password,sex,departid,zhicheng,phone,description,state) values (#{doctorname},#{account},#{password},#{sex},#{departid},#{zhicheng},#{phone},#{description},#{state})")
    public void saveDoctor(Doctor doctor);

    //更新医生信息（id）
    @Update("update doctor set doctorname=#{doctorname},account=#{account},password=#{password},sex=#{sex},departid=#{departid},zhicheng=#{zhicheng},phone=#{phone},description=#{description},state=#{state} where doctorid=#{doctorid}")
    public void updateDoctor(Doctor doctor);

//    //删除医生信息（id）
//    @Delete("delete from doctor where doctorid=#{doctorid}")
//    public void DeleteDoctor(int doctorid);

    //删除医生信息（并非删除，只是赋予初值，account为null，state为0，表示辞职了
    @Update("update doctor set account = null, state = 0 where doctorid=#{doctorid}")
    public void deletDoctor(int doctorid);

    //重置密码
    @Update("update doctor set password = '123456' where doctorid=#{doctorid}")
    public void resetPassword(int doctorid);

    //分配科室
    @Update("update doctor set departid=#{departid} where doctorid=#{doctorid}")
    public  void assign(Doctor doctor);
}

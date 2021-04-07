package cn.itcast.dao;

import cn.itcast.domain.Duty;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;

import java.util.List;
/**
 * 持久层接口
 */
@Repository
public interface DutyDao {
    //查询一个值班信息（id）
    @Select("select * from duty where dutyid=#{dutyid}")
    @Results(id = "dutyMap",value = {
            @Result(id = true,column = "dutyid",property = "dutyid"),
            @Result(column = "doctorid",property = "doctorid"),
            @Result(column = "day",property = "day"),
            @Result(column = "starttime",property = "starttime"),
            @Result(column = "endtime",property = "endtime"),
            @Result(property = "doctor",column = "doctorid",
                    one = @One(select ="cn.itcast.dao.DoctorDao.findById",
                            fetchType = FetchType.EAGER)),
    })
    public Duty findById(int dutyid);

    //查询指定医生的值班信息
    @Select("select * from duty where doctorid=#{doctorid}")
    @ResultMap("dutyMap")
    public List<Duty> findByDoctorId(int doctorid);

    //查询所有值班信息
    @Select("select * from duty")
    @ResultMap("dutyMap")
    public List<Duty> findAll();

    //保存值班信息
    @Insert("insert into duty (doctorid,day,starttime,endtime) values (#{doctorid},#{day},#{starttime},#{endtime})")
    public void saveDuty(Duty duty);

    //更新值班信息（id）
    @Update("update duty set doctorid=#{doctorid},set day=#{day},set starttime=#{starttime},set endtime=#{endtime} where dutyid=#{dutyid}")
    public void updateDuty(Duty duty);

    //删除值班信息（id）
    @Delete("delete from duty where dutyid=#{dutyid}")
    public void DeleteDuty(int dutyid);
}

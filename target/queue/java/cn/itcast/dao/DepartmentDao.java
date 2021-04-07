package cn.itcast.dao;

import cn.itcast.domain.Department;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * DepartmentDao持久层接口
 */
@Repository
public interface DepartmentDao {
    //查询一个科室（id）
    @Select("select * from department where departid=#{departid}")
    @Results(id="departMap",value = {
            @Result(id = true,column = "departid",property = "departid"),
            @Result(column = "departname",property = "departname"),
            @Result(column = "description",property = "description"),
            @Result(property = "doctors",column = "departid",
                    many = @Many(select = "cn.itcast.dao.DoctorDao.findByDepartid",
                            fetchType= FetchType.LAZY)),
    })
    public Department findById(int departid);

    //根据名字模糊查询科室
    @Select("select * from department where departname like #{departname}")
    @ResultMap(value = "departMap")
    public List<Department> findByName(String departname);

    //根据名字准确查询科室
    @Select("select * from department where departname=#{departname}")
    @ResultMap(value = "departMap")
    public Department findByNameOne(String departname);

    //查询所有科室
    @Select("select * from department")
    @ResultMap(value = "departMap")
    public List<Department> findAll();

    //保存科室信息
    @Insert("insert into department (departname,description) values (#{departname},#{description})")
    public void saveDepartment(Department department);

    //更新科室信息（id）
    @Update("update department set departname=#{departname},description=#{description} where departid=#{departid}")
    public void updateDepartment(Department department);

    //删除科室信息（id）
    @Delete("delete from department where departid=#{departid}")
    public void deleteDepartment(int departid);
}

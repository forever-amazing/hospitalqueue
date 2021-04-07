package cn.itcast.service;

import cn.itcast.domain.Department;

import java.util.List;

public interface DepartmentService {
    //查询科室信息
    public Department findById(int departid);

    public List<Department> findAll();
}

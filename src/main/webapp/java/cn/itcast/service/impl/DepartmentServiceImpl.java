package cn.itcast.service.impl;

import cn.itcast.dao.DepartmentDao;
import cn.itcast.domain.Department;
import cn.itcast.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("departmentService")
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    private DepartmentDao departmentDao;

    @Override
    public Department findById(int departid) {
        return departmentDao.findById(departid);
    }

    @Override
    public List<Department> findAll(){
        return departmentDao.findAll();
    }
}

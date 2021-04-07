package cn.itcast.test;

import cn.itcast.dao.AccountDao;
import cn.itcast.dao.DepartmentDao;
import cn.itcast.domain.Account;
import cn.itcast.domain.Department;
import org.apache.ibatis.io.Resources;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.InputStream;
import java.util.List;

public class TestMybatis {
    @Autowired
    private DepartmentDao departmentDao;

    @Test
    public void run() throws Exception {
        Account account = new Account();
        account.setName("丽丽");
        account.setMoney(1000f);
        //加载Mybatis的配置文件按
        InputStream in = Resources.getResourceAsStream("SqlMapConfig.xml");
        //创建SqlSessionFactory对象
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
        //创建SqlSession对象
        SqlSession session = factory.openSession();
        //获取到代理对象
        AccountDao dao = session.getMapper(AccountDao.class);
        //查询所有信息
        /*List<Account> list = dao.findAll();
        for(Account account:list){
            System.out.println(account);
        }*/
        //保存账户
        dao.save(account);

        //提交事务
        session.commit();
        //关闭资源
        session.close();
        in.close();
    }

}

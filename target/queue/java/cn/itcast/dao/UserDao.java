package cn.itcast.dao;

import cn.itcast.domain.User;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDao {

    @Select("select * from user where username=#{username} and password=#{password}")
    public User findByUser(User user);
}

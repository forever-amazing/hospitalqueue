package cn.itcast.service;

import cn.itcast.domain.Account;

import java.util.List;

/**
 * 业务层接口
 */
public interface AccountService {
    //查询所有账户
    public List<Account> findAll();
    //保存账户信息
    public void save(Account account);
}

package com.youren.bbs.dao;

import com.youren.bbs.entity.User;
import com.youren.bbs.entity.UserSetting;
import org.springframework.data.repository.CrudRepository;

public interface UserDao extends CrudRepository<User, Long> {

}
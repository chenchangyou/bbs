package com.hwua.sss.test;

import com.youren.bbs.entity.User;
import org.junit.Before;
import com.youren.bbs.dao.UserDao;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Optional;

public class UserTest {

    private UserDao userDao;
    @Before
    public void init(){
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        userDao = context.getBean(UserDao.class);
    }

    @Test
    public void findAll(){

      /*  Iterable<User> all = userDao.findAll();

        for (User user :all){
            System.out.println(user.getUsername());
        }*/
        User user = userDao.findById(1L).get();
        System.out.println(user);
    }

}

package com.hwua.sss.test;

import com.sun.management.UnixOperatingSystemMXBean;
import com.youren.bbs.dao.NoticeDao;
import com.youren.bbs.dao.UserSettingDao;
import com.youren.bbs.entity.Notice;
import com.youren.bbs.entity.User;
import com.youren.bbs.entity.UserSetting;
import org.junit.Before;
import com.youren.bbs.dao.UserDao;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.lang.management.ManagementFactory;
import java.lang.management.OperatingSystemMXBean;
import java.util.Optional;
import java.util.UUID;


public class UserTest {

    private UserDao userDao;
    private NoticeDao noticeDao;
    private UserSettingDao userSettingDao;
    @Before
    public void init(){
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        userDao = context.getBean(UserDao.class);
        userSettingDao = context.getBean(UserSettingDao.class);
        noticeDao=context.getBean(NoticeDao.class);

    }

    @Test
    public void findAll(){

        Iterable<User> all = userDao.findAll();


        for (User user :all){
            System.out.println(user);
        }
        /*User user = userDao.findById(1L).get();
        System.out.println(user);*/
    }
    @Test
    public void findUserSetting(){

        UserSetting byUser_id = userSettingDao.findByUserId(2L);

        byUser_id.setFans("false");

        UserSetting save = userSettingDao.save(byUser_id);


        System.out.println(byUser_id);

    }
    @Test
    public void findNotice(){
        Notice notice = noticeDao.findById("1").get();
        System.out.println(notice);
    }

    @Test
    public void UUid(){
        System.out.println(UUID.randomUUID().toString());
    }
}

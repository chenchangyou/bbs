package com.youren.bbs.mapper;

import com.youren.bbs.entity.UserBackground;
import org.springframework.stereotype.Repository;

@Repository
public interface UserBackgroundMapper {

    int save(UserBackground userBackground);

    int delete (String id);

    int deleteByUid (UserBackground userBackground);

    int update (UserBackground userBackground);

    UserBackground findByUid(UserBackground userBackground);

}

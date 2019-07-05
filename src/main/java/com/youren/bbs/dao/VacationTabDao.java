package com.youren.bbs.dao;


import com.youren.bbs.entity.VacationTab;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface VacationTabDao extends CrudRepository<VacationTab, Long> {

    List<VacationTab> findAll();
}

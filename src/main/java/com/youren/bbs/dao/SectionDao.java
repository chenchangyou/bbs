package com.youren.bbs.dao;

import com.youren.bbs.entity.Section;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;


public interface SectionDao  extends CrudRepository<Section, String> {

}

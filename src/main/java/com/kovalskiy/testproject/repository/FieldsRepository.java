package com.kovalskiy.testproject.repository;

import com.kovalskiy.testproject.model.Field;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface FieldsRepository extends JpaRepository<Field, Long> {

    //    @Query(value = "select f from fields f where f.isActive = true")
    List<Field> findByIsActive(boolean isActive);
}

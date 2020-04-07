package com.kovalskiy.testproject.repository;

import com.kovalskiy.testproject.model.Field;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FieldsRepository extends JpaRepository<Field, Long> {
}

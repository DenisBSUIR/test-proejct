package com.kovalskiy.testproject.repository;

import com.kovalskiy.testproject.model.Response;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ResponseRepository extends JpaRepository<Response, Long> {
}

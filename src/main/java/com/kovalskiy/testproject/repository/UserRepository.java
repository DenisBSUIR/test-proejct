package com.kovalskiy.testproject.repository;

import com.kovalskiy.testproject.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {

    User findByEmail(String email);

}

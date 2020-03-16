package com.example.repository;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import com.example.utility.UserUtility;

public interface CurdRepository extends JpaRepository<UserUtility, Integer> {
	
}

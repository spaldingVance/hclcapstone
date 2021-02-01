package com.hcl.capstone.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import com.hcl.capstone.model.User;
@Repository
public interface UserRepository extends JpaRepository<User, Long> {

}
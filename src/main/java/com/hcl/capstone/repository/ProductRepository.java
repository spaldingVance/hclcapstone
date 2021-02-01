package com.hcl.capstone.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import com.hcl.capstone.model.Product;
@Repository
public interface ProductRepository extends JpaRepository<Product, Long>{

}
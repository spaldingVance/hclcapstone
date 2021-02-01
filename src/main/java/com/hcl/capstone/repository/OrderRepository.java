
package com.hcl.capstone.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hcl.capstone.model.Order;
@Repository
public interface OrderRepository extends JpaRepository<Order,Long> {

}

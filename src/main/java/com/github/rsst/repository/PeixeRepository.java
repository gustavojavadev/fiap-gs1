package com.github.rsst.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.github.rsst.model.Peixe;

@Repository
public interface PeixeRepository extends JpaRepository<Peixe, Long> {

}

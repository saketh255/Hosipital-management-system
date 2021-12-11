package com.project.Hospital.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.project.Hospital.model.Login;

public interface LoginDAO extends CrudRepository<Login, Integer> {

	public List<Login> findAll(); 
	public Login findByUsername(String username);
	
	/*
	
	@Modifying
	@Query("update Login password= :password where username = :username")
	public void updateagentt(@Param(value = "agentId") Integer agentId, @Param(value = "organisation") String organisation, @Param(value = "address") String address, @Param(value = "contact") Long contact);

*/
	
	
@Modifying
@Transactional
	@Query("UPDATE Login l SET l.password = :password WHERE l.username = :username")
	public void updatePassword(@Param(value = "password" ) String password, @Param(value="username") String username);
}

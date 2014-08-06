package com.auth.dao;

public interface UserDao {
	public boolean getUserById(int id);
	public boolean getUserByUsername(String username);
	public boolean getUserByNameAndPass(String username,String password);
}
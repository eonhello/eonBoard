package org.eon.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.eon.domain.UserVO;
import org.eon.dto.LoginDTO;


public interface UserService {

	public UserVO login(LoginDTO dto) throws Exception;
	
	public void keepLogin(String uid, String sessionId, Date next) throws Exception;
	
	public UserVO checkLoginBefore(String value) throws Exception;
	
	public List<UserVO> userList() throws Exception; 
	
	public void insertUser(UserVO vo) throws Exception; 
	
	public UserVO viewUser() throws Exception; 
	
	public void deleteUser(String uid) throws Exception;
	
	public void updateUser(UserVO vo) throws Exception;
	
	public boolean loginCheck(UserVO vo, HttpSession session) throws Exception;
	
	public UserVO viewLogin(UserVO vo) throws Exception;
	
	public void logout(HttpSession session) throws Exception;
	
	public int idDupCheck(String uid) throws Exception;
	
}

package org.eon.persistence;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.eon.domain.UserVO;
import org.eon.dto.LoginDTO;

public interface UserDAO {

	public UserVO login(LoginDTO dto)throws Exception;
	
	public void keepLogin(String uid, String sessionId, Date next)throws Exception;
	
	public UserVO checkUserWithSessionKey(String value)throws Exception;
	
	public List<UserVO> userList()throws Exception; //ȸ�� ��� ����
	
	public void insertUser(UserVO vo)throws Exception; //ȸ�� ����
	
	public UserVO viewUser()throws Exception; //ȸ�� ���� �� ����
	
	public void deleteUser(String uid)throws Exception; //ȸ�� ����
	
	public void updateUser(UserVO vo)throws Exception; //ȸ�� ���� ����
	
	public boolean loginCheck(UserVO vo)throws Exception; //ȸ�� �α��� üũ
	
	public UserVO viewLogin(UserVO vo)throws Exception; //ȸ�� �α��� ����
	
	public void logout(HttpSession session)throws Exception; //ȸ�� �α׾ƿ�
	
	public int idDupCheck(String uid)throws Exception; //���̵� �ߺ� üũ
	
}

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
	
	public List<UserVO> userList()throws Exception; //회원 목록 보기
	
	public void insertUser(UserVO vo)throws Exception; //회원 가입
	
	public UserVO viewUser()throws Exception; //회원 정보 상세 보기
	
	public void deleteUser(String uid)throws Exception; //회원 삭제
	
	public void updateUser(UserVO vo)throws Exception; //회원 정보 수정
	
	public boolean loginCheck(UserVO vo)throws Exception; //회원 로그인 체크
	
	public UserVO viewLogin(UserVO vo)throws Exception; //회원 로그인 정보
	
	public void logout(HttpSession session)throws Exception; //회원 로그아웃
	
	public int idDupCheck(String uid)throws Exception; //아이디 중복 체크
	
}

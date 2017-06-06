package org.eon.service;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.eon.domain.UserVO;
import org.eon.dto.LoginDTO;
import org.eon.persistence.UserDAO;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	private UserDAO dao;

	@Override
	public UserVO login(LoginDTO dto) throws Exception {

		return dao.login(dto);
	}

	@Override
	public void keepLogin(String uid, String sessionId, Date next) throws Exception {

		dao.keepLogin(uid, sessionId, next);
	}

	@Override
	public UserVO checkLoginBefore(String value) throws Exception {

		return dao.checkUserWithSessionKey(value);
	}

	@Override
	public List<UserVO> userList() throws Exception {

		return dao.userList();
	}

	@Override
	public void insertUser(UserVO vo) throws Exception {

		dao.insertUser(vo);
	}

	@Override
	public UserVO viewUser() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteUser(String uid) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateUser(UserVO vo) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean loginCheck(UserVO vo, HttpSession session) throws Exception {

		boolean result = dao.loginCheck(vo);
		
		if (result) {
			UserVO vo1 = viewLogin(vo);

			session.setAttribute("userId", vo1.getUid());
			session.setAttribute("userName", vo1.getUname());
		}

		return result;
	}

	@Override
	public UserVO viewLogin(UserVO vo) throws Exception {

		return dao.viewLogin(vo);
	}

	@Override
	public void logout(HttpSession session) throws Exception {

		session.invalidate();
	}

	@Override
	public int idDupCheck(String uid) throws Exception {
		
		System.out.println("Service ¡¯¿‘" + "--" + uid);
		return dao.idDupCheck(uid);
	}
	
	

}

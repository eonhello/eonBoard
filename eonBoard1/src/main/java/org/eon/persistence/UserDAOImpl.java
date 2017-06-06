package org.eon.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.eon.domain.UserVO;
import org.eon.dto.LoginDTO;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "org.eon.mapper.UserMapper";

	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		
		return session.selectOne(namespace + ".login", dto);
	}

	@Override
	public void keepLogin(String uid, String sessionId, Date next) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("uid", uid);
		paramMap.put("sessionId", sessionId);
		paramMap.put("next", next);
		
		session.update(namespace + ".keepLogin", paramMap);
		
	}

	@Override
	public UserVO checkUserWithSessionKey(String value) throws Exception {
		
		return session.selectOne(namespace + ".checkUserWithSessionKey", value);
	}

	@Override
	public List<UserVO> userList() throws Exception {
		
		return session.selectList(namespace + ".userList");
	}

	@Override
	public void insertUser(UserVO vo) throws Exception {
		
		session.insert(namespace + ".insertUser", vo);
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
	public boolean loginCheck(UserVO vo) throws Exception {
		
		String name = session.selectOne(namespace + ".loginCheck", vo);
		return (name == null) ? false : true;
	}

	@Override
	public UserVO viewLogin(UserVO vo) throws Exception {
		
		return session.selectOne(namespace + ".viewLogin", vo);
	}

	@Override
	public void logout(HttpSession session) throws Exception {
		
	}

	@Override
	public int idDupCheck(String uid) throws Exception {
		
		System.out.println("DAO ¡¯¿‘" + "--" + uid);
		int testID = session.selectOne(namespace + ".idDupCheck", uid);
		System.out.println(testID);
		return testID;
	}

}

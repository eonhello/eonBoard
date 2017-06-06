package org.eon.service;

import javax.inject.Inject;

import org.eon.domain.MessageVO;
import org.eon.persistence.MessageDAO;
import org.eon.persistence.PointDAO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MessageServiceImpl implements MessageService {

	@Inject
	private MessageDAO messageDAO;

	@Inject
	private PointDAO pointDAO;

	//@Transactional
	@Override
	public void addMessage(MessageVO vo) throws Exception {

		messageDAO.create(vo);
		pointDAO.updatePoint(vo.getSender(), 10);
	}

	@Override
	public MessageVO readMessage(String uid, Integer mid) throws Exception {

		messageDAO.updateState(mid);

		pointDAO.updatePoint(uid, 5);

		return messageDAO.readMessage(mid);
	}

}

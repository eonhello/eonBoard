package org.eon.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MailController {

	@Autowired
	private JavaMailSender mailSender;

	// mailForm
	@RequestMapping(value = "/mail/mailForm")
	public String mailForm() {

		return "/mail/mailForm";
	}

	// mailSending 
	@RequestMapping(value = "/mail/mailSending")
	public String mailSending(HttpServletRequest request) {

		String setfrom = "eonhello@gmail.com"; // ������ ��� �̸���
		String personal = request.getParameter("name"); // ������ ��� �̸�
		String tomail = "paleblue_sky@naver.com"; // request.getParameter("tomail");
													// // �޴� ��� �̸���
		String title = request.getParameter("title"); // ���� ����
		String content = request.getParameter("content"); // ���� ����
		String sendermail = personal + " �� �̸��� : " + request.getParameter("email");

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom, personal); // ������ ���(�̸���, �̸�)
			messageHelper.setTo(tomail); // �޴� ��� �̸���
			messageHelper.setSubject(title); // ���� ���� ���� ����
			messageHelper.setText(content + "<br><br>" + sendermail); // ���� ����

			mailSender.send(message);

		} catch (Exception e) {

			System.out.println(e);
		}

		return "redirect: ../";
	}

}

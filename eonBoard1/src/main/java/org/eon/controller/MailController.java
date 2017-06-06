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

		String setfrom = "eonhello@gmail.com"; // 보내는 사람 이메일
		String personal = request.getParameter("name"); // 보내는 사람 이름
		String tomail = "paleblue_sky@naver.com"; // request.getParameter("tomail");
													// // 받는 사람 이메일
		String title = request.getParameter("title"); // 메일 제목
		String content = request.getParameter("content"); // 메일 내용
		String sendermail = personal + " 님 이메일 : " + request.getParameter("email");

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom, personal); // 보내는 사람(이메일, 이름)
			messageHelper.setTo(tomail); // 받는 사람 이메일
			messageHelper.setSubject(title); // 메일 제목 생략 가능
			messageHelper.setText(content + "<br><br>" + sendermail); // 메일 내용

			mailSender.send(message);

		} catch (Exception e) {

			System.out.println(e);
		}

		return "redirect: ../";
	}

}

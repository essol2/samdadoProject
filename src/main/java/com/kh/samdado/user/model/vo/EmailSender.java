package com.kh.samdado.user.model.vo;

import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import com.sun.xml.internal.messaging.saaj.packaging.mime.internet.MimeUtility;

@Component // Bean 등록
public class EmailSender {
	 
    @Autowired
    protected JavaMailSender mailSender;
    
    public void SendEmail(Email email) throws Exception {
         
        MimeMessage message = mailSender.createMimeMessage();
        
        try {
        	
        	MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
        	
        	messageHelper.setSubject(email.getSubject()); // 컨트롤러에서 작성돼서 들어오는 제목
        	messageHelper.setText(email.getContent()); // 컨트롤러에서 작성돼서 들어오는 내용
        	
        	// 본인 컴퓨터에 있는 첨부파일 경로로 바꿔주세용!!
        	DataSource dataSource = new FileDataSource("C:\\Users\\scybj\\OneDrive\\바탕 화면\\삼다도\\삼다도.png");
        	
        	messageHelper.addAttachment(MimeUtility.encodeText("삼다도.png", "UTF-8", "B"), dataSource);
        	
        	String htmlStr = "<h1 style=\"font-family: 'Jeju Myeongjo', serif;\">[비밀번호 찾기]</h1>"
        			+ "<br> <span style=\"font-family: 'Jeju Myeongjo', serif; font-size: 15px;\">여러분의 제주 여행 동반자, 삼다도입니다.</span>"
        			+ "<br> <span style=\"font-family: 'Jeju Myeongjo', serif; font-size: 15px;\">아래 링크를 클릭하여 <strong style=\"color: darkred; font-size: 15px;\">비밀번호를 변경</strong>해주세요!</span>"
        			+ "<br><br> <a style=\"font-size: 15px;\" href='http://localhost:8898/samdado/user/email/changePwd?authKey="
        			+ email.getContent().substring(0, 6) + "&usemail="
        			+ email.getContent().substring(6) + "' target='_blank'>비밀번호 변경하러 가기</a>";
        	messageHelper.setText(htmlStr, true);
        	
        	message.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(email.getReceiver()));

        } catch(MessagingException e) {
            System.out.println("MessagingException");
            e.printStackTrace();
        } try {
            mailSender.send(message);
        } catch(MailException e) {
            System.out.println("MailException 발생");
            e.printStackTrace();
        }
    }
    
        
}


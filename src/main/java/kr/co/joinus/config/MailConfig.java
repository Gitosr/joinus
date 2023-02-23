package kr.co.joinus.config;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class MailConfig {
	
	@Bean
	JavaMailSender naverMailService() {
		JavaMailSenderImpl javaMailSender = new JavaMailSenderImpl();
		
		javaMailSender.setHost("smtp.naver.com"); //메인 도메인 서버 주소(smtp서버 주소)
		javaMailSender.setUsername("메일아이디");
		javaMailSender.setPassword("메일비밀번호");
		
		javaMailSender.setPort(465); // smtp포트
		
		javaMailSender.setJavaMailProperties(getMailProperties()); //메일 인증서버 정보 가져오기
		
		return javaMailSender;
	}
	
	//메일 인증서버 정보 가져오기
	private Properties getMailProperties() {
		Properties properties = new Properties();
		properties.setProperty("mail.transport.protocol", "smtp"); //프로토콜 설정
		properties.setProperty("mail.smtp.auth", "true"); //smtp인증
		properties.setProperty("mail.smtp.starttls.enable", "true"); //smtp starttls 사용
		properties.setProperty("mail.debug", "true"); //디버그 사용
		properties.setProperty("mail.smtp.ssl.trust", "smtp.naver.com"); //ssl인증 서버는 stmp.naver,com
		properties.setProperty("mail.smtp.ssl.enable", "true"); //ssl사용
		
		return properties;
	}

}

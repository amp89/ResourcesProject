package data;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EMail {


	final static String Username = "confirmation@alexmpeterson.com";

	final static String Password = "KI7RDs2x=;R(";

	final static String fromEmailAddress = "confirmation@alexmpeterson.com";

	private String toEmailAddress;

	private String subject;

	private String textMessage;

	
	
	public String getToEmailAddress() {
		return toEmailAddress;
	}

	public void setToEmailAddress(String toEmailAddress) {
		this.toEmailAddress = toEmailAddress;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getTextMessage() {
		return textMessage;
	}

	public void setTextMessage(String textMessage) {
		this.textMessage = textMessage;
	}

	public boolean sendEMail() {

		Properties props = new Properties();
		boolean success = false;


		props.put("mail.smtp.host", "mail.alexmpeterson.com");
		props.put("mail.smtp.port", "587");

		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");

		LoginAuthenticator la = new LoginAuthenticator(Username, Password);
		Session session = Session.getDefaultInstance(props, new LoginAuthenticator(Username, Password));

		try {

			Message message = new MimeMessage(session);

			message.setFrom(new InternetAddress(fromEmailAddress));

			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmailAddress));

			message.setSubject(subject);

			message.setText(textMessage);

			Transport.send(message);

			System.out.println("\nYour Message delivered successfully ....");
			success = true;
		} catch (MessagingException e) {

			success = false;
			throw new RuntimeException(e);
		}
		return success;
	}

	class LoginAuthenticator extends Authenticator {
		PasswordAuthentication authentication = null;

		public LoginAuthenticator(String username, String password) {
			authentication = new PasswordAuthentication(username, password);
		}

		@Override
		protected PasswordAuthentication getPasswordAuthentication() {
			return authentication;
		}
	}
}

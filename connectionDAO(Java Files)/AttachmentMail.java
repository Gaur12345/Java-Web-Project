package connDAO;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class AttachmentMail 
{
	public static void sendMail(String to,String sub,String msg,String path) throws com.sun.xml.internal.messaging.saaj.packaging.mime.MessagingException
	{
		
		String p="E://eclipse//CollageProject//WebContent//";
		String userid="gaurav19MCA1072@gmail.com";
		String password="gaurav#123";
		p=p+path;
		System.out.println(p);

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(userid, password);
			}
		  });

		try {
			System.out.println(to+" "+sub+" "+msg);
			System.out.println(p);

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(userid)); // same email id
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(to));// whome u have to send mails that person id
			message.setSubject(sub);
			
			Multipart emailcontent = new MimeMultipart();
			//Text body part
			MimeBodyPart textBodypart =new MimeBodyPart();
			textBodypart.setText(msg);
			//Attachment body parts
			MimeBodyPart imageAtt = new MimeBodyPart();
		
			imageAtt.attachFile(p);
		
			//Attach body Parts
			emailcontent.addBodyPart(textBodypart);
			emailcontent.addBodyPart(imageAtt);
			
			message.setContent(emailcontent);
			
			Transport.send(message);
			
		
			
			// creates message part
		
	 
			
			        
			System.out.println("Done");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
}
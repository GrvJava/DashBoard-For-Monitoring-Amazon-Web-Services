package com.Dash.Blogic;


import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.Dash.Models.mail_ver;


public class SendEmailToUser{
	
	public static String SendEmail(String sEmail,String sPassword,String rEmail,String subject,String Text)
	{
		String ver = mail_ver.validation(rEmail);
		if(ver.equals("true"))
		{
		final String username =sEmail;
		final String password =sPassword;
	

		try {

            Properties properties = new Properties();
            properties.put("mail.smtp.host", "smtp.gmail.com");  
            properties.put("mail.smtp.socketFactory.port", "465");  
            properties.put("mail.smtp.socketFactory.class",  
                  "javax.net.ssl.SSLSocketFactory");  
            properties.put("mail.smtp.auth", "true");  
            properties.put("mail.smtp.port", "465");
            Session ses = Session.getInstance(properties,    
                new javax.mail.Authenticator() {  
                 protected PasswordAuthentication getPasswordAuthentication() {  
                 return new PasswordAuthentication(username, password); } 
                });  

            Message message = new MimeMessage(ses);  
            message.setFrom(new InternetAddress(username));  
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(rEmail));  
            message.setSubject(subject);  
            message.setText(Text);  
            Transport.send(message);       
            
            return "success";
       

		} catch (MessagingException e) {
			System.out.println(e.toString());
			return e.toString();
		}
		}
		else
		{
			return "wrong";
		}
		
	}


}

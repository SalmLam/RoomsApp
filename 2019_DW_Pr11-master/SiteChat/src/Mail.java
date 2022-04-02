import java.util.Properties;    
import javax.mail.*;    
import javax.mail.internet.*;    
public class Mail{  
    public static void send(String to,String sub,String msg){  
    	
    	  final String from = "onlinechat.rooms4@gmail.com";
    	  final String password = "chatonline123";
          //Get properties object    
          Properties props = new Properties();    
          props.put("mail.smtp.host", "smtp.gmail.com");
          props.put("mail.smtp.port", "587");
          props.put("mail.smtp.auth", "true");
          props.put("mail.smtp.starttls.enable", "true");   
          //get Session   
          Session session = Session.getDefaultInstance(props,    
           new javax.mail.Authenticator() {    
           protected PasswordAuthentication getPasswordAuthentication() {    
           return new PasswordAuthentication(from,password);  
           }    
          });    
          //compose message    
          try {    
           MimeMessage message = new MimeMessage(session);    
           message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));    
           message.setSubject(sub);    
           message.setContent(msg, "text/html; charset=utf-8");   
           //send message  
           Transport.send(message);    
          } catch (MessagingException e) {throw new RuntimeException(e);}    
             
    }  
}
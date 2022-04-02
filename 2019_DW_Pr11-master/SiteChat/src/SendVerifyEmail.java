
public class SendVerifyEmail {
	
	public static void send(String to, String token) {
		String message = "<!DOCTYPE html><html><head><style>body, html {text-align: center;font-family: Arial, Helvetica;}</style></head>"
				+ "<body><h1>Online Chat Rooms</h1><p>To verify your email, please click <a href = '"+"http://localhost:8081/SiteChat/Verifyemail?token="+token+"'>here</a></p>"
				+ "</div></body></html>";
		Mail.send(to, "Verifying your email", message);
	}
}

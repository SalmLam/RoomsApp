
public class RandomToken {
    public static String getAlphaNumericString() { 
        String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                    + "0123456789"
                                    + "abcdefghijklmnopqrstuvxyz"; 
        StringBuilder sb = new StringBuilder(200); 
        for (int i = 0; i < 200; i++) {
            int index = (int)(AlphaNumericString.length() * Math.random()); 
            sb.append(AlphaNumericString .charAt(index)); 
        } 
        return sb.toString(); 
    }
}

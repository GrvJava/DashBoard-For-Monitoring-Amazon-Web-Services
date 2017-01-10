package com.Dash.Blogic;
import java.security.Key;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

public class StrongAES {

	private final static String key = "hbjhvbihlabilbak";
	  public static String Encrypt(String text)
	  {
		  String en = "";
		  try 
	        {
	            // Create key and cipher
	            Key aesKey = new SecretKeySpec(key.getBytes(), "AES");
	            Cipher cipher = Cipher.getInstance("AES");
	            // encrypt the text
	            cipher.init(Cipher.ENCRYPT_MODE, aesKey);
	            byte[] encrypted = cipher.doFinal(text.getBytes());
	            en = new String(encrypted);
	            // decrypt the text
	        }
	        catch(Exception e) 
	        {
	            e.printStackTrace();
	        }
		  return en;
	  }
	  
	  public static String Decrypt(String text)
	  {
		  String dc = "";
		  try
		  {
		  Key aesKey = new SecretKeySpec(key.getBytes(), "AES");
          Cipher cipher = Cipher.getInstance("AES");
          cipher.init(Cipher.DECRYPT_MODE, aesKey);
          dc = new String(cipher.doFinal(text.getBytes()));
          
		  }
		  catch(Exception e) 
	        {
	            e.printStackTrace();
	        }
		  return dc;
	  }
}

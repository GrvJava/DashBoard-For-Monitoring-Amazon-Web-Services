package com.Dash.Models;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;

public class mail_ver
{
   boolean result = true;
   public static String validation(String s)
   {

   try {
      InternetAddress emailAddr = new InternetAddress(s);
      emailAddr.validate();
	  return "true";

   } catch (AddressException ex) {
	   return "false";
   }
    
   }
  
}

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sis.util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

class Auth extends Authenticator {
	//private static final String SMTP_HOST_NAME = "smtp.gmail.com";
	  private static final String SMTP_AUTH_USER = "E.Gas.Sewa1@gmail.com";
	  private static final String SMTP_AUTH_PWD  = "ritu.proj";
	    
	    public PasswordAuthentication getPasswordAuthentication()
	    {
	        String username = SMTP_AUTH_USER;
	        String password = SMTP_AUTH_PWD;
	        return new PasswordAuthentication(username, password);
	    }


}

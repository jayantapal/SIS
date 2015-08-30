/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sis.util;


/**
 *
 * @author Administrator
 */
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class SendEmail {

    public static String sendEmail(String destinationAddress,String subject,String msg)
    {
        String status="success";
        // Create a session
        String host = "smtp.gmail.com";
        Properties props = new Properties();

        // SMTP Session
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "586");
        props.put("mail.smtp.auth", "true");
        // We need TTLS, which gmail requires
        props.put("mail.smtp.starttls.enable", "true");

        // Create a session
        Session session = Session.getDefaultInstance(props, new Auth());

        try {
            // Make a new message
            MimeMessage message = new MimeMessage(session);

            // Who is this message from
            message.setFrom(new InternetAddress("jayanta.pal84@gmail.com", subject));

            // Who is this message to (we could do fancier things like make a list or add CC's)
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(destinationAddress, false));

            // Subject and body
            message.setSubject(subject);
            message.setText(msg);

            // We can do more here, set the date, the headers, etc.
            Transport.send(message);
            System.out.println("Mail sent!");
        } catch (Exception e) {
            e.printStackTrace();
            status="faild";
            
        }
        return status;
    }
    
}

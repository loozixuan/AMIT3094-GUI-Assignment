/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

/**
 *
 * @author Chrisann Lee
 */
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Chrisann Lee
 */
public class JavaMailUtilOrderCancel {

    public static void sendMail(String recipient, String orderId, String name) {
        System.out.println("Prepare to send email");
        Properties properties = new Properties();

        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        String myAccountEmail = "leesm-wm19@student.tarc.edu.my";//sender email
        String password = "9705095272chris";//sender password
        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(myAccountEmail, password);
            }
        });

        Message message = prepareMessage(session, myAccountEmail, recipient, orderId, name);
        try {
            Transport.send(message);
        } catch (Exception ex) {
            Logger.getLogger(JavaMailUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.print("Message sent successfully");

    }

    private static Message prepareMessage(Session session, String myAccountEmail, String recipient, String id, String name) {
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(myAccountEmail));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
            message.setSubject("Your Order Summary - Hobbit Hall");
            String htmlCode = "<html>\n"
                    + "<head>\n"
                    + "<title>Hobbit Hall</title>\n"
                    + "</head>\n"
                    + "<body style='margin:30px;'>\n"
                    + "<p style='font-size:2.2em;color:rgb(51, 204, 204);'>Order Cancelled</p>\n"
                    + "<p style='font-size:1.5em;'>Dear " + name + ":</p>\n"
                    + "<p style='font-size:1.3em;'>Your order has been cancelled.(Order No: " + id + ")</p>\n"
                    + "<p style='font-size:1.3em;'>You can click the button below to check the status of your order.</p>"
                    + "<a href='http://localhost:48180/HobbitHall/CustomerOrderControl?action=orderDetail&orderID=" + id + "'><input style='border: 2px solid black;background-color:white;padding:10px;margin-top:20px;margin-bottom:20px;margin-right:100px;display:block;font-size:1.3em;' type='button' name='orderDetails' value='View Order Status'/></a>\n"
                    + "</body>\n"
                    + "</html>";
            message.setContent(htmlCode, "text/html");
            return message;

        } catch (Exception ex) {
            Logger.getLogger(JavaMailUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }
}

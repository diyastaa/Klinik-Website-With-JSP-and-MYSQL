package com.shashi.utility;

import jakarta.mail.MessagingException;


public class MailMessage {
	public static void registrationSuccess(String emailId, String name) {
		String recipient = emailId;
		String subject = "Registration Successfull";
		String htmlTextMessage = "" + "<html>" + "<body>"
				+ "<h2 style='color:Blue;'>Welcome to Klinik Solusi Medika</h2>" + "" + "Hi " + name + ","
				+ "<br><br>Terimakasih Sudah Registrasi di Klinik Solusi .<br>"
			
			
                                 + "</body>" + "</html>";
		try {
			JavaMailUtil.sendMail(recipient, subject, htmlTextMessage);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
        public static void KnSelesai(String emailId, String name, String appoin, String keluhan) {
		String recipient = emailId;
		String subject = "Konsultasi Terkirim";
		String htmlTextMessage = "" + "<html>" + "<body>"
				+ "<h2 style='color:Blue;'>Appointment anda kami terima</h2>" + "" + "Hi " + name + ","
				+ "<br><br>Appointment Anda sudah kami terima. Mohon Menunggu dan selalu cek di webiste/email anda kami untuk info lebih lanjut<br>"
			+ "<br>" + "tanggal appointment anda " + appoin 
                        + "<br>Dengan keluhan sebagai berikut : " + keluhan + ""
                        +  "<br> <br>    Pastikan tanggal anda benar dan jangan terlewatkan<br/><br/>"
			+  " <br><br>     Terimkasih sudah bersama kami!<br/><br/>"
                                 + "</body>" + "</html>";
		try {
			JavaMailUtil.sendMail(recipient, subject, htmlTextMessage);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
  
  
 

  
    }


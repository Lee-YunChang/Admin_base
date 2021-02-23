package com.sangs.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import com.sangs.support.SangsProperties;

public class Mail {

	javax.mail.Message msg = null;
	InternetAddress cc = null;
	Session session = null;
	InternetAddress[] toAddr = null;

	private String fromMail; // 보내는 사람 이메일 주소
	private String fromName; // 보내는 사람 이름

	public String getFromMail() {
		return fromMail;
	}

	public void setFromMail(String fromMail) {
		this.fromMail = fromMail;
	}

	public String getFromName() {
		return fromName;
	}

	public void setFromName(String fromName) {
		this.fromName = fromName;
	}

	/*
	 * This class implements a typed DataSource from : an InputStream a byte
	 * array a String
	 */
	class ByteArrayDataSource implements DataSource {

		private byte[] data; // data
		private String type; // content-type

		/* Create a datasource from an input stream */
		ByteArrayDataSource(InputStream is, String type) {
			this.type = type;
			try {
				ByteArrayOutputStream os = new ByteArrayOutputStream();
				int ch;

				while ((ch = is.read()) != -1)
					// XXX : must be made more efficient by
					// doing buffered reads, rather than one byte reads
					os.write(ch);
				data = os.toByteArray();

			} catch (IOException ioex) {
			}
		}

		/* Create a datasource from a byte array */
		ByteArrayDataSource(byte[] data, String type) {
			this.data = data;
			this.type = type;
		}

		/* Create a datasource from a String */
		ByteArrayDataSource(String data, String type) {

			try {
				// Assumption that the string contains only ascii
				// characters ! Else just pass in a charset into this
				// constructor and use it in getBytes()
				this.data = data.getBytes("KSC5601");
				// this.data = data.getBytes();
			} catch (UnsupportedEncodingException uex) {
			}

			this.type = type;
		}

		public InputStream getInputStream() throws IOException {
			if (data == null)
				throw new IOException("no data");
			return new ByteArrayInputStream(data);
		}

		public OutputStream getOutputStream() throws IOException {
			throw new IOException("cannot do this");
		}

		public String getContentType() {
			return type;
		}

		public String getName() {
			return "dummy";
		}
	}

	/**
     * 
     */
	public Mail() throws MailException {

		super();

		try {
			java.util.Properties props = new java.util.Properties();
			props.put("mail.smtp.host", SangsProperties.getProperty("Globals.mail.smtp.host"));
			props.put("mail.transprot.protocol", SangsProperties.getProperty("Globals.mail.transport.protocol"));
			props.put("mail.smtp.port", SangsProperties.getProperty("Globals.mail.smtp.port"));
			props.put("mail.smtp.auth", SangsProperties.getProperty("Globals.mail.smtp.auth"));
			
			session = Session.getDefaultInstance(props, null);
			session.setDebug(true);
			msg = new MimeMessage(session);
			msg.setSentDate(new java.util.Date());
			
	        String cc_flag = "false";
	        
			if (cc_flag.equalsIgnoreCase("true")) {
				InternetAddress[] cc = { new InternetAddress(fromMail) };
				msg.setRecipients(Message.RecipientType.CC, cc);
			}
		} catch (MessagingException e) {
			throw new MailException(e.getMessage());
		} catch (Exception e) {
			throw new MailException(e.getMessage());
		}
	}

	public void send() throws MailException {

		try {
			Transport.send(msg);
		} catch (MessagingException e) {
			throw new MailException(e.getMessage());
		}
	}

	public void setContent(java.lang.Object o, String type)
			throws MailException {

		try {
			msg.setContent(o, type);
		} catch (MessagingException e) {
			throw new MailException(e.getMessage());
		} catch (Throwable e) {
			throw new MailException(e.getMessage());
		}
	}

	public void setContent(Multipart mp) throws MailException {

		try {
			msg.setContent(mp);
		} catch (MessagingException e) {
			throw new MailException(e.getMessage());
		} catch (Throwable e) {
			throw new MailException(e.getMessage());
		}
	}

	/**
	 * 명시적으로 setFrom(email) 혹은 setFrom(email, name) 을 사용하지 않으면 configuration 파일의
	 * dev.traniz.mail.admin 값으로 셋팅됩니다.<br>
	 * 명시적으로 발신자를 바꾸고자 할 때 사용하세요.
	 * 
	 * @param from
	 *            java.lang.String
	 * @see #setFrom(java.lang.String, java.lang.String)
	 */
	public void setFrom(String address) throws MailException {

		try {
			InternetAddress user = new InternetAddress(address);
			msg.setFrom(user);
		} catch (AddressException e) {
			throw new MailException(e.getMessage());
		} catch (MessagingException e) {
			throw new MailException(e.getMessage());
		}
	}

	/**
	 * 명시적으로 setFrom(email) 혹은 setFrom(email, name) 을 사용하지 않으면 configuration 파일의
	 * dev.traniz.mail.admin 값으로 셋팅됩니다.<br>
	 * 명시적으로 발신자를 바꾸고자 할 때 사용하세요....
	 * 
	 * @param from
	 *            java.lang.String
	 * @param from
	 *            java.lang.String
	 * 
	 * @see #setFrom(java.lang.String)
	 */
	public void setFrom(String address, String personal) throws MailException {

		try {
			InternetAddress user = new InternetAddress(address, personal,"UTF-8");
			msg.setFrom(user);
		} catch (Exception e) {
			throw new MailException(e.getMessage());
		}
	}

	/**
	 * @param content
	 *            java.lang.Object
	 */
	public void setHtmlContent(String html) throws MailException {

		try {
			msg.setDataHandler(new DataHandler(new ByteArrayDataSource(html,
					"text/html; charset=euc-kr")));
			msg.setHeader("Content-Transfer-Encoding", "7bit");
		} catch (MessagingException e) {
			throw new MailException(e.getMessage());
		} catch (Exception e) {
			throw new MailException(e.getMessage());
		}
	}

	/**
	 * @param to
	 *            java.lang.String
	 */
	public void setRecipient(String recipient) throws MailException {

		try {
			InternetAddress[] users = { new InternetAddress(recipient) };
			msg.setRecipients(Message.RecipientType.TO, users);
		} catch (AddressException e) {
			throw new MailException(e.getMessage());
		} catch (MessagingException e) {
			throw new MailException(e.getMessage());
		} catch (Exception e) {
			throw new MailException(e.getMessage());
		}
	}

	/**
	 * @param address
	 *            e-mail address
	 * @param personal
	 *            sender name
	 */
	public void setRecipient(java.lang.String address, java.lang.String personal)
			throws MailException {

		try {
			InternetAddress[] users = { new InternetAddress(address, personal) };
			msg.setRecipients(Message.RecipientType.TO, users);
		} catch (AddressException e) {
			throw new MailException(e.getMessage());
		} catch (MessagingException e) {
			throw new MailException(e.getMessage());
		} catch (Exception e) {
			throw new MailException(e.getMessage());
		}
	}

	/**
	 * @param recipients
	 *            java.lang.String[]
	 */
	public void setRecipients(String[] recipients) throws MailException {

		try {
			InternetAddress[] users = new InternetAddress[recipients.length];
			for (int i = 0; i < recipients.length; i++) {
				users[i] = new InternetAddress(recipients[i]);
			}
			msg.setRecipients(Message.RecipientType.TO, users);
		} catch (AddressException e) {
			throw new MailException(e.getMessage());
		} catch (MessagingException e) {
			throw new MailException(e.getMessage());
		} catch (Exception e) {
			throw new MailException(e.getMessage());
		}
	}

	/**
	 * @param recipients
	 *            Vector
	 */
	@SuppressWarnings("rawtypes")
	public void setRecipients(java.util.Vector recipients) throws MailException {

		try {
			InternetAddress[] users = new InternetAddress[recipients.size()];
			java.util.Enumeration enum2 = recipients.elements();
			for (int i = 0; enum2.hasMoreElements(); i++) {
				String recipient = (String) enum2.nextElement();
				users[i] = new InternetAddress(recipient);
			}
			msg.setRecipients(Message.RecipientType.TO, users);
		} catch (AddressException e) {
			throw new MailException(e.getMessage());
		} catch (MessagingException e) {
			throw new MailException(e.getMessage());
		} catch (Exception e) {
			throw new MailException(e.getMessage());
		}
	}

	/**
	 * @param subject
	 *            java.lang.String
	 */
	public void setSubject(String subject) throws MailException {

		try {
			((MimeMessage) msg).setSubject(subject, "euc-kr");
		} catch (MessagingException e) {
			throw new MailException(e.getMessage());
		}
	}

	/**
	 * @param text
	 *            java.lang.Object
	 * @param html
	 *            java.lang.Object
	 */
	public void setTextAndHtmlContent(String text, String html)
			throws MailException {

		try {
			MimeBodyPart mbp1 = new MimeBodyPart();
			mbp1.setDataHandler(new DataHandler(new ByteArrayDataSource(html,
					"text/html; charset=euc-kr")));
			mbp1.setHeader("Content-Transfer-Encoding", "7bit");

			MimeBodyPart mbp2 = new MimeBodyPart();
			mbp2.setDataHandler(new DataHandler(new ByteArrayDataSource(text,
					"text/plain; charset=euc-kr")));
			mbp2.setHeader("Content-Transfer-Encoding", "7bit");

			MimeMultipart mp = new MimeMultipart();
			mp.addBodyPart(mbp1);
			mp.addBodyPart(mbp2);
			mp.setSubType("alternative");
			msg.setContent(mp);
		} catch (MessagingException e) {
			throw new MailException(e.getMessage());
		} catch (Exception e) {
			throw new MailException(e.getMessage());
		}
	}

	/**
	 * @param text
	 *            java.lang.String
	 */
	public void setTextContent(String text) throws MailException {

		try {
			msg.setContent(text, "text/plain; charset=euc-kr");
			msg.setHeader("Content-Transfer-Encoding", "7bit");
		} catch (MessagingException e) {
			throw new MailException(e.getMessage());
		} catch (Exception e) {
			throw new MailException(e.getMessage());
		}
	}

}

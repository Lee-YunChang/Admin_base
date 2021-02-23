package com.sangs.util;

import java.security.InvalidKeyException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import javax.crypto.spec.DESedeKeySpec;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;
/**
 * Description : AES_128 암호화/복호화
 * 
 * Modification Information
 * 수정일		수정자			수정내용
 * -------	-----------------------------------
 * 2014.08.07  김학규				수정
 *
 */

public class Aes_128 {
	
	private static final String strKey = "b9ca1a5dd2db00cadee3f16ce55d1dc7";
	
	private static Log log = LogFactory.getLog("com.sangs.util.Aes_128");
	
	// AES_18 암호화
	public static String encrypt(String to_encrypt) {
	    try {
	      Key key = generateKey("AES", ByteUtils.toBytes(strKey, 16));
	      String transformation = "AES/ECB/PKCS5Padding";
	      Cipher cipher = Cipher.getInstance(transformation);
	      cipher.init(1, key);

	      byte[] plain = to_encrypt.getBytes("UTF-8");
	      byte[] encrypt = cipher.doFinal(plain);
	      return ByteUtils.toHexString(encrypt);
	      
	    }catch (Exception e) {
	    	
	    }
	    
	    return null;
	    
	  }

	// AES_18 복호화
	public static String decrypt(String to_decrypt) {
	    try {
	    	
	      String transformation = "AES/ECB/PKCS5Padding";
	      Cipher cipher = Cipher.getInstance(transformation);
	      Key key = generateKey("AES", ByteUtils.toBytes(strKey, 16));
	      cipher.init(2, key);
	      byte[] decrypt = cipher.doFinal(ByteUtils.toBytes(to_decrypt, 16));
	      return new String(decrypt, "UTF8");
	      
	    } catch (Exception e) {
	    	
	    }
	    
	    return null;
	    
	 }
	
	 public static String Decrypt1(String text, String key) throws Exception
     {
               Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
               byte[] keyBytes= new byte[16];
               byte[] b= key.getBytes("UTF-8");
               int len= b.length;
               if (len > keyBytes.length) len = keyBytes.length;
               System.arraycopy(b, 0, keyBytes, 0, len);
               SecretKeySpec keySpec = new SecretKeySpec(keyBytes, "AES");
               IvParameterSpec ivSpec = new IvParameterSpec(keyBytes);
               cipher.init(Cipher.DECRYPT_MODE,keySpec,ivSpec);

               BASE64Decoder decoder = new BASE64Decoder();
               byte [] results = cipher.doFinal(decoder.decodeBuffer(text));
               return new String(results,"UTF-8");
     }

     public static String Encrypt1(String text, String key) throws Exception
     {
               Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
               byte[] keyBytes= new byte[16];
               byte[] b= key.getBytes("UTF-8");
               int len= b.length;
               if (len > keyBytes.length) len = keyBytes.length;
               System.arraycopy(b, 0, keyBytes, 0, len);
               SecretKeySpec keySpec = new SecretKeySpec(keyBytes, "AES");
               IvParameterSpec ivSpec = new IvParameterSpec(keyBytes);
               cipher.init(Cipher.ENCRYPT_MODE,keySpec,ivSpec);

               byte[] results = cipher.doFinal(text.getBytes("UTF-8"));
               BASE64Encoder encoder = new BASE64Encoder();
               return encoder.encode(results);
     }
	//키 생성
	public static Key generateKey(String algorithm, byte[] keyData) throws NoSuchAlgorithmException,
	InvalidKeyException, InvalidKeySpecException{
		
		String upper = algorithm.toUpperCase();
		
		if("DES".equals(upper)){
			KeySpec keySpec = new DESKeySpec(keyData);
			SecretKeyFactory secreKeyFactory = SecretKeyFactory.getInstance(algorithm);
			SecretKey secretKey = secreKeyFactory.generateSecret(keySpec);
			return secretKey;
		}else if("DESede".equals(upper) || "TripleDES".equals(upper) ){
			KeySpec keySpec = new DESedeKeySpec(keyData);
			SecretKeyFactory secretKeyFactory = SecretKeyFactory.getInstance(algorithm);
			SecretKey secretKey = secretKeyFactory.generateSecret(keySpec);
			return secretKey;
		} else {
			SecretKeySpec keySpec = new SecretKeySpec(keyData, algorithm);
			return keySpec;
			
		}
	}
	
	
	
	
	
}

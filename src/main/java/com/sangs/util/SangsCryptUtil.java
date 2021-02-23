package com.sangs.util;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.GregorianCalendar;
import java.util.Random;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class  SangsCryptUtil
{
	
	private static Log log = LogFactory.getLog("com.sangs.util.CryptUtil");
	
    public static boolean isMatch(String s, String s1)
    {
        String s2 = getSalt(s1);
        return s1.equals(s2 + digest(setSalt(s2, s)));
    }

    public static String crypt(String s)
    {
    	String resultPass;
    	resultPass = crypt(s, makeSalt());
    	
    	//비밀번호가 68자리가 되지 않는다면 다시 암호화를 한다.
		while (resultPass.length() != 68) {
			resultPass = crypt(s, makeSalt());
		}
        return resultPass;
    }

    private static String crypt(String s, String s1)
    {    	
        return s1 + digest(setSalt(s1, s));
    }

    private static String makeSalt(int i)
    {
    	return Integer.toHexString((i | 0x10) & 0xffff);
    }

    public static String makeSalt()
    {
        return makeSalt(nextRand());
    }

    private static int nextRand()
    {
    	return (new Random((new GregorianCalendar()).getTime().getTime())).nextInt();
    }

    private static String digest(String s)
    {
        MessageDigest messagedigest = null;
        try
        {
            messagedigest = MessageDigest.getInstance("SHA-256");
        }
        catch(NoSuchAlgorithmException nosuchalgorithmexception) {  }
        messagedigest.update(s.getBytes());
        byte abyte0[] = messagedigest.digest();
        StringBuffer stringbuffer = new StringBuffer();
        for(int i = 0; i < abyte0.length; i++)
        {
            String s1 = Integer.toHexString((new Byte(abyte0[i])).intValue() & 0xff);
            
            if(s1.length() == 1)
                stringbuffer.append("0" + s1);       
            else
                stringbuffer.append(s1);   
        }
        
        return stringbuffer.toString();
    }

    public static String getSalt(String s)
    {
        return s.substring(0, 4);
    }

    private static String setSalt(String s, String s1)
    {
        return s + s1;
    }	
}
package com.sangs.util;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.Enumeration;

public class IpUtil {

	//public static final String DEFALUT_SERVER_IP = "127.0.0.1";
	
	//public static final String REAL_SERVER_IP_86 = "211.210.89.86";
	
	//public static final String REAL_SERVER_IP_87 = "211.210.89.87";
	
	
	
	
	public static String getLocalServerIp(){
		String sip = null;
		
		try{
			boolean isLoopBack = true;
			Enumeration<NetworkInterface> en = NetworkInterface.getNetworkInterfaces();
			while(en.hasMoreElements()) {
				NetworkInterface ni = en.nextElement();
				if (ni.isLoopback())
					continue;

				Enumeration<InetAddress> inetAddresses = ni.getInetAddresses();
				while(inetAddresses.hasMoreElements()) {
					InetAddress ia = inetAddresses.nextElement();
					if (ia.getHostAddress() != null && ia.getHostAddress().indexOf(".") != -1) {
						sip = ia.getHostAddress();
						isLoopBack = false;
						break;
					}
				}
				if (!isLoopBack)
					break;
			}
		} catch (SocketException e1) {
		}
		
		
		return sip;
	}
	

	
	 
	   
}

package org.cdszmis.utils;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * 密码转换 使用SHA-1 和 MD5加密算法
 * 
 * @author WZQ
 * 
 */ 

public class Encipherment {
	/**
	 * 将传入的pass密码字符串转换为SHA-1加密的字符串 不可逆转
	 * 
	 * @param pass
	 * 
	 * @return String pass ;if Exception return null
	 */
	final public static String Enc_SHA_1(String pass) {
		MessageDigest alga;
		try {
			alga = MessageDigest.getInstance("SHA-1");
			alga.update(pass.getBytes());
			byte[] digesta = alga.digest();
			pass = byte2hex(digesta);
		} catch (NoSuchAlgorithmException e) {
			System.out.println("SHA-1算法在当前环境不可用");
			e.printStackTrace();
			return null;
		}
		return pass;
	}

	// 加密加密字符串
	final public static String byte2hex(byte[] b) {
		String hs = "";
		String stmp = "";
		for (int n = 0; n < b.length; n++) {
			stmp = (Integer.toHexString(b[n] & 0XFF));
			if (stmp.length() == 1)
				hs = hs + "0" + stmp;
			else
				hs = hs + stmp;
			if (n < b.length - 1)
				hs = hs + ":";
		}
		return hs.toUpperCase();
	}

	/**
	 * 进行字符串的MD5 多次加密 不可逆
	 * 
	 * @param str
	 * @return
	 */
	final public static String Enc_MD5_2(String str) {
		byte[] data = str.getBytes();

		MessageDigest md5 = null;
		BigInteger big = new BigInteger(data);
		try {
			md5 = MessageDigest.getInstance("MD5");
			for (int i = 1; i <= 3; i++) {
				md5.update(data);
				data = md5.digest();
			}
		} catch (NoSuchAlgorithmException e) {
			System.out.println("MD5 算法在该环境不可用");
			e.printStackTrace();
			return null;
		}
		return big.toString();
	}
}

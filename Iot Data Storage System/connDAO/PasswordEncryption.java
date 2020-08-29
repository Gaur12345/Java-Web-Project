package connDAO;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.spec.KeySpec;
import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESedeKeySpec;


public class PasswordEncryption {

	static String s;
	public static String passwordEnc(String pass)
	{
		try {
			MessageDigest md = MessageDigest.getInstance("SHA");
			md.update(pass.getBytes());
			byte[] b =md.digest();
			StringBuffer sb=new StringBuffer();
			for(byte  b1 : b)
			{
				sb.append(Integer.toHexString(b1 & 0xff).toString());
				
			}
			s=sb.toString();
			return sb.toString();
			
		} 
		catch (NoSuchAlgorithmException e) {
			
			e.printStackTrace();
		}
		return s;
	}

}

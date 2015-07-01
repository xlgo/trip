package base;

import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

public class MainExec {
	public static void main(String[] args) throws NoSuchAlgorithmException {
		SecureRandom sr = SecureRandom.getInstance("sha256");
		byte[] bytes =new byte[200];
		sr.nextBytes(bytes);
		for (byte b : bytes) {
			System.out.println((char)b);
		}
	}
}

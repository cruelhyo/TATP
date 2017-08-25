package take.a.talent.test;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class UserAuthenticationServiceTest 
{
	BCryptPasswordEncoder passwordEncoder;
	
	@Before
	public void setUp() throws Exception
	{
		passwordEncoder = new BCryptPasswordEncoder();
	}

	@Test
	public void test() 
	{
		String password ="pw001";
		String encryptPassword = passwordEncoder.encode(password);
		System.out.println(encryptPassword);
		System.out.println(encryptPassword.length());
		
		//String encodedPassword = "$2a$10$VgCGMLflHvpSgs85/HbElO.WZ.BEEBtZV3a7M8HMPha3tIdF4UgSO";
				
		//assertTrue(passwordEncoder.matches(password, encodedPassword ));

	}

}

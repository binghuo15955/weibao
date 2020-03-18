package weibao.test.mapper;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.yt.entity.User;
import com.yt.mapper.UserMapper;

import weibao.test.TestCase;

public class TestUserMapper extends TestCase{
	
	@Autowired
	private UserMapper userMapper;
	
	@Test
	public void Test_register() {
		User user = new User();
		user.setUsername("1123234");
		userMapper.insert(user);
		System.err.println(user.getUid());
	}
	
	@Test
	public void Test_getbymany() {
		userMapper.selectByMany("a", "", "", "", "", "", "", "0","5" );
	}
	
	@Test
	public void Test_validate_Duplicate(){
		System.out.println(userMapper.validate_Duplicate("1234", "", "", ""));
	}
	
}

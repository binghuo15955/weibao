package weibao.test.mapper;

import java.time.LocalDateTime;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.yt.entity.Browsing_history;
import com.yt.mapper.Browsing_historyMapper;

import weibao.test.TestCase;

public class TestBrowsingHistory extends TestCase {

	@Autowired
	private Browsing_historyMapper historyMapper;
	
	@Test
	public void Test_insert_duplicateMes() {
		LocalDateTime time = LocalDateTime.now();
		Browsing_history browsing_history=new Browsing_history();
		browsing_history.setName("123");
		browsing_history.setPicurl(null);
		browsing_history.setPid(49);
		browsing_history.setPrice("22");
		browsing_history.setSeller_id(99);
		browsing_history.setTime(time);
		browsing_history.setUid(2);
		historyMapper.insertSelective(browsing_history);
	}
}

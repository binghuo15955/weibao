package weibao.test.mapper;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.yt.entity.Collect;
import com.yt.mapper.CollectMapper;

import weibao.test.TestCase;

public class TestCollectMapper extends TestCase {
	
	@Autowired
	private CollectMapper collectMapper;
	
	@Test
	public void Test_getbyUid() {
		List<Collect> collects = collectMapper.selectByUid("1", "0", "2");
		for (int i = 0; i < collects.size(); i++) {
			System.err.println(collects);
		}
	}

}

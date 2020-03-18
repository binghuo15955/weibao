package weibao.test.mapper;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.yt.entity.Product;
import com.yt.mapper.ProductMapper;

import weibao.test.TestCase;

public class TestMypostMapper extends TestCase{
	
	@Autowired
	private ProductMapper productMapper;
	
	@Test
	public void Test_selectByUserIdWithPics_Pages() {
		List<Product> list = productMapper.selectByUserIdWithPics_Pages(1, "1","10");
		for (int i = 0; i < list.size(); i++) {
			System.err.println(list.get(i));
		}
	}

}

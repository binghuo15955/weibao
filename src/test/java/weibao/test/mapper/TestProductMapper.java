package weibao.test.mapper;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.yt.entity.Picture;
import com.yt.entity.Product;
import com.yt.mapper.PictureMapper;
import com.yt.mapper.ProductMapper;
import com.yt.util.file;

import weibao.test.TestCase;

public class TestProductMapper extends TestCase {

	@Autowired
	private ProductMapper productMapper;
	@Autowired
	private PictureMapper pictureMapper;
	
	
	@Test
	public void Test_edit_time() {
		productMapper.selectByMany(1, "", "", "2020-02-14", "", "0", "20");
	}
	
	@Test
	public void Test_delFile() {
		file.deleteFile("../uploadImg/108bf700-e4e5-4626-a5ff-b3151a0db1aa.jpg");
	}
	
	@Test
	public void Test_getbymany() {
		productMapper.selectByMany(1, "", "","", "","2","5");
		
	}
	
	@Test
	public void Test_insert_Many() {
		List<Picture> pictures=new ArrayList<Picture>();
		
		Picture p1=new Picture();
		p1.setPicurl("1111");
		p1.setPid(1);
		pictures.add(p1);
		
		Picture p2=new Picture();
		p2.setPicurl("2222");
		p2.setPid(2);
		pictures.add(p2);
		
		Picture p3=new Picture();
		p3.setPicurl("3333");
		p3.setPid(3);
		pictures.add(p3);
		
		pictureMapper.insertMany(pictures);
	}
	
	@Test
	public void TestSelect_KEY() {
		Product product=new Product();
		product.setCurrent_price("123");
		productMapper.insert(product);
		System.err.println("id="+product.getId());
	}
	
	@Test
	public void TestPost_Product() {
		Product product=new Product();
		//product.setPid(1);
		productMapper.insert(product);
	}
}

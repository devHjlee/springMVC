package com.hjlee.home;

import java.sql.Connection;
import javax.inject.Inject;
import javax.sql.DataSource;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/*.xml" })
public class DataSourceTest {
	@Inject
	@Qualifier("dataSourceSpied")
	private DataSource ds;

	@Test
	public void testConection() throws Exception {
		try (Connection con = ds.getConnection()) {
			System.out.println(ds.getClass());
			System.out.println(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

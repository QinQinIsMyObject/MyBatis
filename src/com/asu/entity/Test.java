package com.asu.entity;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class Test {

	public static void main(String[] args) {
		SqlSession session = null;
		try {
			// 1.通过流的方式读取myBatis.xml配置文件
			InputStream is = Resources.getResourceAsStream("mybatis-config.xml");
			// 2.创建SqlSessionFactory工厂对象
			SqlSessionFactory sf = new SqlSessionFactoryBuilder().build(is);
			// 3.得到SqlSession对象
			session = sf.openSession();
			// 查询单个学生
			Student student = session.selectOne("selectStuBySno", 9);
			System.out.println(student.getSname());
			// 提交事务
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			// 事务回滚
			session.rollback();
		} finally {
			// 关闭资源
			session.close();
		}

	}
}
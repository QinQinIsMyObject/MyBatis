package com.asu.entity;

import java.io.InputStream;
import java.util.List;

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

			// 进行相应的操作(增)
//			Student stu = new Student();
//			stu.setSname("琴琴");
//			stu.setSex("女");
//			stu.setAge(9);
//			int num = session.insert("addStu", stu);
//			if (num > 0) {
//				System.out.println("add success!");
//			}

			// 删
//			int num = session.delete("deleteStu", 20);
//			if (num > 0) {
//				System.out.println("delete success!");
//			}

			// 改
//			Student stu = new Student();
//			stu.setSname("li琴");
//			stu.setSno(9);
//			int num = session.insert("updateStu", stu);
//			if (num > 0) {
//				System.out.println("update success!");
//			}

			// 查询单个学生
//			Student student = session.selectOne("selectStuBySno", 9);
//			System.out.println(student.getSname());

			// 查询所有
//			List<Student> sList = session.selectList("selectAllStu");
//			for (Student student : sList) {
//				System.out.println(student.getSname());
//			}

			// 按照名字模糊查询
			List<Student> sList = session.selectList("selectBySname", "小");
			for (Student stu : sList) {
				System.out.println(stu.getSname());
			}

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
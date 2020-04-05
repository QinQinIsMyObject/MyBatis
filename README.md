# 此项目说明
## 1、主要功能
    数据库连接及实体别名优化。
## 2、主要知识点
### 1)数据库连接优化
	写代码讲究扩展和维护性，一般便于优化、扩展不会把代码写死或者是固定下来。鉴于此，我们可以把数据库连接信息单独写在一个配置文件当中独立抽取出来。
把数据库连接信息抽取到-db.properties中
```
driver=com.mysql.jdbc.Driver
url=jdbc:mysql://localhost:3306/ms
username=root
password=admin
```
把数据库连接信息db.properties引入核心配置文件mybatis-config.xml
```
<!--引入db.propertis文件 -->
<properties resource="db.properties"/>
```
将连接信息用el表达式读取出来
```
<!--POOLED:Mybatis自带数据源 -->
<dataSource type="POOLED">
  <property name="driver" value="${driver}"/>
  <property name="url" value="${url}"/>
  <property name="username" value="${username}"/>
  <property name="password" value="${password}"/>
</dataSource>
```
### 2)实体类别名优化
		在我们的映射文件当中**Mapper.xml经常会碰到参数类型或返回值类型为实体类的情况，正常情况下我们需要写类的全路径，如果系统中类似于这种操作太多，对我们来讲其实是一种消耗；基于此，我们统一在核心配置文件中为实体类取别名，方便简化我们在映射文件中的操作。取别名两种方式：
#### a、为每个实体类取别名
```
<!--给实体类取别名-->
<typeAliases>
	<!--简化在mapper配置文件中使用 为每一个实体类取别名-->
  	<typeAlias type="com.ls.entity.Student" alias="stu"/>
</typeAliases>
```
#### b、为整个包下面的实体类取别名

```
<!--为整个包下面的实体类取别名 -->
<package name="com.ls.entity"/>
```
## 3、说明
## 4、报错
## 5、附加
### 依赖
	官网：https://mvnrepository.com/
	MyBatis：https://mvnrepository.com/artifact/org.mybatis/mybatis
	MySql：https://mvnrepository.com/artifact/mysql/mysql-connector-java
### MyBatis
	官网：https://mybatis.org/
	官网简介：https://mybatis.org/mybatis-3/zh/index.html
	配置文件：https://mybatis.org/mybatis-3/zh/getting-started.html
```
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE configuration
  PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-config.dtd">
<configuration>
	<environments default="development">
		<environment id="development">
			<transactionManager type="JDBC" />
			<dataSource type="POOLED">
				<property name="driver" value="${driver}" />
				<property name="url" value="${url}" />
				<property name="username" value="${username}" />
				<property name="password" value="${password}" />
			</dataSource>
		</environment>
	</environments>
	<mappers>
		<mapper resource="org/mybatis/example/BlogMapper.xml" />
	</mappers>
</configuration>
```
```
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
  PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="org.mybatis.example.BlogMapper">
	<select id="selectBlog" resultType="Blog">
		select * from Blog where id = #{id}
	</select>
</mapper>
```


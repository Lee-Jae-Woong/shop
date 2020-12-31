package com.spring.config;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperFactoryBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.spring.mapper.CartMapper;
import com.spring.mapper.CouponMapper;
import com.spring.mapper.GdsMapper;
import com.spring.mapper.MgrCouponMapper;
import com.spring.mapper.PaymentMapper;
import com.spring.mapper.TopMenuMapper;
import com.spring.mapper.UserMapper;

// Spring MVC 프로젝트에 관련된 설정을 하는 클래스
// (servlet-context.xml)
@Configuration
// @Controller 어노테이션이 붙은 클래스를
// Controller 로 등록함
@EnableWebMvc // (<annotation-driven />)
// Scan 할 Bean 들이 모여있는 package 를 지정함
@ComponentScan("com.spring.controller")
@ComponentScan("com.spring.repository")
@ComponentScan("com.spring.service")
@PropertySource("/WEB-INF/properties/db.properties")
public class ServletAppContext 
  implements WebMvcConfigurer {
  
  @Value("${db.classname}")
  private String db_classname;
  
  @Value("${db.url}")
  private String db_url;
  
  @Value("${db.username}")
  private String db_username;
  
  @Value("${db.password}")
  private String db_password;
  
  /*
    Controller 에서 return하는 문자열(경로)에
    접두사, 접미사 설정하기 
  */
  @Override
  public void configureViewResolvers(ViewResolverRegistry registry) {
    WebMvcConfigurer.super.configureViewResolvers(registry);
    registry.jsp("/WEB-INF/view/",".jsp");
  }
  
  /*
    프로젝트에서 사용하는 정적 파일 경로 설정하기
    이미지, 사운드, 동영상, js, css 등 
  */
  @Override
  public void addResourceHandlers
    (ResourceHandlerRegistry registry) {
    WebMvcConfigurer.super.addResourceHandlers(registry);
    registry.addResourceHandler("/**").addResourceLocations("/resources/");
    registry.addResourceHandler("/uploadimg").addResourceLocations("/uploadimg");
  }
  
  // DataBase 접속 정보 관리
  @Bean
  public BasicDataSource dataSource(){
    BasicDataSource source = new BasicDataSource();
      
    source.setDriverClassName(db_classname);
    source.setUrl(db_url);
    source.setUsername(db_username);
    source.setPassword(db_password);
    
    return source;
  }
  
  @Bean
  public MultipartResolver multipartResolver() {

     //StandardServletMultipartResolver multipartResolver = new StandardServletMultipartResolver();
     MultipartResolver multipartResolver = new CommonsMultipartResolver();
     
     return multipartResolver;
  }
  

  // 접속과 Query문을 관리하는 객체
  @Bean
  public SqlSessionFactory factory(BasicDataSource source) throws Exception{
    
    SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
    factoryBean.setDataSource(source);

    SqlSessionFactory factory = factoryBean.getObject();
        
    return factory;
      
  }
  
  
  
  // TopMenuMapper 등록하기
  @Bean
  public MapperFactoryBean<TopMenuMapper> getTopMenuMapper(SqlSessionFactory factory) throws Exception{
    
    MapperFactoryBean<TopMenuMapper> factoryBean = new MapperFactoryBean<TopMenuMapper>(TopMenuMapper.class);
    factoryBean.setSqlSessionFactory(factory);
    
    return factoryBean;  
    
  }
  
  // UserMapper 등록하기
  @Bean
  public MapperFactoryBean<UserMapper> getUserMapper(SqlSessionFactory factory) throws Exception{
    
    MapperFactoryBean<UserMapper> factoryBean = new MapperFactoryBean<UserMapper>(UserMapper.class);
    factoryBean.setSqlSessionFactory(factory);
    
    return factoryBean;  
    
  }
  //GdsMapper 등록하기
  @Bean
  public MapperFactoryBean<GdsMapper> getGdsMapper(SqlSessionFactory factory) throws Exception{
	    MapperFactoryBean<GdsMapper> factoryBean = new MapperFactoryBean<GdsMapper>(GdsMapper.class);
	    factoryBean.setSqlSessionFactory(factory);
	    return factoryBean;
  }
  //cartMapper
  @Bean
  public MapperFactoryBean<CartMapper> getCartMapper(SqlSessionFactory factory) throws Exception{
    
    MapperFactoryBean<CartMapper> factoryBean = new MapperFactoryBean<CartMapper>(CartMapper.class);
    factoryBean.setSqlSessionFactory(factory);
    
    return factoryBean;  
    
  }
  
  //pay Mapper
  
  @Bean
  public MapperFactoryBean<PaymentMapper> getPaymentMapper(SqlSessionFactory factory) throws Exception{
    
    MapperFactoryBean<PaymentMapper> factoryBean = new MapperFactoryBean<PaymentMapper>(PaymentMapper.class);
    factoryBean.setSqlSessionFactory(factory);
    
    return factoryBean;  
    
  }
  @Bean
  public MapperFactoryBean<MgrCouponMapper> getMgrCouponMapper(SqlSessionFactory factory) throws Exception{
    
    MapperFactoryBean<MgrCouponMapper> factoryBean = new MapperFactoryBean<MgrCouponMapper>(MgrCouponMapper.class);
    factoryBean.setSqlSessionFactory(factory);
    
    return factoryBean;  
    
  }
  
  @Bean
  public MapperFactoryBean<CouponMapper> getCouponMapper(SqlSessionFactory factory) throws Exception{
    
    MapperFactoryBean<CouponMapper> factoryBean = new MapperFactoryBean<CouponMapper>(CouponMapper.class);
    factoryBean.setSqlSessionFactory(factory);
    
    return factoryBean;  
    
  }
  
  // Interceptor 등록하기
	/*
	 * @Override public void addInterceptors(InterceptorRegistry registry) {
	 * WebMvcConfigurer.super.addInterceptors(registry);
	 * 
	 * TopMenuInterceptor topMenuInterceptor = new
	 * TopMenuInterceptor(topMenuService); InterceptorRegistration reg1 =
	 * registry.addInterceptor(topMenuInterceptor);
	 * 
	 * reg1.addPathPatterns("/**");
	 * 
	 * }
	 */
  
  /*
   -- Annotation 방식으로 설정하는 경우 --
   
    @PropertySource("/WEB-INF/properties/db.properties")
    으로 등록된 properties 파일과
    res.setBasenames("/WEB-INF/properties/errors")
    으로 등록된 properties 파일이 충돌하지 않도록 해줌
    
  */  
  @Bean
  public static PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer() {
    return new PropertySourcesPlaceholderConfigurer();
  }
  
  
  // 에러 메세지 등록하기
  @Bean
  public ReloadableResourceBundleMessageSource messageSource() {
    ReloadableResourceBundleMessageSource res = 
        new ReloadableResourceBundleMessageSource();
    res.setBasenames("/WEB-INF/properties/errors");
    return res;
  }
  
  @Bean
  public BCryptPasswordEncoder passwordEncoder() {
      BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
      return bCryptPasswordEncoder;
  }
  
  
  
}







package com.spring.config;

import javax.servlet.Filter;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;


public class ConfigSpring
  extends AbstractAnnotationConfigDispatcherServletInitializer{

  
  // DispatcherServlet에 mapping 할 주소를 설정함 
  @Override
  protected String[] getServletMappings() {
    return new String[] {"/"};
  }
  
  // Spring MVC 에서 사용하는 클래스를 지정함
  // servlet-context.xml
  @Override
  protected Class<?>[] getServletConfigClasses() {
    return new Class[] {ServletAppContext.class};
  }

  // 프로젝트에서 사용하는 Bean들을 정의하는 클래스를 지정함
  // root-context.xml
  @Override
  protected Class<?>[] getRootConfigClasses() {
    return new Class[] {RootAppContext.class};
  }
  
  // 한글 처리를 위한  encoding filter
  @Override
  protected Filter[] getServletFilters() {
    
    CharacterEncodingFilter encodingFilter = 
        new CharacterEncodingFilter();
    encodingFilter.setEncoding("UTF-8");
    
    return new Filter[] {encodingFilter};
  }
  
  
}













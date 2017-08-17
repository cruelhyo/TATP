package take.a.talent.configuration;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

//AbstractAnnotationConfigDispatcherServletInitializer 클래스를 상속 받아 초기화 클래스를 작성
public class SpringMvcInitializer extends AbstractAnnotationConfigDispatcherServletInitializer
{
	@Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class[] { ProjectConfiguration.class };
    }
  
    @Override
    protected Class<?>[] getServletConfigClasses() {
        return null;
    }
  
    @Override
    protected String[] getServletMappings() {
        return new String[] { "/" };
    }
}

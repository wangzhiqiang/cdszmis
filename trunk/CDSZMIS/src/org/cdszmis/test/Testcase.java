package org.cdszmis.test;

 
import org.cdszmis.service.UserService;
import org.cdszmis.utils.HibernateUtils;
import org.hibernate.HibernateException;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.transaction.annotation.Transactional;


@Transactional
public class Testcase {
private static   UserService userService;
private static HibernateUtils hibernateUtils;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	try {
		ApplicationContext act=new ClassPathXmlApplicationContext("applicationContext.xml");
		//sessionFactory=(SessionFactory)act.getBean("sessionFactory");
		System.out.println(act.getBean("sessionFactory"));
		hibernateUtils =(HibernateUtils)act.getBean("hibernateUtils");
	} catch (Exception e) {
		
		e.printStackTrace();
	}
	}
	@Test 
	public void login (){
		
	
		 try {
			 //System.out.println(hibernateUtils.getObjbyId(2, UserEntity.class));
//			 UserEntity u=new UserEntity();
//			 u=(UserEntity) hibernateUtils.getObjbyId(2, UserEntity.class);
			 
//			 List<UserEntity> li=new ArrayList();
//			 li=hibernateUtils.findall(UserEntity.class);
//			 int i=0;
//			 for(UserEntity uu :li){
//				
//				 System.out.println(li.get(i).getId());
//				 i++;
//			 }
			 //userService.userlogin("sad", "sadfadf");
			// UserAction ua=new UserAction();
			// ua.userlogin();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		
	}

}

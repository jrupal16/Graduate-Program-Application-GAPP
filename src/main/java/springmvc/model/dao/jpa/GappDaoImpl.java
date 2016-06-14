package springmvc.model.dao.jpa;


import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import springmvc.model.AcademicRecords;
import springmvc.model.AdditionalInfo;
import springmvc.model.Application;
import springmvc.model.ApplicationStatus;
import springmvc.model.Department;
import springmvc.model.Programs;
import springmvc.model.StudentDegree;
import springmvc.model.StudentInfo;
import springmvc.model.Usersinfo;
import springmvc.model.dao.GappDao;

@Repository
public class GappDaoImpl implements GappDao{
	
	  @PersistenceContext
	    private EntityManager entityManager;
	  
	  
	  
	  @Override
	    @Transactional
	    public Usersinfo saveUsersInfo( Usersinfo usersinfo )
	    {

	        return entityManager.merge( usersinfo );
	    }
	  
	  
	  @Transactional
	  public Department department( Department depar )
	    {

	        return entityManager.merge(depar);
	    }
	  

	  
	  @Override
	    public Department getDep( Integer id )
	    {
	        return entityManager.find( Department.class, id );
	    }

	  
	  
	  @Override
	    public List<Usersinfo> getLogin( String email, String password )
	    {
	        return entityManager.createQuery(
	            "select user from Usersinfo user where user.email=:email and user.password=:password ", Usersinfo.class )
	            .setParameter( "email", email )
	            .setParameter( "password", password )
	            .getResultList();
	    }
		// for validation
	  
	  
		@Override
		public List<Usersinfo> emailCheck() {
			
			return entityManager.createQuery("from Usersinfo", Usersinfo.class).getResultList();
		}
       
		//for dept list
		
		@Override
		public List<Department> getDepartment(){
			
	        return entityManager.createQuery("from Department order by id", Department.class)
	        		.getResultList();
	
		}
		
	
		@Override
		public Department getDeptDetails() {
			// TODO Auto-generated method stub
			return entityManager.createQuery("from Department order by id" , Department.class)
		            .getSingleResult();
		}
		
		
		@Override
	    @Transactional
		public Programs programs(Programs prog) {
			// TODO Auto-generated method stub
			
	        return entityManager.merge(prog);
		}
		
		
		@Override
	    @Transactional
       public AdditionalInfo additionalinfo(AdditionalInfo depar) {
			// TODO Auto-generated method stub
			return entityManager.merge(depar);
		}
		
		
		@Override
		public Programs getProgram(int id) {
			return entityManager.find(Programs.class, id);
		}
		
		
		@Override
		@Transactional
		public void removeProgram(int id) {
			
			entityManager.remove(getProgram(id));
			
		}
		
		@Override
		public AdditionalInfo getInfo(int id) {
			return entityManager.find(AdditionalInfo.class, id);
		}
		@Override
		@Transactional
		public void removeInfo(int id) {
			
			entityManager.remove(getInfo(id));
			
		}


		@Override
		public List<Application> getApp(int sinfo_id) {
			// TODO Auto-generated method stub
			 return entityManager.createQuery("from Application where uinfo.id=:sinfo_id",Application.class).setParameter("sinfo_id", sinfo_id).getResultList();		}


		@Override
		public Application getDetail(Integer id) {
			// TODO Auto-generated method stub
        return entityManager.find( Application.class, id );

		}


		@Override
		public List<Programs> getProgByDeptName(String name) {
			// TODO Auto-generated method stub
			return entityManager.createQuery("from Programs where dept.name=:name",Programs.class).setParameter("name", name).getResultList();
		}


		@Override
	    @Transactional
		public StudentInfo saveStudentInfo(StudentInfo stud) {
			// TODO Auto-generated method stub
			return entityManager.merge( stud );
		}


		@Override
	    @Transactional
		public Application saveApplication(Application app) {
			// TODO Auto-generated method stub
			return entityManager.merge( app );
		}


		@Override
	    @Transactional
		public StudentDegree saveStudentDegree(StudentDegree degree) {
			// TODO Auto-generated method stub
			return entityManager.merge( degree );
		}


		@Override
	    @Transactional
		public AcademicRecords saveAcademicRecords(AcademicRecords record) {
			// TODO Auto-generated method stub
			return entityManager.merge( record );
		}


		@Override
	    @Transactional
		public ApplicationStatus saveApplicationStatus(ApplicationStatus statu) {
			// TODO Auto-generated method stub
			return entityManager.merge( statu );
		}


		@Override
		public List<Programs> getProgList() {
			
			return entityManager.createQuery("from Programs", Programs.class).getResultList();
		}


		@Override
		public Usersinfo getbyid(Integer id) {
			// TODO Auto-generated method stub
			return entityManager.find( Usersinfo.class, id );
		}


		@Override
		public Application getbyaid(Integer id) {
			// TODO Auto-generated method stub
			return entityManager.find( Application.class, id );
		}


		@Override
		public StudentInfo getbysid(Integer id) {
			// TODO Auto-generated method stub
			return entityManager.find( StudentInfo.class, id );
		}


		@Override
		public Programs getprogbyname(String name) {
			// TODO Auto-generated method stub
			return entityManager.createQuery("from Programs where programs=:name", Programs.class).setParameter("name", name).getSingleResult();
					
		}


		@Override
		public Department getdeptbyname(String name) {
			// TODO Auto-generated method stub
			return entityManager.createQuery("from Department where name=:name ", Department.class).setParameter("name", name).getSingleResult();
		}


		@Override
		public List<Application> getappprog(Integer id1) {
			// TODO Auto-generated method stub
			return entityManager.createQuery("from Application where program.id=:id", Application.class).setParameter("id", id1).getResultList();
		}


		


	


		@Override
		public StudentDegree getStudentDegree(int id) { 
			// TODO Auto-generated method stub
			return entityManager.find(StudentDegree.class, id);
		}

		@Override
		@Transactional
		public void removeDegree(StudentDegree degree) {
			// TODO Auto-generated method stub
			entityManager.remove(degree); 

		}


		


	

		
 
	
}
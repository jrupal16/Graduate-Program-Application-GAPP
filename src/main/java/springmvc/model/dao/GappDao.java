package springmvc.model.dao;

import java.util.Date;
import java.util.List;

import springmvc.model.AcademicRecords;
import springmvc.model.AdditionalInfo;
import springmvc.model.Application;
import springmvc.model.ApplicationStatus;
import springmvc.model.Department;
import springmvc.model.Programs;
import springmvc.model.StudentDegree;
import springmvc.model.StudentInfo;
import springmvc.model.Usersinfo;

public interface GappDao {

    Department getDep( Integer id );
    
    List<Department> getDepartment( );

	Usersinfo saveUsersInfo( Usersinfo usersinfo );
	
	List<Usersinfo> getLogin(String email, String password);
    
	List<Usersinfo> emailCheck();
	
	Department getDeptDetails();
	
	Department department( Department depar );
	
	Programs programs(Programs prog);
	
	AdditionalInfo additionalinfo(AdditionalInfo info);
    
	Programs getProgram(int id);
	
	void removeProgram(int id);
	
	AdditionalInfo getInfo(int id);
	
	void removeInfo(int id);
	
	
	//Homework 5
	
	List<Application> getApp(int sinfo_id);
	
	Application getDetail(Integer id);
	
	List<Programs> getProgByDeptName(String name);
	
	StudentInfo saveStudentInfo( StudentInfo stud );

    Application saveApplication(Application app);
    
    StudentDegree saveStudentDegree(StudentDegree degree); 
    
    AcademicRecords saveAcademicRecords(AcademicRecords record);
    
    ApplicationStatus saveApplicationStatus(ApplicationStatus statu);
    
    List<Programs> getProgList();
    
    Usersinfo getbyid (Integer id);
    
    Application getbyaid (Integer id);
    
    StudentInfo getbysid(Integer id);
    
    Programs getprogbyname (String name); 
    
    Department getdeptbyname(String name);
    
    List<Application> getappprog(Integer id1);
    
    
    StudentDegree getStudentDegree(int id);
    
	void removeDegree(StudentDegree degree);

}

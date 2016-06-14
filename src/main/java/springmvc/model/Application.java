package springmvc.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "application")
public class Application implements Serializable{
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue
    private Integer id;
	
	    
    private String term;
     
    @ManyToOne
	StudentInfo sinfo;
    
    @OneToMany(mappedBy="app")
   	private List<StudentDegree> degree;
    
    @ManyToOne
    AcademicRecords records;
    
   @OneToOne
    ApplicationStatus appstatus;
   
   @ManyToOne
   Programs program;
   
   @ManyToOne
   Usersinfo uinfo;
  
   
    
	public Usersinfo getUinfo() {
	return uinfo;
}

public void setUinfo(Usersinfo uinfo) {
	this.uinfo = uinfo;
}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}


	

	

	

	

	public StudentInfo getSinfo() {
		return sinfo;
	}

	public void setSinfo(StudentInfo sinfo) {
		this.sinfo = sinfo;
	}




	public List<StudentDegree> getDegree() {
		return degree;
	}

	public void setDegree(List<StudentDegree> degree) {
		this.degree = degree;
	}

	public Programs getProgram() {
		return program;
	}

	public void setProgram(Programs program) {
		this.program = program;
	}

	

	public AcademicRecords getRecords() {
		return records;
	}

	public void setRecords(AcademicRecords records) {
		this.records = records;
	}



	public ApplicationStatus getAppstatus() {
		return appstatus;
	}

	public void setAppstatus(ApplicationStatus appstatus) {
		this.appstatus = appstatus;
	}
    	
	
	
}

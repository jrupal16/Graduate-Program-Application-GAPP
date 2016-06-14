package springmvc.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "studentdegree")
public class StudentDegree implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private int id;
	
	private String universityname,timeperiod,degreeearned,field;
	
	@ManyToOne
	private Application app;
	





	public Application getApp() {
		return app;
	}

	public void setApp(Application app) {
		this.app = app;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUniversityname() {
		return universityname;
	}

	public void setUniversityname(String universityname) {
		this.universityname = universityname;
	}

	public String getTimeperiod() {
		return timeperiod;
	}

	public void setTimeperiod(String timeperiod) {
		this.timeperiod = timeperiod;
	}

	public String getDegreeearned() {
		return degreeearned;
	}

	public void setDegreeearned(String degreeearned) {
		this.degreeearned = degreeearned;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	
	
	

}

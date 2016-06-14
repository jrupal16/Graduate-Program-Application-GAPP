package springmvc.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "academicrecords")
public class AcademicRecords implements Serializable{
	
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	
    private Integer id;
	
	private Integer toefl,gre;
	
	private Double gpa;
	
	@Column(name = "trans")
	private String transcript;
	
		
	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getToefl() {
		return toefl;
	}

	public void setToefl(Integer toefl) {
		this.toefl = toefl;
	}

	public Integer getGre() {
		return gre;
	}

	public void setGre(Integer gre) {
		this.gre = gre;
	}

	

	public Double getGpa() {
		return gpa;
	}

	public void setGpa(Double gpa) {
		this.gpa = gpa;
	}

	public String getTranscript() {
		return transcript;
	}

	public void setTranscript(String transcript) {
		this.transcript = transcript;
	}

	

	
	
	
}

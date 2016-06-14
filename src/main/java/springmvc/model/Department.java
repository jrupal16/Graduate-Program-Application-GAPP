package springmvc.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "department")
public class Department implements Serializable {

	

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue
    private Integer id;
	
	private String name;
 
    @OneToMany(mappedBy="dept")
	private List<Programs>prog;
    
    @OneToMany(mappedBy="depart")
   	private List<AdditionalInfo>depar;
    
   
    
    public List<AdditionalInfo> getDepar() {
		return depar;
	}

	public void setDepar(List<AdditionalInfo> depar) {
		this.depar = depar;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

    
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	 public List<Programs> getProg() {
			return prog;
		}

		public void setProg(List<Programs> prog) {
			this.prog = prog;
		}


		

		
}
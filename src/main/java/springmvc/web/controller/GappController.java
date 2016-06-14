package springmvc.web.controller;



import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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

@Controller
public class GappController {
	
	@Autowired
    private GappDao stu;
	
	@Autowired
	private ServletContext context;
	
    // Registration controller 
    @RequestMapping(value = "/Registration.html", method = RequestMethod.GET)
    public String Registration(ModelMap model)
    {

    	model.put("usersinfo", new Usersinfo());
        return "Registration";
    }
  
    @RequestMapping(value = "/Registration.html", method = RequestMethod.POST)
    public String Registration(@ModelAttribute Usersinfo us, BindingResult re, ModelMap models,@RequestParam String email,@RequestParam String password,@RequestParam String fname,@RequestParam String lname )
    {
	  
     List<Usersinfo> email1=stu.emailCheck();
	   String email2=email;
	   String error=null;
	   for(Usersinfo user1:email1)
		   if(user1.getEmail().equalsIgnoreCase(email2))
		   {
			   error = "matched.!";
			   models.put("error",error);
			   models.put("email",email);
			   return "redirect:Registration.html";
		   }
   	   
   	
   	   	
	   
            Usersinfo usersinfo = new Usersinfo();
            usersinfo.setEmail(email);
            usersinfo.setPassword(password);
            usersinfo.setFname(fname);
            usersinfo.setLname(lname);
            usersinfo.setType("Student");
            usersinfo.setRole("Apply for Program");
            //save to database
            usersinfo = stu.saveUsersInfo(usersinfo); 
        
        //redirect
       return "redirect:Login.html";
    }
    
   
    
    
   // Login Controller 
   @RequestMapping(value = {"index.html"," Login.html"}, method = RequestMethod.GET)
   public String Login()
   {

       return "Login";
   }

   @RequestMapping(value = "Login.html", method = RequestMethod.POST)
   public String User(@RequestParam String email, @RequestParam String password, ModelMap model,HttpSession session){
   	
   	List<Usersinfo> usersinfo= stu.getLogin(email, password);
        
   	    String administrator="Administrator";
   	    String staff="Staff";
   	    String student="Student";
   	   
   	     for(Usersinfo user1:usersinfo )
   	     {
   	    	 String emailid=user1.getEmail();
   	    	 String pass=user1.getPassword();
   	    	 if(emailid.equals(email) && pass.equals(password))
   	    	 {
   	    		 
   	    		 if (user1.getType().contains(administrator)){
                      return "Administrator";
   	    		 }
   	    		 else if (user1.getType().contains(staff)){
                      return "redirect:Staff.html";
   	    		 }
   	    		 else if (user1.getType().contains(student)) {
   	    			 session.setAttribute("useris",user1);
   	    			 return "redirect:Student.html?user_id="+user1.getId();
   	    		 }	
   	    	 }
   		}
	     return "redirect:Failed.html";

   }
   @RequestMapping(value="Adminstrator.html",method=RequestMethod.GET)
   public String Administrator()
   {
	   return "Administrator.html";
   }
   @RequestMapping("/Admin.html" )
   public String Admin(ModelMap models)
   {
       models.put( "department", stu.getDepartment());
	   return "Admin";
   }
   @RequestMapping("/Staff.html")
   public String Staff()
   {
	   return "Staff";
   }
   @RequestMapping("/Student.html")
   public String Student(ModelMap models,HttpSession session)
   {	
	   Usersinfo useris=(Usersinfo) session.getAttribute("useris");
	   List<Application> appl=stu.getApp(useris.getId());
	   for(Application ap:appl){
		   System.out.println(ap.getTerm());
	   }
	   models.put("application",stu.getApp(useris.getId()));
	   return "Student";
   }
   @RequestMapping("/Failed.html")
   public String Failed()
   {
	   return "Failed";
   }

  // Department Detail
   @RequestMapping("/DeptDetail/{id}.html")
   public String department(ModelMap models,@PathVariable Integer id)
   {
       models.put( "DepartmentDetail", stu.getDep( id ) );
       return "DeptDetail";
   }
   @RequestMapping("/Detail.html")
   public String appli(ModelMap models,@RequestParam Integer app_Id)
   {
       models.put( "ApplicationDetail", stu.getDetail( app_Id ) );
       return "Detail";
   }
   
  //add department controller
   @RequestMapping(value = "/AddDept.html", method = RequestMethod.GET)
   public String AddDept(ModelMap model)
   {
   	
       return "AddDept";
   }
@RequestMapping(value = " AddDept.html", method = RequestMethod.POST)
   public String add(ModelMap models,@RequestParam String department )
   {
	   
	   Department depart=new Department();
	   depart.setName(department);
	   depart=stu.department(depart);
       return "redirect:AddProg.html?deptId="+depart.getId();
   }

                         //Edit Department controller

@RequestMapping(value = "EditDept.html", method = RequestMethod.GET)
public String EditDept(ModelMap models,@RequestParam Integer deptId)
{
		models.put("department",stu.getDep(deptId));
		return "EditDept";
}
@RequestMapping(value = " EditDept.html", method = RequestMethod.POST)
public String Edit(@RequestParam String deptName, ModelMap models,@RequestParam Integer deptId)
{
	   
	   Department d=stu.getDep(deptId);
	   d.setName(deptName);
	   d=stu.department(d);
	   return "redirect:EditProg.html?deptId="+d.getId();
}
   
    // Edit Program controller
  
   	@RequestMapping(value = " EditProg.html", method = RequestMethod.GET)
   	public String EditProg(@RequestParam Integer deptId ,ModelMap models)
   	{   
	  
          models.put("dep", stu.getDep(deptId));
          return "EditProg";
   	}
    @RequestMapping(value = " EditProg.html", method = RequestMethod.POST)
    public String editprog1(@RequestParam Integer deptId , @RequestParam String programs, ModelMap models,@RequestParam String pname)
    {   
 	      Department d = stu.getDep(deptId);
 	      Programs p = new Programs();
 	      p.setPrograms(programs);
 	      p.setDept(d);
 	      p = stu.programs(p);
 	      d.getProg().add(p);
 	      stu.department(d);
 	      return "redirect:EditProg.html?deptId="+d.getId();
   }
    
    // Edit Aditional Information controller
    
    @RequestMapping(value = " EditInfo.html", method = RequestMethod.GET)
    public String editinfo(@RequestParam Integer deptId ,ModelMap models)
    {   
 	      models.put("depart", stu.getDep(deptId));
 	      return "EditInfo";
   }

  
   
   @RequestMapping(value = " EditInfo.html", method = RequestMethod.POST)
   public String editinfo1(@RequestParam Integer deptId ,@RequestParam String fieldname,@RequestParam String typefieldvalue,@RequestParam String requirement, ModelMap models)
   {   
          Department d = stu.getDep(deptId);
 	      AdditionalInfo a = new AdditionalInfo();
 	      a.setFieldname(fieldname);
 	      a.setTypefieldvalue(typefieldvalue);
 	      a.setRequirement(requirement);
 	      a.setDepart(d);
 	      a = stu.additionalinfo(a);
          d.getDepar().add(a);
 	      stu.department(d);
          return "redirect:EditInfo.html?deptId="+d.getId();
  }
   
   // Add Program controller
   
   @RequestMapping(value = " AddProg.html", method = RequestMethod.GET)
   public String addprog(ModelMap models,@RequestParam Integer deptId)
   {   
	   
	      models.put("dep", stu.getDep(deptId));
          return "AddProg";
  }
   @RequestMapping(value = " AddProg.html", method = RequestMethod.POST)
   public String addprog1(ModelMap models,@RequestParam Integer deptId , @RequestParam String programs )
   {   
	   	  //Get the dept object from the database
	      Department d = stu.getDep(deptId);
	      // create a new program object.
	      Programs p = new Programs();
	      //set the program name to the above object
	      p.setPrograms(programs);
	      //set the dept object to the above program object
	      p.setDept(d);
	      // Update the program table using EntityManager.merge method
	      p = stu.programs(p);
	      //Update the department with the new program 
	      d.getProg().add(p);
	      // update the department table using entityManager.merge method
	      stu.department(d);
          return "redirect:AddProg.html?deptId="+d.getId();
  }
   
   					//Add Additional Information controller
   
   @RequestMapping(value = " AddInfo.html", method = RequestMethod.GET)
   public String addinfo(@RequestParam Integer deptId ,ModelMap models)
   {   
	      models.put("depart", stu.getDep(deptId));
          return "AddInfo";
  }
   
   @RequestMapping(value = " AddInfo.html", method = RequestMethod.POST)
  public String addinfo1(ModelMap models,@RequestParam Integer deptId ,@RequestParam String fieldname,@RequestParam String typefieldvalue,@RequestParam String requirement)
  {   

	      Department d = stu.getDep(deptId);
	      AdditionalInfo a = new AdditionalInfo();
	      a.setFieldname(fieldname);
	      a.setTypefieldvalue(typefieldvalue);
	      a.setRequirement(requirement);
	      a.setDepart(d);
	      a = stu.additionalinfo(a);
	      d.getDepar().add(a);
	      stu.department(d);
	      return "redirect:AddInfo.html?deptId="+d.getId();
 }
   //DeleteDegree
   @RequestMapping("/DeleteDegree.html")
   public String deleteDegree(@RequestParam Integer degreeid,@RequestParam Integer appliid) {
	   StudentDegree ap = stu.getStudentDegree(degreeid);
	   
		   
	   
	   stu.removeDegree(ap);
	return "redirect:EditUpload.html?appid="+appliid;
	   
   }

   
   
   //Delete program controller  
   @RequestMapping("DeleteProgram.html")
   public String deleteProgram(@RequestParam Integer progId, @RequestParam Integer deptId) {
	  
	   List<Application> applist = stu.getappprog(progId);
	   for(Application apps:applist)
	   {
		   Integer ap = apps.getId();
		   Application app1=stu.getbyaid(ap);
		   Programs prog1 = app1.getProgram();
		   prog1 = null;
		   app1.setProgram(prog1);
		   app1 = stu.saveApplication(app1);
		   }
	   
	     stu.removeProgram(progId);
	     return "redirect:EditProg.html?deptId="+deptId;
	   
   }
   
   //Delete additional info controller
   
   @RequestMapping("DeleteInfo.html")
   public String deleteInfo(@RequestParam Integer infoId, @RequestParam Integer deptId) {
	   stu.removeInfo(infoId);
	return "redirect:EditInfo.html?deptId="+deptId;
	   
   }
   
   //Logout
   @RequestMapping("logout.html")
   private String log(HttpSession session)
   {
	   session.invalidate();
	   return "Login";
   }
   
   //upload
   private File getFileDirectory(){
	   
	   String path = context.getRealPath("WEB-INF/files");
	   return new File( path );
			    }
   
   
   
   
   
   
   
   
   @RequestMapping(value ="upload.html" , method = RequestMethod.GET)
   public String Addapp(ModelMap models)
   {
       models.put( "department", stu.getDepartment());
       return "upload";
   }
   
   @RequestMapping(value = "upload.html", method = RequestMethod.POST)
    public String upload(@RequestParam MultipartFile file,HttpSession session,@RequestParam Long cin,@RequestParam Long phone,@RequestParam String citizenship,@RequestParam String dob,@RequestParam String fname,@RequestParam String lname,@RequestParam String email,
    		@RequestParam String term,@RequestParam List<String> degreeearned,@RequestParam String deptname,@RequestParam String progname,@RequestParam Integer user_id,@RequestParam Integer student_id,@RequestParam String gender,@RequestParam List<String> timeperiod,@RequestParam List<String> field,@RequestParam List<String> universityname,@RequestParam Double gpa
    		,@RequestParam Integer gre,@RequestParam Integer toefl,@RequestParam String comment,@RequestParam(required=false,value="add")String add)
    throws IllegalStateException, IOException
    {
	   file.transferTo(new File(getFileDirectory(),file.getOriginalFilename()));
             Application apprecord = new Application();
             AcademicRecords reco=new AcademicRecords();
             String trans = file.getOriginalFilename();
             reco.setTranscript(trans);
          //   reco = stu.saveAcademicRecords(reco); 
             apprecord = stu.saveApplication(apprecord);
             System.out.println("2" +file.getOriginalFilename());

	   
	   //1
             
	   StudentInfo stud = new StudentInfo();
	   //
	   stud.setFname(fname);
	   stud.setLname(lname);
	   stud.setEmail(email);
	   stud.setCin(cin);
	   stud.setGender(gender);
	   stud.setCitizenship(citizenship);
	   stud.setDob(dob);
	   stud.setPhone(phone);
	   System.out.println("1");
	   //save to database
      stud = stu.saveStudentInfo(stud); 
//2
       
       // Application app = new Application();
        Usersinfo uinfo=(Usersinfo) session.getAttribute("useris");
        apprecord.setUinfo(uinfo);
       apprecord.setSinfo(stud);
       apprecord.setTerm(term);
//     
      
      Programs pro = stu.getprogbyname(progname);
      pro = stu.programs(pro);
      apprecord.setProgram(pro);
      
      Department dep = stu.getdeptbyname(deptname);
      dep.setName(deptname);
      dep = stu.department(dep);
      pro.setDept(dep);
      apprecord.setProgram(pro);
//3       
      List<StudentDegree> d2=new ArrayList<StudentDegree>();
      for(int i=0;i<degreeearned.size();i++){
      StudentDegree degree = new StudentDegree();
      degree.setDegreeearned(degreeearned.get(i));
      degree.setField(field.get(i));
      degree.setTimeperiod(timeperiod.get(i));
      degree.setUniversityname(universityname.get(i));
      apprecord = stu.saveApplication(apprecord);

      degree.setApp(apprecord);

      degree = stu.saveStudentDegree(degree);
      d2.add(degree);}
      apprecord.setDegree(d2);

      
//4      
      reco.setGpa(gpa);
      reco.setGre(gre);
      reco.setToefl(toefl);
      reco = stu.saveAcademicRecords(reco);

      apprecord.setRecords(reco);
 

      String Editable;
      System.out.println(add);
  	if(add!=null)
  	   {
  		   Editable="doEdit";
  		   
  	   }
  	   else
  	   {
  		   Editable="submit";
  	   }

//5      
      ApplicationStatus statu = new ApplicationStatus();
      statu.setComment(comment);
      Date d = new Date();
      statu.setRecordtime(d);
      statu.setValue(Editable);
      
      statu = stu.saveApplicationStatus(statu);
      apprecord.setAppstatus(statu);
      apprecord = stu.saveApplication(apprecord);
    //6
      
	   return "redirect:Student.html";

    }
   
   @RequestMapping(value = "up.html", method = RequestMethod.POST)
   public String up(@RequestParam String dname,HttpServletResponse response) throws IOException{
	   JSONArray list=new JSONArray();
	   	System.out.println(dname);
	      List<Programs> plist = stu.getProgByDeptName(dname);
	      HashMap<String,String> map=new HashMap<String,String>();
	      for(Programs p:plist){
	    	map.put("pname", p.getPrograms());
	    	list.put(map); 
	      }
	     
	     response.setContentType( "application/json" );
	     list.write( response.getWriter() );
	      return null;
	   
	   
   } 
   @RequestMapping(value = "download.html")
   public String download(HttpServletResponse response,@RequestParam Integer app_Id) throws IOException
   {
	   Application app1=stu.getbyaid(app_Id);
	   String file=app1.getRecords().getTranscript();
	   //response.setContentType( "text/plain/jpg" );
       response.setHeader( "Content-Disposition",
           "inline; filename="+file );
       System.out.println(file);
       //read in the file
       FileInputStream in = new FileInputStream( new File(getFileDirectory(), file) );
       OutputStream out = response.getOutputStream();
   
	   //write it to response
       byte buffer[] = new byte[2048];
       int bytesRead;
       while( (bytesRead = in.read( buffer )) > 0 )
           out.write( buffer, 0, bytesRead );

       in.close();
       
       return null;
       
   }
   
   @RequestMapping(value = " EditUpload.html", method = RequestMethod.GET)
   public String Editapp(@RequestParam Integer appid,ModelMap models)
   {   
	   Application app=stu.getbyaid(appid);
	   List<Programs> programs=app.getProgram().getDept().getProg();
		models.put("application",app);
		models.put("programs", programs);
		return "EditUpload";
  }
   @RequestMapping(value = " EditUpload.html", method = RequestMethod.POST)
   public String Editap(@RequestParam MultipartFile file,@RequestParam Integer appliid,@RequestParam String fname,@RequestParam String lname,@RequestParam String email,
		  @RequestParam String citizenship,@RequestParam Long cin,@RequestParam Long phone,
		  @RequestParam String term,@RequestParam String prog2,@RequestParam String dob,@RequestParam(required=false)String add,
		  @RequestParam(required=false) List<String> degreeearned,@RequestParam(required=false) List<String> universityname,@RequestParam(required=false) List<String> field,@RequestParam(required=false) List<String> timeperiod,
		  @RequestParam Double gpa, @RequestParam Integer gre,@RequestParam Integer toefl, @RequestParam String comment)throws IllegalStateException, IOException
   {      
	   
	   String Editable;
	if(add!=null)
	   {
		   Editable="doEdit";
		   

	   }
	   else
	   {
		   Editable="submit";
		   

	   }
	    Application appli = stu.getbyaid(appliid);
	    StudentInfo stu1=appli.getSinfo();
	    stu1.setFname(fname);
	    stu1.setLname(lname);
	    stu1.setEmail(email);
	    stu1.setCin(cin);
	    stu1.setCitizenship(citizenship);
	    stu1.setPhone(phone);
	    stu1.setDob(dob);
	    stu1 = stu.saveStudentInfo(stu1);
	    appli = stu.saveApplication(appli);
	    
	    appli.setTerm(term);
	    appli = stu.saveApplication(appli);
	    file.transferTo(new File(getFileDirectory(),file.getOriginalFilename()));
	       AcademicRecords reco = appli.getRecords();
	       String trans = file.getOriginalFilename();
	       reco.setTranscript(trans);
	       reco = stu.saveAcademicRecords(reco);
	       appli = stu.saveApplication(appli);
	    
	    Programs prog1 = stu.getprogbyname(prog2);
	    prog1.setPrograms(prog2);
	    prog1 = stu.programs(prog1);
        appli.setProgram(prog1);	    
		  System.out.println("101");

	  List<StudentDegree> sd1= new ArrayList<StudentDegree>();  
	  List<StudentDegree> degreeList=appli.getDegree();
	  	for(StudentDegree dgr:degreeList){
	  		stu.removeDegree(dgr);
	  	}
	  if(degreeearned!=null)
	  {
	  for(int i=0;i<degreeearned.size();i++){
		  String degreeearned1=degreeearned.get(i);
		  String universityname1=universityname.get(i);
		  String field1=field.get(i);
		  String timeperiod1=timeperiod.get(i);
		  StudentDegree toAdd=new StudentDegree();
		  toAdd.setDegreeearned(degreeearned1);
		  toAdd.setUniversityname(universityname1);
		  toAdd.setField(field1);
		  toAdd.setTimeperiod(timeperiod1);
		  toAdd.setApp(appli);
		  stu.saveStudentDegree(toAdd);
		  sd1.add(toAdd);
		  
	  	}
	  }
	  
	
	  	appli.setDegree(sd1);
	    appli = stu.saveApplication(appli);
	    
	    AcademicRecords ar1 = appli.getRecords();
	    ar1.setGpa(gpa);
	    ar1.setGre(gre);
	    ar1.setToefl(toefl);
	    ar1 = stu.saveAcademicRecords(ar1);
	    appli = stu.saveApplication(appli);
	    
	    ApplicationStatus as1 = appli.getAppstatus();
	    as1.setComment(comment);
	    as1.setValue(Editable);
	    as1 = stu.saveApplicationStatus(as1);
	    appli = stu.saveApplication(appli);
	    
	   
   	   return "redirect:Student.html";
   }
   
   
   
 }
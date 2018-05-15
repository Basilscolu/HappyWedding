<%-- 
    Document   : Religion
    Created on : 15 Aug, 2017, 2:45:55 PM
    Author     : basilscolu
--%>
<%@include file="header.jsp" %>
<!DOCTYPE html>

<%@page import="javafx.scene.control.Alert"%>
<%@page import="java.util.Random"%>
 <%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>

    <!-------JSP code-->
    <%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<jsp:useBean class="db.mailconnection" id="Mobj"></jsp:useBean>


<%
   if(request.getParameter("btn_loginsubmit")!=null)
   {
       
        String s1,s2;
        s1=request.getParameter("txt_username");
        s2=request.getParameter("txt_password");
        ResultSet rs=obj.selectData("select * from tbl_login where user_id='"+s1+"' or email='"+s1+"' and password='"+s2+"'");
        
    
        if(rs.next())
                  {
                      session.setAttribute("useridentity",rs.getString("user_id"));
                      if(rs.getString("reg2").contentEquals("N"))
                     {
                        response.sendRedirect("registration2.jsp");
                      
                     }
                     else if(rs.getString("reg3").contentEquals("N"))
                     {
                         response.sendRedirect("registration3.jsp");
                     }
                      else if(rs.getString("PartnerPref").contentEquals("N"))
                     {
                         response.sendRedirect("PartnerPref1.jsp");
                     }
                      else
                      {
                          response.sendRedirect("Homepage.jsp");
                      }
                      
                  }
             
            
   }
   
   
   
   
   
   
   
   if(request.getParameter("btn_regfree")!=null)
   {
      String name=request.getParameter("txt_name");
      Random rand = new Random();
       int n = rand.nextInt(90000) + 10000;
 String userid=(String.valueOf(name.charAt(0))).toUpperCase()+n+(String.valueOf(name.charAt(2))).toUpperCase();
                
        session.setAttribute("useridentity",userid);
        
        
       
        
       
       
       String profilefor="",gender="",dob="", cast_id="",country="",phone_no="",religion_id="",email="",password="";
        profilefor=request.getParameter("profilefor_sel");
        gender=request.getParameter("gender");
        dob=request.getParameter("date_dob");
         religion_id=request.getParameter("religionSel");
         cast_id=request.getParameter("castsel");
         country=request.getParameter("CountrySel");
         phone_no=request.getParameter("Countrycode")+request.getParameter("txt_phoneno");
         email=request.getParameter("txt_email");
          password=request.getParameter("txt_password");
          //int age=0;
          %>
          <!--Age Calculating-->
          <%
           //String dob = "1986-06-24"; (YYYY-MM-DD)

          
            //String dob = "1995-11-27"; //(YYYY-MM-DD)

            int yearDOB = Integer.parseInt(dob.substring(0, 4));
            int monthDOB = Integer.parseInt(dob.substring(5, 7));
            int dayDOB = Integer.parseInt(dob.substring(8, 10));

            DateFormat dateFormat = new SimpleDateFormat("yyyy");
            java.util.Date date = new java.util.Date();
            int thisYear = Integer.parseInt(dateFormat.format(date));

            dateFormat = new SimpleDateFormat("MM");
            date = new java.util.Date();
            int thisMonth = Integer.parseInt(dateFormat.format(date));

            dateFormat = new SimpleDateFormat("dd");
            date = new java.util.Date();
            int thisDay = Integer.parseInt(dateFormat.format(date));

            int age = thisYear - yearDOB;

            if (thisMonth < monthDOB) {
                age = age - 1; 
        }

          if (thisMonth == monthDOB && thisDay < dayDOB) {
                age = age - 1;
        }
            


      
          
          %>
          <%
        Boolean A= obj.executeCommand("insert into tbl_registration(user_id,profilefor_id,gender,dob,rel_id,castid,country,phone_no,Name,Age) values('"+userid+"','"+profilefor+"','"+gender+"','"+dob+"','"+religion_id+"','"+cast_id+"','"+country+"','"+phone_no+"','"+name+"','"+age+"')");
      if(A)
              {
         Boolean b=obj.executeCommand("insert into tbl_login(user_id,email,password,reg2,reg3) values('"+userid+"','"+email+"','"+password+"','N','N')");
        if(b)
        {
            Random rand1 = new Random();
       int code1 = rand1.nextInt(900) + 100; 
        int code2 = rand1.nextInt(900) + 100;
        String code=code1+"-"+code2;
Boolean Bb=obj.executeCommand("insert INTO tbl_emailvarification (user_id,var_cod) values('"+userid+"','"+code+"')");
            
          
         
            
            
            String []to={email};
            
        Boolean bb=  Mobj.sendMail(to, "Welcome To Happy Wedding Matrimonial ","Hi... "+name.toUpperCase()+" ,Access Your Happy Wedding Account using Username :"+userid+"/"+email+" and Password :"+password);
       if(bb)
       {
           response.sendRedirect("registration2.jsp");
          // Mobj.sendMail(to, "Email Varification", "Your Email Varification Code :"+code+" enter your code to varify your account");
       }
                    //['"+email+"'], subject, text)"Varify Email","'"+userid+"'");
        }
    //  else
      //  {
       
        //}
 
              }
   }
   
%>
    <!-----------jsp code end here---->
<html>
<head>
<title>Matrimony > MalayalieMarriage > Register FREE!</title>
<meta name="viewport" content="width=device-width, initial-scale=1">


<!--CSS code-->
<link href="UserCss/reg1css.css" rel="stylesheet" type="text/css">
</head>
<body>

 
    
    
    
                                       
       
         
                                                

     
                                                
                                                 
 
    
 						<!-- Register Form - Start -->
                                                
                                   
                                                <form  method="post" name="MatriForm" onsubmit="return validateForm();" style="width: 1800px;height:1000px" class="FormImage">
                                                   
                                                    
           <div class="modalAboutMe"  id="modalChangePassword" style="margin-left: 800px;" >
                 <table id="myTable1"  >
                         <tr>
                             <th > <span style="color: #fff;font-size: 20px;">Change Password</span> </th><th><label style="padding-left: 200px; cursor: pointer;font-size: 20px;" id="PasswordClose"> &times;</label> </th>
                         </tr>
                 </table>
               <table style="margin-top: 40px;">
                   <tr>
                       <td>
                           <label class="Mylabel" >UserName </label></td><td>
                           <input class="MytxtBox" type="text" placeholder="Username" name="txt_username" id="Cuser"></td>
               </tr>
               <tr>
                   <td>
               <label class="Mylabel">Password </label>
                   </td>
                   <td>               <input  class="MytxtBox" type="password" placeholder="Password" name="txt_pass" id="Cpass">
</td>
               </tr>
               </table>
               <button class="MySaveBtn" name="Btn_save" onclick="changePassworajax()" >Next !!</button>
                
            </div>
                                                    
                                                    
                                                    
                                                    
                                                    
	         
	
     <div class="Happywedding_registerform_details">
     <div class="registerhead" style="float:left"><span class="regHead">Register FREE</span>
                                                              </div>          
     
     <table >
                         <tr><td><div class="bengali_innerregisterform_new">Profile For</div></td><td><div class="bengali_innerregisterform_new">
                                
                                     <select class="select-arw" onchange="getLname(this.value)" name="profilefor_sel" required=""><option value="">--select--</option>
                                          <%  ResultSet rs=obj.selectData("select * from tbl_profilefor");
                                 while(rs.next())
                                 {
                                     
                                 
                                   %>
                                   <option value="<%=rs.getString("profilefor_id")%>">
                                       <%=rs.getString("profile_name")%>
                                   </option><%}%>
                                     </select></div></td>
                         </tr>
                         <tr><td><div class="bengali_innerregisterform_new" id="lname"><label name="lname">Name</label></div></td><td><div class="bengali_innerregisterform_new"><input type="text" class="regtxtbox" placeholder="enter name" name="txt_name" required=""></div></td>
                         </tr>
                         <tr><td class="bengali_innerregisterform_new">Gender</td>
                             <td><div class="bengali_innerregisterform_new"> <input type="radio" name="gender" id="radioGender1" value="male" required="" ><label for="radioGender1" class="regcheck" style="margin-right:20px ">male </label>
                                    <input type="radio" name="gender" value="female" id="radioGender2" required=""><label for="radioGender2" class="regcheck">female</label></div></td>
                             
                         </tr>
                         <tr>
                             <td>
                                 <div class="bengali_innerregisterform_new">Date of Birth</div> </td><td><div class="bengali_innerregisterform_new"><input type="date" name="date_dob" class="regtxtbox" required=""></div></td>
                         </tr>
                         
                         <!--religion -->
                         <tr><td><div class="bengali_innerregisterform_new">Religion</div></td><td><div class="bengali_innerregisterform_new"><select class="select-arw" name="religionSel" onchange="getDist(this.value)" required=""><option>--select--</option> 
                                         
                                          <%  ResultSet rsreligion=obj.selectData("select * from tbl_religion");
                                 while(rsreligion.next())
                                 {
                                     
                                 
                                   %>
                                         
                                         
                                   <option value="<%=rsreligion.getString("religion_id") %>"><%=rsreligion.getString("religion_name") %></option>
                                     
                                     <%  
                                             }
                                              %> 
                                     
                                     </select></div></td>
                                         
                                              
                                         
                         </tr>
                         <!--cast/division-->
                         <tr><td><div class="bengali_innerregisterform_new">cast / division</div></td><td><div class="bengali_innerregisterform_new"><select class="select-arw" name="castsel" id="cast" required=""><option>--Select--</option></select></div></td>
                         </tr>
                         <!--Coutry living-->
                         <tr><td><div class="bengali_innerregisterform_new">Country Living</div></td><td><div class="bengali_innerregisterform_new"><select class="select-arw" name="CountrySel" required=""><option>--select--</option>>
                                         <%
                                 ResultSet rsCountry=obj.selectData("select * from tbl_country");
                                 while(rsCountry.next())
                                 {
                                 %>
                                         
                                         
                                 <option value="<%=rsCountry.getString("c_id")%>" style="color:#004F00"><%=rsCountry.getString("country")%></option>
                                 <%
                                 }
                                 %>
                          </select></div></td>
                         </tr>
                         <!--mobile n0-->
                        <tr><td><div class="bengali_innerregisterform_new">Phone No</div> </td>
                            <td><div class="bengali_innerregisterform_new"><select class="inputcon" name="Countrycode"  style="width: 81px;margin-right:10px;" required=""><option selected="" value="0">Country</option>
                                        <%
                                 ResultSet rsCcode=obj.selectData("select * from tbl_country");
                                 while(rsCcode.next())
                                 {
                                 %>
                                    
                                                                  <option value="<%=rsCcode.getString("c_id")%>" style="color:#004F00"><%=rsCcode.getString("c_code")%></option>

                                 <%
                                 }
                                 %>
                                    </select><input type="text" class="regtxtbox" placeholder="Mobile no" name="txt_phoneno" style=" width: 145px;" maxlength="12"></div></td>
                         </tr> 
                         <!--email-->
                         
                         <tr><td><div class="bengali_innerregisterform_new">E-Mail</div></td><td><div class="bengali_innerregisterform_new"><input type="email" class="regtxtbox" placeholder="Enter Email" name="txt_email" required=""  onchange="myf(this.value)" id="myemail"pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$"  ></div></td>
                         </tr>
                         <!--password-->
                         <tr><td><div class="bengali_innerregisterform_new">Password</div></td><td><div class="bengali_innerregisterform_new"><input type="password" class="regtxtbox" placeholder="Enter Password" name="txt_password" required="" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"  ></div></td>
                         </tr>
                         <!--register free button-->
                         <tr><td><div class="bengali_innerregisterform_new"></div></td><td> <div class="bengali_innerregisterform_new"><button class="button"  name="btn_regfree"><span>REGISTER FREE ! </span></button></div><br clear="all"></td>
                         </tr>
                     </table>
                                     <div class="bengali_campaignbottomernew">by choosing to continue you agree our<br><a href="#">Terms & Condition</a>and<a href="#">Privacy Policy</a></div>                              
               
     </div>       
 </form>
                                      
                                                    
                                                
                                     
                                     

                                     
                                    
                                    
      
</body>

<!--script-->
<script src="MyJavaScript/jquery.min.js" type="text/javascript"></script>
 <script src="MyJavaScript/Registration1js.js"></script>
 <script>function myf(d)
{
 $.ajax({url:"Ajax_mailVarification.jsp?email="+d, 
         success: function(result){
           var em= document.getElementById("myemail");
 
      var res=$.trim(result);
      if(res=="False")
      {
          alert("Email Is Alreday Registered..!");
     em.value="";
     em.focus();
      }
     
    
    }});
    }
    
</script>


</html>

<%-- 
    Document   : RtOfficer Registration
    Created on : 28 Feb, 2018, 6:52:13 PM
    Author     : basilscolu
--%>


<%@page import="java.util.Random"%>
<%@page import="java.sql.ResultSet"%>
<a href="User Registration.jsp"></a>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>

<%@include file="header.jsp" %> 
<%
if(request.getParameter("btn_loginsubmit")!=null)
   {
       
        String s1,s2;
        s1=request.getParameter("txt_username");
        s2=request.getParameter("txt_password");
        ResultSet rs=obj.selectData("select * from tbl_userregistration where UserId='"+s1+"' or Email='"+s1+"' and Password='"+s2+"'");
        
    
        if(rs.next())
                  {
                       session.setAttribute("userId", rs.getString("UserId"));
                       response.sendRedirect("Homepage.jsp");
                  }
        else
        {
            ResultSet rsa=obj.selectData("select * from tbl_rtofficer where RtoId='"+s1+"' or emaiId='"+s1+"' and password='"+s2+"'");
            if(rsa.next())
            {
                  session.setAttribute("RTO", rsa.getString("RtoId"));
                  response.sendRedirect("../RTOfficer/HomePage.jsp");
            }
        }
             
            
   }
   %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        
    </head>
    <body>
       
       
        <form action="FileUploadAction.jsp" method="post" enctype="multipart/form-data">       
           
		
           
    
           
       

           
            <div  class="Malyali_registerform_details"> 
        <!------------personal section------>
        <br><br><br>
        
        
                                                              
       
        <table  id="mytabLee" style="margin-top: 100px;">
            <!--marital status-->
       
             
            <tr>
                <td><span> Name :</span></td>
               <td>
                   <input type="text" name="txt_name">
            </td>
            
            </tr>
             <tr>
                <td><span>Email :</span></td>
               <td>
                   <input type="text" name="txt_email">
            </td>
            
            </tr>
            <tr>
                <td><span>Phone No :</span></td>
               <td>
                   <input type="text" name="txt_PhNo">
            </td>
            
            </tr>
              <tr><td class="bengali_innerregisterform_new">Gender</td>
                             <td><div class="bengali_innerregisterform_new"> <input type="radio" name="gender" id="radioGender1" value="male" required="" ><label for="radioGender1" class="regcheck" style="margin-right:20px ">male </label>
                                    <input type="radio" name="gender" value="female" id="radioGender2" required=""><label for="radioGender2" class="regcheck">female</label></div></td>
                             
                         </tr>
            <tr>
                <td><span>Address :</span></td>
               <td>
                   <textarea name="txtAddress" maxlength="150" ></textarea>
            </td>
            
            </tr>
              <tr>
                <td><span>Pin Code :</span></td>
               <td>
                   <input type="text" name="txtpin" >
            </td>
            
            </tr>
           <tr>
                <td><span>Date Of Birth :</span></td>
               <td>
                   <input type="date" name="txtDate">
            </td>
            
           </tr>
          
             <tr>
                <td><span>Adhaar No :</span></td>
               <td>
                   <input type="text" name="txtadhaar" >
            </td>
            
            </tr>
             <tr>
                <td><span>Upload Scanned Adhaar File(image file is required) :</span></td>
               <td>
                   <input type="file" name="mpho">
            </td>
            
             </tr>
               <tr>
                <td><span>Upload Scanned User File(image file is required) :</span></td>
               <td>
                   <input type="file" name="Muser">
            </td>
            
             </tr>
            
             <tr>
                <td><span>Password :</span></td>
               <td>
                   <input type="text" name="txtpassword" id="pd1">
            </td>
             </tr>
             <tr>
                <td><span>ReEnter Password :</span></td>
               <td>
                   <input type="text" name="txtpassword1" id="pd2" onchange="check()" >
            </td>
             </tr>
            
           
                                       <tr><td></td><td >  <button class="button"  name="btn_continue"><span>Continue ! </span></button></td>
                                       </tr>
                                   
                                   
                                   </table>
        
        <!------->
        </div>
        
       
       </form>
               <%
   
    %>                         
                                                
                                               
                                                  
    </body>
    <script src="jquery.min.js" type="text/javascript"></script>
     <script>
     function GetRto(d)
     {
        alert(d); 
        $.ajax({url:" Ajax_Rtoffice.jsp?Dis="+d, 
         success: function(result){
         alert(result);
      $("#Rtoffice").html(result);
    }});
         
     }
     function check()
     {
         if(pd1.value!=pd2.value)
         {
             alert("password Not Matching");
             pd2.value="";
            
         }
     }
     
     
     </script>
</html>

</html>

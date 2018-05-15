<%-- 
    Document   : RtOfficer Registration
    Created on : 28 Feb, 2018, 6:52:13 PM
    Author     : basilscolu
--%>


<%@page import="java.util.Random"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>

<%@include file="header.jsp" %> 

<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        
    </head>
    <body>
       
       
        <form>         
           
		
           
           
        </form> 
           
        <form method="post"  class="MyForm">

           
            <div  class="Malyali_registerform_details"> 
        <!------------personal section------>
        <br><br><br>
        <label class="regHead">Personal Details</label>
        
                                                              
       
        <table  id="mytabLee">
            <!--marital status-->
            <tr>
                <td><span>User Name :</span></td>
               <td>
                   <input type="text" name="txt_username">
            </td>
            
            </tr>
             <tr>
                <td><span>Password :</span></td>
               <td>
                   <input type="text" name="txt_password">
            </td>
            
            </tr>
            <!----------->
            
            <!-----height----->
            <tr>
                <td >
                District:
            </td>
            <td >
                <select name="DistrictSel"  onchange="GetRto(this.value)">
                  
                    <option>--select--</option>
                    <%
                 ResultSet rsDis=obj.selectData("select * from tbl_district ");
                 while(rsDis.next())
                 {
                 %>
                 <option value="<%=rsDis.getString("district_id")%>"><%=rsDis.getString("district")%></option>
                    <%
                 }
                 %>
                </select>
            </td>
            </tr>
            <!------------------------>
            <!----family stasus---->
            <tr>
                <td >
            RT office :
            </td>
            
            <td>
                <select id="Rtoffice" name="RtOfficeSel">
                    <option>--Select--</option>
                </select>
                
            </td>
            </tr>
             <!--marital status-->
            <tr>
                <td><span>Phone NO:</span></td>
               <td>
                   <input type="text" name="txt_phone">
            </td>
            </tr>
             <!--marital status-->
            <tr>
                <td><span>Email :</span></td>
               <td>
                   <input type="text" name="txt_email">
            </td>
            </tr>
            <!---------------->
            
            <!--Family Type-->
           
                                       <tr><td></td><td >  <button class="button"  name="btn_continue"><span>Continue ! </span></button></td>
                                       </tr>
                                   
                                   
                                   </table>
        
        <!------->
        </div>
        
       
       </form>
               <%
   
    if(request.getParameter("btn_continue")!=null)
    {
         Random rand = new Random();
       int n = rand.nextInt(90000) + 10000;
       String RtoId="Rto"+n;
       
       
     Boolean bb=obj.executeCommand("insert into tbl_rtofficer (RtoId,username,password,emaiId,phoneno,DistrictId,Rtoffice) "
             + "VALUES('"+RtoId+"','"+request.getParameter("txt_username")+"','"+request.getParameter("txt_password")+"','"+request.getParameter("txt_email")+"','"+request.getParameter("txt_phone")+"',"
             + "'"+request.getParameter("DistrictSel")+"','"+request.getParameter("RtOfficeSel")+"')");
     response.sendRedirect("AdminHomepage");
       
    }

    
   
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
     
     
     </script>
</html>

</html>

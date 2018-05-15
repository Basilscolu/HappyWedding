<%-- 
    Document   : LicenseScanning
    Created on : 9 Mar, 2018, 9:59:55 AM
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
        <title>Driving  License Details</title>
    </head>
    <body>
       
       
       
        <form action="FileUploadAction1.jsp" method="post" enctype="multipart/form-data">       
           
		
           
    
           
       

           
            <div  class="Malyali_registerform_details"> 
        <!------------personal section------>
        <br><br><br>
        
        
                                                              
       
        <table  id="mytabLee" style="margin-top: 100px;">
            <!--marital status-->
       
             
            <tr>
                <td><span> License No :</span></td>
               <td>
                   <input type="text" name="txt_lno">
            </td>
            
            </tr>
           
             <tr>
                <td><span>Upload Scanned License Image(Front) :</span></td>
               <td>
                   <input type="file" name="LiceFront">
            </td>
            
             </tr>
               <tr>
                <td><span>Upload Scanned License Image(Back) :</span></td>
               <td>
                   <input type="file" name="LiceBack">
            </td>
            
             </tr>
              <tr>
                <td><span>Date Of License Issuing :</span></td>
               <td>
                   <input type="date" name="txtdate">
            </td>
              </tr>
              <tr>
                <td><span>Validity From:</span></td>
               <td>
                   <input type="date" name="txtdate">
            </td>
              </tr>
              <tr>
                <td><span>Validity To :</span></td>
               <td>
                   <input type="date" name="txtdate">
            </td>
              </tr>
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
            
           
           
                                       <tr><td></td><td >  <button class="button"  name="btn_continue"><span>Continue ! </span></button></td>
                                       </tr>
                                   
                                   
                                   </table>
        
        <!------->
        </div>
        
       
       </form>
    </body>
     <script src="jquery.min.js" type="text/javascript"></script>
     <script>
     function GetRto(d)
     {
        alert(d); 
        $.ajax({url:"Ajax_Rtoffice.jsp?Dis="+d, 
         success: function(result){
         alert(result);
      $("#Rtoffice").html(result);
    }});
         
     }
     
     
     </script>
</html>

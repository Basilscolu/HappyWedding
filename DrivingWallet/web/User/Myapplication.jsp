<%-- 
    Document   : Myapplication
    Created on : 27 Mar, 2018, 3:52:57 AM
    Author     : basilscolu
--%>
<%
       String UId=session.getAttribute("userId").toString();
    
    %>
 
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Application</title>
    </head>
    <body>
        <%
       ResultSet rs=obj.selectData("select * from tbl_qrapplication ap,tbl_userregistration us  where ap.UserId=us.UserId and ap.UserId='"+UId+"'");
      if(rs.next())
       {
           if(rs.getString("AcceptOrReject").equals("Not Yet"))
           {
               %>
    <label>Hai   <b><%=rs.getString("Name")%></b>, your Application on <%=rs.getString("application_date")%> for Qr code App No:<%=rs.getString("Application_No")%> Waiting for Approval </label>  
               
               <%
               
           }
           else if(rs.getString("AcceptOrReject").equals("reject"))
           {%>
           
    <label>Hai   <b><%=rs.getString("Name")%></b>, your Application on <%=rs.getString("application_date")%> App No:<%=rs.getString("Application_No")%>  Rejected  </label> <a href="LicenseScanning.jsp">Apply New</a>      
               <%
               
           }
           
            if(rs.getString("AcceptOrReject").equals("Accept"))
           {
          %>
           <label>Hai   <b><%=rs.getString("Name")%></b>, your Application on <%=rs.getString("application_date")%> for Qr code App No:<%=rs.getString("Application_No")%> and Qr Code Is Generated Valid Up To </label>  
          
               <%
               
           }
           
       }
      else
      {
          %>
          
    <label>No Applictaion </label> <a href="LicenseScanning.jsp">Apply</a>
          <%
      }
       
       %>
      
    </body>
</html>

<%-- 
    Document   : Qrcodes
    Created on : 27 Mar, 2018, 4:22:47 AM
    Author     : basilscolu
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<!DOCTYPE html>
<%
     String UId=session.getAttribute("userId").toString();
    
     
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Qr Codes</title>
    </head>
    <body>
        <%
         ResultSet rs=obj.selectData("select * from tbl_qrcodes where UserId='"+UId+"'");
         if(rs.next())
         {
             %>
             <img  src="../qrcodes/<%=rs.getString("QrCodes")%>.png">
             <%
         }
         else
         {
             %>
                <label> Your Qr Code Not Yet Generated!</label>  
       
             <%
         }
         
         %>
    </body>
</html>

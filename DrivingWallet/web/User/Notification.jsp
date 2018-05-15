<%-- 
    Document   : Notification
    Created on : 27 Mar, 2018, 9:10:55 AM
    Author     : basilscolu
--%>
<%
       String UId=session.getAttribute("userId").toString();
    
    %>
 
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Notification</title>
    </head>
    <body>
            
         <table id="myTable" >
                            
     
                  <tr>
                      <td style="background: white;color: red;font-size: 30px; ">
                                  Notifications
                              </td>
         </tr>            
                             
             <% 
        ResultSet rs1=obj.selectData("select * from tbl_notification nt where nt.UserId='"+UId+"' order by date desc");
                            
             while(rs1.next())
                             {
                           
                             %>
                            <tr>
                                   <td>
                                       <%=rs1.getString("Notification")%>
                                    </td>
                                
                             
                                
                                 </tr>
                             
                            <% 
                             }
    
                            %>  
                             
                        </table>
       
    </body>
</html>

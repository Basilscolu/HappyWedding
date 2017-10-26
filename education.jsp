<%-- 
    Document   : education
    Created on : Aug 12, 2017, 9:35:13 AM
    Author     : student63
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form>
            <select>
                     <%
                          String s="select * from tbl_educationsection";
                          ResultSet rs=obj.selectData(s);
                                   while(rs.next())
                                     {
                    %>
                                 <option value="<%=rs.getString("edu_id")%>"><%=rs.getString("edu_name")%>
                                    
                                 </option>  
                 
                   <%
                         String s2="select * from tbl_course where edu_id='"+rs.getString("edu_id")+"'";
                         ResultSet rs1=obj.selectData(s2);
                         while(rs1.next())
                                   {
                    %>
                             <option value="<%=rs1.getString("edu_id")%>"><%=rs1.getString("course_name")%>
                                    
                              </option>  
                 
                 
                 <%
                     }
                     }
%>
            </select>
    </form>
    </body>
</html>

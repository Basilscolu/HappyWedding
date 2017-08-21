<%-- 
    Document   : state
    Created on : Aug 7, 2017, 11:27:44 AM
    Author     : student63
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>>
<!DOCTYPE html>
<%
  String statename="",id="";  
 
  if(request.getParameter("btnSubmit")!=null)
    {   
        
            String name=request.getParameter("txt_Sname");
            if(!request.getParameter("hid").equals(""))
            {
                String n=request.getParameter("hid");
                String s1 = "update tbl_state set state_name='"+name+"' where state_id="+n;
                 boolean b=obj.ExecuteCommand(s1);
                if(b==true)
                    out.print("success");
            else
                    out.print(s1);
         
              }
            
            else
            {
            
            String str="insert into tbl_state(state_name) values('"+name+"')";
            boolean b=obj.ExecuteCommand(str);
            if(b==true)
                    out.print("success");
            else
                    out.print(str);
         
              }
    }

 
 
 
 
 
 if(request.getParameter("del")!=null)
 {
 
 int sidno=Integer.parseInt(request.getParameter("del"));
 String str1="delete from tbl_state where state_id="+sidno;
obj.ExecuteCommand(str1);
 }
 
 if(request.getParameter("edit")!=null)
 {
  int eidno=Integer.parseInt(request.getParameter("edit"));
     ResultSet a=obj.selectData("select * from tbl_state where state_id="+eidno);
     if(a.next())
     {
     id=a.getString("state_id");
     statename=a.getString("state_name");
     }
     
 }
     %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>StateDetails</title>
    </head>
    <body>
        <form>
        <h1>StateDetails</h1>
        <input type="hidden" name="hid" value="<%=id%>">
        <table align="center">
            <tr>
                        <td>State Name:</td>
                        <td><input type="text" name="txt_Sname" value="<%=statename%>"></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="btnSubmit" value="Submit">
                <input type="button" name="btnReset" value="Cancel">
                </td>   
         </tr>
</table>
        </form>
        
        <table align="center">
            <tr>
                        <th>State Name</th>
                        <th>operation </td>
            </tr>
             <%
             String s="select * from tbl_state ";
                ResultSet rs=obj.selectData(s);
                while(rs.next())
                {
                   
                 %>
            <tr>
            
                 <td>
                     <%=rs.getString("state_name") %>
                 </td>
                 <td>
                     
                     <a href="State.jsp?edit=<%=rs.getString("state_id") %>">Edit</a>
                       
                 </td>
                 <td>
                     <a href="State.jsp?del=<%=rs.getString("state_id") %>">Delete</a>
                 </td>
                 <%
                 }
                 %>
            </tr>   
            
            
        </table>
        
        </form>    
    </body>
</html>

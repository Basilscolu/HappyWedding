<%-- 
    Document   : District
    Created on : Aug 7, 2017, 12:07:52 PM
    Author     : student63
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="ob"></jsp:useBean>
<!DOCTYPE html>
<%
    String stateid="",dis_name="";
      
     if(request.getParameter("btn_submit")!=null)
    {    
      String name=request.getParameter("txt_dname");
        String sid=request.getParameter("State");
        
        if(!request.getParameter("hid1").equals(""))
            {
                String n=request.getParameter("hid1");
                String s1 = "update tbl_district set Dis_name='"+name+"' where Dis_id="+n;
                 boolean b=ob.ExecuteCommand(s1);
                if(b==true)
                    out.print("success");
            else
                    out.print(s1);
         
              }
        else
        {
        String str="insert into tbl_district(Dis_name,State_id) values('"+name+"','"+sid+"')";
                boolean b=ob.ExecuteCommand(str);
            if(b==true)
                    out.print("success");
            else
                    out.print(str);
        }
                
        
    }
if(request.getParameter("del")!=null)
{
    int sid=Integer.parseInt( request.getParameter("del"));
    String del="delete from tbl_district where Dis_id="+sid;
    
    ob.ExecuteCommand(del);
    
}

if(request.getParameter("edit")!=null)
{
 int dis_id=Integer.parseInt( request.getParameter("edit"));
 ResultSet rs1=ob.selectData("select * from tbl_district d,tbl_state s  where d.State_id=s.state_id and Dis_id="+dis_id);
 while(rs1.next())
 {
   stateid=rs1.getString("Dis_id");
   dis_name=rs1.getString("Dis_name");
 }
    
}

  %>  


<html>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         </head>
          <body>
              <form method="post" action="District.jsp">
                  <input type="hidden" name="hid1" value="<%=stateid%>">
             
                    <h1>
                        District
                    </h1>
                          <table align=center>
                             <tr>
                                 <td>
                                     State Name:
                                 </td>
                                 <td>
                                     <select name="State" >
                                         <option >
                                             ....select...
                                         </option>
                                   <%
                                     String s="select * from tbl_state ";
                                     ResultSet rs=ob.selectData(s);
                                     while(rs.next())
                                    {%>
                                    <option value="<%=rs.getString("state_id")%>" <%if(rs.getString("state_id").equals(stateid)){%> selected="true"<%} %>>
                                         
                                         <%=rs.getString("state_name")%>
                                     </option>  
                                    <% }
                
                 
                                     %>
                
                
                
                
                
                                        </select>
                                  </td>
                             </tr>
                             <tr>
                                   <td>
                                       District Name:
                                   </td>
                                   <td>
                                       <input type="text" name="txt_dname" value="<%=dis_name%>">
                                   </td>
                             </tr>

                             <tr>
                                     <td>
                                         <input type="submit" name="btn_submit" >
                                     </td>
    
                                      <td>
                                          <button type="button" name="reset">Cancel
                                      </td>
                             </tr>
                             
                             
                            

                          </table>
                                     
                  <table>         <tr>
                                          <th>State Name</th><th>Dstrict name</th><th>Edit</th><th>Delete</th>
                                  </tr>
                                         <%
                                             ResultSet rs1=ob.selectData("select * from tbl_state s,tbl_district d where s.state_id=d.State_id ");
                                             
                                             while(rs1.next())
                                             {
                                                 
                                            
                                 
                                             %>
                                             <tr>
                                                 <td><%=rs1.getString("state_name")%>
                                                 </td>
                                                 <td>
                                                     <%=rs1.getString("Dis_name")%>
                                                 </td>
                                                 <td>
                                                     <a href="District.jsp?edit=<%=rs1.getString("Dis_id")%>">Edit</a>
                                                 </td>
                                                 <td>
                                                     <a href="District.jsp?del=<%=rs1.getString("Dis_id")%>">Delete</a>
                                                 </td>
                                             
                                             </tr>
                                             <%
                                                 
                                              }
                                             %>
                                             
                                             
                                             
</table>
              </form>
                                      </body>

</html>

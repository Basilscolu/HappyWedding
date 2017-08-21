<%-- 
    Document   : place
    Created on : Aug 12, 2017, 10:18:23 AM
    Author     : student63
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>>
<!DOCTYPE html>
<% 
if(request.getParameter("btnSubmit")!=null)
    {    
            String placename,dist_id,state_id;
              placename=request.getParameter("txt_place");
            dist_id=request.getParameter("district");
            state_id=request.getParameter("state");
                    
            String str="insert into tbl_place(place_name,state_id,district_id) values('"+placename+"','"+state_id+"','"+dist_id+"')";
            boolean b=obj.ExecuteCommand(str);
            if(b==true)
                    out.print("success");
            else
                    out.print(str);
         
       
    }


%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="jquery.min.js" type="text/javascript"></script>
        
        <script>
            function getDist(v) 
    {
        
    // alert(v);  
    $.ajax({url: "ajax_dist.jsp?id="+v, success: function(result){
            //alert(result);
        $("#dist").html(result);
    }});

        
        
    }
            </script>
        
        
        
    </head>
    <body>
        <form>
        <table>
             <tr>
                        <td>State Name:</td>
             
             
             <td>
                 
                 <select name="state" onchange="getDist(this.value)">
                  <option value="sel"> --select--</option>
                               <%
                                String str="select * from tbl_state";
                                ResultSet rs=obj.selectData(str);
                                while(rs.next())
                                    {
                                %>
                            
                           
                               <option value="<%= rs.getString("state_id")%>"> <%=rs.getString("state_name")%>
                                    
                                </option> 
                                <%
                                    }
                                %>
              </select>

                            
                           
            </td>
            </tr>
             <td>Disrict Name:</td>
             <td>
                 <select name="district" id="dist">
                             
              </select>
             </td>
            <tr>
                
            </tr>
            <td>
             Place :   
            </td>
            <td>
                <input type="text" name="txt_place">
            </td>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="btnSubmit" value="Submit">
                <input type="button" name="btnReset" value="Cancel">
                </td>   
         </tr>
        </table>
        </form>
    </body>
</html>

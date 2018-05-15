<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>  
    <option>--Select--</option> 
<%
               String Check=request.getParameter("Dis");
               
                 
                ResultSet rsMs=obj.selectData("select * from tbl_rtoffice where DistrictId="+Check);
                   
                    while(rsMs.next())
                    {
                    %>
                    <option value="<%=rsMs.getString("id")%>" ><%=rsMs.getString("RtOffice")%></option>>
                    <%
                    }
                
                 %>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>    
<%
String sid=request.getParameter("id");

                                String str="select * from tbl_district where State_id="+sid;
                                ResultSet rs=obj.selectData(str);
                                %>
                                <option value="sel"> --select--</option>
                                
                                <%
                                while(rs.next())
                                    {
                                %>
                            
                           
                               <option value="<%= rs.getString("Dis_id")%>"> <%=rs.getString("Dis_name")%>
                                    
                                </option> 
                                <%
                                    }
                                %>

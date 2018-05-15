<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean> 

<%
     String MessageSender_id=request.getParameter("id");
     String userid=session.getAttribute("userId").toString();
     obj.executeCommand("update tbl_mymessagers mm set mm.typing='Y' where mm.My_id='"+userid+"' and mm.My_Messager_id='"+MessageSender_id+"'");
    %>
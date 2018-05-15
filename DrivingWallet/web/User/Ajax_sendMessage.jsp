<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean> 
<%
    String uid=session.getAttribute("userId").toString();
    String ReceiverId=request.getParameter("id");
    String Messagedata=request.getParameter("Message");
    
    Boolean BB=obj.executeCommand("insert into tbl_messsage(sender_id,receiver_id,Message,mdate,mTime,receiver_seen) VALUES('"+uid+"','"+ReceiverId+"','"+Messagedata+"',curdate(),curtime(),'N')");
   obj.executeCommand("update tbl_mymessagers mm set mm.typing='N' where mm.My_id='"+uid+"' and mm.My_Messager_id='"+ReceiverId+"'");
   
    
   
    %>
    
    
  
    
  
    <table style="width: 380px;overflow-y: scroll;overflow-x: hidden;margin-top: 100px;margin-left: 300px;">
       
<%
   
    ResultSet Rsmessageshow=obj.selectData("select * from tbl_messsage where (sender_id='"+uid+"' and receiver_id='"+ReceiverId+"') or( sender_id='"+ReceiverId+"' and receiver_id='"+uid+"') order by M_id  desc");
while(Rsmessageshow.next())
{
    if(Rsmessageshow.getString("sender_id").equals(ReceiverId))
    {
%>
 <tr>
 <td ><textarea maxlength="100"  style="width: 250px; height: 50px;border: solid #333;border-radius: 10px; background: #ff9999; " ><%=Rsmessageshow.getString("Message")%></textarea>
                <br>
            <span style="color: crimson;font-size: 10px"><%=Rsmessageshow.getString("mdate")%>:  :<%=Rsmessageshow.getString("mTime")%></span>
                </label></td><td></td>
</tr>
<%
    }
    else
    {
        %>
       
<tr>
<td></td><td  ><textarea maxlength="100"  style="width: 250px; height: 50px;border: solid #333;border-radius: 10px; background: #33ffcc; " ><%=Rsmessageshow.getString("Message")%></textarea><br>
            <span style="color: crimson;font-size: 10px"><%=Rsmessageshow.getString("mdate")%>:  :<%=Rsmessageshow.getString("mTime")%></span></label></td>
</tr>
        <%
    }
}
%>
    </table>
    
    
   
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean> 

<%
     String MessageSender_id=request.getParameter("id");
     String userid=session.getAttribute("userId").toString();
     obj.executeCommand("update tbl_messsage msg set msg.receiver_seen='Y' where msg.receiver_id='"+userid+"' and msg.sender_id='"+MessageSender_id+"'and msg.receiver_seen='N'");
 %>
    
  
    <table style="width: 380px;height: 50px;position: fixed ;background: #FFFFFF;">
        <tr>
                             <th > Message </th><th><label style="margin-left: 230px;cursor: pointer;font-size: 20px;"  class="close" id="closemessage1"> &times;</label> </th>
                         </tr>
        <tr>
            <td  style="width: 250px; height: 50px;"><textarea maxlength="100"  style="width: 250px; height: 50px;border: solid #333;border-radius: 10px;" id="Message" name="messageTextarea" required=""></textarea></td><td style="width: 70px;height: 50px;"> <input type="button" value="send" name="messagesend" style="width: 70px;height: 50px;border: solid #333;border-radius: 10px;background: #ff0033;color: #FFFFFF;" onclick="SendMessage('<%=MessageSender_id%>')"></td>
    </tr>
    </table>
    <table style="width: 380px;overflow: scroll;overflow-x: hidden;margin-top: 100px;">
         
<%
   
    ResultSet Rsmessageshow=obj.selectData("select * from tbl_messsage where (sender_id='"+userid+"' and receiver_id='"+MessageSender_id+"') or( sender_id='"+MessageSender_id+"' and receiver_id='"+userid+"') order by M_id  asc");
while(Rsmessageshow.next())
{
    if(Rsmessageshow.getString("sender_id").equals(MessageSender_id))
    {
%>
<tr>
<td ><textarea maxlength="100"  style="width: 250px; height: 50px;border: solid #333;border-radius: 10px; background: #ff9999; " ><%=Rsmessageshow.getString("Message")%></textarea>
                <br>
            <span style="color: crimson;font-size: 10px"><%=Rsmessageshow.getString("mdate")%>-<%=Rsmessageshow.getString("mTime")%></span>
                </label></td><td></td>
</tr>
<%
    }
    else
    {
        %>
        
<tr>
<td></td><td  ><textarea maxlength="100"  style="width: 250px; height: 50px;border: solid #333;border-radius: 10px; background: #33ffcc; " ><%=Rsmessageshow.getString("Message")%></textarea><br>
            <span style="color: crimson;font-size: 10px"><%=Rsmessageshow.getString("mdate")%>-<%=Rsmessageshow.getString("mTime")%></span></td>
</tr>
        <%
    }
}
%>
    </table>